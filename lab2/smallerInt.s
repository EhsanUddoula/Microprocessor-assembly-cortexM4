	AREA smallerInt, CODE, READONLY
		ENTRY
		EXPORT smaller
			
X EQU 0x6
Y EQU 0x8
		
smaller
	LDR r0, =X 		;load X into r0
	LDR r1, =Y		;load Y into r1
	CMP r0, r1		;compare X,Y
	MOVPL r2, r1	;if r0>r1 r2=r1
	MOVMI r2, r0	;else r2=r0

Stop B Stop
	END
	