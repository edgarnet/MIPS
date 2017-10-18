# Edgar Perez
# Homework 5
# CS_260

		.data
my_ints: 	.word 11, 12, -10, 13, 9, 12, 14, 15, -20, 0
my_max:		.word 0
my_sum:		.word 0

msgOne: 	.asciiz "\nThe maximum is: "
msgTwo:		.asciiz "\nThe summation is: "
msgThree: 	.asciiz "\nThe address of the array: "		
		
		.text
		.globl main

main:
		j setup

setup:
		la $s0, my_ints
		addi $s1, $s0, 40 	# Final address is 4 bytes * 10 elements
		lw $t0, 0($s0) 		# Collect first element in my_ints
		sw $t0, my_max 		# Store my_ints[0] in my_max
		
sum:
		beq $s0, $s1, Exit 	# my_ints[i] == end ? Exit
		lw $t0, 0($s0)		# $t0 = my_ints[i]
		addi $s0, $s0, 4 	# i++
		add $s2, $s2, $t0 	# $s2 += my_ints[i]

max:
		lw $a0, my_max 
		slt $t1, $t0, $a0	# my_ints[i] < max ? 
		bne $t1, $zero, sum     # then loop back to sum 

		sw $t0, my_max 		# else max = my_ints[i] 
		j sum

Exit:
		sw $s2, my_sum 		# Store $s2 back into my_sum

		li $v0, 4
		la $a0, msgOne
		syscall

		li $v0, 1
		lw $a0, my_max
		syscall

		li $v0, 4
		la $a0, msgTwo
		syscall

		li $v0, 1
		lw $a0, my_sum
		syscall

		li $v0, 4
		la $a0, msgThree
		syscall

		la $a0, my_ints
		li $v0, 1
		syscall 

		li $v0, 10
		syscall
