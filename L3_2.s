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
	LDR R5, =RESULT
	MOV R0, #0x64
	MOV R4, #0
	MOV R3, #10
	MOV R1, R0
	AND R2, R1, #0x0F
	ADD R4, R2
	AND R2, R1, #0xF0
	MOV R2, R2, LSR #4
	MUL R2, R3 
	ADD R4, R2
	STR R4, [R5]
STOP
	B STOP
NUM DCD 64
	AREA DATASEG, DATA, READWRITE
RESULT DCD 0
	END