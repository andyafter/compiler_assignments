#include<stdio.h>
#include<time.h>
#include<stdlib.h>


#define X 20000
#define Y 30000
#define Z 40000
#define block_size 100

void print_matrix(float *mat, int i, int j);
void matrix_multiply(float *mat1, float *mat2, float *result, int i, int j, int k);
void tiling_mm(float *mat1, float *mat2, float *result, int i, int j, int k);
void sync_mm(float *mat1, float *mat2, float *result, int i, int j, int k);
// 


int main(){
    float *a, *b, *c; // one dementional array
    int i, j, k;
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
    printf("Starting everything!!!\n");
    //matrix_multiply(a, b, c, X, Y, Z);
    tiling_mm(a, b, c, X, Y, Z);

    end = clock();
    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("time spent: %f \n", time_spent);
    printf("Seems good! \n");
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


void matrix_multiply(float *mat1, float *mat2, float *result, int i, int j, int k){
    // mat1 is i rows and j columns
    // mat2 is j rows and k columns
    // result should have i rows and k columns
    int m, n, l;
    double time_spent;
    clock_t begin, end;
    for(m=0; m<i; ++m){
        begin = clock();
        for(n=0; n<k; ++n){
            for(l=0; l<j; ++l){
                result[m*k+n] += mat1[m*j+l]*mat2[l*k+n];
            }
        }
        end = clock();
        time_spent = (double)(end - begin) / CLOCKS_PER_SEC;            
        printf("%d\t%d\tTime spent:  %f\n", m, i, time_spent);
    }

}


void tiling_mm(float *mat1, float *mat2, float *result, int i, int j, int k){
    // this function take cares of basic loop tiling
    int m, n, mm, l; // mm however, is the block index, nothing to do with m.
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
                    result[m*k+mm*k+n]+=\
                        mat1[m*j+mm*j+n]*mat2[n*k+l+mm];
                }
            }
        }
        end = clock();
        time_spent = (double)(end - begin) / CLOCKS_PER_SEC;            
        printf("$d\t%d\tTime Spent:  %f\n", m,i, time_spent );
    }
}


void sync_mm(float *mat1, float *mat2, float *result, int i, int j, int k){
    // synchronous multiplication
    
}
