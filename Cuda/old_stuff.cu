
void sum_cpu(int n, int iter,float *x)
{
    int pick = 1 << iter;
    int index = pick;
    int stride = (pick*2);
    printf("iter %d\n", iter);
    for(int i = index; i + pick < n ; i += stride){
        printf("%d: %f %f %f\n", i, x[i] + x[i+pick], x[i], x[pick]);
        x[i] = x[i] + x[i+pick];
    }
}


float avg_emul(int n, float* x){
    for(int i = 0; n > (1 << i); i++){
        sum_cpu(n, i, x);
    }
    return *x/n;
}


int ceil_log2(unsigned long long x)
{
  static const unsigned long long t[6] = {
    0xFFFFFFFF00000000ull,
    0x00000000FFFF0000ull,
    0x000000000000FF00ull,
    0x00000000000000F0ull,
    0x000000000000000Cull,
    0x0000000000000002ull
  };

  int y = (((x & (x - 1)) == 0) ? 0 : 1);
  int j = 32;
  int i;

  for (i = 0; i < 6; i++) {
    int k = (((x & t[i]) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;
  }

  return y;
}

__global__
void sum_cuda2(int iter, int n, float* x)
{
    uint64_t pick = pow(4, iter);
    uint64_t index = (pick*4)*(blockIdx.x * blockDim.x + threadIdx.x);
    uint64_t stride = (pick*4)*blockDim.x * gridDim.x;
    for(uint64_t i = index; i + pick*3 < n ; i += stride){
        x[i] = x[i] + x[i+pick] + x[i+pick*2] + x[i+pick*3];
    }
}
