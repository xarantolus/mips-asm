.section .text

.global __start

__start:
    li $v0, 4001
    li $a0, 0
    syscall
