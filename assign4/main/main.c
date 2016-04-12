#include<stdio.h>
#include<time.h>


#define X 1000
#define Y 1000
#define Z 1000


int main(){
  int a[X][Y] = {0};
  int b[Y][Z] = {0};
  int c[X][Z] = {0};
  int i, j, k;
  clock_t begin, end;
  double time_spent;
  begin = clock();
  for(i=0;i<X;++i){
    for(j=0;j<Y;++j){
      for(k=0;k<Z;++k){
        c[i][k]+= a[i][j]*b[j][k];
      }
    }
  }
  end = clock();
  time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
  printf("time spent: %f \n", time_spent);
  return 0;
}
