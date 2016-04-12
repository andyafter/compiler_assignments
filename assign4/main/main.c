#include<stdio.h>
#include<time.h>


#define X 10000
#define Y 10000

int main(){
  int a[10000][10000] = {0};
  int b[10000][10000] = {0};
  int c[10000][10000] = {0};
  int i, j, k;
  clock_t begin, end;
  double time_spent;
  begin = clock();
  for(i=0;i<10000;++i){
    for(j=0;j<10000;++j){
      for(k=0;k<10000;++k){
        c[i][k]+= a[i][j]*b[j][k];
      }
    }
  }
  end = clock();
  time_spent = (double)(end - begin) / CLOCKS_PER_SEC;

  return 0;
}
