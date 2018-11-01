//cl /c test.c
//link test.obj getVal.obj /LARGEADDRESSAWARE:NO

#include <stdio.h>

int getInt();
double getDouble();

int main(int argc, char *argv[])
{
	printf("Servus!\n");
	printf("Integer Value = %d\n", getInt());
	printf("Double Value = %lf\n", getDouble());

	return 0;
}

void printVal(int x)
{
	printf("Called and passed from ASM Object: %d\n", x);
}