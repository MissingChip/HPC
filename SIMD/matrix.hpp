#pragma once

#include <cstddef>
#include <cstdint>
#include <memory>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <immintrin.h>
#include <thread>
#include "cache.h"

template<class T>
class Matrix {
protected:
    int rows, cols, stride;
    T* elems = nullptr;

public:
    Matrix() : rows{0}, cols{0}, elems{nullptr} {};
    Matrix(int rows, int cols);
    Matrix(int rows, int cols, const T* data);
    constexpr Matrix(Matrix&& m) : rows{m.rows}, cols{m.cols}, stride{m.stride},elems{m.elems} {m.elems = nullptr;};
    constexpr Matrix& operator=(Matrix&& m) {return std::move(m);};
    ~Matrix();
    T* operator[](size_t i){return elems + i*stride;}
    const T* operator[](size_t i) const{return elems + i*stride;}
    void resize(int rows, int cols);
    void read(const T* data);
    void set(int rows, int cols, const T* data);
    void clear();
    void clean();
    int width() const{return rows;}
    int height() const{return cols;}
    int r() const{return rows;}
    int c() const{return cols;}
    int s() const{return rows;}
    T* row(size_t i) {return elems + i*stride;}
    T* row(size_t i) const{return elems + i*stride;}
    virtual int calculate_stride(int cols) {return cols;}
    static T* allocate(size_t e) {return (T*)aligned_alloc(BLOCK_SIZE, e*sizeof(T));};
    void reallocate();
    static void deallocate(T* elems) {free(elems);};

    Matrix transpose() const;
    friend float dotp(size_t n, const float* a, const float* b);

    Matrix& operator+=(const Matrix& a);
};
template<class T>
T mul(const T& a, const T& b);
template<class T>
void mul(const T& a, const T& b, T& o);
template<class T>
void mul_mt(const T& a, const T& b, T& o);
template<class T>
void mul_mt_wk(int beg_row, int end_row, const T* a, const T* b, T* o);
template<class T>
Matrix<T> operator*(const Matrix<T>& a, const Matrix<T>& b);
template<class T>
Matrix<T> transpose(const Matrix<T>& m);


template<class T>
inline Matrix<T>::Matrix(int rows, int cols) : rows{rows}, cols{cols}, elems{nullptr} {
    resize(rows, cols);
}

template<class T>
inline Matrix<T>::Matrix(int rows, int cols, const T* data) : Matrix{rows, cols} {
    read(data);
}

template<class T>
inline Matrix<T>::~Matrix(){
    clean();
}

template<class T>
inline void Matrix<T>::resize(int rows, int cols){
    this->rows = rows;
    this->cols = cols;
    this->stride = calculate_stride(cols);
    reallocate();
}

template<class T>
inline void Matrix<T>::reallocate(){
    clean();
    elems = allocate(stride * rows);
    clear();
}

template<class T>
inline void Matrix<T>::read(const T* data){
    for(int i = 0; i < rows; i++){
        memcpy(elems + stride * i, data+i*cols, cols*sizeof(T));
    }
}

template<class T>
inline void Matrix<T>::set(int rows, int cols, const T* data){
    resize(rows, cols);
    read(data);
}

template<class T>
inline void Matrix<T>::clear(){
    memset(elems, 0, sizeof(*elems)*rows*stride);
}

template<class T>
inline void Matrix<T>::clean(){
    if(elems == nullptr) return;
    deallocate(elems);
}

template<class T>
inline Matrix<T> Matrix<T>::transpose() const{
    Matrix<T> ret(cols, rows);
    int c = 0;
    for(int r = 0; r < rows; r++){
        for(c = 0; c < cols; c++){
            ret[c][r] = (*this)[r][c];
        }
    }
    return ret;
};

template<class T>
inline Matrix<T> transpose(const Matrix<T>& m){
    return m.transpose();
};


template<class T>
inline void mul(const T& a, const T& b, T& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
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

template<class T = float, int V = 8>
class VMatrix : public Matrix<T>{
public:
    VMatrix() : Matrix<T>() {}
    VMatrix(int rows, int cols) {this->rows = rows; this->cols = cols; this->stride = calculate_stride(cols); Matrix<T>::reallocate();}
    int calculate_stride(int cols) override {return cols - (cols % V) + V;}
};

template<>
inline void mul(const VMatrix<float, 8>& a, const VMatrix<float, 8>& b, VMatrix<float, 8>& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
    __v8sf var1, var2, var3;
    o.clear();
    for(int r = 0; r < o.r(); r++){
        for(int c = 0; c < o.c(); c++){
            var1 = _mm256_broadcast_ss(a[r] + c);
            int cb = 0;
            for(cb = 0; cb < b.s(); cb+=8){
                var2 = _mm256_load_ps(b[c] + cb);
                float* store = o.row(r) + cb;
                _mm256_store_ps(store, var1 * var2 + _mm256_load_ps(store));
            }
        }
    }
}
template<>
inline void mul(const VMatrix<double, 4>& a, const VMatrix<double, 4>& b, VMatrix<double, 4>& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
    __v4df var1, var2, var3;
    o.clear();
    for(int r = 0; r < o.r(); r++){
        for(int c = 0; c < o.c(); c++){
            var1 = _mm256_broadcast_sd(a[r] + c);
            int cb = 0;
            for(cb = 0; cb < b.s(); cb+=4){
                var2 = _mm256_load_pd(b[c] + cb);
                double* store = o.row(r) + cb;
                _mm256_store_pd(store, var1 * var2 + _mm256_load_pd(store));
            }
        }
    }
}
template<>
inline void mul_mt_wk(int beg_row, int end_row, const VMatrix<float, 8>* a, const VMatrix<float, 8>* b, VMatrix<float, 8>* o){
    __v8sf var1, var2, var3;
    o->clear();
    for(int r = beg_row; r < end_row; r++){
        for(int c = 0; c < o->c(); c++){
            var1 = _mm256_broadcast_ss((*a)[r] + c);
            int cb = 0;
            for(cb = 0; cb < b->s(); cb+=8){
                var2 = _mm256_load_ps((*b)[c] + cb);
                float* store = o->row(r) + cb;
                _mm256_store_ps(store, var1 * var2 + _mm256_load_ps(store));
            }
        }
    }
}
template<class T, int V>
inline void mul_mt(const VMatrix<T, V>& a, const VMatrix<T, V>& b, VMatrix<T, V>& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
    int n = a.r() / 8;
    int r = 0;
    int i = 0;
    std::thread threads[8];
    VMatrix<T, V>* o_arr[9];
    o.clear();
    for(i = 0; i < 9; i++){
        o_arr[i] = new VMatrix<T, V>(o.r(), o.c());
    }
    for(i = 0, r = 0; r + n < a.r(); r += n, i++){
        threads[i] = std::thread(mul_mt_wk<VMatrix<T, V>>, r, r+n, &a, &b, o_arr[i]);
    }
    if(r < a.r()){
        mul_mt_wk(r, a.r(), &a, &b, o_arr[i]);
    }
    for(r = 0, i = 0; r + n < a.r(); r += n, i++){
        threads[i].join();
    }
    for(i = 0; i < 9; i++){
        o += *o_arr[i];
        delete o_arr[i];
    }
}