//LPThao - sang so nguyen to Eratosthene
#include<bits/stdc++.h>
using namespace std;
void eratos(int n, vector<int>&P) {
	bool S[n+5]={}; //khai bao mang toan false(0)
	for(int i=2; i<=n; i++)
	if (S[i]==0) 
	{
		P.push_back(i);
		for(int j=i*i; j<=n; j+=i) S[j]=1;
	}
}
int main() {
	int n;
	cin>>n;
	vector<int>Q;
	eratos(n,Q);
	for(int x:Q) cout <<x<<" "<<endl;
}
