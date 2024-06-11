	AREA con_wr, DATA

result DCB "0000000"
	
	AREA concate, CODE, READONLY
		ENTRY
		EXPORT main

str1 DCB "alu", 0
str2 DCB "palu", 0
			
main
	LDR r0, =str1	;address od 1st string
	LDR r1, =str2	;address of 2nd string
	LDR r3, =result ;address of result
	
	;copying first string
while
	LDRB r2, [r0], #1 
	CMP r2, #0
	BEQ outLoop
	STRB r2, [r3], #1
	B while
	
	;copying second string
outLoop
	LDRB r2, [r1], #1
	CMP r2, #0
	BEQ finish
	STRB r2, [r3], #1
	B outLoop
	
finish

	