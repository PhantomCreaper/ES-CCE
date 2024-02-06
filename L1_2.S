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
	LDR R0, =SRC
	LDR R1, =SRC+(N-1)*4
	MOV R2, #5
	MOV R3, #10
	LDR R4, =SRC+(N-1)*4
LOOPA
	STR R3, [R4], #-4
	SUBS R3, #1
	BNE LOOPA
LOOP
	LDR R3, [R0]
	LDR R4, [R1]
	STR R3, [R1], #-4
	STR R4, [R0], #4
	SUBS R2, #1
	BNE LOOP
STOP
	B STOP
N EQU 10
	AREA SEG, DATA, READWRITE
SRC DCD 0x10000000
	END