//cl /c io.c

#include <stdio.h>

int writeText(char *str)
{
	printf(str);
	return 0;
}

int writeText2(char *str, double f)
{
	printf(str, f);
	return 0;
}

int writeText3(char *str, int d)
{
	printf(str, d);
	return 0;
}