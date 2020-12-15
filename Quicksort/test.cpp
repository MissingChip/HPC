
#include "quicksort.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <algorithm>
#include <vector>

int sort_anomaly(int n, int* x){
    for(int i = 1; i < n; i++){
        if(x[i-1] > x[i]){
            return i;
        }
    }
    return 0;
}

int main(void)
{
    int N = 1'000'000;
    int tests = 6;
    int* x;
    int* y;
    x = (int*)malloc(sizeof(int)*N);
    y = (int*)malloc(sizeof(int)*N);


    for (int i = 0; i < N; i++) {
        x[i] = (int)(rand());
    }

    for(int i = 0; i < 10; i++){
        printf("%d ", x[i]);
    }
    printf("\n");

    int time, ptime, total_time = 0;
    for(int i = 0; i < tests; i++){
        memcpy(y, x, sizeof(int)*N);
        ptime = clock();
        quicksort(y, 0, N-1);
        time = clock();
        total_time += time - ptime;
    }
    printf("single time elapsed (avg): \t%f sec\n", (((float)(total_time))/CLOCKS_PER_SEC)/tests);

    // for(int i = 0; i < 10; i++){
    //     printf("%d ", x[i]);
    // }
    // printf("\n");
    int a = sort_anomaly(N, y);
    if(a) printf("anomaly at %d: %d, %d\n", a, y[a-1], y[a]);
    else printf("sorted\n");

    ThreadPool pool;
    total_time = 0;
    for(int i = 0; i < tests; i++){
        memcpy(y, x, sizeof(int)*N);
        ptime = clock();
        quicksort_pool(&pool, 3, y, 0, N-1);
        time = clock();
        total_time += time - ptime;
    }
    pool.shutdown();
    printf("multi time elapsed (avg): \t%f sec\n", (((float)(total_time))/CLOCKS_PER_SEC)/tests);

    a = sort_anomaly(N, y);
    if(a) printf("anomaly at %d: %d, %d\n", a, y[a-1], y[a]);
    else printf("sorted\n");

    total_time = 0;
    for(int i = 0; i < tests; i++){
        memcpy(y, x, sizeof(int)*N);
        ptime = clock();
        std::sort(y, y+N);
        time = clock();
        total_time += time - ptime;
    }
    printf("std lib time elapsed (avg): \t%f sec\n", (((float)(total_time))/CLOCKS_PER_SEC)/tests);

    total_time = 0;
    for(int i = 0; i < tests; i++){
        memcpy(y, x, sizeof(int)*N);
        std::vector<int> vec(y, y + N);
        ptime = clock();
        std::sort(vec.begin(), vec.end());
        time = clock();
        total_time += time - ptime;
    }
    printf("std vec time elapsed (avg): \t%f sec\n", (((float)(total_time))/CLOCKS_PER_SEC)/tests);

    free(x);
    free(y);

    return 0;
}