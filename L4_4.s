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
	LDR R0,=NUM
	LDR R4,=RESULT
	LDRB R1,[R0]
	AND R2,R1,#0x0F
	CMP R2,#09
	BLO DOWN
	ADD R2,#07
DOWN
	ADD R2,#0x30
	STRB R2,[R4]
	AND R3,R1,#0xF0
	MOV R3,R3,LSR#04
	CMP R3,#09
	BLO DOWN1
	ADD R3,#07
DOWN1
	ADD R3,#0x30
	STRB R3,[R4,#01]
STOP B STOP
NUM DCD 0x000003A	 
	AREA data, DATA, READWRITE
RESULT DCD 0
	END
