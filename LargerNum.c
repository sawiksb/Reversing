#include <stdio.h>  

int main()
{
    int a,b;
    printf("Please enter 2 numbers:\n");
    scanf("%d %d", &a, &b);

    if (a > b)
    {
        printf("%d is the Largest.\n", a);
    }
    else if (b > a)
    {
        printf("%d is the Largest.\n", b );
    }
    else
    {
        printf("Both are Equal\n");
    }
}

