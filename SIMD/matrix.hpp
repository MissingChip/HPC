#pragma once

#include <cstddef>
#include <cstdint>
#include <memory>
#include <cstring>
#include <cstdlib>
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
    Matrix(int rows, int cols, const float* data);
    constexpr Matrix(Matrix&& m) : rows{m.rows}, cols{m.cols}, stride{m.stride},elems{m.elems} {m.elems = nullptr;};
    constexpr Matrix& operator=(Matrix&& m) {return std::move(m);};
    ~Matrix();
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
    int s() const{return rows;}
    float* row(size_t i) {return elems + i*stride;}
    float* row(size_t i) const{return elems + i*stride;}
    constexpr static int calculate_stride(int cols) {return cols;}
    static float* allocate(size_t e) {return (float*)aligned_alloc(BLOCK_SIZE, e*sizeof(T));};
    static void deallocate(float* elems) {free(elems);};

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
inline Matrix<T>::Matrix(int rows, int cols, const float* data) : Matrix{rows, cols} {
    read(data);
}

template<class T>
inline Matrix<T>::~Matrix(){
    clean();
}

template<class T>
inline void Matrix<T>::resize(int rows, int cols){
    clean();
    this->rows = rows;
    this->cols = cols;
    this->stride = calculate_stride(cols);
    elems = allocate(stride * rows);
    clear();
}

template<class T>
inline void Matrix<T>::read(const float* data){
    for(int i = 0; i < rows; i++){
        memcpy(elems + stride * i, data+i*cols, cols*sizeof(float));
    }
}

template<class T>
inline void Matrix<T>::set(int rows, int cols, const float* data){
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

template<class T, int V>
class VMatrix : public Matrix<T>{
public:
    VMatrix() : Matrix<T>() {}
    VMatrix(int rows, int cols) : Matrix<T>() {Matrix<T>::resize(rows, cols);}
    VMatrix(VMatrix&& m) : Matrix<T>(std::move(m)) {};
    constexpr VMatrix& operator=(VMatrix&& m) {return static_cast<Matrix<T>&>(Matrix<T>::operator=(std::move(m)));};
    constexpr static int calculate_stride(int cols){return cols - (cols % V) + V;}
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
template<>
inline void mul_mt(const VMatrix<float, 8>& a, const VMatrix<float, 8>& b, VMatrix<float, 8>& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
    int n = a.r() / 8;
    int r = 0;
    int i = 0;
    std::thread threads[8];
    VMatrix<float, 8>* o_arr[9];
    o.clear();
    for(i = 0; i < 9; i++){
        o_arr[i] = new VMatrix<float, 8>(o.r(), o.c());
    }
    for(i = 0, r = 0; r + n < a.r(); r += n, i++){
        threads[i] = std::thread(mul_mt_wk<VMatrix<float, 8>>, r, r+n, &a, &b, o_arr[i]);
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