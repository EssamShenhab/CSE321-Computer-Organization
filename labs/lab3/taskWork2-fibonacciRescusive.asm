fib_recursion:
    addi $sp, $sp, -16
    sw   $ra, 0($sp)
    sw   $a0, 4($sp)
    sw   $s0, 8($sp)
    sw   $s1, 12($sp)

    beq  $a0, $zero, fib0

    li   $t0, 1
    beq  $a0, $t0, fib1

    addi $a0, $a0, -1
    jal  fib_recursion
    move $s0, $v0 

    lw   $a0, 4($sp)
    addi $a0, $a0, -2
    jal  fib_recursion
    move $s1, $v0

    add  $v0, $s0, $s1
    j    fib_end

fib0:
    li $v0, 0
    j  fib_end

fib1:
    li $v0, 1
    j  fib_end

fib_end:
    lw   $s1, 12($sp)
    lw   $s0, 8($sp)
    lw   $a0, 4($sp)
    lw   $ra, 0($sp)
    addi $sp, $sp, 16
    jr   $ra


main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0 

    jal fib_recursion

    move $a0, $v0
    li   $v0, 1
    syscall

    li $v0, 10
    syscall


.data
prompt: .asciiz "Enter an integer: "
