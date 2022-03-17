
build: exit_code.bin

run: exit_code.bin
	qemu-mips ./exit_code.bin												

exit_code.o:
	mips-linux-gnu-as exit_code.s -o exit_code.o

exit_code.bin: exit_code.o
	mips-linux-gnu-gcc exit_code.o -o exit_code.bin -nostdlib -static

clean:
	rm -f exit_code.bin exit_code.o
