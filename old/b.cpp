#include <iostream>
#include <algorithm>
#include <string>
#include <vector>
#include <sstream>
#include <stdlib.h>



using namespace std;

void rotate(int *num, string *str, ostringstream *c){
	(*c).str("");
	*c << *num;
	*str = (*c).str();
	(*str).append(1,(*str)[0]);
	(*str).erase(0,1);
	*num = atoi((*str).c_str());
	/*itoa((*num),c,10);
	c.append(1,c[0]);
	c.erase(0,1);
	*num = atoi(c.c_str());*/
}

int main ()
{
	int r;
	string s;
	//char c [6];
	ostringstream c;
	r = 12345;
	cout << "r is : " << r << endl;
	rotate(&r,&s,&c);
	cout << "r is : " << r << endl;
	rotate(&r,&s,&c);
	cout << "r is : " << r << endl;
	return 0;
}