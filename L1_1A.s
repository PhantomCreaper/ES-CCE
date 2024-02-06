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
	LDR R1, =DST
	MOV R2, #0xA
LOOP
	LDR R3, [R0], #4
	STR R3, [R1], #4
	SUBS R2, #1
	BNE LOOP
STOP
	B STOP
SRC DCD 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9,0xA
	AREA dataseg, DATA, READWRITE
DST DCD 0x10000000
	END