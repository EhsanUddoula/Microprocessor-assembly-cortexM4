	AREA prob1, CODE, READONLY
		ENTRY
		EXPORT main

array2D DCD 1,2,3,4,  5,6,7,8,  9,10,11,12 ;It's a 3*4 2D Array
	
main
	LDR r0, =array2D ;load (0.0) position of array
	MOV r1, #3 ;Taking resister r1 to store row number
	MOV r2, #4 ;Taking resister r2 to store column number
	MOV r3, #0 ;To iterate rows
	
loop
	B loop1
back
	ADD r3, r3, #1 ;	ADD 1 with r3
	CMP r3, r1 ;Check whether r3=r1
	BEQ finish ;If equal finish the program
	MOV r4, #0 ;To iterate columns
	B loop ;Else go to loop again
	
loop1
	;Folling lines for access array elements
	MOV r5, r3, LSL #2
	ADD r5, r5, r4
	LDR r6, [r0, r5, LSL #2] ;Load element in r6
	
	ADD r4, r4, #1
	CMP r4, r2 ;check whether we iterate all columns or not
	BNE loop1
	B back
	
	
finish
	;END
	
	