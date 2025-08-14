//LPThao - hang doi uu tien
#include<bits/stdc++.h>
using namespace std;
struct cmp {
	bool operator()(int a, int b) {
//		return a%2>b%2; // chan truoc le sau
		return a%2==b%2?a>b:a%2>b%2; // chan truoc va sx tang, le sau va sx tang
	}
};
int main() {
	int a[]= {23, 52, 464, 67, 756, 379,12,849};
//	priority_queue<int> Q; // uu tien lon
//	priority_queue<int, vector<int>, greater<int> > Q; //uu tien be
	priority_queue<int, vector<int>, cmp > Q; 


	for(int x:a) Q.push(x);
	while(Q.size()) {
		cout <<Q.top()<<" \n";
		Q.pop();
	}
}

