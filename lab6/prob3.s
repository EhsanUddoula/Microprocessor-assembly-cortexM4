	AREA arr_wr, DATA

array DCD 1, 5, 3, 2, 7
	
	AREA prob3, CODE, READONLY
		ENTRY
		EXPORT third
			
N EQU 0x4

third
	LDR r0, =array ;load the initial address of array
	MOV r1, #0 ;for outer loop
	BL outer_loop
	B finish

outer_loop
	MOV r2, #0 ;for inner loop
	MOV r5, #N
	SUB r5, r2 ;r5-=r2
	B inner_loop
back1
	ADD r1, #1
	CMP r1, #N ;check whether loop is finished or not
	BNE outer_loop
	BX LR

inner_loop
	LSL r3, r2, #2 ;r3=r2*4
	LDR r4, [r0, r3] ;load element from array[i]
	ADD r3, #4
	LDR r6, [r0,r3] ;load element from arry[i+1]
	CMP r4, r6 ;Compare if array[i]>array[i+1]
	BPL swap
back
	ADD r2, #1
	CMP r2, r5
	BNE inner_loop
	B back1
	
swap
	;swaping logic
	MOV r7, r6
	MOV r6, r4
	MOV r4, r7
	
	STR r6, [r0, r3] ;array[i]=array[i+1]
	SUB r3, #4
	STR r4, [r0,r3] ;array[i+1]=array[i]
	
	B back
	
	
finish