	AREA arr_wr, DATA

store DCD 0,0,0,0,0  ;for storing prime
	
	AREA prime, CODE, READONLY
		ENTRY
		EXPORT pr
		
array DCD 3,5,8,9,11 ;given array

pr					;main function
	LDR r0, =array	
	LDR r1, =store
	MOV r6, #5
loop
	LDR r2, [r0], #4
	BL check_prime
	SUBS r6, #1
	BNE loop
	B finish
	
check_prime
	CMP r2, #2		;check if it is 2
	BEQ store_prime
	MOV r3, #2		;starting division from 2
loop1
	SDIV r4, r2, r3 ;get the quotient
	MUL r5, r4, r3	
	CMP r5, r2		;check whether reminder 0 or not
	BEQ not_prime
	ADD r3, #1
	CMP r2, r3
	BNE loop1
	B store_prime
	
	
store_prime			;for storing prime
	STR r2, [r1], #4
	BX LR
	
not_prime
	BX LR

finish
	
	

	