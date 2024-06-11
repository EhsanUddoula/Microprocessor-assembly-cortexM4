	AREA prob4, CODE, READONLY
		ENTRY
		EXPORT main

array DCD 0x10A32135

main
	LDR r0, =array ;load initial address of array
	LDRB r1, [r0], #1 ;load first byte
	LDRB r2, [r0], #1 ;load second byte
	LDRB r3, [r0], #1 ;load third byte
	LDRB r4, [r0], #1 ;load fourth byte
	
	;Now we will add them and store generated carry at r5
	MOV r5, #0 ;r5=0
	ADD r1, r1, r2 ;add r1 with r2
    MOV r8, r1 ; Copy sum to r8
    LSR r8, r8, #8 ; Extract carry from latest addition
    
    ADD r5, r5, r8 ; Add carry to sum of carries
    
    AND r1, r1, #0xFF ; Keep the carries out of the sum
	
	ADD r1, r1, r3 ;add result with r3
	LSR r8, r8, #8 ; Extract carry from latest addition
    
    ADD r5, r5, r8 ; Add carry to sum of carries
    
    AND r1, r1, #0xFF ; Keep the carries out of the sum
	
	ADD r1, r1, r4 ;add result with r4
	LSR r8, r8, #8 ; Extract carry from latest addition
    
    ADD r5, r5, r8 ; Add carry to sum of carries
    
    AND r1, r1, #0xFF ; Keep the carries out of the sum

finish