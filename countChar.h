#ifndef CHAR
#define CHAR

#include <iostream>
using namespace std;

class countchar {

public:
char * pName;
int countc(string a);

};

int countchar::countc(string a)
{
	return a.size();;
}

#endif
