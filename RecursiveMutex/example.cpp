
#include <stdio.h>
#include <unistd.h>
#include "recursive_mtx.h"


RecursiveMutex rmtx;

void tr_fn(){
    printf("thread %d\n", rmtx.lock());
    printf("thread runing\n");
    sleep(1);
    printf("thread ran\n");
    rmtx.unlock();
}

int main(){
    rmtx.lock();
    rmtx.lock();
    std::thread tr(tr_fn);
    printf("main fn locked twice\n");
    rmtx.unlock();
    printf("main fn unlocked once\n");
    sleep(1);
    rmtx.unlock();
    printf("main fn unlocked twice\n");
    usleep(10);
    printf("main %d\n", rmtx.lock());
    printf("main fn done\n");
    rmtx.unlock();
    tr.join();
}