//LPThao
#include<conio.h>
#include <stdio.h>
#include<string.h>
int main() {
	char m[64], p[32],fcs[32];
	int i,j=-1,k;
// nhap chuoi nhi phan
a1:
	printf("\n nhap vao chuoi bit: ");
	gets(m);
	int b=strlen(m); //do dai chuoi m
	for(i=0; i<b; i++) if(m[i]!='0'&&m[i]!='1') {
			printf("\n chuoi khong hop le: \n");
			goto a1;
			break;
		}
// nhap chuoi bit cua da thuc sinh
a2:
	printf("\n nhap vao chuoi sinh: ");
	gets(p);
	int r=strlen(p); // do dai chuoi sinh
	for(i=0; i<r; i++) if(p[i]!='0'&&p[i]!='1') {
			printf("\n chuoi khong hop le: \n");
			goto a2;
			break;
		}
	int d=b+r-1; //do dai chuoi Mx2^r
//them r-1 bit 0 vao chuoi ban dau
	for(i=b; i<d; i++) m[i]=48;

// chuyen ma ASCII thanh so nguyen
	for(i=0; i<d; i++) if (m[i]==49)
			m[i]=1;
		else
			m[i]=0;
	for(i=0; i<r; i++) 	if (p[i]==49)
			p[i]=1;
		else
			p[i]=0;
//luu chuoi Mx2^r
	for(i=0; i<d; i++) fcs[i]=m[i];
//in day Mx2^r
	printf("\n day Mx2^r: ");
	for(i=0; i<d; i++)
		printf("%d", fcs[i]);
//tinh toan FCS
	for(i=0; i<=d-r; i++) {
		if(fcs[i]==1) {
			k=-1;
			for(j=i; j<i+r; j++) {
				k++;
				fcs[j]=fcs[j]^p[k];
			}
		} else
			fcs[i]=0;
		printf("\nday Mx2^r sau khi dich lan %d la: ", i);
		for (int t=0; t<d; t++)
			printf("%d", fcs[t]);

		printf("\n");
	}
//in FCS
	printf("\n so du FCS: ");
	for(i=0; i<d; i++)
		printf("%d", fcs[i]);
//cong FCS voi chuoi Mx2^r
	for(i=0; i<d; i++)
		m[i]=m[i]|fcs[i];
//in ket qua
	printf("\n day T: ");
	for(i=0; i<d; i++)
		printf("%d", m[i]);
	getchar();
}
// thu: 10100010	110100111
