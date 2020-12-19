#pragma once

#include <cstddef>
#include <cstdint>
#include <memory>
#include <cstring>
#include <cstdlib>
#include <immintrin.h>
#include <thread>

const int BLOCK_SIZE = 64;

class FMatrix {
protected:
    int rows, cols, stride;
    float* elems = nullptr;

public:
    FMatrix() : rows{0}, cols{0}, elems{nullptr} {};
    FMatrix(int rows, int cols);
    FMatrix(int rows, int cols, const float* data);
    constexpr FMatrix(FMatrix&& m) : rows{m.rows}, cols{m.cols}, stride{m.stride},elems{m.elems} {m.elems = nullptr;};
    constexpr FMatrix& operator=(FMatrix&& m) {return m;};
    ~FMatrix();
    float* operator[](size_t i){return elems + i*stride;}
    const float* operator[](size_t i) const{return elems + i*stride;}
    void resize(int rows, int cols);
    void read(const float* data);
    void set(int rows, int cols, const float* data);
    void clear();
    void clean();
    int width() const{return rows;}
    int height() const{return cols;}
    int r() const{return rows;}
    int c() const{return cols;}
    float* row(size_t i) {return elems + i*stride;}
    float* row(size_t i) const{return elems + i*stride;}

    FMatrix transpose() const;
    friend float dotp(size_t n, const float* a, const float* b);
    friend FMatrix mul(const FMatrix& a, const FMatrix& b);
    friend void mul(const FMatrix& a, const FMatrix& b, FMatrix& o);
    friend void mul_nsimd(const FMatrix& a, const FMatrix& b, FMatrix& o);
    friend void mul_slow(const FMatrix& a, const FMatrix& b, FMatrix& o);
    friend void mul_mt(const FMatrix& a, const FMatrix& b, FMatrix& o);
    friend void mul_mt_wk(int beg_row, int end_row, const FMatrix* a, const FMatrix* b, FMatrix* o);

    FMatrix& operator+=(const FMatrix& a);
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


inline void FMatrix::clear(){
    memset(elems, 0, sizeof(float)*rows*stride);
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

inline FMatrix& FMatrix::operator+=(const FMatrix& a){
    for(int r = 0; r < rows; r++){
        for(int c = 0; c < cols; c += 8){
            float* x = row(r) + c;
            float* y = a.row(r) + c;
            _mm256_store_ps(x, _mm256_load_ps(x) + _mm256_load_ps(y));
        }
    }
    return *this;
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
            for(cb = 0; cb < b.stride; cb+=8){
                var2 = _mm256_load_ps(b[c] + cb);
                float* store = o.elems + r*o.stride + cb;
                _mm256_store_ps(store, var1 * var2 + _mm256_load_ps(store));
            }
        }
    }
}
inline void mul_nsimd(const FMatrix& a, const FMatrix& b, FMatrix& o){
    if(o.rows != a.rows || o.cols != b.cols || a.cols != b.rows){
        return;
    }
    __v8sf var1, var2, var3;
    memset(o.elems, 0, sizeof(float)*o.rows*o.stride);
    for(int r = 0; r < o.rows; r++){
        for(int c = 0; c < o.cols; c++){
            int cb = 0;
            float av = a[r][c];
            for(cb = 0; cb < b.cols; cb++){
                o[r][cb] += av * b[c][cb];
            }
        }
    }
}
inline void mul_mt_wk(int beg_row, int end_row, const FMatrix* a, const FMatrix* b, FMatrix* o){
    __v8sf var1, var2, var3;
    memset(o->elems, 0, sizeof(float)*o->rows*o->stride);
    for(int r = beg_row; r < end_row; r++){
        for(int c = 0; c < o->cols; c++){
            var1 = _mm256_broadcast_ss((*a)[r] + c);
            int cb = 0;
            for(cb = 0; cb < b->stride; cb+=8){
                var2 = _mm256_load_ps((*b)[c] + cb);
                float* store = o->elems + r*o->stride + cb;
                _mm256_store_ps(store, var1 * var2 + _mm256_load_ps(store));
            }
        }
    }
}
inline void mul_mt(const FMatrix& a, const FMatrix& b, FMatrix& o){
    if(o.rows != a.rows || o.cols != b.cols || a.cols != b.rows){
        return;
    }
    int n = a.rows / 8;
    int r = 0;
    int i = 0;
    std::thread threads[8];
    FMatrix* o_arr[9];
    memset(o.elems, 0, sizeof(float)*o.rows*o.stride);
    for(i = 0; i < 9; i++){
        o_arr[i] = new FMatrix(o.rows, o.cols);
    }
    for(i = 0, r = 0; r + n < a.rows; r += n, i++){
        threads[i] = std::thread(mul_mt_wk, r, r+n, &a, &b, o_arr[i]);
    }
    if(r < a.rows){
        mul_mt_wk(r, a.rows, &a, &b, o_arr[i]);
    }
    for(r = 0, i = 0; r + n < a.rows; r += n, i++){
        threads[i].join();
    }
    for(i = 0; i < 9; i++){
        o += *o_arr[i];
        delete o_arr[i];
    }
}

class Matrix2 : public FMatrix {
public:
    Matrix2() : FMatrix(){}
    Matrix2(int rows, int cols);
    void resize(int rows, int cols);

    friend void mul(const Matrix2& a, const Matrix2& b, Matrix2& o);
};

inline Matrix2::Matrix2(int rows, int cols){
    resize(rows, cols);
}

inline void Matrix2::resize(int rows, int cols){
    clean();
    this->rows = rows;
    this->cols = cols;
    this->stride = cols;
    elems = (float*)malloc(stride * rows * sizeof(*elems));
    memset(elems, 0, stride * rows * sizeof(*elems));
}

inline void mul(const Matrix2& a, const Matrix2& b, Matrix2& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
    const int B = BLOCK_SIZE/sizeof(float);
    o.clear();
    int i, j, k, i1, j1, k1;
    for(i = 0; i < o.r(); i+=B){
        for(j = 0; j < o.c(); j+=B){
            for(k = 0; k < a.c(); k+=B){
                for(i1 = 0; i1 < i+B && i1 < o.r(); i1++){
                    for(j1 = 0; j1 < j+B && j1 < o.c(); j1++){
                        for(k1 = 0; k1 < k+B && k1 < a.c(); k1++){
                            o[i1][j1] += a[i1][k1]*b[k1][j1];
                        }
                    }
                }
            }
        }
    }
}

class Matrix3 : public Matrix2 {
public:
    Matrix3() : Matrix2(){};
    Matrix3(int rows, int cols) : Matrix2(rows, cols) {};

    friend void mul(const Matrix3& a, const Matrix3& b, Matrix3& o);
};

inline void mul(const Matrix3& a, const Matrix3& b, Matrix3& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
    const int B = BLOCK_SIZE/sizeof(float);
    o.clear();
    int i, j, k, i1, j1, k1;
    for(i = 0; i < o.r(); i++){
        for(j = 0; j < o.c(); j++){
            for(k = 0; k < a.c(); k++){
                o[i][j] += a[i][k]*b[k][j];  
            }
        }
    }
}
