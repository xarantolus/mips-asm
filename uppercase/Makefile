PROGRAM_NAME=up

build: $(PROGRAM_NAME).bin

run: $(PROGRAM_NAME).bin
	echo "This text should no longer have lowercase characters (but other chars should be unaffected!)..." | qemu-mips ./$(PROGRAM_NAME).bin

$(PROGRAM_NAME).o:
	mips-linux-gnu-as $(PROGRAM_NAME).s -o $(PROGRAM_NAME).o

$(PROGRAM_NAME).bin: $(PROGRAM_NAME).o
	mips-linux-gnu-gcc $(PROGRAM_NAME).o -o $(PROGRAM_NAME).bin -nostdlib -static

clean:
	rm -f $(PROGRAM_NAME).bin $(PROGRAM_NAME).o
