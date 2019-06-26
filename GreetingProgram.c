#include <conio.h>
#include <stdio.h>

void main()
{
	char name[50];
	printf("Please enter your name: \n");
	scanf("%s",name);
	printf("\n Good Morning, %s !\n",name);
	getch();
}