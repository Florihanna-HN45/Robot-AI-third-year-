//LPThao
#include<bits/stdc++.h>
using namespace std;
int main() {
	int n, t = -INT_MAX, s=0;
	cin>>n;
	pair<int, int> A[n];
	for (auto &x:A) cin>>x.second>>x.first;
	sort(A,A+n);
	for (auto x:A)
	if (x.second>=t) {
		s++;
		t=x.first;
	}
	cout<<"Tong sk: "<<s;
	}

