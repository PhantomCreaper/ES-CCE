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
	MOV R0, #0x40
	LDR R5, =RESULT
	MOV R1, #0
	CMP R0, #10
	BCS DIV
	B RES
DIV
	SUB R0, #10
	ADD R1, #1
	CMP R0, #10
	BCS DIV
RES
	MOV R2, R1
	MOV R2, R2, LSL #4
	ADD R2, R0
	STR R2, [R5]
STOP
	B STOP
NUM DCD 64
	AREA DATASEG, DATA, READWRITE
RESULT DCD 0
	END