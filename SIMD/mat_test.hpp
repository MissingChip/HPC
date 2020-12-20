#pragma once

#include "matrix.hpp"

enum Version {
    REGULAR,
    BLOCKED,
    SEQUENTIAL
};

template<int ver>
class MatTest : public Matrix<float> {
public:
    MatTest() : Matrix<float>() {}
    MatTest(int rows, int cols) : Matrix<float>(rows, cols) {}
};

template<>
inline void mul(const MatTest<REGULAR>& a, const MatTest<REGULAR>& b, MatTest<REGULAR>& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
    const int B = BLOCK_SIZE/sizeof(float);
    o.clear();
    int i, j, k, i1, j1, k1;
    for(i = 0; i < o.r(); i++){
        for(j = 0; j < o.c(); j++){
            for(k = 0; k < a.c(); k++){
                o[i][j] += a[i][k]*b[k][j];  
            }
        }
    }
}

template<>
inline void mul(const MatTest<BLOCKED>& a, const MatTest<BLOCKED>& b, MatTest<BLOCKED>& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
    const int B = BLOCK_SIZE/sizeof(float);
    o.clear();
    int i, j, k, i1, j1, k1;
    for(i = 0; i < o.r(); i+=B){
        for(j = 0; j < o.c(); j+=B){
            for(k = 0; k < a.c(); k+=B){
                for(i1 = i; i1 < i+B && i1 < o.r(); i1++){
                    for(j1 = j; j1 < j+B && j1 < o.c(); j1++){
                        for(k1 = k; k1 < k+B && k1 < a.c(); k1++){
                            o[i1][j1] += a[i1][k1]*b[k1][j1];
                        }
                    }
                }
            }
        }
    }
}
template<>
inline void mul(const MatTest<SEQUENTIAL>& a, const MatTest<SEQUENTIAL>& b, MatTest<SEQUENTIAL>& o){
    if(o.r() != a.r() || o.c() != b.c() || a.c() != b.r()){
        return;
    }
    __v8sf var1, var2, var3;
    o.clear();
    for(int r = 0; r < o.r(); r++){
        for(int c = 0; c < o.c(); c++){
            int cb = 0;
            float av = a[r][c];
            for(cb = 0; cb < b.c(); cb++){
                o[r][cb] += av * b[c][cb];
            }
        }
    }
}