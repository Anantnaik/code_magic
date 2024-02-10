#include<stdio.h>
#define MAX 10
int interchange(char *b,char *c)
{
  char tmp=*b;
      *b=*c;
      *c=tmp;
}
int Partition(char a[],int m,int p,int n)
{
    int tmp,i,j,k;
    i=m+1;
    j=p;
    char v=a[m];
    while(i<=j)
    {
    	while(a[i]<v && i<=j)
    	{
			 i++; 
		}
		while(a[j]>v)
    	{
			j--; 
		}
		if(i<j)
		{
			interchange(&a[i],&a[j]);
		}
                else
                i++;
		/*for(k=0;k<n;k++)
			printf("%d ", a[k]);
		printf("\n");*/
	}
        a[m]=a[j];
	a[j]=v;
        printf("j=%d\t",j+1);
	for(k=0;k<n;k++)
			printf("%c ", a[k]);
	printf("\n\n");
	return j;
}
int kthsmall(char a[],int m,int n,int k,int s)
{
  if(m==n)
  return a[m];
  int p;
     p=Partition(a,m,n,s);
  if(p==k)
  return a[p];
  else if(p>k)
  return kthsmall(a,m,p-1,k,s);
  else
  return kthsmall(a,p+1,n,k,s);
 } 
  
  
int main()
{
    int n,i,k;
	printf("Enter the number of elements: ");
	scanf("%d", &n);
	char a[50];
	printf("Enter the elements: \n");
	for(i=0;i<n;i++)
	{
		scanf(" %c",&a[i]);
	}
	
        printf("enter index to be searched\n");
        scanf("%d",&k);
        printf("Swaps: \n");
	printf("smallest element at %c\n",kthsmall(a,0,n-1,k-1,n));
	
}
