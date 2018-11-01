all:
	nasm -f win64 getVal.asm -l list.txt
	cl /nologo /W3 /c test.c
	link /nologo test.obj getVal.obj /LARGEADDRESSAWARE:NO

clean:
	del *.obj *.exe *.txt