#include<stdio.h>
#include<time.h>
#include<stdlib.h>


#define X 20000
#define Y 30000
#define Z 40000
#define block_size 100


int main(){
    int i;
    float *a, *b, *c;
    printf("Hello World!\n");
    
    printf("%d\n", (int)sizeof(float));
    // add comment
    i = 0; // give you value, but not necessary you can simply read it online
    // test memory allocation
    a = (float *)malloc(X*Y*sizeof(float));
    for(i=0;i<X*Y;++i){
        a[i] = i;
    }
    return 0;
}
