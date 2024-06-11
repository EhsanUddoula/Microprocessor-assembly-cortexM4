	AREA normal, CODE,READONLY
		ENTRY
		EXPORT main
		EXPORT second
W EQU 7
X EQU 9
Y EQU 3
Z EQU 1
	
A EQU 0x20F2
C EQU 0x30F0
D EQU 0xC4F8
E EQU 0x3E
F EQU 0xFFFFFFFF
			
main
	MOV r0, #1
	MOV r1, #2
	MOV r2, #-1
	MOV r3, #-1
	
	LSL r0, 2 ;left shift 2 bit
	LSR r1, 1 ;logical right shift 1 bit
	LSR r2, 1 ;logical right shift 1 bit
	ASR r3, 1 ;arithmatic right shift 1 bit

second
	MOV r0, #W ;move 7 to r0
	MOV r1, #X ;move 9 to r1
	MOV r4, #F
	AND r2, r1, r0 ;r2=r1&r0
	MOV r0, #Y ;move 3 t0 r0
	MOV r1, #Z ;move 1 to r1
	AND r3, r1, r0 ;r3=r0&r1
	BIC r4, r4, r3 ;r4=r4.not(r3)
	ORR r2, r2, r4 ;r2=W.X + not(Y.Z)

third
	MOV r0, #A ;move A to r0
	MOV r1, #C ;move C to r1
	MOV r2, #D ;move D to r2
	
	; shifting bits to extract indicated bits
	LSL r0, 17
	LSL r1, 25
	LSL r2, 21
	LSR r0, 26
	LSR r1, 26
	LSR r2, 26
	
	EOR r1, r1, r2 ;XOR of C D
	ORR r0, r0, r1 ;OR of r0 r1
	AND r0, r0, #E ;AND of r0, E
	
fourth
	LDR r1, =0x80008001
	LSL r1, #4
	
	
	END