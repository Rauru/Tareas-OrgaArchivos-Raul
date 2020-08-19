; Implement the function draw_rect
; void draw_rect(int width, int height)

.global draw_rect
;li $a0, 4
;li $a1, 6
#show $a1
move $t1, $a0
move $t0, $a1
draw_rect:
	

	li $t2, 0
	outer_for:
	beq $t2, $t0, end_outer_for
	
	li $t3, 0
	inner_for:
	beq $t3, $t1, inner_for_end
	

	li $v0, 11
	li $a0, 42
	syscall
	;jal print_char


	addi $t3, $t3, 1
	j inner_for
	inner_for_end:
	
	
	li $v0, 11
	li $a0, 10
	syscall

	li $a0, 32


	addi $t2, $t2, 1
	j outer_for
	end_outer_for:
	jr $ra