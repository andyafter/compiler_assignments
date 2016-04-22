#include<stdio.h>
#include<time.h>
#include<stdlib.h>


#define X 4000
#define Y 3000
#define Z 4000
#define block_size 100

void print_matrix(float *mat, int i, int j);
void matrix_multiply(float *mat1, float *mat2, float *result, int i, int j, int k);


int main(){
    float *a, *b, *c; // one dementional array
    int i, j, k;
    clock_t begin, end;
    double time_spent;
    a = (float *)malloc(X*Y*sizeof(float));
    b = (float *)malloc(Y*Z*sizeof(float));
    c = (float *)malloc(X*Z*sizeof(float));
    printf("%d\n", (int)sizeof(float));
    /* for(i=0;i<X*Y;++i){ */
    /*     a[i] = i; */
    /* } */
    /* for(i=0;i<Y*Z;++i) */
    /*     b[i]=i; */

    for(i=0;i<X*Z;++i)
        c[i]=i;
    printf("Clocks Per Second: %lf \n", CLOCKS_PER_SEC);
    begin = clock();
    /* for(i=0; i<X; ++i){ */
    /*     end = clock(); */
    /*     time_spent = (double)(end - begin) / CLOCKS_PER_SEC; */
    /*     printf("time spent: %f \n", time_spent); */
    /*     for(j=0; j<Z; ++j){ */
    /*         k = c[i*X+j]; */
    /*         c[j*X+i]=k; */
    /*     } */
    /* } */
    // matrix mutiplication here
    printf("Starting everything!!!\n");
    matrix_multiply(a, b, c, X, Y, Z);

    end = clock();
    //time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    time_spent = end - begin;
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


void vect(float *mat1, float *mat2, float *result, int i, int j, int k){
    //function for testing loop vectorizing
    int m, n, l;
    double time_spent;
    clock_t begin, end;
    for(m=0; m<i; ++m){
        begin = clock();
        #pragma clang loop vectorize(enable)
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
