;ml64 hello_world_masm.asm /link io.obj /subsystem:console /entry:start ucrt.lib
;oder:
;ml64 /c hello_world_masm.asm
;link hello_world_masm.obj io.obj /subsystem:console /entry:start ucrt.lib

;extrn printf: PROC
extrn writeText: PROC

.data

msg		db		'*** Hello World !!! ***',10,0

.code

start PROC
		sub		rsp,28h      ; shadow space, aligns stack
		lea		rcx,msg
		;call	printf
		call	writeText
		add		rsp,28h
		mov		rax,0
		ret
start ENDP
End