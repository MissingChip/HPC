
#include <ctime>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stdint.h>
#include <string.h>
// Kernel function to add the elements of two arrays
__global__
void sum_cuda(int iter, int n, float* x)
{
    uint64_t pick = 1 << iter;
    uint64_t index = (pick*2)*(blockIdx.x * blockDim.x + threadIdx.x);
    uint64_t stride = (pick*2)*blockDim.x * gridDim.x;
    for(uint64_t i = index; i + pick < n ; i += stride){
        x[i] = x[i] + x[i+pick];
    }
    // x[index] = x[index] + x[index+pick];

}

float avg_cuda(int n, float* x){
    int block_size = 256;
    for(int i = 0; n > (1 << i); i++){
        int num_blocks = max((n + block_size - 1)/max((2*block_size*(1 << i)), 1), 1);
        sum_cuda<<<num_blocks, block_size>>>(i, n, x);
    }
    cudaDeviceSynchronize();
    return *x/n;
}

float avg_cpu(int n, float* x){
    double total = 0;
    for(int i = 0; i < n; i++){
        total += x[i];
    }
    return total/n;
}

int main(void)
{
    int N = 1<<6+1;
    float *x;
    float *y;

    // Allocate Unified Memory – accessible from CPU or GPU
    cudaMallocManaged(&x, N*sizeof(float));
    cudaMallocManaged(&y, N*sizeof(float));

    // initialize x and y arrays on the host
    // srand(clock());
    for (int i = 0; i < N; i++) {
        x[i] = (float)(rand()%100);
        y[i] = x[i];
        // x[i] = (float)(i%2);
    }

    int time, ptime = clock();
    float true_avg = avg_cpu(N, y);
    time = clock();
    printf("cpu time elapsed: %f sec\n", ((float)(time-ptime))/CLOCKS_PER_SEC);

    memcpy(y, x, N*sizeof(float));
    ptime = clock();
    float calculated_avg = avg_cuda(N, y);
    time = clock();
    printf("cuda time elapsed: %f sec\n", ((float)(time-ptime))/CLOCKS_PER_SEC);

    printf("cuda: %f  \t cpu (expected): %f\n", calculated_avg, true_avg);
    // for(int i = 0; i < 20; i++){
    //     printf("%f\n", x[i]);
    // }

    // Free memory
    cudaFree(x);

    return 0;
}