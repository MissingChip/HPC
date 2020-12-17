
typedef struct Mat{
    int rows, cols;
    float* elems;
} Mat;

static inline void mul1(Mat* a, Mat* b, Mat* o){
    int ar = a->rows;
    int ac = a->cols;
    float* ae = a->elems;
    int br = b->rows;
    int bc = b->cols;
    float* be = b->elems;

}