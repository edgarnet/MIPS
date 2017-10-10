#Edgar Perez
#Homework 4
#CS_260

		.data
randOne: 	.word 0
randTwo: 	.word 0
operation: 	.word 0

msgOne: 	.asciiz "\nEnter the first number: "
msgTwo: 	.asciiz "\nEnter the second number: "
msgThree:	.asciiz "\nEnter an operation (1 :: +, 2 :: -, 3 :: *): "
msgFour: 	.asciiz "\nThe result is: "

		.text
		.globl main

main:
		#Collect first number
		li $v0, 4
		la $a0, msgOne 		#Prompt
		syscall
		li $v0, 5 		#Read
		syscall 
		sw $v0, randOne 	#Store

		#Collect second number
		li $v0, 4 		#4: v0 code for print_string
		la $a0, msgTwo
		syscall
		li $v0, 5 		#5: v0 code for read_int
		syscall
		sw $v0, randTwo

		#Collect operation
		li $v0, 4
		la $a0, msgThree
		syscall
		li $v0, 5
		syscall
		sw $v0, operation

		#temp registers
		lw $t0, randOne
		lw $t1, randTwo
		lw $t2, operation


setup: 		
		#Store input into argument registers 
		move $a0, $t0
		move $a1, $t1
		#Conditions for each operation
		beq $t2, 1, addOp
		beq $t2, 2, subOp
		beq $t2, 3, multiOp

addOp:
		add $a0, $a0, $a1
		j Exit 			#Spent hours on this!

subOp:
		sub $a0, $a0, $a1
		j Exit

multiOp:
		mult $a0, $a1
		mflo $a0
		j Exit

Exit:
		move $v1, $a0 		#Store result in $v1 to use $a0
		li $v0, 4
		la $a0, msgFour
		syscall

		#Print result
		li $v0, 1 		#1: v0 code to print_int
		move $a0, $v1
		syscall

		#Exit command	
		li $v0, 10
    		syscall	
