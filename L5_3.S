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
;	MOV R3, #10
;	LDR R4, =SRC+(N-1)*4
;LOOPA
;	STR R3, [R4], #-4
;	SUBS R3, #1
;	BNE LOOPA

	MOV R0, #0
	MOV R1, #10
	LDR R2, =LIST
	LDR R10, =RESULT
OUT
	LDR R3, [R2, R0]
	STR R3, [R10, R0]
	ADD R0, #4
	SUB R1, #1
	CMP R1, #0
	BHI OUT ; STORES ARRAY INTO DATA MEMORY

	LDR R0, =RESULT
	MOV R1, #N1
	MOV R3, #0

LOOPO
	LDR R2, [R0], #4
	CMP R2, R1
	ADD R3, #1
	BNE LOOPO ; FINAL INDEX OF ELEMENT STORED IN R0, VALUE IN R2
STOP
	B STOP
N EQU 10
N1 EQU 0x87
LIST DCD 0x10,0x05,0x33,0x24,0x56,0x77,0x21,0x04,0x87,0x01
	AREA data1, data, readwrite
RESULT DCW 0,0,0,0,0,0,0,0,0,0
	END	