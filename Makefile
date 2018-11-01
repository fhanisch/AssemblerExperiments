all:
	nasm -f win64 getVal.asm -l list.txt
	cl /nologo /W3 /c test.c
	link /nologo test.obj getVal.obj /LARGEADDRESSAWARE:NO

hello:
	nasm -fwin64 hello_world.asm
	cl /nologo /W3 /c writeText.c
	link /nologo hello_world.obj writeText.obj /SUBSYSTEM:CONSOLE /ENTRY:start libucrt.lib

clean:
	del *.obj *.exe *.txt