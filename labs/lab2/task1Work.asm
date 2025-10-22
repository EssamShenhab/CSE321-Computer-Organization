.data
firstNumPrompt:  .asciiz "Enter first number: "
secondNumPrompt: .asciiz "Enter second number: "
thirdNumPrompt:  .asciiz "Enter third number: "
forthNumPrompt:  .asciiz "Enter forth number: "
resultPrompt:    .asciiz "The result is: "
newLine:         .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, firstNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, secondNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, thirdNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    li $v0, 4
    la $a0, forthNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    # Sum
    add $s0, $t0, $t1
    add $s0, $s0, $t2
    add $s0, $s0, $t3

    # Divide sum by 4
    li $t4, 4
    div $s0, $t4
    mflo $a0
    mfhi $s5

    # Print result
    li $v0, 4
    la $a0, resultPrompt
    syscall

    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newLine 
    syscall
exit:
    li $v0, 10
    syscall
