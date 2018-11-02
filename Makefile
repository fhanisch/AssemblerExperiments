test:
	nasm -f win64 getVal.asm -l list.txt
	cl /nologo /W3 /c test.c
	link /nologo test.obj getVal.obj /LARGEADDRESSAWARE:NO

hello:
	nasm -fwin64 hello_world.asm
	cl /nologo /W3 /c writeText.c
	link /nologo hello_world.obj writeText.obj /SUBSYSTEM:CONSOLE /ENTRY:start libucrt.lib

msgBox:
	nasm -f win64 msgBox.asm
	link /nologo msgBox.obj /subsystem:windows kernel32.lib user32.lib /entry:start

clean:
	del *.obj *.exe *.txt