//cl /c test.c
//link test.obj getVal.obj /LARGEADDRESSAWARE:NO

#include <stdio.h>

int getInt();
double getDouble();
double sin(double x);
double cos(double x);
double sqrt(double x);
double mult(double x1, double x2);
void add4(float*, float*);
void mul4(float*, float*);
void mul4x4v(float*, float*);

float v1[] = { 1.0f, 2.0f, 3.0f, 4.0f };
float v2[] = { 10.0f, 10.0f, -10.0f, -10.0f };
float M[] = { 1.5f, 2.5f, 3.5f, 4.5f, 5.5f, 6.5f, 7.5f, 8.5f };
float v3[] = { 1.0f, 2.0f, 3.0f, 4.0f };

int main(int argc, char *argv[])
{
	printf("Servus!\n");
	printf("Integer Value = %d\n", getInt());
	printf("Double Value = %lf\n", getDouble());
	printf("sin(pi/2) = %lf\n", sin(3.14159/2.0));
	printf("cos(pi) = %lf\n", cos(3.14159));
	printf("sqrt(81) = %lf\n", sqrt(81.0));
	printf("3*6 = %lf\n", mult(3.0, 6.0));
	add4(v1, v2);
	printf("v1 = {");
	for (int i=0;i<4;i++) printf(" %0.1f", v1[i]);
	printf(" }\n");
	mul4(v1, v2);
	printf("v1 = {");
	for (int i = 0; i < 4; i++) printf(" %0.1f", v1[i]);
	printf(" }\n");
	mul4x4v(M,v3);
	printf("v3 = {");
	for (int i = 0; i < 4; i++) printf(" %0.1f", v3[i]);
	printf(" }\n");
	return 0;
}

void printVal(int x)
{
	printf("Called and passed from ASM Object: %d\n", x);
}