.globlal countSort



countSort:
	
	sll $t0, $a1, 2 
	subi $sp, $sp, $t0
 	move $t0, $sp ;$t0 = output[n]
	
	li $t1, 0 ; $t1 =i
li $t2, 10
sll $t2, $t2, 2
sub $sp, $sp, $t2
move $t2, $sp ;$t2 = count[10]


for1:
	beq $t1, $a1, for1_end
	sll $t3, $t1, 2
	add $t3, $a0, $t3
	lw $t3, 0($t3)	

	div $t3, $a2
	mflo $t3
	
	li $t4, 10
	div $t3,$t4
	mfhi $t3

	sll $t4, $t3, 2
	add $t4, $t4, $t2
	lw $t5 0($t4)
	addi $t5, $t5, 1
	sw $t5, 0($t4)

	addi $t1, $t1, 1
	j for
for1_end:
	
	li $t9, 10
	li $t1, 1 ; $t1 =i
for2:
	beq $t1, $t9, for2_end
	
	sll $t3,$t1, 2
	add $t3, $t3, $t2
	lw $t4, 0($t3)
	
	move $t8, $t1
	addi $t8, $t8, -1
	sll $t3,$t8, 2
	add $t3, $t3, $t2
	lw $t5, 0($t3)

	add $t4, $t4, $t5
	sw $t4, 0($t3)
	
	addi $t1, $t1, 1
	j for2
for2_end:


move $t1, $a1
addi $t1, $t1, -1

for3:
beq $t1, $zero, for3_end




addi $t1, $t1, -1
j for3
for3_end:
	
	li $t1, 0 ; $t1 =i

for4:
	beq $t1, $a1, for3_end
	
	sll $t3, $t1, 2
	add $t3, $t3, $a0
	
	sll $t4, $t1, 2
	add $t4, $t0, $t4
	lw $t4, 0($t4)
	sw $t4, 0($t3)

	addi $t1, $t1, 1
	j for3
for4_end:


jr $ra