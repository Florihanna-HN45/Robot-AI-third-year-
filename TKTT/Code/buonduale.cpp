//LPThao
#include<bits/stdc++.h>
using namespace std;
int main() {
	int n, k , m , s=0, x, t ;
	cin>>n>>k>>m;
	queue <int> Q;
	for(int i=1; i<=n+k; i++) {
		if(i<=n) cin>>x;
		else x=0;
		Q.push(x);
		if(Q.size()>k) Q.pop();
		t=0;
		while(Q.size()&&Q.front()+t<=m) {
			t+=Q.front();
			Q.pop();
		}
		if(Q.size()>0) {
			Q.front ()= m-t;
			t=m;
		}
		s+=t;
	}
	cout<<s;
}




