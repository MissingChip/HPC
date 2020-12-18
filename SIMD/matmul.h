
#include "fmatrix.hpp"
#include <cstdlib>
#include <immintrin.h>
#include <stdio.h>
#include <string.h>

typedef struct Mat{
    int rows, cols;
    float* elems;
} Mat;

static inline Mat* new_mat(int rows, int cols){
    struct Mat* ret = (Mat*)malloc(sizeof(struct Mat));
    ret->rows = rows;
    ret->cols = cols;
    ret->elems = (float*)aligned_alloc(BLOCK_SIZE, rows*cols*sizeof(float));
    return ret;
}

static inline Mat* new_mat_data(int rows, int cols, float* data){
    struct Mat* ret = new_mat(rows, cols);
    memcpy(ret->elems, data, rows*cols*sizeof(float));
    return ret;
}

static void delete_mat(Mat* mat){
    free(mat->elems);
    free(mat);
}

static inline void mul0(Mat* a, Mat* b, Mat* o){
    if(o->rows != a->rows || o->cols != b->cols || a->cols != b->rows){
        fprintf(stderr, "Matrix dimension mismatch\n");
    }
    float* ae = a->elems;
    float* be = b->elems;
    float* oe = o->elems;
    memset(oe, 0, sizeof(float)*o->rows*o->cols);
    for(int r = 0; r < o->rows; r++){
        for(int c = 0; c < o->cols; c++){
            for(int i = 0; i < a->cols; i++){
                oe[r*o->cols + c] += ae[r*a->cols + i] * be[i*b->cols + c];
            }
        }
    }
}

static inline void mul1(Mat* a, Mat* b, Mat* o){
    if(o->rows != a->rows || o->cols != b->cols || a->cols != b->rows){
        fprintf(stderr, "Matrix dimension mismatch\n");
    }
    float* ae = a->elems;
    float* be = b->elems;
    float* oe = o->elems;
    memset(oe, 0, sizeof(float)*o->rows*o->cols);
    for(int r = 0; r < o->rows; r++){
        for(int c = 0; c < o->cols; c++){
            for(int cb = 0; cb < b->cols; cb++){
                oe[r*o->cols + cb] += ae[r*a->cols + c] * be[c*b->cols + cb];
            }
        }
    }
}

static inline void mul2(Mat* a, Mat* b, Mat* o){
    if(o->rows != a->rows || o->cols != b->cols || a->cols != b->rows){
        fprintf(stderr, "Matrix dimension mismatch\n");
    }
    float* ae = a->elems;
    float* be = b->elems;
    float* oe = o->elems;
    int o_r = o->rows;
    int o_c = o->cols;
    int b_c = b->cols;
    __v8sf var1, var2, var3;
    memset(oe, 0, sizeof(float)*o->rows*o->cols);
    for(int r = 0; r < o_r; r++){
        for(int c = 0; c < o_c; c++){
            int cb = 0;
            for(cb = 0; cb + 8 < b_c; cb+=8){
                var1 = _mm256_broadcast_ss(ae + r*a->cols + c);
                var2 = _mm256_load_ps(be + c*b->cols + cb);
                _mm256_store_ps(oe + r*o->cols + cb, var1 * var2 + _mm256_load_ps(oe + r*o->cols + cb));
            }
            for(; cb < b_c; cb++){
                oe[r*o->cols + cb] += ae[r*a->cols + c] * be[c*b->cols + cb];
            }
        }
    }
}