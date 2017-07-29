#include<stdio.h>
#include<string.h>
void sum(char a[],char b[])
{
	int i,n,k;
	for(i=strlen(b)-1,k=0;i>=0;k++,i--)
	{
		a[k]+=b[i]-'0';
		n=k;
		while(a[n]>'9')
		{
			a[n+1]+=(a[n]-'0')/10;
			a[n]=(a[n]-'0')%10+'0';
			n++;
		}
	}
}
int main()
{
	char a[101],b[101],fib[500][201]={0},ch;
	int i,j,k,c,n;
	strcpy(fib[1],"1");
	strcpy(fib[2],"2");
	fib[0][0]='1';
	for(i=1;i<101;i++)  
		fib[0][i]='0';
	for(i=3;i<500;i++)
	{
		for(j=0;j<201;j++)
			fib[i][j]='0';
	}
	for(i=3;;i++)
	{
		sum(fib[i],fib[i-1]);
		sum(fib[i],fib[i-2]);
		for(j=200;fib[i][j]=='0';j--);
		fib[i][j+1]='\0';
		for(k=0;k<=j;k++,j--)
		{
			ch=fib[i][k];
			fib[i][k]=fib[i][j];
			fib[i][j]=ch;
		}
		if(strlen(fib[i])>100||(strlen(fib[i])==101&&strcmp(fib[i],fib[0])>=0))
			break;
	}
	strcpy(fib[0],"1");
	n=i;
	for(i=0;i<100;i++)
	{
		printf("fib[%d]=%s\n",i+1,fib[i]);
	}
}
