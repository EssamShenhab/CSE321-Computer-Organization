.data

prompt:  .asciiz "Enter an integer: "
zeroMsg: .asciiz "Zero\n"
posMsg:  .asciiz "Positive\n"
negMsg:  .asciiz "Negative\n"

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

if:
    bne $t0, $zero, elsif 
    li  $v0, 4
    la  $a0, zeroMsg
    j endif
elsif:
    blez $t0,else
    la $a0, posMsg
    j endif
else:
    la $a0, negMsg
endif:
    li  $v0, 4
    syscall

exit:
    li $v0, 10
    syscall
