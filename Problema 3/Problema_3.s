.global _start
.section .text
_start:
	LDR R4, =pressed_keys	// load array address into R4
	LDR R5, =up_value 		// load up_value address
	LDR R5, [R5]			// load up_value from memory address into R5
	LDR R6, =down_value		// load down_value address
	LDR R6, [R6] 			// load down_value from memory address into R6
	LDR R7, adr_key 		// load key address into R7
	LDR R8, adr_counter 	// load counter address into R8
	MOV R9, #0				// start index at 0
	MOV R2, #0				// set counter at 0
	STR R2, [R8]			// write counter value to memory

FOR:
	CMP R9, #5  				// index < 5? check condition
	BGE DONE 					// if (index >= 5) exit loop
	
	LDR R10, [R4, R9, LSL #2] 	// Load into R10 current array value
	STR R10, [R7]				// save into key address current array value
	LDR R2, [R8]				// load current counter value
	
	LDR R1, [R7]  				// load content of key into R1
	CMP R1, R5					// key == up?
	BLEQ UP 
	CMP R1, R6					// key == down?
	BLEQ DOWN
	
	ADD R9, R9, #1 				// increment index
	B FOR 						// repeat loop

UP:
	ADD R0, R2, #1
	STR R0, [R8]
	MOV PC, LR 				// return
DOWN:
	SUB R0, R2, #1
	STR R0, [R8]
	MOV PC, LR 				// return

DONE:	
	
	
adr_key: .word 0x1000  // address to key
adr_counter: .word 0x2000  // address to counter

.section .data
	up_value:		.word 0xe048	// Down key value
	down_value:		.word 0xe050	// Up key value
	pressed_keys: 	.word 0xe048, 0xe048, 0xe050, 0xaaaa, 0xe048