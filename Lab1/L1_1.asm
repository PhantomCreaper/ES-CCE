	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	MOVS R0, #0xF1
	MOVS R1, #0xF2
	MOVS R2, #0xF3
	MOVS R3, #0xF4
	MOVS R4, #-0x12
	MOVS R5, #0x12
	MOVS R7, #-0x35
	MOVS R8, #30
	MOVS R9, #0x13
	MOVS R10, #-0x2C
	ADD R11, R7, R8
	ADDS R10, R9
	
	
STOP
	B STOP
SRC DCD 8,0x123456; SRC location in code segment
	AREA DATASEG, DATA, READWRITE
DST DCD 0 ;DST location in Data segment
	END
