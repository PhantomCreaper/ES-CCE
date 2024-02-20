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
	LDRH R1,[R0]
	AND R2,R1,#0xFF
	CMP R2,#0x39
	BLO DOWN
	SUB R2,#07
DOWN
	SUB R2,#0x30
	MOV R5, R2
	AND R3,R1,#0xFF00
	MOV R3,R3,LSR#08
	CMP R3,#0x39
	BLO DOWN1
	SUB R3,#07
DOWN1
	SUB R3,#0x30
	MOV R3, R3, LSL#04
	ADD R5, R3
	STR R5,[R4]
STOP 
	B STOP
NUM DCD 0x0003341	 
	AREA data, DATA, READWRITE
RESULT DCD 0
	END
