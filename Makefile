
build: exit_code

run: exit_code.bin
	qemu-mips ./exit_code.bin												

exit_code.o:
	mips-linux-gnu-as exit_code.s -o exit_code.o

exit_code.bin: exit_code.o
	mips-linux-gnu-gcc exit_code.o -o exit_code.bin -nostdlib -static
	
install:
	sudo apt-get install qemu gcc-mips-linux-gnu qemu-user

clean:
	rm exit_code exit_code.bin exit_code.o
