#pragma once

#include <cstddef>
#include <cstdint>
#include <memory>
#include <cstring>
#include <cstdlib>
#include <immintrin.h>

const int BLOCK_SIZE = 64;

class FMatrix {
    int rows, cols, stride;
    float* elems = nullptr;

public:
    FMatrix() : rows{0}, cols{0} {};
    FMatrix(int rows, int cols);
    FMatrix(int rows, int cols, const float* data);
    FMatrix(FMatrix&& m) : rows{m.rows}, cols{m.cols}, elems{m.elems} {m.elems = nullptr;};
    FMatrix& operator=(FMatrix&& m) {m.elems = nullptr; return *this;};
    ~FMatrix();
    float* operator[](size_t i){return elems + i*stride;}
    const float* operator[](size_t i) const{return elems + i*stride;}
    void resize(int rows, int cols);
    void read(const float* data);
    void set(int rows, int cols, const float* data);
    void clean();
    int width() const{return rows;}
    int height() const{return cols;}
    int r() const{return rows;}
    int c() const{return cols;}

    FMatrix transpose() const;
    friend float dotp(size_t n, const float* a, const float* b);
    friend FMatrix mul(const FMatrix& a, const FMatrix& b);
    friend void mul(const FMatrix& a, const FMatrix& b, FMatrix& o);
    friend void mul_slow(const FMatrix& a, const FMatrix& b, FMatrix& o);
};
FMatrix operator*(const FMatrix& a, const FMatrix& b);
FMatrix transpose(const FMatrix& m);

inline FMatrix::FMatrix(int rows, int cols) : rows{rows}, cols{cols}, elems{nullptr} {
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
    this->stride = cols - (cols % 8) + 8;
    elems = (float*)aligned_alloc(BLOCK_SIZE, stride * rows * sizeof(*elems));
    memset(elems, 0, stride * rows * sizeof(*elems));
}

inline void FMatrix::read(const float* data){
    for(int i = 0; i < rows; i++){
        memcpy(elems + stride * i, data+i*cols, cols*sizeof(float));
    }
}

inline void FMatrix::set(int rows, int cols, const float* data){
    resize(rows, cols);
    read(data);
}

inline void FMatrix::clean(){
    if(elems == nullptr) return;
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

inline void mul_slow(const FMatrix& a, const FMatrix& b, FMatrix& o){
    if(o.rows != a.rows || o.cols != b.cols || a.cols != b.rows){
        return;
    }
    __v8sf var1, var2, var3;
    memset(o.elems, 0, sizeof(float)*o.rows*o.stride);
    for(int r = 0; r < o.rows; r++){
        for(int c = 0; c < o.cols; c++){
            o[r][c] = 0;
            for(int d = 0; d < a.cols; d++){
                o[r][c] += a[r][d] * b[d][c];
            }
        }
    }
}

inline FMatrix operator*(const FMatrix& a, const FMatrix& b){
    return mul(a, b);
}
inline FMatrix mul(const FMatrix& a, const FMatrix& b){
    FMatrix ret(a.cols, b.rows);
    mul(a, b, ret);
    return ret;
}
inline void mul(const FMatrix& a, const FMatrix& b, FMatrix& o){
    if(o.rows != a.rows || o.cols != b.cols || a.cols != b.rows){
        return;
    }
    __v8sf var1, var2, var3;
    memset(o.elems, 0, sizeof(float)*o.rows*o.stride);
    for(int r = 0; r < o.rows; r++){
        for(int c = 0; c < o.cols; c++){
            var1 = _mm256_broadcast_ss(a[r] + c);
            int cb = 0;
            for(cb = 0; cb + 8 <= b.stride; cb+=8){
                var2 = _mm256_load_ps(b[c] + cb);
                float* store = o.elems + r*o.stride + cb;
                _mm256_store_ps(store, var1 * var2 + _mm256_load_ps(store));
            }
        }
    }
}