fact:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    li   $t0, 1
    ble  $a0, $t0, fact0or1

    li   $v0, 1

    addi $sp, $sp, -4
    sw   $a0, 0($sp)
    addi $a0, $a0, -1

    jal fact

    lw   $a0, 0($sp)
    addi $sp, $sp, 4
    mul  $v0, $v0, $a0
    j    returnFact

fact0or1:
    li   $v0, 1

returnFact:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
main:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    li   $a0, 3          
    jal  fact

    move $a0, $v0        
    li   $v0, 1
    syscall               

    li   $v0, 10            
    syscall