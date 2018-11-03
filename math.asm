; nasm -f win64 math.asm
global sin
global cos
global sqrt
global mult
global add4
global mul4
global mul4x4v

section .data
a		dd		1.5
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
		sqrtsd	xmm0, xmm0
		ret

mult:
		mulsd	xmm0, xmm1
		ret

add4:
		movups	xmm0, [rcx]
		movups	xmm1, [rdx]
		addps	xmm0, xmm1
		movups	[rcx], xmm0
		ret

mul4:
		movups	xmm0, [rcx]
		movups	xmm1, [rdx]
		mulps	xmm0, xmm1
		movups	[rcx], xmm0
		ret

mul4x4v:
		movups	xmm0, [rcx]
		movss	xmm1, dword [rdx]
		shufps	xmm1, xmm1, 0
		mulps	xmm0, xmm1
		movups	xmm2, xmm0

		movups	xmm0, [rcx+16]
		movss	xmm1, dword [rdx+4]
		shufps	xmm1, xmm1, 0
		mulps	xmm0, xmm1
		addps	xmm2, xmm0

		movups	[rdx], xmm2
		ret