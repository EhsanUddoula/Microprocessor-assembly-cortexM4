	AREA arr_wr, DATA

result DCD 0, 0  ;to store result
	
	AREA prob8, CODE, READONLY
		ENTRY
		EXPORT eighth
			
array DCD 0x112211, 0x654553
N EQU 0x2
	
eighth
	LDR r0, =array ;initial address of array
	LDR r1, =result ;initial address of result
	MOV r2, #0
	B loop

loop
	LDRB r3, [r0], #1 ;load first byte in r3 
	LDRB r4, [r0], #1 ;load second byte in r4
	LDRB r5, [r0], #1 ;load third byte in r5
	ADD r0, #1;
	
	CMP r3,r4 ;Compare the first and second bytes
	MOVLT r3,r4 ;IF r4 is greater r3=r4
	CMP r3, r5 ; Compare the maximum of first two bytes with the third byte
	MOVLT r3, r5 ;if greater then replace it
	
	STR r3, [r1, r2, LSL #2] ;store result
	
	ADD r2, #1
	CMP r2, #N ;logic to iterate the loop
	BNE loop

finish
	
	