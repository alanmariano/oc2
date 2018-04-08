#include <iostream>

using namespace std;

int main()
{
    
    int A[16] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
    int B[16] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
    int k, j, i;
    int C[64] = {0};
    int D[16] = {0};
    for(k=0;k<4;k++){
        for(j=k;j<16;j+=4){
            for(i=k*4;i<(4*k)+4;i++){
                C[k*16+j+i-(k*5)] = A[j] * B[i];
            }
        }
    }
    
    for(i=0;i<64;i++){
        cout << C[i]<< " ";
    }
  
    for(i=0;i<16;i++){
        D[i] = C[i] + C[16+i] + C[32+i] + C[48+i];
        cout << D[i]<< " ";
    }

    
    return 0;
}