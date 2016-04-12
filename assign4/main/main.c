#include<stdio.h>
#include<time.h>
#include<stdlib.h>


#define X 1000
#define Y 1000
#define Z 1000


int main(){
  int* a,b,c; // one dementional array
  int i, j, k;
  clock_t begin, end;
  double time_spent;
  begin = clock();
  a = (int *)malloc(100000000*sizeof(int));
  for(i=0;i<100000000;++i){
    a[i] = i;
    printf("%d\n",a[i]);
  }
  /*
  for(i=0;i<X;++i){
    for(j=0;j<Y;++j){
      for(k=0;k<Z;++k){
        c[i][k]+= a[i][j]*b[j][k];
      }
    }
    }*/
  end = clock();
  time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
  printf("time spent: %f \n", time_spent);
  printf("Seems good! \n");
  return 0;
}
