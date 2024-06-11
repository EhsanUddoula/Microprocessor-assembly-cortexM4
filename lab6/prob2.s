	AREA arr_wr, DATA
		
result DCD 0,0,0,  0,0,0,  0,0,0 ;for storing result
	
	AREA prob1, CODE, READONLY
		ENTRY
		EXPORT second

mat1 DCD 1,2,3,  1,2,3,  1,2,3 ;first matrix
mat2 DCD 4,5,6,  4,5,6,  4,5,6 ;second matrix

mat1_row EQU 0x3 ;row number of matrix 1
mat1_col EQU 0x3 ;column number of matrix 1
mat2_row EQU 0x3 ;row number of matrix 2
mat2_col EQU 0x3 ;column number of matrix 2
res_row EQU 0x3 ;row number of result 
res_col EQU 0x3 ;column number of result
	
second
	LDR r5, =mat1 ;load the address of mat1
	LDR r6, =mat2 ;load the address of mat2
	LDR r7, =result ;load the address of result
	MOV r0, #0 ;for the first loop
	BL loop
	B finish
	
loop
	MOV r1, #0 ;for the second loop
	B loop1
back1
	ADD r0, #1
	CMP r0, #mat1_row ;Comparing to see whether we should break loop or not
	BNE loop
	BX LR  ;return to previous call


loop1
	MOV r3, #0 
	MOV r2, #0 ;for the third loop
	B loop2
back
	ADD r1, #1
	CMP r1, #mat2_col ;Comparing to see whether we should break loop or not
	BNE loop1
	B back1 ;return to previous call

loop2
	;Following lines to fetch data from mat1 -> mat1[i][k]
	MOV r4, #mat1_col
	MUL r4, r4, r0
	LSL r4, r4, #2
	ADD r4, r2, LSL #2
	LDR r8, [r5,r4]
	
	;Following lines to fetch data from mat2 -> mat2[k][j]
	MOV r4, #mat2_col
	MUL r4, r4, r2
	LSL r4, r4, #2
	ADD r4, r1, LSL #2
	LDR r4, [r6, r4]
	
	MUL r4, r4, r8 ; mat1[i][k] * mat2[k][j]
	ADD r3, r4 ;r3+=r4
	
	;Following lines to store data in result -> result[i][j]
	MOV r4, #res_col
	MUL r4, r4, r0
	LSL r4, r4, #2
	ADD r4, r1, LSL #2
	STR r3, [r7, r4]
	
	ADD r2, #1
	CMP r2, #mat2_row ;Comparing to see whether we should break loop or not
	BNE loop2
	B back ;return to previous call
	
	

finish
	
	