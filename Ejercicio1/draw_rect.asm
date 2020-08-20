; Implement the function draw_rect
; void draw_rect(int width, int height)

.global draw_rect

draw_rect:
	;li $a0, 3
	;li $a1, 6

	move $t1, $a0
	move $t0, $a1

	

	li $t2, 0
outer_for:
	beq $t2, $t0, end_outer_for
	
	li $t3, 0
inner_for:
	beq $t3, $t1, inner_for_end
	

	li $a0, 42
	move $t4, $t0
	addi $t4, $t4, -1
	move $t5, $t1
	addi $t5, $t5, -1
	beq $t2, $zero, not_space
	beq $t2, $t4, not_space
	beq $t3, $t5, not_space
	beq $t3, $zero, not_space
	li $a0, 32
not_space:
	li $v0, 11
	syscall
	;jal print_char


	addi $t3, $t3, 1
	j inner_for
inner_for_end:
	
	
	li $v0, 11
	li $a0, 10
	syscall




	addi $t2, $t2, 1
	j outer_for
end_outer_for:
	move $a0, $t1
	li $v0, 0
	jr $ra