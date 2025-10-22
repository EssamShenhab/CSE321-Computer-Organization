.data 
    length:  .asciiz "Enter the number of integers: "
    prompt:  .asciiz "Enter an integer: "
    result:  .asciiz "The average = "
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
    li $t3, 0     # sum = 0

loop:
    bgt $t0, $t1, endLoop

    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    addu $t3, $t3, $t2
    addi $t0, $t0, 1

    j loop

endLoop:
    div $t3, $t1
    mflo $t4

    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

exit:
    li $v0, 10
    syscall