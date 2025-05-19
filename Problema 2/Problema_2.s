.global _start
_start:
	MOV R0, #3				//Load n to R0
FACTORIAL:
	PUSH {R0, LR} 			// push n and LR on stack
	CMP R0, #1 				// R0 <= 1?
	BGT ELSE 				// no: branch to else
	MOV R0, #1 				// otherwise, return 1
	ADD SP, SP, #8 			// restore SP
	MOV PC, LR 				// return
ELSE:
	SUB R0, R0, #1 			// n = n − 1
	BL FACTORIAL 			// recursive call
	POP {R1, LR} 			// pop n (into R1) and LR
	MUL R0, R1, R0 			// R0 = n * factorial(n − 1)
	MOV PC, LR 				// return