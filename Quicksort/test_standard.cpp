
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <algorithm>
#include <vector>

int main(void)
{
    int N = 1<<20;
    int tests = 6;
    int* x;
    int* y;
    x = (int*)malloc(sizeof(int)*N);
    y = (int*)malloc(sizeof(int)*N);


    for (int i = 0; i < N; i++) {
        x[i] = (int)(rand()%100);
    }
    int time, ptime, total_time;
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