fib_iter:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    beq $a0, $zero, fib0
    li $t0, 1
    beq $a0, $t0, fib1

    li $t1, 0
    li $t2, 1
    move $t3, $a0

fib_loop:
    add $t0, $t1, $t2
    move $t1, $t2
    move $t2, $t0
    addi $t3, $t3, -1

    bgt $t3, 1, fib_loop

    move $v0, $t0
    j fib_end

fib0:
    li $v0, 0
    j fib_end

fib1:
    li $v0, 1
    j fib_end

fib_end:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    jal fib_iter 

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

.data
prompt: .asciiz "Enter an integer: "