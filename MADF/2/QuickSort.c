#include<stdio.h>
#define MAX 10
int Partition(int a[],int m,int p,int n)
{
    int v=a[m],i=m,j=p,k;
    while(i<=j)
    {
    	while(a[i]<=v && i<=j)
    	{
			 i++; 
		}
		while(a[j]>=v && i<=j)
    	{
			j--; 
		}
		if(i<j)
		{
			int t= a[i];
			a[i]=a[j];
			a[j]=t;
		}
		for(k=0;k<n;k++)
			printf("%d ", a[k]);
		printf("\n");
	}
		a[m]=a[j];
	a[j]=v;
	for(k=0;k<n;k++)
			printf("%d ", a[k]);
	printf("\n\n");
	return j;
}
void QuickSort(int a[],int p,int q,int n)
{
    if(p<q)
    {
        int j=Partition(a,p,q,n);
        QuickSort(a,p,j-1,n);
        QuickSort(a,j+1,q,n);
    }
}
int main()
{
    int n,i;
	printf("Enter the number of elements: ");
	scanf("%d", &n);
	int a[n];
	printf("Enter the elements: \n");
	for(i=0;i<n;i++)
	{
		scanf("%d",&a[i]);
	}
	printf("Swaps: \n");
	QuickSort(a,0,n-1,n);
	printf("Sorted array: \n");
	for(i=0;i<n;i++)
    {
        printf("%d ",a[i]);
    }
}
