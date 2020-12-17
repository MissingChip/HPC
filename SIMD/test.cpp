
#include <stdio.h>
#include <vector>
#include "matrix.hpp"
#include "fmatrix.hpp"

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

void nl(){
    printf("\n");
}

int main(){
    int N = 128;
    int rows = 2, cols = 2;
    Matrix<float> m;
    FMatrix f;

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
    FMatrix f2 = mul(f, f);
    print_mat(rows, cols, f2);
    // printf("%f\n", f[0][0]);
    nl();
}