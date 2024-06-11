

	AREA p, DATA

Mem DCD 0, 0, 0, 0, 0
	
	AREA prob, CODE, READONLY
		ENTRY
		EXPORT main
			
Brray DCD 11, 12, 31, 41, 5
Crray DCD 1, 2, 3, 4, 5	
Frray DCD 2,1,6,3,5
	
main
	ADR r0, Array
	;LDR r1, [r0]
	;LDR r2, =1
	;ADD r0, r0, r2, LSL #4
	;LDR r3, [r0]
	LDR r1, [r0, #0]  ;Get first value of array to r1
	LDR r2, [r0, #16] ;Get last value of array to r2

Array DCD 11, 12, 31, 41, 5
	
second
	ADR r0, Brray
	LDR r1, =0x4
	LDR r2, =0
Loop
	LDR r4, [r0], #4
	ADD r2, r2, r4
	SUBS r1, #1
	BPL Loop
	


Third
	ADR r0, Crray
	LDR r5, =Mem
	LDR r1, =0x4
	MOV r4, #16
loop
	LDR r3, [r0,r4]
	SUB r4, #4
	STR r3, [r5]
	ADD r5, #4
	SUBS r1, #1
	BPL loop

	
Fourth
	ADR r0, Frray
	LDR r1, =0x4
	MOV r2, #0
	
llop
	LDR r4, [r0], #4
	CMP r4, r2
	MOVGT r2,r4
	SUBS r1, #1
	BPL llop

	

	
	END