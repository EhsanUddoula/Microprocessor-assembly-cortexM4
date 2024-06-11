
	AREA prob, CODE, READONLY
		ENTRY
		EXPORT main
			
array DCD 2,64,10,6,8	;taking array
N EQU 0x4
			
main
	LDR r0, =array 		;load the initial address of array
	MOV r1, #N    		;load the numbefr of elements
	LDR r2, [r0], #4 	;Taking r2 for storing largest element 
loop 
	LDR r3, [r0], #4 	;load from the array and take pointer to next
	CMP r3, r2 			;compare r3 with r2
	MOVPL r2,r3 		;if r3>r2 r2=r3
	SUBS r1, #1 		;r1=r1-1
	BNE loop   			;check whether iteration is complete or not
	B finish   			;branch finish
	

	
finish

Stop B Stop

END

