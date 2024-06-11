	AREA prob6, CODE, READONLY
		ENTRY
		EXPORT sixth

N EQU 0xA
			
sixth
	LDR r5, =0xF4240
	MOV r0, #0 ;register for unit place
	MOV r1, #0 ;register for decimal place
	B loop

loop 
	ADD r0, #1 ;add 1 to r0
	MOV r3, #0 
	;B delay		;register for delay function
back
	CMP r0, #N ;compare r0 with 9
	BEQ check
back1
	B loop

check
	CMP r1, #9 ;if decimal place register is also 9 then we break the loop
	BEQ finish
	ADD r1, #1 ;if r0=10 we make r0=0, r1+=1
	MOV r0, #0
	B back1

delay
	ADD r3, #1 ;we create a loop for 1 million iteration to create 1 sec delay
	CMP r3, r5
	BEQ back
	B delay

finish