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
	LDR R1, NUM
	LDR R13, = 0x10001000
	BL FACT1
	LDR R1, =FACT
	STR R2, [R1]
STOP
	B STOP
	
FACT1
	CMP R1, #1
	BEQ EXIT
	PUSH {R1}
	PUSH {LR}
	SUB R1, #1
	BL FACT1
	POP{LR}
	POP{R1}
	MUL R2, R1, R2
	BX LR
EXIT 
	MOV R2, #1
	BX LR
NUM DCD 0x07
FACT DCD 0
	END