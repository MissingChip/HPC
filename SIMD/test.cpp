
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
            printf("%f, ", mat->elems[r*mat->cols + c]);
        }
        printf("%f: ", mat->elems[r*mat->cols + c]);
    }
    for(c = 0; c < cols-1; c++){
        printf("%f, ", mat->elems[r*mat->cols + c]);
    }
    printf("%f]", mat->elems[r*mat->cols + c]);
}

bool cmp_mat_struct(struct Mat* a, struct Mat* b){
    if(a->rows != b->rows || a->cols != b->cols) return 1;
    int r = 0;
    int c = 0;
    int rows = a->rows;
    int cols = a->cols;
    for(r = 0; r < rows; r++){
        for(c = 0; c < cols; c++){
            if(a->elems[r*a->cols + c] != b->elems[r*b->cols + c]) return 1;
        }
    }
    return 0;
}

void nl(){
    printf("\n");
}

int main(){
    int N = 1;
    int rows = 2000, cols = 2000;
    Matrix<float> m;
    FMatrix f;
    Mat* cmat, * cmato, * cmato2;

    float mat[] = {
        1.0, 2.0,
        3.0, 4.0
    };

    
    // f.set(rows, cols, mat);
    // f = FMatrix(rows, cols, mat);
    // for(int i = 0; i < N; i++){
    //     m.push_back(Matrix<float>(rows, cols, mat));
    //     f.push_back(FMatrix(rows, cols, mat));
    // }
    // print_mat(rows, cols, f);
    // nl();

    FMatrix f2 = mul(f, f);
    // print_mat(rows, cols, f2);
    // nl();

    cmat = new_mat(rows, cols);
    cmato = new_mat(rows, cols);
    cmato2 = new_mat(rows, cols);
    for(int r = 0; r < rows; r++){
        for(int c = 0; c < cols; c++){
            cmat->elems[r*cols + c] = ((float)rand())/(INT_MAX/2L);
        }
    }
    int ptime, time;
    float dtime;
    ptime = clock();
    for(int i = 0; i < N; i++){
        mul0(cmat, cmat, cmato);
    }
    time = clock(); dtime = (time - ptime)/(float)CLOCKS_PER_SEC;
    printf("%f sec\n", dtime);
    // print_mat_struct(cmato);
    // nl();
    ptime = clock();
    for(int i = 0; i < N; i++){
        mul1(cmat, cmat, cmato2);
    }
    time = clock(); dtime = (time - ptime)/(float)CLOCKS_PER_SEC;
    printf("%f sec\n", dtime);
    printf("not equal? %d\n", cmp_mat_struct(cmato, cmato2));
    ptime = clock();
    for(int i = 0; i < N; i++){
        mul2(cmat, cmat, cmato2);
    }
    time = clock(); dtime = (time - ptime)/(float)CLOCKS_PER_SEC;
    printf("%f sec\n", dtime);
    printf("not equal? %d\n", cmp_mat_struct(cmato, cmato2));
    // print_mat_struct(cmato);
    // nl();
}