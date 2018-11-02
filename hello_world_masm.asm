;ml64 hello_world_masm.asm /link /subsystem:console /entry:start libucrt.lib msvcrt.lib
extrn printf: PROC

.data

msg		db		'*** Hello World !!! ***',10,0

.code

start PROC
		lea		rcx,msg
		call	printf
l1:		jmp		l1
		ret
start ENDP
End