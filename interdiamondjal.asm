
jal main

li $v0, 10
syscall

ask_levels:
	li $v0, 5
	syscall
	
	move $a0, $v0
	
	li $t0, 2
	div $a0, $t0
	move $t1, $a0
  	mfhi $a0
		
	
	beq $a0, $zero, not_round
	addi $t1, $t1, 1


not_round:
#show $t2 decimal
#show $t3 decimal
jr $ra

show_diamond:

div $t1, $t0
move $t2, $t1



mflo $t1
mflo $t8
addi $t2, $t2,1
addi $t8, $t8,1
#show $t8 decimal
#show $t2 decimal
#show $t1 decimal


li $t0, 1
li $t3, 0
li $t4, 0
li $t5, 0
li $t6, 2
li $t7, -1



space_loop_start:
	beq $t3, $t1, asterisk_loop_start
	li $v0, 11
	li $a0, 32
	addi $t3, $t3, 1
	syscall
	j space_loop_start
asterisk_loop_start:
	beq $t4, $t0, asterisk_loop_end
	
	li $v0, 11
	li $a0, 42
	addi $t4, $t4, 1
	syscall
	j asterisk_loop_start
asterisk_loop_end:
	beq $t5, $t2, exit_loop
	li $v0, 11
	li $a0, 10

	
	beq $t3, $zero, change_registers
	j continue
	change_registers:
	li $t6, -2
	li $t7, 1
	continue:
	beq $t3, $t8, change_registers
	add $t0, $t0, $t6
	add $t1, $t1, $t7
	move $t4, $zero
	move $t3, $zero	



	addi $t5, $t5, 1
	syscall

	
	bne $t5,$t2, space_loop_start
exit_loop:	
	jr $ra
	

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal ask_levels
	jal show_diamond

	lw $ra, 0($sp)
	jr $ra
