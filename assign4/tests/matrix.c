#include<stdio.h>
#include<time.h>
#include<stdlib.h>

void print_matrix(float *mat, int i, int j);


int main(){
    float *a, *b, *c; // one dementional array
    int i, x, y;
    x = 3;
    y = 4;
    a = (float *)malloc(x*y*sizeof(float));
    for(i=0;i<x*y;++i){
        a[i] = i;
    }
    print_matrix(a,x,y);
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

