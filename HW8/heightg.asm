# Edgar Perez
# Homework 8
# CS_260

		.data
msgOne: 	.asciiz "\nEnter the height in feet: "
msgTwo: 	.asciiz "\nEnter the height in inches: "
msgThree: 	.asciiz "\nHeight in meters: "
msgFour: 	.asciiz "\nHeight in centimeters: "
coeff: 		.double 12.0
conv: 		.double .0254
cent: 		.double 2.54
		
		.text
		.globl main

# Inputs in MARS are stored in $f0 while outputs are stored in $f12.
# MARS also prohibits the use of odd registers for instruction calls.

main:
		li $v0, 4
		la $a0, msgOne
		syscall

		l.d $f4, coeff
		li $v0, 7
		syscall
		mul.d $f6, $f0, $f4 		# Convert Feet to Inches

		li $v0, 4
		la $a0, msgTwo
		syscall

		li $v0, 7
		syscall
		add.d $f2, $f0, $f6 		# Add all Inches

		li $v0, 4
		la $a0, msgThree
		syscall

		l.d $f4, conv
		li $v0, 3
		mul.d $f12, $f2, $f4 		# Convert Inches to Meters
		syscall
		
		li $v0, 4
		la $a0, msgFour
		syscall

		l.d $f4, cent
		li $v0, 3
		mul.d $f12, $f2, $f4 		# Convert Inches to Centimeters
		syscall

		li $v0, 10
		syscall
