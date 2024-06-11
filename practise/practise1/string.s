
	AREA stringOp, CODE, READONLY
		ENTRY
		EXPORT shuru
	
string DCB "abcde"
N EQU 0x5
			
shuru
	LDR r0, =string
	MOV r1, #N
	
loop 
	LDR r2, [r0], #1
	SUBS r1, #1
	BNE loop
	B finish
	
finish