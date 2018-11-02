; nasm -f win64 math.asm
global sin
global cos
global sqrt
global mult

section .data

x		dq		0
y		dq		0

section .text

sin:
		movq	[x], xmm0
		fld		qword [x]
		fsin
		fst		qword [y]
		movq	xmm0, [y]
		ret

cos:
		movq	[x], xmm0
		fld		qword [x]
		fcos
		fst		qword [y]
		movq	xmm0, [y]
		ret
	
sqrt:
		sqrtsd	xmm0,xmm0
		ret

mult:
		mulsd	xmm0,xmm1
		ret