/*
 * This is unblocked kij matmul, comparing where the data is stored in the
 * object directly, or where the data is stored in an allocated block.  First
 * precludes run-time sizing.
 */

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

class Matrix2 {
    public:
        Matrix2() : data(new float[1024*1024]) {}
        ~Matrix2() { delete [] data; }
        float *operator[](std::size_t i) { return &data[1024*i]; }
    private:
        float *__restrict__ const data;
};

int
main() {

    {
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
        for(int k = 0; k < 1024; k++){
            for(int i = 0; i < 1024; i++){
                for(int j = 0; j < 1024; j++){
                    c[i][j] += a[i][k]*b[k][j];
                }
            }
        }

        clock_gettime(CLOCK_REALTIME, &time); 
        dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
        printf("%f sec\n", dtime);
    }
    {
        static Matrix2 a;
        static Matrix2 b;
        static Matrix2 c;

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
        for(int k = 0; k < 1024; k++){
            for(int i = 0; i < 1024; i++){
                for(int j = 0; j < 1024; j++){
                    c[i][j] += a[i][k]*b[k][j];
                }
            }
        }

        clock_gettime(CLOCK_REALTIME, &time); 
        dtime = (time.tv_sec - ptime.tv_sec)+(time.tv_nsec - ptime.tv_nsec)/(float)1e9;
        printf("%f sec\n", dtime);
    }
}

// vim: set ai sw=4 ts=4 et:
