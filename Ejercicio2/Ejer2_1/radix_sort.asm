.global radixSort

.data

.text
radixSort:
    addiu $sp, $sp, -40
    slti $v0, $a1, 2
    sw $s3, 32($sp)
    sw $s2, 28($sp)
    sw $s1, 24($sp)
    sw $ra, 36($sp)
    lw $s1, 0($a0)
    sw $s0, 20($sp)
    move $s3, $a1
    move $s2, $a0
    bne $v0, $zero, $L2
    sll $a0, $a1, 2
    addiu $v0, $s2, 4
    addu $a0, $s2, $a0
$L4:
    lw $v1, 0($v0)
    addiu $v0, $v0, 4
    slt $a2, $s1, $v1
    beq $a2, $zero, $L3
    move $s1, $v1
$L3:
    bne $v0, $a0, $L4
$L2:
    blez $s1, $L1
    li $s0, 1
$L6:
    move $a2, $s0
    move $a1, $s3
    move $a0, $s2
    jal countSort
    sll $a2, $s0, 2
    addu $s0, $a2, $s0
    sll $s0, $s0, 1
    div $s1, $s0
    bne $s0, $zero, $NL0
    break 7
$NL0:
    mflo $v0
    bne $v0, $zero, $L6
$L1:
    lw $ra, 36($sp)
    lw $s3, 32($sp)
    lw $s2, 28($sp)
    lw $s1, 24($sp)
    lw $s0, 20($sp)
    addiu $sp, $sp, 40
    jr $ra
