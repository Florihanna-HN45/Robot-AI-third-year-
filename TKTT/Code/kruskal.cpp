//LPThao - thuat toan kruskal
#include<bits/stdc++.h>
using namespace std;
typedef pair <int, pair<int , int >> Canh;
#define ts first 
#define dau second.first
#define cuoi second.second
int main() {
	int n, m ,x,y,v,W, res=0;
	cin >>n>>m;
	int D[n+5]	={};
	Canh A[m+5];
	for(int i=1; i<=m; i++) cin>>A[i].dau>>A[i].cuoi>>A[i].ts;
	sort(A+1, A+m+1);
	for(int i=1; i<=m; i++) {
		x=A[i].dau; while(D[x]!=0) x=D[x];
		y=A[i].cuoi; while(D[y]!=0) y=D[y];
		if(x!=y) { 
		res+=A[i].ts;
		D[x]=y;
		}
	}
	cout<<res;
}
/* vd: 
 9 15
 1 2 3
 1 5 4
 2 3 7 
 2 5 8 
 3 6 2 
 3 7 2 
 3 4 7 
 4 7 5 
 4 9 3
 5 6 4 
 5 8 6 
 6 7 5 
 7 8 6 
 7 9 2
 8 9 4*/
