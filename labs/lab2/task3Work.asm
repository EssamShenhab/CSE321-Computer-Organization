.data 
    prompt: .asciiz "Enter a number (1-3): "
    case1Msg : .asciiz "You selected ONE\n"
    case2Msg : .asciiz "You selected TWO\n"
    case3Msg : .asciiz "You selected THREE\n"
    defaultMsg: .asciiz "Invalid choice\n"

.text
main:
    li $v0, 4 
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # switch...case structure
    beq $t0, 1, case1
    beq $t0, 2, case2
    beq $t0, 3, case3
    j defaultCase

case1:
    li $v0, 4
    la $a0, case1Msg
    syscall
    j exit

case2:
    li $v0, 4
    la $a0, case2Msg
    syscall
    j exit

case3:
    li $v0, 4
    la $a0, case3Msg
    syscall
    j exit

defaultCase:
    li $v0, 4
    la $a0, defaultMsg
    syscall
    j exit

exit:
    li $v0, 10
    syscall
