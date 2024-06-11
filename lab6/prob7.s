	AREA arr_wr, DATA

dest DCD 0, 0  ;for destination
	
	AREA prob7, CODE, READONLY
		ENTRY
		EXPORT seventh

source DCD 2, 4 ;source array

seventh
	ADR r0, source ;load initial address of source
	LDR r2, =dest ;load initial address of dest array
	LDR r1, [r0] ;load first 4 bytes from source
	STR r1, [r2] ;store first four bytes 
	LDR r1, [r0,#4] ;load second four bytes
	STR r1, [r2,#4] ;store second four bytes
	
	B finish
	
finish