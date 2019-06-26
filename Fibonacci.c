#include <stdio.h>

int main()
{
	int n, first=0, second=0, next, i;

	printf("Enter the number of terms\n");
	scanf("%d", &n);
	printf("First %d Fibonacci Series are: \n");

	for(i=o; i<n; i++)
	{
		if(i <= 1)
		{
			next = i;
		}
		else
		{
			next = first + second;
			first = second;
			second = next;
		}
		printf("%d\n", next);
	}
	return 0;
}