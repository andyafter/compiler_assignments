#include<stdio.h>
#include<time.h>
#include<stdlib.h>


#define X 30000
#define Y 40000
#define Z 50000

void print_matrix(int *mat, int i, int j);
void matrix_multiply(int *mat1, int *mat2, int *result, int i, int j, int k);
// 


int main(){
    int *a, *b, *c; // one dementional array
    int i, j, k;
    clock_t begin, end;
    double time_spent;
    begin = clock();
    a = (int *)malloc(X*Y*sizeof(int));
    b = (int *)malloc(Y*Z*sizeof(int));
    c = (int *)malloc(X*Z*sizeof(int));
    for(i=0;i<X*Y;++i){
        a[i] = i;
    }
    for(i=0;i<Y*Z;++i)
        b[i]=i;

    for(i=0;i<X*Z;++i)
        c[i]=0;

    // matrix mutiplication here
    printf("Starting everything!!!\n");
    matrix_multiply(a, b, c, X, Y, Z);

    end = clock();
    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("time spent: %f \n", time_spent);
    printf("Seems good! \n");
    return 0;
}


void print_matrix(int *mat, int i, int j){
    // i rows and j columns
    int n, m, k;
    k = i*i;
    for(n=0;n<i;n++){
        for(m=n*j; m<n*j+j; ++m){
            printf("%d\t", mat[m]);
        }
        printf("\n");
    }
    printf("%d \t %d\n", i,j);
}


void matrix_multiply(int *mat1, int *mat2, int *result, int i, int j, int k){
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
