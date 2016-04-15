#include<stdio.h>
#include<time.h>
#include<stdlib.h>


#define X 4
#define Y 4
#define Z 8
#define block_size 2


void tiling_mm(float *mat1, float *mat2, float *result, int i, int j, int k);
void print_matrix(float *mat, int i, int j);

int main(){
    float *a, *b, *c; // one dementional array
    int i, j, k;
    clock_t begin, end;
    double time_spent;

    a = (float *)malloc(X*Y*sizeof(float));
    b = (float *)malloc(Y*Z*sizeof(float));
    c = (float *)malloc(X*Z*sizeof(float));
    for(i=0;i<X*Y;++i){
        a[i] = i;
    }
    for(i=0;i<Y*Z;++i)
        b[i]=i;

    for(i=0;i<X*Z;++i)
        c[i]=0;

    tiling_mm(a,b,c,X,Y,Z);

    // here see the result;
    print_matrix(a,X,Y);
    print_matrix(b,Y,Z);
    print_matrix(c,X,Z);
    return 0;
}

void print_matrix(float *mat, int i, int j){
    // i rows and j columns
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
    for(m=0;m<i;m+=block_size){
        begin = clock();
        for(l=0; l<k; l+=block_size){
            #pragma omp parallel for
            for(n=0; n<j; ++n){
                // result does not have anything to do with n,
                // which n is the column of mat1 and row of mat2
                // here block stuff.
                for(mm=0; mm<block_size; ++mm){
                    for(nn=0; nn<block_size; ++nn){
                        result[m*k+mm*k+nn+l]+=\
                            mat1[m*j+mm*j+n]*mat2[nn+l+n*k];    
                    }
                }
            }
        }
        end = clock();
        time_spent = (double)(end - begin) / CLOCKS_PER_SEC;            
        printf("%d\t%d\tTime Spent:  %f\n", m,i, time_spent);
    }
}

