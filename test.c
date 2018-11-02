//cl /c test.c
//link test.obj getVal.obj /LARGEADDRESSAWARE:NO

#include <stdio.h>

int getInt();
double getDouble();
double sin(double x);
double cos(double x);
double sqrt(double x);
double mult(double x1, double x2);

int main(int argc, char *argv[])
{
	printf("Servus!\n");
	printf("Integer Value = %d\n", getInt());
	printf("Double Value = %lf\n", getDouble());
	printf("sin(pi/2) = %lf\n", sin(3.14159/2.0));
	printf("cos(pi) = %lf\n", cos(3.14159));
	printf("sqrt(81) = %lf\n", sqrt(81.0));
	printf("3*6 = %lf\n", mult(3.0, 6.0));

	return 0;
}

void printVal(int x)
{
	printf("Called and passed from ASM Object: %d\n", x);
}