;nasm -fwin64 hello_world.asm
;link hello_world.obj writeText.obj /SUBSYSTEM:CONSOLE /ENTRY:start libucrt.lib

global start
extern printf
extern writeText
extern getInt

section .text

start:
	push	rax
	push	rcx
	push	rdx
	push	r8
	push	r9
	push	r10
	push	r11
	mov		rcx,message
	call	printf
	pop		r11
	pop		r10
	pop		r9
	pop		r8
	pop		rdx
	pop		rcx
	pop		rax
	;call	writeText
	;call 	getInt
l:	jmp		l
	ret

message:
	db		'*** Hello World !!! ***',10,0