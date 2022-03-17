.section .text

.global __start

__start:
    li $v0, 4004         # write Syscall
    li $a0, 1            # to stdout
    la $a1, hello_world  # Address of string 
    li $a2, 14           # Number of bytes to write
    syscall

    li $v0, 4001         # Exit
    li $a0, 0            # with code 0
    syscall

.section .data
hello_world:
    .asciz "Hello, World!\n"
