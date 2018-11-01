;nasm -fwin64 getVal.asm
;uses x64 calling convention

global getInt
global getDouble
extern printVal

section .data

x:	dq		0.123456

section .text

getInt:
	push	rcx
	mov		rcx,13
	call	printVal
	pop		rcx
	mov		rax,5
	ret

getDouble:
	movq	xmm0,[x]
	ret