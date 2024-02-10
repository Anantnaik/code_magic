#include<stdio.h>
#define MAX 10

int BinarySearch(char a[],int low,int high,char x)
{
	int mid;
	if(low==high)
	{
		if(x==a[low])
		return low;
		else
		return -1;
	}
	else
	{
	mid=(low+high)/2;
	
	if(a[mid]==x)
	{
		return mid;
	}
	else if(x<a[mid])
	{
		
		BinarySearch(a,low,mid-1,x);
	}
	else
	{
		BinarySearch(a,mid+1,high,x);
	}
}
}
int main()
{
	int n,i;
	char a[n],x;
	printf("Enter the number of elements: ");
	scanf("%d",&n);
	printf("Enter array: ");
	for(i=0;i<n;i++)
	{
		scanf(" %c",&a[i]);
	}
	printf("Enter the element to be searched: ");
	scanf(" %c",&x);
	int in=BinarySearch(a,0,n,x);
    if(in==-1)
        printf("Not found\n");
    else
        printf("%c found at index %d\n",x,in);
	return 0;
}
