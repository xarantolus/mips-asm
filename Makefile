install:
	sudo apt-get install qemu gcc-mips-linux-gnu qemu-user
	
clean:
	find */* -type f -name Makefile -execdir make clean \; > /dev/null

