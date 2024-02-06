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
	MOV R0, #N
	MOV R1, #N1
	MOV R2, #0
	MOV R3, #0
	CMP R1, #0
	BEQ STOP
LOOP
	ADDS R2, R0
	SUB R1, #1
	BCS LOOPB
	CMP R1, #0
	BNE LOOP
	B STOP
	
LOOPB
	ADD R3, #1
	CMP R1, #0
	BNE LOOP

STOP
	B STOP
	
N EQU 10
N1 EQU 5