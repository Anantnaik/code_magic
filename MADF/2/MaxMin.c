#include<stdio.h>
int max,min,a[30];
int MaxMin(int i, int j)
{
 	int max1, min1, mid;
 	if(i==j)
 	{
 		max=a[i];
 		min=a[i];
 	}
 	else
 	{
  		if(i==j-1)
  		{
   			if(a[i]<a[j])
   			{
    			max=a[j];
    			min=a[i];
   			}
   			else
   			{
    			max=a[i];
    			min=a[j];
   			}
  		}	
  		else
  		{
   			mid=(i+j)/2; 
   			MaxMin(i, mid); 
   			max1=max;
		        min1=min;
   			MaxMin(mid+1,j); 
   			if(max<max1)
    		        {
    			max=max1;
			}
   			if(min>min1)
    		        {
    			min=min1; 
			}
  		}
 	}
}
int main()
{
    int n,i;
    printf("enter number of elemts\n");
    scanf("%d",&n);
    printf("enter elements\n");
    for(i=1;i<=n;i++)
{
   scanf("%d",&a[i]);
}
max=a[0];
min=a[0];
MaxMin(1,n);

printf("maximum value is:%d",max);
printf("\n");
printf("minimum value is:%d",min);
printf("\n");
}


 
