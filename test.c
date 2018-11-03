//cl /c test.c
//link test.obj getVal.obj /LARGEADDRESSAWARE:NO

#include <stdio.h>
#include <windows.h>
#include "../inc/matrix.h"

int getInt();
double getDouble();
double sin(double x);
double cos(double x);
double sqrt(double x);
double mult(double x1, double x2);
void add4(float*, float*);
void mul4(float*, float*);
void mul4x4v(float*, float*);
void mul4x4(float*, float*, float*);

float v1[] = { 1.0f, 2.0f, 3.0f, 4.0f };
float v2[] = { 10.0f, 10.0f, -10.0f, -10.0f };
float v3[] = { 1.0f, 2.0f, 3.0f, 4.0f };

mat4 A = {	1.5f, 2.5f, 3.5f, 4.5f,
			5.5f, 6.5f, 7.5f, 8.5f,
			-0.5f, -1.5f, -2.5f, -3.5f,
			7.5f, -1.5f, 12.5f, -3.5f };
mat4 B = {	1.5f, 2.5f, 3.5f, 4.5f,
			5.5f, 6.5f, 7.5f, 8.5f,
			-0.5f, -1.5f, -2.5f, -3.5f,
			7.5f, -1.5f, 12.5f, -3.5f };
mat4 C;
float P[] = {	1.5f, 2.5f, 3.5f, 4.5f,
				5.5f, 6.5f, 7.5f, 8.5f,
				-0.5f, -1.5f, -2.5f, -3.5f,
				7.5f, -1.5f, 12.5f, -3.5f };
float Q[] = {	1.5f, 2.5f, 3.5f, 4.5f,
				5.5f, 6.5f, 7.5f, 8.5f,
				-0.5f, -1.5f, -2.5f, -3.5f,
				7.5f, -1.5f, 12.5f, -3.5f };
float R[16];

void printMat4x4(char *name, float *M)
{
	printf("%s =\n", name);
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			printf(" %6.1f", M[j * 4 + i]);
		}
		printf("\n");
	}
}

int main(int argc, char *argv[])
{
	LARGE_INTEGER frequency;
	LARGE_INTEGER t1, t2;
	LARGE_INTEGER elapsedTime;
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

	//------------------------------------------------------------------
	printf("**************************************************\n");
	printf("Matrix multiplication using c compiler:\n");
	printf("C = A * B\n");
	printMatrix4(A, "A");
	QueryPerformanceFrequency(&frequency);
	QueryPerformanceCounter(&t1);
	for (int i = 0; i < 1000; i++) {
		mult4(C, A, B);
	}
	QueryPerformanceCounter(&t2);
	elapsedTime.QuadPart = t2.QuadPart - t1.QuadPart;
	elapsedTime.QuadPart *= 1000000;
	elapsedTime.QuadPart /= frequency.QuadPart;
	printMatrix4(C, "C");
	printf("Calculated in %lld micro seconds.\n", elapsedTime.QuadPart);
	//------------------------------------------------------------------
	printf("**************************************************\n");
	printf("Matrix multiplication using asm & sse:\n");
	printf("R = P * Q\n");
	printMat4x4("P", P);
	QueryPerformanceFrequency(&frequency);
	QueryPerformanceCounter(&t1);
	for (int i = 0; i < 1000; i++) {
		mul4x4(P, Q, R);
	}
	QueryPerformanceCounter(&t2);
	elapsedTime.QuadPart = t2.QuadPart - t1.QuadPart;
	elapsedTime.QuadPart *= 1000000;
	elapsedTime.QuadPart /= frequency.QuadPart;
	printMat4x4("R", R);
	printf("Calculated in %lld micro seconds.\n", elapsedTime.QuadPart);
	return 0;
}

void printVal(int x)
{
	printf("Called and passed from ASM Object: %d\n", x);
}