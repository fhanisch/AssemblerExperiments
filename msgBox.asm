;nasm -f win64 msgBox.asm
;link msgBox.obj /subsystem:windows kernel32.lib user32.lib /entry:start
global start
extern ExitProcess	; external functions in system libraries
extern MessageBoxA

section .data

caption	db	'64-bit hello!', 0
message	db	'Hello World!', 0

section .text

start:
		sub		rsp,28h      ; shadow space, aligns stack
		mov		rcx, 0       ; hWnd = HWND_DESKTOP
		mov		rdx, message ; LPCSTR lpText
		mov		r8,  caption ; LPCSTR lpCaption
		mov		r9d, 0       ; uType = MB_OK
		call	MessageBoxA  ; call MessageBox API function
		mov		ecx, eax     ; uExitCode = MessageBox(...)
		call	ExitProcess