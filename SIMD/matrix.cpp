
void add(int n, float* x, float* y, float* o){
    for(int i = 0; i < n; i++){
        o[i] = x[i] + y[i];
    }
}

void add_avx(int n, float* x, float* y, float* o){
}