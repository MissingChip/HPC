
#include <thread>
#include <cstdio>
#include <ctime>

void add_fn(int* a, int n){
    for(;n>0;n--){
        *a += n + (*a * n)/4;
    }
}

int main(){
    int N = 10000000;
    {
        int a1[2];
        timespec ptime, time;
        float dtime;
        clock_gettime(CLOCK_REALTIME, &ptime);
        std::thread tr1(add_fn, a1, N);
        std::thread tr2(add_fn, a1+1, N);
        tr1.join();
        tr2.join();
        clock_gettime(CLOCK_REALTIME, &time); 
        dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
        printf("false share: %f sec\n", dtime);
    }
    {
        int a[128];
        timespec ptime, time;
        float dtime;
        clock_gettime(CLOCK_REALTIME, &ptime);
        std::thread tr1(add_fn, a, N);
        std::thread tr2(add_fn, a+64, N);
        tr1.join();
        tr2.join();
        clock_gettime(CLOCK_REALTIME, &time); 
        dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
        printf("no false share: %f sec\n", dtime);
    }
}