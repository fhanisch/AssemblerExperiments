;nasm -fwin64 getVal.asm
;uses x64 calling convention

global getInt
global getDouble
extern printVal
extern printf

section .data

x:	dq		0.123456
m:	db		'*** Hello World !!! ***',10,0
p:	dq		0

section .text

getInt:
	push	rcx
	mov		rcx,13
	call	printVal
	pop		rcx
	mov		rax,5
	ret

getDouble:
	push	rax
	push	rcx
	push	rdx
	push	r8
	push	r9
	push	r10
	push	r11
	;mov		[p],rsp
	mov		rcx,m
	call	printf
	;mov		rsp,[p]
	pop		r11
	pop		r10
	pop		r9
	pop		r8
	pop		rdx
	pop		rcx
	pop		rax
	movq	xmm0,[x]
	ret