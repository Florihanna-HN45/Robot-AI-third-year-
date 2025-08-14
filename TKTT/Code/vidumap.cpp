//LPThao
#include<bits/stdc++.h>
using namespace std;
int main() {
	map<string, int> M={{"ha noi",29},{"thanh hoa", 36}, {"nam dinh", 18}, {"quang ninh", 14}};
	string s;
	while(1) {
		cout<<"\nMoi ban nhap ten tinh: ";
		fflush(stdin);
		getline(cin, s);
		if(M.find(s)==M.end()) cout<<"\n Khong tim thay";
		else cout <<"\n Ma tinh "<<M[s];
	}
}

