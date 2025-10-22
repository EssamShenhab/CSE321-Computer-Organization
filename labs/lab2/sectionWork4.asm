.data
    prompt:  .asciiz "Enter an integer: "
    result:  .asciiz "The sum = "
    newLine: .asciiz "\n"

.text
main:
    move $t0, $zero
do:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0,5
    syscall
    move $t1, $v0

    addu $t0, $t0, $t1
while:
    bne $t1, $zero, do

    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0,$t0
    syscall

    li $v0, 4
    la $a0, newLine
    syscall
exit:
    li $v0, 10
    syscall