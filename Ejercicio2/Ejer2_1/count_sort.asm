.global countSort



countSort:

	
    sll $t0, $a1, 2 
    sub $sp, $sp, $t0
 
    
    li $t1, 0 ; $t1 =i

li $t2, 10
sll $t2, $t2, 2
sub $sp, $sp, $t2



lw $t9, 0($a0)
move $t7, $a0
move $a0, $sp




add $t0, $sp, $t0 ;$t0 = output[n]
add $t2, $t0, $t2 ;$t2 = count[10]


li $t3, 10
sll $t3, $a1, 2

add $t2, $t3, $t2 


for1:
	beq $t1, $a1, for1_end
	sll $t3, $t1, 2
	add $t3, $t3, $a0
	lw $t3, 0($t3)	
	
	div $t3, $a2
	mflo $t3
	
	li $t4, 10
	div $t3,$t4
	mfhi $t3

	sll $t4, $t3, 2
	add $t4, $t4, $t2
	lw $t5, 0($t4)
	;#show $t5
	addi $t5, $t5, 1
	sw $t5, 0($t4)

	addi $t1, $t1, 1
	j for1
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
	
	sll $t7,$t8, 2
	add $t7, $t7, $t2
	lw $t5, 0($t7)

	add $t4, $t4, $t5
	sw $t4, 0($t3)
	
	addi $t1, $t1, 1
	j for2
for2_end:


move $t1, $a1
addi $t1, $t1, -1

for3:
bltz $t1,for3_end

	
	sll $t3, $t1, 2
	add $t3, $t3, $a0 ;$ t3-> arr[i]
	lw $t4, 0($t3) ; $t4 = arr[i]
	
	div $t4, $a2
	mflo $t4
	
	li $t5, 10
	div $t4, $t5 
	mfhi $t4

	
	sll $t6, $t4, 2
	add $t6, $t6, $t2 ;&=count[arr/exp%10]
	lw $t4, 0($t6)
	addi $t4, $t4, -1 

	sll $t7, $t4, 2
	add $t7, $t7, $t0 ;-> output[count[...]]
	
	lw $t8, 0($t7)
	


	lw $t5, 0($t3)
	sw $t5, 0($t7)
	sw $t4, 0($t6)
	



 
addi $t1, $t1, -1
j for3
for3_end:
	
	li $t1, 0 ; $t1 =i

for4:
	beq $t1, $a1, for4_end

	sll $t3, $t1, 2
	add $t3, $t3, $a0
	
	sll $t4, $t1, 2
	add $t4, $t4, $t0
	lw $t4, 0($t4)
	;#show $t4
	sw $t4, 0($t3)

	addi $t1, $t1, 1
	j for4
for4_end:
	
	

	

	li $t2, 10
	sll $t2, $t2, 2
	add $sp, $sp, $t2

	sll $t0, $a1, 2 
	add $sp, $sp, $t0
 	

jr $ra