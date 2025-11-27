# $a0 -> n
# $v0 -> n!

fact:
    li $t0, 1  # i: counter
    li $t1, 1  # factorial

for:
    bgt  $t0, $a0, endFor
    mul  $t1, $t0, $t1

    addi $t0, $t0, 1
    j for
endFor:
    move $v0, $t1
returnFact:
    jr $ra
main:
    addi $sp, $sp, -4
    sw  $ra, 0($sp)

    li $a0, 3

    jal fact

    move $a0, $v0
    li $v0, 1
    syscall

returnMain:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4

    jr   $ra
