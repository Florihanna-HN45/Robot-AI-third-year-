//LPThao
#include<bits/stdc++.h>
using namespace std;

	struct covid {
		int n, m , d[100000], F[100000]= {};
		vector <int> A[10000];
		queue <int>Q;
		cin >>n>>m;
		while (m--) {
			int x, y ;
			cn>>x>>y;
			A[x].push_back (y);
			A[y].push_back (x);
		}
		fill(d, d+n+1, -1 );
		cin >> F[0];
		for (int i=1; i<=F[0]; i++) {
			int x;
			cin>>x;
			Q.push(x);
			d[x]=0;
		}
		while (Q.size()) {
			int u= Q.front();
			Q.pop();
			for (auto v:A[u])
				if (d[v]==-1) {
					d[v]=d[u]+1;
					Q.push(v);
					F[d[v]]++;
				}
		}
		for(int i=0; F[i]!=0; i++)
		cout <<"F"<<i<<":"<<F[i]<<"\n";
	};
int main() {
	



