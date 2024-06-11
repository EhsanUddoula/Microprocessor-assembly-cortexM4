	AREA Second, CODE, READONLY
		ENTRY
		EXPORT main

X EQU 0x5
Y EQU 0x3

main
	LDR r0, =X 		;loading value of X into r0
	LDR r1, =Y  	;loading value of Y into r1
	ADD r2, r0, r1	;r2=r0+r1
	SUB r2, r0, r1	;r2=r0-r1
	MUL r2, r0, r1	;r2=r0*r1

finish
	
	