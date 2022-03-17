
build: output.bin

run: output.bin
	qemu-mips ./output.bin												

output.o:
	mips-linux-gnu-as output.s -o output.o

output.bin: output.o
	mips-linux-gnu-gcc output.o -o output.bin -nostdlib -static

clean:
	rm -f output.bin output.o
