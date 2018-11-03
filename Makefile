test:
	nasm -f win64 getVal.asm -l getVal.lst
	nasm -f win64 math.asm -l math.lst
	cl /nologo /W3 /c test.c
	link /nologo test.obj getVal.obj math.obj ../lib/mathlib.lib /LARGEADDRESSAWARE:NO

hello:
	nasm -fwin64 hello_world.asm
	cl /nologo /W3 /c io.c
	link /nologo hello_world.obj io.obj /SUBSYSTEM:CONSOLE /ENTRY:start /LARGEADDRESSAWARE:NO ucrt.lib

hello_masm:
	cl /nologo /W3 /c io.c
	ml64 hello_world_masm.asm /link io.obj /subsystem:console /entry:start ucrt.lib

#ml64 /c hello_world_masm.asm
#link /nologo hello_world_masm.obj io.obj /subsystem:console /entry:start ucrt.lib

msgBox:
	nasm -f win64 msgBox.asm
	link /nologo msgBox.obj /subsystem:windows kernel32.lib user32.lib /entry:start

clean:
	del *.obj *.exe *.txt