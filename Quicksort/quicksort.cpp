
#include <condition_variable>
#include <cstdlib>
#include <mutex>
#include <stdio.h>
#include <thread>
#include "quicksort.hpp"

int choose_pivot(int* nums, int lo, int hi){
    if(hi-lo < 2){
        return nums[lo];
    }
    int a = (hi + lo)/2;
    return nums[lo] < nums[a] ? (nums[a] < nums[hi] ? nums[a] : nums[hi]) : 
        nums[lo] < nums[hi] ? nums[lo] : nums[hi];
}

int partition(int* nums, int lo, int hi){
    int pivot = choose_pivot(nums, lo, hi);
    int i = lo-1;
    int j = hi+1;
    while(true){
        do{
            i++;
        }while(nums[i] < pivot);
        do{
            j--;
        } while(nums[j] > pivot);
        if(i >= j) return j;
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }    
}

void quicksort(int* nums, int lo, int hi){
    if(lo < hi){
        int pivot = partition(nums, lo, hi);
        quicksort(nums, lo, pivot);
        quicksort(nums, pivot + 1, hi);
    }
}

struct sort_data {
    std::mutex mutex;
    std::condition_variable cv;
    std::condition_variable parent_cv;
    int waiting;
    int pivot;
    int num_threads;
    int* partitions;
    int* sizes;
};

int choose_pivot(int n, int* nums){
    int n_sample = 15;
    int sample[n_sample];
    int step = std::max(n/n_sample, 1);
    for(int i=0; i<n && i<n_sample; i++){
        sample[i] = i*step;
    }
    for(int i=0; i<n && i<n_sample; i++){
        sample[i] = nums[sample[i]];
    }
    quicksort(nums, 0, n-1);
    return sample[n_sample/2];
}

int partition_scratch(int pivot, int n, int* nums, int* scratch){
    int pivot_idx = 0;
    int i = 0, j = 0, s = 0;
    for(i=0; i<n; i++){
        if(nums[i] > pivot){
            scratch[s] = nums[i];
            s++;
        }
        else if(i != j){
            nums[i] = nums[j];
            j++;
        }
    }
    return j;
}

void quicksort_thread(int idx, struct sort_data* data, int* nums, int* scratch){
    int n;
    std::unique_lock<std::mutex> lock(data->mutex);
    n = data->sizes[idx];
    if(++data->waiting == data->num_threads-1){
        data->parent_cv.notify_one();
    }
    data->cv.wait(lock);
    int pivot = data->pivot;
    lock.unlock();
    int part = partition_scratch(pivot, n, nums, scratch);
    lock.lock();
    data->partitions[idx] = part;
    if(++data->waiting == data->num_threads-1){
        data->parent_cv.notify_one();
    }
    data->cv.wait(lock);
}

void quicksort_concurrent(int num_threads, int* nums, int lo, int hi){
    std::thread threads[num_threads];
    int n = hi-lo;
    int* scratch = (int*)malloc(sizeof(int)*n);
    struct sort_data data;
    data.num_threads = num_threads;
    data.partitions = (int*)malloc(sizeof(int)*num_threads);
    data.sizes = (int*)malloc(sizeof(int)*num_threads);
    int per_thread = std::max(n/num_threads, 1);
    int i;
    for(i=1; i < num_threads && i < n; i++){
        threads[i] = std::thread(quicksort_thread, i, &data, nums + per_thread * i, scratch + per_thread * i);
        data.sizes[i] = per_thread;
    }
    threads[i] = std::thread(quicksort_thread, i, &data, nums + per_thread * i, scratch + per_thread * i);
    data.sizes[i] = n - per_thread * i;
    int pivot;
    {
        std::unique_lock<std::mutex> lock(data.mutex);
        while(data.waiting <= num_threads-1)
            data.parent_cv.wait(lock);
        data.pivot = choose_pivot(per_thread, nums);
        pivot = data.pivot;
        data.cv.notify_all();
    }
    int part = partition_scratch(pivot, per_thread, nums, scratch);
    {
        std::unique_lock<std::mutex> lock(data.mutex);
        data.partitions[0] = part;
        while(data.waiting <= num_threads-1)
            data.parent_cv.wait(lock);
        int place_i = 0;
        for(int i = 0; i < num_threads; i++){
            for(int pull_i = 0; pull_i < data.partitions[i]; pull_i++, place_i++){
                nums[place_i] = nums[pull_i + per_thread * i];
            }
        }
        for(int i = 0; i < num_threads; i++){
            for(int pull_i = 0; pull_i < data.sizes[i] - data.partitions[i]; pull_i++, place_i++){
                nums[place_i] = scratch[pull_i + per_thread * i];
            }
        }
        data.pivot = choose_pivot(per_thread, nums);
        pivot = data.pivot;
        data.cv.notify_all();
    }
    free(data.partitions);
    free(data.sizes);
    free(scratch);
}

void quicksort_pool(ThreadPool* pool, int depth, int* nums, int lo, int hi){
    if(lo < hi){
        int pivot = partition(nums, lo, hi);
        if(depth <= 1){
            quicksort(nums, lo, pivot);
            quicksort(nums, pivot+1, hi);
            return;
        }
        pool->submit_job(std::bind(quicksort_pool, pool, depth-1, nums, lo, pivot));
        pool->submit_job(std::bind(quicksort_pool, pool, depth-1, nums, pivot + 1, hi));
    }
}