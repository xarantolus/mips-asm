.section .text

.global __start

# TODO: Check with calling convention on whether this is ok (likely not)

read:
    li $v0, 4003         # read Syscall
    li $a0, 0            # from stdin
    la $a1, char         # Address of string 
    li $a2, 1            # Number of bytes to read
    syscall

    jr $ra

write:

    li $v0, 4004         # write Syscall
    li $a0, 1            # to stdout
    la $a1, char         # Address of string 
    li $a2, 1            # Number of bytes to write
    syscall

    jr $ra


__start:

    li $t3, 'a'
    li $t4, 'z'

    .Lread:
    jal read
    ble		$v0, $zero, .Lend	# if $v0 <= 0, then we could not read a character (so we should end)

    # Get the last read character from memory
    la		$t1, char
    lb		$t2, 0($t1)
    
    # If char < 'a' or char > 'z', we directly jump to write
    blt		$t2, $t3, .Lwrite	# if $t2 < $t3 then .Lwrite
    bgt		$t2, $t4, .Lwrite	# if $t2 >= $t4 then .Lwrite
        
    # Make this char uppercase by setting the bit for 32 to zero 
    andi	$t2, $t2, 0b11011111
    # Write back to the char location, the write function will take it from there
    sb		$t2, 0($t1)		
    
    .Lwrite:
    jal write
    j .Lread

    .Lend:

    li $v0, 4001
    li $a0, 0
    syscall

.section .data
char:
    .byte 0

