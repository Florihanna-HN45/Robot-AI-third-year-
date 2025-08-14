//LPThao
#include<bits/stdc++.h>
using namespace std;
int main() {
	int n;
	cin>>n;
	int a[n+5] , res=0;
	for(int i=1; i<=n; i++){
		cin>>a[i];
	}
	for (int i=1; i<n; i++){
		int M= a[i+1];
		for(int j=i+2; j<=n;j++){
			if(M<a[j]) {
				M=a[j];
			}
			if(M>a[j]){
				res+=M-a[j];
			}
		}
	}
	cout << res;
}

