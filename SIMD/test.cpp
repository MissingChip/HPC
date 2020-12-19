
#include <cstdlib>
#include <ctime>
#include <stdio.h>
#include <limits.h>
#include <vector>
#include "fmatrix.hpp"
#include "matrix.hpp"
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
#define STRING(s) #s
template<class T, int rows, int cols, int N, class A>
void test(A& answer){
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
    printf("class %s: %f sec\n", typeid(T).name(), dtime);
    int a = cmp_mat(mato, answer);
    if(a){
        printf("FAILED: Matrices not equal\n");
    }
    else{
        printf("PASSED\n");
    }
}

int main(){
    const int N = 1;
    const int rows = 128, cols = 128;
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

    test<Matrix<float>, rows, cols, N>(ans);
    test<VMatrix<float, 8>, rows, cols, N>(ans);
    // test<Matrix3, rows, cols, N>();

    // FMatrix f2(rows, cols);
    // clock_gettime(CLOCK_REALTIME, &ptime);
    // for(int i = 0; i < N; i++){
    //     mul_nsimd2(f, f, f2);
    // }
    // clock_gettime(CLOCK_REALTIME, &time); dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
    // printf("function 0: %f sec\n", dtime);

    // Matrix2 mo(rows, cols);
    // for(int i = 0; i < N; i++){
    //     mul(m2, m2, mo);
    // }
    // clock_gettime(CLOCK_REALTIME, &time); dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
    // printf("function 1: %f sec\n", dtime);
    // printf("!= ? %d %f %f\n", cmp_mat(mo, f3), mo[0][0], f3[0][0]);
    // print_mat(rows, cols, f3);
    // nl();nl();nl();
    // print_mat(rows, cols, mo);
    // nl();

    // cmat = new_mat(rows, cols);
    // cmato = new_mat(rows, cols);
    // cmato2 = new_mat(rows, cols);
    // for(int r = 0; r < rows; r++){
    //     for(int c = 0; c < cols; c++){
    //         cmat->elems[r*cols + c] = ((float)rand())/(INT_MAX/2L);
    //     }
    // }
    // clock_gettime(CLOCK_REALTIME, &ptime);
    // for(int i = 0; i < N; i++){
    //     mul0(cmat, cmat, cmato);
    // }
    // clock_gettime(CLOCK_REALTIME, &time); dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
    // printf("function 0: %f sec\n", dtime);
    // // print_mat_struct(cmato);
    // // nl();
    // for(int fn = 1; fn < 4; fn++){
    //     clock_gettime(CLOCK_REALTIME, &ptime);
    //     for(int i = 0; i < N; i++){
    //         mul_fns[fn](cmat, cmat, cmato2);
    //     }
    //     clock_gettime(CLOCK_REALTIME, &time); dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
    //     printf("function %d: %f sec\n", fn, dtime);
    //     int neq = cmp_mat_struct(cmato, cmato2);
    //     printf("not equal? %d\n", neq);
    //     if(neq){
    //         print_mat_struct(cmato); nl();
    //         print_mat_struct(cmato2); nl();
    //     }
    // }
    // print_mat_struct(cmato);
    // nl();
}