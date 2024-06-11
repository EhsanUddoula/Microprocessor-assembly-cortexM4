	AREA first, CODE, READONLY
		ENTRY
		EXPORT main

X16_bit EQU 28000
Y16_bit EQU 15000

main
	LDR r0, =X16_bit		;load x into r0
	LDR r1, =Y16_bit		;load y into r1
	ANDS r3, r0, r1 		; r3=r0 & r1
	ORRS r2, r0, r1 		; r2=r0 | r1
	MVN r2, r2				; r2 = r0 nor r1
	MVN r3, r3				; r3 = r0 nand r1
	EORS r2, r0, r1			;r2 = r0 XOR r1
	MVN r2, r2				; r2= XNOR of r0 and r1
	
	
Stop B  Stop
	END