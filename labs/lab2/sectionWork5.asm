.data
    length:  .asciiz "Enter the number of natural numbers: "
    result:  .asciiz "The sum = "
    newLine: .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, length
    syscall

    li $v0, 5
    syscall
    move $t1, $v0


    li $t0, 1     # counter = 1
    li $t2, 0     # sum = 0
loop:
    bgt $t0, $t1, endLoop

    addu $t2, $t2, $t0
    addi $t0, $t0, 1

    j loop

endLoop:
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newLine
    syscall
exit:
    li $v0, 10
    syscall
