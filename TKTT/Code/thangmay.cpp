#include<bits/stdc++.h>
using namespace std;
int main(){
	int n,k,m,s,f;
	//n tang, len k tang, xuong m tang, di tu s -> f
	cin>>n>>k>>m>>s>>f;
	queue<int> Q; 
	int d[n+5] = {}; //d[i] la so buoc it nhat de di tu s den i
	Q.push(s);
	d[s]=1;		//so buoc it nhat de di tu s->s la 0 nhung ta + them 1 de danh dau 
	while(Q.size() && d[f]==0){ 
		int u = Q.front();Q.pop();
		if(u+k<=n && d[u+k] == 0) {
		//kiem tra xem u+k co vuot qua n khong va tang u+k da duoc di den truoc do chua
			d[u+k]=d[u]+1; //neu chua thi so buoc de den tang u+k la d[u]+
			Q.push(u+k); 
		}
		if(u-m>=1 && d[u-m] == 0) { //kiem tra u-m co vuot qua n khong va tang u-m da duoc di den truoc do chua
			d[u-m]=d[u]+1; //neu chua thi so buoc de den tang u-m la d[u]+
			Q.push(u-m);
		}
	}
	cout<<d[f]-1<<" ";		
}
// vi du: 20 3 4 6 18
