#include <stdint.h>
#include <immintrin.h>
#include <stdio.h>
#include <assert.h>

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
    int offset = n_floats - (addr % n_floats);
    *data += offset;
    *n -= offset;
    *n -= *n % n_floats;
}

float sum_avx(int n, float* data){
    int stride = 8;
    float* avx_data = data;
    int avx_n = n;
    simd_partition(8, &avx_n, &avx_data);
    printf("%p %ld %d\n", data, avx_data - data, avx_n);
    __v8sf var1, var2;
    const __v8sf zero8sf = {0, 0, 0, 0, 0, 0, 0, 0};

    var1 = _mm256_load_ps(avx_data);
    for(int i = stride; i < avx_n; i += stride){
        // for(int j = 0; j < 8; j++){
        //     if(avx_data[i+j] != 1.0){
        //         printf("Error accessing %ld %f\n", i+j+(avx_data-data), avx_data[i+j]);
        //     }
        // }
        var2 = _mm256_load_ps(avx_data + i);
        var1 += var2;
    }
    float total = 0;
    for(int i = 0; i < 8; i++){
        total += var1[i];
    }
    total += sum(avx_data-data, data);
    total += sum((data+n)-(avx_data+avx_n), data);
    return total;
}

int main(){
    float data[1024] = {1};
    for(int i = 0; i < 1024; i++){
        data[i] = 1.0;
    }
    float total = sum_avx(1024, data);
    printf("total: %f\n", total);
}