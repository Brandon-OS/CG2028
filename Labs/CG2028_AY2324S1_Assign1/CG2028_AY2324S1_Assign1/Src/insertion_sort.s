/*
 * insertion_sort.s
 *
 *  Created on: 10/08/2023
 *      Author: Ni Qingqing
 */
   .syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.thumb

		.global insertion_sort

@ Start of executable code
.section .text

@ EE2028 Assignment 1, Sem 1, AY 2023/24
@ (c) ECE NUS, 2023
@ Insertion sort arr in ascending order

@ Write Student 1’s Name here:
@ Write Student 2’s Name here:

@ You could create a look-up table of registers here:

@ R0 ...
@ R1 ...

@ write your program from here:
insertion_sort:
	PUSH {R4, R5, R6, R7, R8, R9, R10, R14}

	// R0 - array
	// R1 - total number of elements
	// R2 - current index
	// R3 - prev index
	// R4 - temp value
	// R5 - number of swaps
	// R6 - current value
	// R7 - previous value
	// R8 - temp index
	// R9 - temp index
	// R10 - #4

	MOV R2, #1
	MOV R5, #0
	MOV R10, #4

	BL outer_loop

done_sorting:
	MOV R0, R5
	POP {R4, R5, R6, R7, R8, R9, R10, R14}
	BX LR

outer_loop:
	CMP R2, R1
	BGE done_sorting

	ADD R2, #1
	MOV R3, R2
	BL inner_loop

inner_loop:
	SUB R3, #1

	// return to outer loop
	CMP R3, #0
	BEQ outer_loop

	SUB R8, R2, #1
	SUB R9, R3, #1
	MUL R8, R8, R10
	MUL R9, R9, R10

	LDR R6, [R0, R8]
	LDR R7, [R0, R9]

	CMP R6, R7
	BLT SWAP

	B outer_loop

SWAP:
	MOV R4, R7
	MOV R7, R6
	MOV R6, R4
	STR R7, [R0, R9]
	STR R6, [R0, R8]
	LDR R11, [R0, R8]
	SUB R2, #1
	ADD R5, #1


	B inner_loop


