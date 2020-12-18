#pragma once

#include <cstddef>
#include <cstdint>
#include <memory>
#include <cstring>
#include <cstdlib>
#include <immintrin.h>

const int BLOCK_SIZE = 64;

class FMatrix {
    int rows, cols;
    float** elems = nullptr;

public:
    FMatrix() : rows{0}, cols{0} {};
    FMatrix(int rows, int cols);
    FMatrix(int rows, int cols, const float* data);
    FMatrix(FMatrix&& m) : rows{m.rows}, cols{m.cols}, elems{m.elems} {m.elems = nullptr;};
    FMatrix& operator=(FMatrix&& m) {m.elems = nullptr; return *this;};
    ~FMatrix();
    float* operator[](size_t i){return elems[i];}
    const float* operator[](size_t i) const{return elems[i];}
    void resize(int rows, int cols);
    void read(const float* data);
    void set(int rows, int cols, const float* data);
    void clean();


    FMatrix transpose() const;
    friend float dotp(size_t n, const float* a, const float* b);
    friend FMatrix mul(const FMatrix& a, const FMatrix& b);
};
FMatrix transpose(const FMatrix& m);

inline FMatrix::FMatrix(int rows, int cols) : rows{rows}, cols{cols} {
    resize(rows, cols);
}

inline FMatrix::FMatrix(int rows, int cols, const float* data) : FMatrix{rows, cols} {
    read(data);
}

inline FMatrix::~FMatrix(){
    clean();
}

inline void FMatrix::resize(int rows, int cols){
    clean();
    this->rows = rows;
    this->cols = cols;
    elems = (float**)aligned_alloc(BLOCK_SIZE, rows*sizeof(*elems));
    int size = 0;
    for(int i = 0; i < rows; i++){
        elems[i] = (float*)aligned_alloc(BLOCK_SIZE, cols*sizeof(**elems));
        int j = 1;
        for(j = 1; i + j < rows && j * cols *sizeof(**elems) < BLOCK_SIZE; j++){
            elems[i+j] = elems[i] + cols*j;
        }
        i += j - 1;
    }
}

inline void FMatrix::read(const float* data){
    for(int i = 0; i < rows; i++){
        memcpy(elems[i], data+i*cols, cols*sizeof(float));
    }
}

inline void FMatrix::set(int rows, int cols, const float* data){
    resize(rows, cols);
    read(data);
}

inline void FMatrix::clean(){
    if(elems == nullptr) return;
    free(elems[0]);
    for(int i = 1; i < rows; i++){
        if(elems[i] != elems[i-1] + cols){
            free(elems[i]);
        }
    }
    free(elems);
}

inline FMatrix FMatrix::transpose() const{
    FMatrix ret(cols, rows);
    int c = 0;
    for(int r = 0; r < rows; r++){
        for(c = 0; c < cols; c++){
            ret[c][r] = (*this)[r][c];
        }
    }
    return ret;
};

inline FMatrix transpose(const FMatrix& m){
    return m.transpose();
};

inline float sum(__v8sf v){
    float total = 0;
    for(int i = 0; i < 8; i++){
        total += v[i];
    }
    return total;
}


inline float* simd_partition(float* data){
    intptr_t addr = (intptr_t)(data)/sizeof(float);
    int offset = (8 - (addr % 8)) % 8;
    data += offset;
    return data;
}

inline float dotp(size_t n, const float* a, const float* b){
    int i = 0;
    __v8sf var1, var2;
    float total = 0;
    for(i = 0; i + 8 < n; i += 8){
        var1 = _mm256_load_ps(a + i);
        var2 = _mm256_load_ps(b + i);
        total += sum(var1 * var2);
    }
    if(i < n){
        alignas(BLOCK_SIZE) float* scratch = {0};
        memcpy(scratch, a + i, (n-i)*sizeof(float));
        var1 = _mm256_load_ps(scratch);
        memcpy(scratch+8, b + i, (n-i)*sizeof(float));
        var2 = _mm256_load_ps(scratch+8);
        total += sum(var1 * var2);
    }
    return total;
};

inline FMatrix mul(const FMatrix& a, const FMatrix& b){
    if(a.cols != b.rows){
        return FMatrix(0, 0);
    }
    FMatrix bt = transpose(b);
    FMatrix ret = FMatrix(a.rows, b.cols);
    for(int r = 0; r < ret.rows; r++){
        for(int c = 0; c < ret.cols; c++){
            ret[r][c] = dotp(a.cols, a[r], bt[c]);
        }
    }
    return ret;
}