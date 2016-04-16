#include<stdio.h>
#include<time.h>
#include<stdlib.h>


#define X 20000
#define Y 3000
#define Z 40000
#define block_size 80

void print_matrix(float *mat, int i, int j);
void tiling_mm(float *mat1, float *mat2, float *result, int i, int j, int k);


int main(){
    float *a, *b, *c; // one dementional array
    int i;
    clock_t begin, end;
    double time_spent;
    begin = clock();
    a = (float *)malloc(X*Y*sizeof(float));
    b = (float *)malloc(Y*Z*sizeof(float));
    c = (float *)malloc(X*Z*sizeof(float));
    printf("%d\n", sizeof(float));
    for(i=0;i<X*Y;++i){
        a[i] = i;
    }
    for(i=0;i<Y*Z;++i)
        b[i]=i;

    for(i=0;i<X*Z;++i)
        c[i]=0;

    // matrix mutiplication here
    tiling_mm(a, b, c, X, Y, Z);
    end = clock();
    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("time spent: %f \n", time_spent);
    return 0;
}

void print_matrix(float *mat, int i, int j){
    int n, m, k;
    k = i*i;
    for(n=0;n<i;n++){
        for(m=n*j; m<n*j+j; ++m){
            printf("%f\t", mat[m]);
        }
        printf("\n");
    }
    printf("%d \t %d\n", i,j);
}

void tiling_mm(float *mat1, float *mat2, float *result, int i, int j, int k){
    // this function take cares of basic loop tiling
    int m, n, mm, nn, l; // mm however, is the block index, nothing to do with m.
    double time_spent;
    clock_t begin, end;
    int total_blocks = (i/block_size)*(k/block_size);
    for(m=0;m<i;m+=block_size){
        for(l=0; l<k; l+=block_size){
            begin = clock();
            #pragma omp parallel for
            for(n=0; n<j; ++n){
                for(mm=0; mm<block_size; ++mm){
                    for(nn=0; nn<block_size; ++nn){
                        result[m*k+mm*k+nn+l]+=\
                            mat1[m*j+mm*j+n]*mat2[nn+l+n*k];    
                    }
                }
            }
            end = clock();
            time_spent = (double)(end - begin) / CLOCKS_PER_SEC;            
            printf("%d\t%d\t%d\tTime Spent:  %f\n", m,l, total_blocks ,time_spent);
        }
    }
}
