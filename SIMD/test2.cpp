#include <time.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

class Matrix {
    public:
        float *operator[](std::size_t i) { return data[i]; }
    private:
        float data[1024][1024];
};

int
main() {

    static Matrix a;
    static Matrix b;
    static Matrix c;

    for (std::size_t i = 0; i < 1024; i++) {
        for (std::size_t j = 0; j < 1024; j++) {
            a[i][j] = 3*drand48() - 1;
            b[i][j] = 3*drand48() - 1;
            c[i][j] = 0;
        }
    }

    timespec ptime, time;
    float dtime;

    clock_gettime(CLOCK_REALTIME, &ptime);
    constexpr int B = 64/sizeof(float);
    int i, j, k, i1, j1, k1;
    for(i = 0; i < 1024; i+=B){
        for(j = 0; j < 1024; j+=B){
            for(k = 0; k < 1024; k+=B){
                for(i1 = i; i1 < i+B && i1 < 1024; i1++){
                    for(j1 = j; j1 < j+B && j1 < 1024; j1++){
                        for(k1 = k; k1 < k+B && k1 < 1024; k1++){
                            c[i1][j1] += a[i1][k1]*b[k1][j1];
                        }
                    }
                }
            }
        }
    }

    clock_gettime(CLOCK_REALTIME, &time);
    dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
    printf("%f sec\n", dtime);
}
