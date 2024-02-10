#include <stdio.h>
int main()
{ 
  int i,j;
  int A[2][2],B[2][2],C[2][2];
  printf("Enter elements of matrix A: ");
  for(i=0;i<2;i++)
  for(j=0;j<2;j++)
  scanf("%d", &A[i][j]);
  printf("Enter elements of matrix B: ");
  for(i=0;i<2;i++)
    for(j=0;j<2;j++)
        scanf("%d", &B[i][j]);
        int p=(A[0][0]+A[1][1])*(B[0][0]+B[1][1]); 
        int q=(A[1][0]+A[1][1])*B[0][0];
        int r=(B[0][1]-B[1][1])*A[0][0];
        int s=(B[1][0]-B[0][0])*A[1][1];
        int t=(A[0][0]+A[0][1])*B[1][1];
        int u=(A[1][0]-A[0][0])*(B[0][0]+B[0][1]);
        int v=(A[0][1]-A[1][1])*(B[1][0]+B[1][1]);
        C[0][0]=p+s-t+v; 
        C[0][1]=r+t;
        C[1][0]=q+s;
        C[1][1]=p+r-q+u;
        printf("C=A X B=\n"); 
        for(i=0;i<2;i++)
        { 
		    for(j=0;j<2;j++)
            printf("%d ", C[i][j]);
            printf("\n"); 
		}
}

