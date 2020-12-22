#include "recursive_mtx.h"
#include <condition_variable>
#include <cstdio>
#include <iostream>
#include <chrono>
#include <mutex>
#include <thread>

using namespace std::chrono_literals;

RecursiveMutex rm;
std::mutex m2;

void f1() {
    while (true) {
        // printf("lock rm 1\n");
        rm.lock();
        // printf("unlock rm 1\n");
        int amt = rm.unlock();
        // printf("unlocked rm 1: %d\n", amt);
        m2.lock();
        m2.unlock();
    }
}

void f2() {
    long long int count = 0;
    while (true) {
        m2.lock();
        // printf("lock: %d\n", rm.lock());
        // printf("lock rm 2\n");
        rm.lock();
        // printf("unlock rm 2\n");
        rm.unlock();
        m2.unlock();
        // if(count % 2 == 0) printf("%lld\n", count);
        if (++count % 1'000'000 == 0) {
            std::cerr << count << " iterations.\n";
        }
    }
}

int
main() {

    std::thread t1{f1};
    std::thread t2{f2};


    std::this_thread::sleep_for(60s);
}