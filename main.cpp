#include <iostream>
#include "countLine.h"
#include "countChar.h"
using namespace std;

int main() {
	countline test;
	string tmp;

	while(tmp != "-1")
	{
	cout<<endl<<"Enter a string(-1 to quit)";
	std::getline(std::cin, tmp);
	if(tmp != "-1")
	{
	test.linel(tmp);
	}
	}
	
	cout<<endl<<"There are "<<test.get_countl()<<"lines total"<<endl;
	return 0;
}

