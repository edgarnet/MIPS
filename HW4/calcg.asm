#Edgar Perez
#Homework 4
#CS_260

		.data
randOne: 	.word 0
randTwo: 	.word 0
operation: 	.word 0

msgOne: 	.asciiz "\nEnter the first number: "
msgTwo: 	.asciiz "\nEnter the second number: "
msgThree:	.asciiz "\nEnter an operation (0 :: +, 1 :: -, 2 :: *): "
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
		sw $v0, randOne

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

setup: 		
		lw $a0, operation 	#Store input into argument register 
		
		#Conditions for each operation
		beq $a0, 0, addOp
		beq $a0, 1, subOp
		beq $a0, 2, multiOp

addOp:	
		#Load registers and compute
		lw $a0, randOne
		lw $a1, randTwo
		add $a0, $a0, $a1
		j Exit 			#Spent hours on this!

subOp:
		lw $a0, randOne
		lw $a1, randTwo
		sub $a0, $a0, $a1
		j Exit

multiOp:
		lw $a0, randOne
		lw $a1, randTwo
		mult $a0, $a1
		mflo $a0
		j Exit

Exit:
		sw $a0, operation	#Store result in operation
		li $v0, 4
		la $a0, msgFour
		syscall

		#Print result
		li $v0, 1 		#1: v0 code to print_int
		lw $a0, operation
		syscall

		#Exit command	
		li $v0, 10
    		syscall
