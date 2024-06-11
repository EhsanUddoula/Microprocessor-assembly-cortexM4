	AREA st_wr, DATA
result DCB "0"							;to store result
	AREA palindrome,CODE, READONLY
		ENTRY
		EXPORT main
			
string DCB "abba", 0					;given string
size EQU 0x3

main
	LDR r0, =string						;load initial value
	LDR r5, =result						;load initial value of result
	MOV r1, #0
	MOV r2, #size
	
for 
	CMP r1, r2							;compare r1>r2
	BGT finish
	LDRB r3, [r0, r1]					;r3=string[i]
	LDRB r4, [r0, r2]					;r4=string[n-i]
	CMP r3, r4							;compare
	BNE not_pali
	ADD r1, #1							;increamenting i
	SUB r2, r1
	B for


not_pali
	MOV r0, #1							;if not pallindrome result is 1
	STRB r0, [r5]

finish
	
	
	