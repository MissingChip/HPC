

#include <ctime>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stdint.h>
#include <string.h>

inline int ceil_log2(unsigned long long x)
{
  static const unsigned long long t[6] = {
    0xFFFFFFFF00000000ull,
    0x00000000FFFF0000ull,
    0x000000000000FF00ull,
    0x00000000000000F0ull,
    0x000000000000000Cull,
    0x0000000000000002ull
  };

  int y = (((x & (x - 1)) == 0) ? 0 : 1);
  int j = 32;
  int i;

  for (i = 0; i < 6; i++) {
    int k = (((x & t[i]) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;
  }

  return y;
}

// Kernel function to avg the elements of array
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

__global__
void sum_cuda2(uint32_t stride, uint32_t n, float* x)
{
    uint32_t index = blockIdx.x * blockDim.x + threadIdx.x;
    for(uint64_t i = index; i + stride < n; i += blockDim.x * gridDim.x){
        x[i] = x[i] + x[i+stride];
    }
}

float avg_cuda(int n, float* x){
    int block_size = 128;
    for(int i = 0; n > (1 << i); i++){
        int num_blocks = max((n + block_size - 1)/max((2*block_size*(1 << i)), 1), 1);
        sum_cuda<<<num_blocks, block_size>>>(i, n, x);
    }
    cudaDeviceSynchronize();
    return *x/n;
}

float avg_cuda2(int n, float* x){
    int block_size = 128;
    for(int i = 0; n > (1 << i); i++){
        int num_blocks = min(max((n+1)/2, 1), 32);
        uint32_t stride = 1 << (ceil_log2(n) - i - 1);
        sum_cuda2<<<num_blocks, block_size>>>(stride, n, x);
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
    int N = 1<<20;
    float *x;
    float *y;

    // Allocate Unified Memory – accessible from CPU or GPU
    cudaMallocManaged(&x, N*sizeof(float));
    cudaMallocManaged(&y, N*sizeof(float));

    // initialize x and y arrays on the host
    // srand(clock());
    for (int i = 0; i < N; i++) {
        x[i] = (float)(rand()%100);
        // x[i] = (float)(i%2);
        y[i] = x[i];
    }

    int time, ptime = clock();
    float true_avg = avg_cpu(N, y);
    time = clock();
    printf("cpu time elapsed:  \t%f sec\n", ((float)(time-ptime))/CLOCKS_PER_SEC);

    memcpy(y, x, N*sizeof(float));
    ptime = clock();
    float calculated_avg = avg_cuda2(N, y);
    time = clock();
    printf("cuda time elapsed: \t%f sec\n", ((float)(time-ptime))/CLOCKS_PER_SEC);

    printf("cuda: %f  \t cpu (expected): %f\n", calculated_avg, true_avg);
    // for(int i = 0; i < 20; i++){
    //     printf("%f\n", x[i]);
    // }

    // Free memory
    cudaFree(x);

    return 0;
}