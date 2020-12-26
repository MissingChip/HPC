
#include <condition_variable>
#include <mutex>
#include <thread>
#include <cstdio>
#include <ctime>
#include <unistd.h>

std::mutex mtx;
std::condition_variable cv;

void add_fn(int* a, int n){
    std::unique_lock<std::mutex> lock(mtx);
    cv.wait(lock);
    lock.unlock();
    for(;n>0;n--){
        *a += n + (*a * n)/4;
    }
}

int main(){
    int N = 10000000;
    int in = 0;
    {
        std::thread tr(add_fn, &in, N);
        usleep(1000);
        std::unique_lock<std::mutex> lock(mtx);
        cv.notify_all();
        lock.unlock();
        tr.join();
    }
    {
        int a[2] = {0};
        timespec ptime, time;
        float dtime;
        std::thread tr1(add_fn, a, N);
        std::thread tr2(add_fn, a+1, N);
        usleep(1000);
        std::unique_lock<std::mutex> lock(mtx);
        clock_gettime(CLOCK_REALTIME, &ptime);
        cv.notify_all();
        lock.unlock();
        tr1.join();
        tr2.join();
        clock_gettime(CLOCK_REALTIME, &time); 
        dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
        printf("false share: %f sec\n", dtime);
    }
    {
        int a[128] = {0};
        timespec ptime, time;
        float dtime;
        std::thread tr1(add_fn, a, N);
        std::thread tr2(add_fn, a+64, N);
        usleep(1000);
        std::unique_lock<std::mutex> lock(mtx);
        clock_gettime(CLOCK_REALTIME, &ptime);
        cv.notify_all();
        lock.unlock();
        tr1.join();
        tr2.join();
        clock_gettime(CLOCK_REALTIME, &time); 
        dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
        printf("no false share: %f sec\n", dtime);
    }
}