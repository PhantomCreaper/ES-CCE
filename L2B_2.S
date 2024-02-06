	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	MOV R1, #N1
	MOV R2, #N2
	LDR R10, =DST
	
UP 
	CMP R1, R2
	BEQ GCD
	BCS DIV
	MOV R5, R1
	MOV R6, R2
	MOV R1, R6
	MOV R2, R5
	B DIV
	
DIV
	SUB R1, R2
	CMP R1, R2
	BCS DIV
	CMP R1, #0
	BEQ GCD
	B UP
	
GCD
	MOV R9, R2
	STR R2, [R10], #4

	MOV R1, #N1
	MOV R2, #N2
	MUL R0, R1, R2
	MOV R4, #0
DIV1
	SUB R0, R9
	ADD R4, #1
	CMP R0, R9
	BCS DIV1
	STR R4, [R10], #4
STOP
	B STOP
	
N1 EQU 56
N2 EQU 42

	AREA DATASEG, DATA, READWRITE
DST DCD 0X10000000

	END