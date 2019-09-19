// g++ -g -o main main.cpp 

#include <iostream>

using namespace std ;

int main(int argc, char* argv[])
{
	printf("Sup meng %s\n", argv[1] );
	
	int src = 666;
	int dst;   

	asm ("mov %1, %0\n\t"
    		"add $1, %0"
    		: "=r" (dst) 
    		: "r" (src));

	printf("%d\n", dst);

	return 0;
}

