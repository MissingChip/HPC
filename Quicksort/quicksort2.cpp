
#include <condition_variable>
#include <cstdlib>
#include <mutex>
#include <stdio.h>
#include <thread>
#include "quicksort.hpp"

class SortData {
public:
    std::mutex mutex;
    std::condition_variable cv;
    std::condition_variable parent_cv;
    int waiting;
    int pivot;
    int num_threads;
    int* nums;
    int* scratch;
    int* partitions;
    int* sizes;
    int* assignments;

    SortData(int num_threads, int arr_size, int* nums);
    ~SortData();
    int defragment();
};

SortData::SortData(int n_threads, int arr_size, int* nums){
    num_threads = n_threads;
    nums = nums;
    scratch = new int[arr_size];
    partitions = new int[n_threads];
    sizes = new int[n_threads];
    assignments = new int[n_threads];
}
SortData::~SortData(){
    delete[] partitions;
    delete[] sizes;
    delete[] assignments;
}
int SortData::defragment(){
    int place_i = 0;
    for(int i = 0; i < num_threads; i++){
        for(int pull_i = 0; pull_i < partitions[i]; pull_i++, place_i++){
            nums[place_i] = nums[pull_i + sizes[i] * i];
        }
    }
    int pivot_idx = place_i;
    for(int i = 0; i < num_threads; i++){
        for(int pull_i = 0; pull_i < sizes[i] - partitions[i]; pull_i++, place_i++){
            nums[place_i] = scratch[pull_i + sizes[i] * i];
        }
    }
    return pivot_idx;
}

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

void quicksort_thread(int idx, struct SortData* data){
    int n;
    std::unique_lock<std::mutex> lock(data->mutex);
    n = data->sizes[idx];
    if(++data->waiting == data->num_threads-1){
        data->parent_cv.notify_one();
    }
    data->cv.wait(lock);
    int pivot = data->pivot;
    lock.unlock();
    int part = partition_scratch(pivot, n, data->nums, data->scratch);
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
    struct SortData data(num_threads, n, nums);
    int per_thread = std::max(n/num_threads, 1);
    int i;

    std::unique_lock<std::mutex> lock(data.mutex);
    for(i=1; i < num_threads && i < n; i++){
        data.sizes[i] = per_thread;
        threads[i] = std::thread(quicksort_thread, i, &data, nums + per_thread * i, scratch + per_thread * i);
    }
    data.sizes[i] = n - per_thread * i;
    threads[i] = std::thread(quicksort_thread, i, &data, nums + per_thread * i, scratch + per_thread * i);
}