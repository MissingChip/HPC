#include <stdint.h>
#include <immintrin.h>
#include <stdio.h>
#include <assert.h>
#include <pthread.h>
#include <math.h>
#include <time.h>
#include <unistd.h>

float sum(int n, float* data){
    float total = 0.0;
    for(int i = 0; i < n; i++){
        total += data[i];
    }
    return total;
}

void simd_partition(int n_floats, int* n, float** data){
    assert((intptr_t)(*data) % sizeof(float) == 0);
    intptr_t addr = (intptr_t)(*data)/sizeof(float);
    int offset = (n_floats - (addr % n_floats)) % n_floats;
    *data += offset;
    *n -= offset;
    *n -= *n % n_floats;
}

float sum_avx(int n, float* data){
    if(n < 16){
        return sum(n, data);
    }
    int stride = 8;
    float* avx_data = data;
    int avx_n = n;
    simd_partition(8, &avx_n, &avx_data);
    __v8sf var1, var2;
    const __v8sf zero8sf = {0, 0, 0, 0, 0, 0, 0, 0};

    var1 = _mm256_load_ps(avx_data);
    for(int i = stride; i < avx_n; i += stride){
        var2 = _mm256_load_ps(avx_data + i);
        var1 += var2;
    }
    float total = 0;
    for(int i = 0; i < 8; i++){
        total += var1[i];
    }
    total += sum(avx_data-data, data);
    total += sum((data+n)-(avx_data+avx_n), avx_data+avx_n);
    return total;
}


typedef struct sum_avx_thread_data {
    float* data;
    int n;
    float result;
} sum_avx_thread_data;

void* sum_avx_thread(void* vdata){
    struct sum_avx_thread_data* data = (struct sum_avx_thread_data*)vdata;
    data->result = sum_avx(data->n, data->data);
    return vdata;
}

static inline int max(int a, int b){
    return a > b ? a : b;
}

float sum_avx_mt(int thread_count, int n, float* data){
    if(n < 128){
        return sum_avx(n, data);
    }
    int i = 0;
    int n_per_th = n/thread_count;
    n_per_th += 8 - (n_per_th % 8);
    pthread_t threads[thread_count];
    sum_avx_thread_data thread_data[thread_count];
    for(i = 0; (i+1)*n_per_th < n && i < n_per_th - 1; i++){
        thread_data[i].n = n_per_th;
        thread_data[i].data = data+i*n_per_th;
        if(pthread_create(threads+i, NULL, sum_avx_thread, thread_data+i)){
            fprintf(stderr, "Failed to create pthread %d\n", i);
            exit(1);
        }
    }
    // printf("started %d threads, %d floats per thread, %d numbers left over\n", i, n_per_th, n-(i*n_per_th));
    float total = sum(n-(i*n_per_th), data + i*n_per_th);
    for(i = 0; (i+1)*n_per_th < n && i < n_per_th - 1; i++){
        if(pthread_join(threads[i], NULL)){
            fprintf(stderr, "Failed to join pthread %d\n", i);
            exit(1);
        }
        total += thread_data[i].result;
    }
    return total;
}
void* sum_thread(void* vdata){
    struct sum_avx_thread_data* data = (struct sum_avx_thread_data*)vdata;
    data->result = sum(data->n, data->data);
    return vdata;
}

float sum_mt(int thread_count, int n, float* data){
    if(n < 128){
        return sum_avx(n, data);
    }
    int i = 0;
    int n_per_th = n/thread_count;
    n_per_th += 8 - (n_per_th % 8);
    pthread_t threads[thread_count];
    sum_avx_thread_data thread_data[thread_count];
    for(i = 0; (i+1)*n_per_th < n && i < n_per_th - 1; i++){
        thread_data[i].n = n_per_th;
        thread_data[i].data = data+i*n_per_th;
        if(pthread_create(threads+i, NULL, sum_thread, thread_data+i)){
            fprintf(stderr, "Failed to create pthread %d\n", i);
            exit(1);
        }
    }
    // printf("started %d threads, %d floats per thread, %d numbers left over\n", i, n_per_th, n-(i*n_per_th));
    float total = sum(n-(i*n_per_th), data + i*n_per_th);
    for(i = 0; (i+1)*n_per_th < n && i < n_per_th - 1; i++){
        if(pthread_join(threads[i], NULL)){
            fprintf(stderr, "Failed to join pthread %d\n", i);
            exit(1);
        }
        total += thread_data[i].result;
    }
    return total;
}

#define TIME(inner) {\
    ptime = clock(); \
    inner; \
    time = clock(); dtime = (time - ptime)/(float)(CLOCKS_PER_SEC); \
}

int main(){
    int N = 1<<28;
    float* data = malloc(N*sizeof(float));
    for(int i = 0; i < N; i++){
        // data[i] = (float)(rand()%100);
        data[i] = 1.0;
    }
    sleep(1);
    printf("Initialized array\n");
    sleep(1);
    int time, ptime; float dtime;
    float total;
    printf("avx:\n");
    TIME(total = sum_avx(N, data)/N);
    printf("avx avg: %f in %f sec\n", total, dtime);
    sleep(2);
    printf("msd:\n");
    TIME(total = sum_avx_mt(8, N, data)/N);
    printf("msd avg: %f in %f sec\n", total, dtime);
    sleep(2);
    printf("mul:\n");
    TIME(total = sum_mt(8, N, data)/N);
    printf("mul avg: %f in %f sec\n", total, dtime);
    sleep(2);
    printf("cpu:\n");
    TIME(total = sum(N, data)/N);
    printf("cpu avg: %f in %f sec\n", total, dtime);
    free(data);
}