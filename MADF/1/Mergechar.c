#include<stdio.h>
#define MAX 20
void Merge(char a[], char b[], int low1, int up1, int low2, int up2)
{
	int i=low1, j=low2,k=low1;
	while((i<=up1) && (j<=up2))
	{
		if(a[i]<=a[j])
		{
			b[k++]=a[i++];
		}
		else
		{
			 b[k++]=a[j++];
        }
  
	}
	while(i<=up1)
	{
		b[k++]=a[i++];
	}
	while(j<=up2)
	{
		b[k++]=a[j++];
    }
	for(i=low1; i<=up2; i++)
	{
		a[i]=b[i];
    }
}
void MergeSort(char a[], int low, int high,int n)
{
	int mid,i,k;
        char b[n]; 
	if(low<high)
	{
		mid=(low+high)/2;
		MergeSort(a,low,mid,n);
		MergeSort(a,mid+1,high,n);
		Merge(a,b,low,mid,mid+1,high);
		//for(k=0;k<n;k++)
			//printf("%c ", a[k]);
		//printf("\n\n");
	}
}
void main()
{
	int n,i;
	printf("Enter number of elements: ");
	scanf("%d", &n);
	char a[n];
	printf("Enter elements: \n");
	for(i=0;i<n;i++)
	{
		scanf(" %c", &a[i]);
	}
	//printf("Merging steps: \n");
	MergeSort(a,0,n-1,n);
	printf("Sorted list is : \n");
	for(i=0;i<n;i++)
	{
		printf("%c ", a[i]);
        }
printf("\n");
}
