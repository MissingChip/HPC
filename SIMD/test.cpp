
#include <cstdlib>
#include <ctime>
#include <stdio.h>
#include <limits.h>
#include <vector>
#include "fmatrix.hpp"
#include "matrix.hpp"
#include "mat_test.hpp"
#include "matmul.h"

template <class T>
void print_mat(int rows, int cols, const T& mat){
    printf("[");
    int r = 0;
    int c = 0;
    for(r = 0; r < rows-1; r++){
        for(c = 0; c < cols-1; c++){
            printf("%f, ", mat[r][c]);
        }
        printf("%f: ", mat[r][c]);
    }
    for(c = 0; c < cols-1; c++){
        printf("%f, ", mat[r][c]);
    }
    printf("%f]", mat[r][c]);
}

void print_mat_struct(struct Mat* mat){
    printf("[");
    int r = 0;
    int c = 0;
    int rows = mat->rows;
    int cols = mat->cols;
    for(r = 0; r < rows-1; r++){
        for(c = 0; c < cols-1; c++){
            printf("%.2f, ", mat->elems[r*mat->cols + c]);
        }
        printf("%.2f: ", mat->elems[r*mat->cols + c]);
    }
    for(c = 0; c < cols-1; c++){
        printf("%.2f, ", mat->elems[r*mat->cols + c]);
    }
    printf("%.2f]", mat->elems[r*mat->cols + c]);
}

template<class T1, class T2>
bool cmp_mat(const T1& a, const T2& b, float tolerance = 0.005){
    if(a.r() != b.r() || a.c() != b.c()) return true;
    for(int r = 0; r < a.r(); r++){
        for(int c = 0; c < a.c(); c++){
            if(abs(a[r][c] - b[r][c]) > tolerance) return true;
        }
    }
    return false;
}

bool cmp_mat_struct(struct Mat* a, struct Mat* b){
    if(a->rows != b->rows || a->cols != b->cols) return 1;
    int r = 0;
    int c = 0;
    int rows = a->rows;
    int cols = a->cols;
    for(r = 0; r < rows; r++){
        for(c = 0; c < cols; c++){
            if(abs(a->elems[r*a->cols + c] - b->elems[r*b->cols + c]) > 0.005) return 1;
        }
    }
    return 0;
}

void nl(){
    printf("\n");
}

void (*mul_fns[])(Mat* a, Mat* b, Mat* o) = {
    mul0, mul1, mul2, mul3
};

template <class T>
T random_matrix(int rows, int cols, float lower, float upper){
    T mat(rows, cols);
    for(int r = 0; r < rows; r++){
        for(int c = 0; c < cols; c++){
            mat[r][c] = (float)rand()/(float)RAND_MAX*(upper-lower)+lower;
        }
    }
    return mat;
}

template<class T, int rows = 2048, int cols = 2048, int N = 1, class A>
void test(A& answer, const char* label = ""){
    srand(0);
    T mat1 = std::move(random_matrix<T>(rows, cols ,-1, 2));
    srand(0);
    T mat2 = std::move(random_matrix<T>(rows, cols ,-1, 2));

    T mato(rows, cols);
    timespec ptime, time;
    float dtime;
    clock_gettime(CLOCK_REALTIME, &ptime);
    for(int i = 0; i < N; i++){
        mul(mat1, mat2, mato);
    }
    clock_gettime(CLOCK_REALTIME, &time); 
    dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
    printf("%s: %f sec\n", label, dtime);
    int a = cmp_mat(mato, answer);
    // print_mat(rows, cols, answer);
    // nl();
    // print_mat(rows, cols, mato);
    // nl();
    if(a){
        printf("\tFAILED: Matrices not equal\n");
    }
    else{
        //printf("PASSED\n");
    }
}

int main(){
    const int N = 1;
    const int rows = 16, cols = 16;
    srand(0);
    FMatrix f = random_matrix<FMatrix>(rows, cols, -1, 2);
    srand(0);
    Matrix2 m2 = random_matrix<Matrix2>(rows, cols, -1, 2);
    srand(0);
    Matrix3 m3 = random_matrix<Matrix3>(rows, cols, -1, 2);
    Mat* cmat, * cmato, * cmato2;

    timespec ptime, time;
    float dtime;

    clock_gettime(CLOCK_REALTIME, &ptime);
    FMatrix ans(rows, cols);
    for(int i = 0; i < N; i++){
        mul(f, f, ans);
    }
    clock_gettime(CLOCK_REALTIME, &time); dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
    printf("function 0: %f sec\n", dtime);
    clock_gettime(CLOCK_REALTIME, &ptime);

    test<Matrix<float>, rows, cols, N>(ans, "Matrix<float>");
    test<VMatrix<float>, rows, cols, N>(ans, "VMatrix");
    test<VMatrix<double, 4>, rows, cols, N>(ans, "VMatrix double");
    test<MatTest<REGULAR>, rows, cols, N>(ans, "regular");
    test<MatTest<BLOCKED>, rows, cols, N>(ans, "blocked");
    test<MatTest<SEQUENTIAL>, rows, cols, N>(ans, "sequential");
}
