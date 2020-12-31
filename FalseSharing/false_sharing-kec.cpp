
#include <condition_variable>
#include <mutex>
#include <thread>
#include <cstdio>
#include <ctime>
#include <unistd.h>

std::mutex mtx;
std::condition_variable cv;

void add_fn(volatile int* a, int n){
    /*
    std::unique_lock<std::mutex> lock(mtx);
    cv.wait(lock);
    lock.unlock();
    printf("Go!\n");
    */
    for(;n>0;n--){
        //*a += n + (*a * n)/4;
        (*a)++;
    }
}

int main(){
    int N = 1'000'000'000;
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
        int a[4] = {0};
        timespec ptime, time;
        float dtime;
        clock_gettime(CLOCK_REALTIME, &ptime);
        std::thread tr1(add_fn, a, N);
        std::thread tr2(add_fn, a+1, N);
        std::thread tr3(add_fn, a+2, N);
        std::thread tr4(add_fn, a+3, N);
        //usleep(1000);
        /*
        sleep(3);
        std::unique_lock<std::mutex> lock(mtx);
        clock_gettime(CLOCK_REALTIME, &ptime);
        cv.notify_all();
        lock.unlock();
        */
        tr1.join();
        tr2.join();
        tr3.join();
        tr4.join();
        clock_gettime(CLOCK_REALTIME, &time); 
        dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
        printf("false share: %f sec\n", dtime);
    }
    {
        int a[4*16] = {0};
        timespec ptime, time;
        float dtime;
        clock_gettime(CLOCK_REALTIME, &ptime);
        std::thread tr1(add_fn, a, N);
        std::thread tr2(add_fn, a+1*16, N);
        std::thread tr3(add_fn, a+2*16, N);
        std::thread tr4(add_fn, a+3*16, N);
        //usleep(1000);
        /*
        sleep(3);
        std::unique_lock<std::mutex> lock(mtx);
        clock_gettime(CLOCK_REALTIME, &ptime);
        cv.notify_all();
        lock.unlock();
        */
        tr1.join();
        tr2.join();
        tr3.join();
        tr4.join();
        clock_gettime(CLOCK_REALTIME, &time); 
        dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
        printf("no false share: %f sec\n", dtime);
    }
}
