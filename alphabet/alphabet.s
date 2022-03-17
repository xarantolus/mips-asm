.section .text

.global __start

__start:
    li $t0, 'a'      # Current character in alphabet
    la $t1, alphabet # Current destination address for that character
    li $t2, 'z'      # Last character in alphabet

    # Basically write a-z into the alphabet data symbol

    .Lalphabet_loop_start:
        bgt $t0, $t2, .Lalphabet_loop_end # if (current_char > 'z') break;

        sb $t0, 0($t1) # Write current char to memory

        addi $t0, $t0, 1 # Jump to next character (e.g. a -> b)
        addi $t1, $t1, 1 # Increase pointer for next char destination

    j .Lalphabet_loop_start

    .Lalphabet_loop_end:

    # Now we can output our generated data

    li $v0, 4004         # write Syscall
    li $a0, 1            # to stdout
    la $a1, alphabet     # Address of string 
    li $a2, 27           # 26 Characters + a newline
    syscall 

    li $v0, 4001
    li $a0, 0
    syscall

.section .data
alphabet:
    .space 26
    .asciz "\n"
