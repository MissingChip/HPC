
#include <cstdlib>
#include <ctime>
#include <stdio.h>
#include <limits.h>
#include <vector>
#include "matrix.hpp"
#include "fmatrix.hpp"
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

bool cmp_mat(const FMatrix& a, const FMatrix& b, float tolerance = 0.005){
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

int main(){
    int N = 1;
    int rows = 2, cols = 2;
    Matrix<float> m;
    FMatrix f;
    Mat* cmat, * cmato, * cmato2;

    float mat[] = {
        1.0, 2.0,
        3.0, 4.0
    };

    
    f.set(rows, cols, mat);
    // f = FMatrix(rows, cols, mat);
    // for(int i = 0; i < N; i++){
    //     m.push_back(Matrix<float>(rows, cols, mat));
    //     f.push_back(FMatrix(rows, cols, mat));
    // }
    print_mat(rows, cols, f);
    nl();

    FMatrix f2(rows, cols);
    mul(f, f, f2);
    print_mat(rows, cols, f2);
    nl();

    // cmat = new_mat(rows, cols);
    // cmato = new_mat(rows, cols);
    // cmato2 = new_mat(rows, cols);
    // for(int r = 0; r < rows; r++){
    //     for(int c = 0; c < cols; c++){
    //         cmat->elems[r*cols + c] = ((float)rand())/(INT_MAX/2L);
    //     }
    // }
    // timespec ptime, time;
    // float dtime;
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