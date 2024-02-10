#include <stdio.h>
#define MAX 10
int distance[MAX][MAX];
int n;

void prims()
{
	int i,j,k,l,min=999, total=0, t[n][2], near[n];
	for(i=0;i<n;i++)		//finding first min edge
	{
		
		for(j=0;j<n;j++)
		{
			
			if(distance[i][j]<min)
			{
				min=distance[i][j], k=i,l=j; 
			}
		}
		
	}
	
	total+=min;
	t[0][0]=k, t[0][1]=l;		//listing out edges of spanning tree in matrix t
	for(i=0;i<n;i++)			//initialising the near array
	{
		
		if(distance[i][k]<distance[i][l])
			near[i]=k;
		else
			near[i]=l;
	}
	
	near[k]=near[l]=0;
	for(i=1;i<n-1;i++)		//finding other edges
	{
		 min=999;
		for(l=0;l<n;l++)
		{
			
			if(near[l]!=0 &&distance[l][near[l]]<min)	//to avoid cycle
			{
				min= distance[l][near[l]], k=l; 
			}
		}
		
		t[i][0]=k, t[i][1]=near[k];
		total+=distance[k][near[k]];
		near[k]=0;
		for(j=0;j<n;j++)
		{
			
			if(near[j]!=0 && (distance[j][near[j]] >distance[j][k]))
			{
				near[j]=k; 
			}
		}
		
	}
	
	printf("\nEdge : Weight\n");
	for(i=0;i<n-1;i++)
	{
		
		printf("%d - %d: %d\n",t[i][0], t[i][1], distance[t[i][0]][t[i][1]]); 
	}
	printf("\nMinimum Cost: %d",total); 
}

void main()
{
    int i,max_edges,origin,destin,dist,v,j;
    printf("Enter number of nodes: ");
	scanf("%d",&n);
	
	for(i=0;i<n;i++)
	{
		
		for(j=0;j<n;j++)
	    {
			
	    	distance[i][j]=999;
		}	
		
	}
	
	max_edges=n*(n-1);
	for(i=1;i<=max_edges;i++)
	{
		
		printf("\nPress origin as -1 and destination as -1 to end\n");
		printf("Enter edge %d: ",i);
		scanf("%d %d",&origin, &destin);
		if((origin==-1)&&(destin==-1))
		{	break;}
		printf("Distance: ");
		scanf("%d",&dist);
		
		if(origin>=n||destin>=n||origin<0||destin<0)
		{
			printf("Invalid edge!\n");
			i--; 
		}
		else
		{	distance[origin][destin]=distance[destin][origin]=dist;}
	}
	
	prims();
	
}
