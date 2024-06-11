	AREA avg, CODE, READONLY
		ENTRY
		EXPORT main
N EQU 0x5
main
	MOV r0, #0 ;r0=0
	MOV r1, #6 ;r1=6
	MOV r2, #0 ;r2=1
loop
	ADD r0, r0, r2 ;r0=r0+r2
	ADD r2, #1
	CMP r1, r2   ;check r1==r2
	BNE loop  	 ;Branch if not equal
	MOV r2, #N
	SDIV r3, r0, r2
	B finish
;Stop B Stop
;	END
finish