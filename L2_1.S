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
	MOV R0, #10
	LDR R1, =SRC
	LDR R5, =DST
LOOP
	LDR R3, [R1], #4
	LDR R4, [R1]
	ADD R2, R3, R4
	STR R2, [R5], #4
	SUBS R0, #1
	BNE LOOP
STOP
	B STOP
	;add ten 32 bit numbers
SRC DCD 0X1, 0X2, 0X3, 0X4, 0X5, 0X6, 0X7, 0X8, 0X9, 0XA
	AREA DATASEG, DATA, READWRITE
DST DCD 0X10000000
	END
	