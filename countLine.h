#ifndef LINE
#define LINE

#include <iostream>
#include "countChar.h"
using namespace std;

class countline {

public:
char * pName;
int linel(string a);
void countl();
int get_countl();

protected:
int count = 0;
};

#endif

int countline::linel(string a)
{
	countchar test;

	cout<<endl<<"There are "<<test.countc(a)<<" character in "<< a <<endl;

	countl();
	return 1;
}

void countline::countl()
{
	count++;
}

int countline::get_countl()
{
	return count;
}
