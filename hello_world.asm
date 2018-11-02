;nasm -fwin64 hello_world.asm
;link hello_world.obj writeText.obj /SUBSYSTEM:CONSOLE /ENTRY:start libucrt.lib

global start
extern printf
extern writeText
extern getInt

section .code

msg		db		'*** Hello World !!! ***',10,0

section .text

start:
		mov		rcx,msg
		call	printf
		;call	writeText
		;call 	getInt
l:		jmp		l
		ret