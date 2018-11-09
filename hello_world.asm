;nasm -fwin64 hello_world.asm
;link hello_world.obj io.obj /subsystem:console /entry:start /LARGEADDRESSAWARE:NO ucrt.lib

global start
;extern printf
extern writeText
extern writeText2
extern writeText3

section .data

msg		db		'*** Hello World !!! ***',10,0
msg2	db		'HalliHallo %lf',10,0
msg3	db		'sqrt(4) = %lf',10,0
msg4	db		'Loop %d: ',0
msg5	db		'x = %lf',10,0
x		dq		0.123456
y		dq		4.0
z		dq		0
h		dq		0.001
x_state	dq		0.0
u		dq		5.0
T		dq		0.15

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
;Loop
		movq	xmm10, [x_state]
		movq	xmm11, [T]
		movq	xmm12, [u]
		movq	xmm13, [h]
		mov		rax, 0
		mov		rcx, 1000
l1:		
		push	rax
		push	rcx

		mov		rcx, msg4
		mov		rdx, rax
		sub		rsp, 28h
		call	writeText3
		add		rsp, 28h
		mov		rcx, msg5
		movq	xmm0, xmm12
		subsd	xmm0, xmm10		;u-x_state
		divsd	xmm0, xmm11		;1/T(u-x_state)
		mulsd	xmm0, xmm13		;1/T(u-x_state)*h
		addsd	xmm10, xmm0		;x_state = x_state + 1/T(u-x_state)*h
		movq	xmm1, xmm10
		sub		rsp, 28h
		call	writeText2
		add		rsp, 28h
		pop		rcx
		pop		rax
		inc		rax
		loop	l1

		mov		rax, 0
		ret