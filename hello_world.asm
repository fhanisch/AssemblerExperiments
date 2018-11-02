;nasm -fwin64 hello_world.asm
;link hello_world.obj io.obj /subsystem:console /entry:start /LARGEADDRESSAWARE:NO ucrt.lib

global start
;extern printf
extern writeText
extern writeText2

section .data

msg		db		'*** Hello World !!! ***',10,0
msg2	db		'HalliHallo %lf',10,0
msg3	db		'sqrt(4) = %lf',10,0
x		dq		0.123456
y		dq		4.0
z		dq		0

section .text

start:
		sub		rsp, 28h      ; shadow space, aligns stack
		mov		rcx, msg
		;call	printf
		call 	writeText
		mov		rcx, msg2
		movq	xmm1, [x]
		mulsd	xmm1, [y]
		addsd	xmm1, [y]
		call	writeText2
		fld		qword [y]
		fsqrt
		fst		qword [z]
		mov		rcx, msg3
		movq	xmm1, [z]
		call	writeText2
		add		rsp, 28h
		mov		rax, 0
		ret