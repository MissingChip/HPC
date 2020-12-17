
#include <cstddef>
#include <memory>
#include <cstring>

template<class T, class N = size_t>
T dotp(N n, T* a, T* b){
    T ret = T();
    for(N i = 0; i < n; i++){
        ret += a[i]*b[i];
    }
    return ret;
}

template<class T, class alloc = std::allocator<T>>
class Matrix {
    int rows,cols;
    alloc allocator;
    typedef alloc A;
    T* elems = nullptr;

public:
    Matrix() : rows{0}, cols{0} {};
    Matrix(int rows, int cols) : rows{rows}, cols{cols}, elems{allocator.allocate(rows*cols)} {};
    Matrix(int rows, int cols, T* data) : Matrix{rows, cols} {memcpy(elems, data, sizeof(T)*rows*cols);};
    ~Matrix() {allocator.deallocate(elems, rows*cols);};

    T* data() {return elems;}
    T* operator[](size_t row) {return elems+row*cols;}
    Matrix<T, A> add(const Matrix<T, A>& b);
    Matrix<T, A> sub(const Matrix<T, A>& b);
    Matrix<T, A> mul(const Matrix<T, A>& b);

    Matrix<T, A> transpose();
};

template<class T, class A>
Matrix<T, A> add(const Matrix<T, A>& a, const Matrix<T, A>& b);
template<class T, class A>
Matrix<T, A> mul(const Matrix<T, A>& a, const Matrix<T, A>& b);

template<class T, class A>
inline Matrix<T, A> transpose(const Matrix<T, A>& a){
    return a.transpose();
}

template<class T, class A>
inline Matrix<T, A> Matrix<T, A>::transpose(){
    const Matrix<T, A>& a = *this;
    Matrix<T, A> ret(a.cols, a.rows);
    for(int r = 0; r < a.rows; r++){
        for(int c = 0; c < a.cols; c++){
            ret[c][r] = a[r][c];
        }
    }
    return ret;
}

template<class T, class A>
inline Matrix<T, A> Matrix<T, A>::add(const Matrix<T, A>& b) {
    const Matrix<T, A>& a = *this;
    if(a.rows != b.rows || a.cols != b.cols){
        return Matrix<T, A>(0, 0);
    }
    Matrix<T, A> ret = Matrix<T, A>(a.rows, a.cols, a.data());
    for(int r = 0; r < a.rows; r++){
        for(int c = 0; c < a.cols; c++){
            ret[r][c] += b[r][c];
        }
    }
    return ret;
}

template<class T, class A>
inline Matrix<T, A> Matrix<T, A>::mul(const Matrix<T, A>& b) {
    const Matrix<T, A>& a = *this;
    if(a.cols != b.rows){
        return Matrix<T, A>(0, 0);
    }
    Matrix<T, A> bt = transpose(b);
    Matrix<T, A> ret = Matrix<T, A>(a.rows, b.cols);
    for(int r = 0; r < ret.rows; r++){
        for(int c = 0; c < ret.cols; c++){
            ret[r][c] = dotp(a.cols, a[r], bt[c]);
        }
    }
    return ret;
}