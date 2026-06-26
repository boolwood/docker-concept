#include<stdio.h>
#include<stdlib.h>
#include<limits.h>

#define MAX 1000

typedef struct{
    int wt; int node; 

} heapnode;

typedef struct{
    heapnode arr[MAX];
    int size;
}minheap;

void swap(heapnode *a, heapnode *b){
    heapnode temp=*a;
    *a=*b;
    *b=temp;

}

void heappush(minheap *h, int wt , int node){
    h->size++;
    h->arr[h->size].wt=wt;
    h->arr[h->size].node=node;
    int i=h->size;
    while(i>1 && h->arr[i].wt < h->arr[i/2].wt){
        swap(&h->arr[i],&h->arr[i/2]);
        i/=2;

    }
}
heapnode heappop(minheap *h){
    heapnode top=h->arr[1];
    h->arr[1]=h->arr[h->size];
    h->size--;


int i=1;
while(1){
    int left =2*i;
    int right =2*i+1;
    int smallest =i;
    if(left<=h->size && h->arr[left].wt<h->arr[smallest].wt){
        smallest =left;
    }
    if(right<=h->size && h->arr[right].wt<h->arr[smallest].wt){
        smallest =right;
    }
    if(smallest!=i){
        swap(&h->arr[i],&h->arr[smallest]);
        i=smallest;
    } 
    else break;
}
return top;
}

typedef struct{
    int v; int w;   
} edge;
 
int main(){
    int v;
    printf("enter the  number of node");
    scanf( "%d",&v);
    edge *adj[v];
        int sizes[v];
        for(int i=0;i<v;i++){
            printf("enter the number of neighbour of node %d",i);
            scanf("%d",&sizes[i]);
            adj[i]=(edge*)malloc(sizes[i]*sizeof(edge));
             printf("Enter neighbours and weights (format: node weight):\n");
             for(int j=0;j<sizes[i];j++){
                scanf("%d %d",&adj[i][j].v,&adj[i][j].w);
             }
        }
        minheap pq={.size=0};
        int vis[v];
        for(int i=0;i<v;i++)vis[i]=0;
        heappush(&pq,0,0);
        int sum=0;
        while(pq.size>0){
            heapnode x=heappop(&pq);
            int wt=x.wt;
            int node=x.node;
            if(vis[node]) continue;
            vis[node]=1;
            sum+=wt;
            for(int i=0;i<sizes[node];i++){
                int neigh=adj[node][i].v;
                int w=adj[node][i].w;
                if(!vis[neigh]){
                    heappush(   &pq,w,neigh);

                }
            }
        }
         printf("\nMinimum Spanning Tree Weight = %d\n", sum);

    return 0;
}