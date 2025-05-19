.global _start
.section .text
_start:
	MOV R4, #3 					// Load immediate into R4
	LDR R5, =array      		// Load the address of array into R5
	MOV R6, #0					// Start index at 0
FOR:
	CMP R6, #5  				// i < 5? check condition
	BGE DONE 					// if (i >= 5) exit loop
	
	LDR R7, [R5, R6, LSL #2] 	// Load into R7 contents of R5 at index R6
	CMP R7, R4					// Compare immediate and current value
	MULGE R8, R7, R4			// if current value is greater than immediate
	ADDLT R8, R7, R4			// if current value is less than immediate
	STR R8, [R5, R6, LSL #2]	// save into array at index, value from R8
	
	ADD R6, R6, #1 				// i = i + 1 loop operation
	B FOR 						// repeat loop
DONE:

.section .data
	array:    .word  1, 2, 3, 4, 5  // define array
	