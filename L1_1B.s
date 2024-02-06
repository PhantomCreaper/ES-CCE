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
	LDR R0, =DST+(N-1)*4
	LDR R1, =DST+(N+S-1)*4
	MOV R2, #10
LOOP
	LDR R3, [R0], #-4
	STR R3, [R1], #-4
	SUBS R2, #1
	BNE LOOP
STOP
	B STOP
N EQU 10
S EQU 5
SRC DCD 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xA
	AREA DATASEG, DATA, READWRITE
DST DCD 0x10000000
	END