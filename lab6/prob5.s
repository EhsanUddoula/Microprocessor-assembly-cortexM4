    AREA arr_wr, DATA
    

bcd EQU 2_1001100010011001  ; 16-bit BCD representation


binary DCD 0            ; store the binary result

    AREA prob9, CODE, READONLY
    ENTRY
    EXPORT ninth

BcdToDecimal ; Procedure to convert BCD to decimal
    
    LDR r0, =bcd	; Load the address of the BCD representation into register r0
    MOV r1, #4     ; Set the number of BCD digits to 4          
    MOV r2, #2_1111      ; Set up a mask to extract the last 4 bits of each BCD digit        
    MOV r3, #0        ; Initialize the index to 0           
    MOV r4, #1          ; Initialize the decimal place multiplier to 1         
    MOV r7, #0         ; Initialize a register to store the decimal result          

; Loop to convert BCD to decimal
loop1
    ; Check if all BCD digits have been processed
    CMP r3, r1               
    ; If yes, exit the loop
    BGE result_binary      
	
	

    ; Extract 4 bits from the BCD representation
    AND r5, r0, r2           
    ; Shift the BCD number by 4 bits to process the next digit
    LSR r0, r0, #4           
    ; Call a subroutine to convert the BCD digit to decimal
    BL check_bcd       
    ; Scale the digit by its place value
    MUL r6, r6, r4           
    ; Add the scaled digit to the decimal result
    ADD r7, r7, r6           
    ; Update the place value by multiplying by 10
	MOV r8, #10             
    MUL r4, r4, r8          
    ; Increment the iteration counter
    ADD r3, r3, #1           

    ; Repeat the loop
    B loop1      

; End of BCD to decimal conversion
result_binary   
    ; Reset index and load address of BINARY_DATA
    MOV r1,#4
	MOV r2, #2_1111
	MOV r3,#0
	LDR r10,=binary
	

; Loop to convert decimal to binary
loop2
    CMP r3, r1
    BEQ finish  	; Check if all decimal digits have been processed. If yes, stop execution			
    AND r4, r7, r2           ; Extract the least significant bit from the decimal result
    LSR r7, r7, #4        ; Shift right to process the next bit   
    STR r4, [r10], #1           ; Store the bit in the binary storage 
    ADD r3, r3, #1            ; Increment the iteration counter   

    B loop2       ; Repeat the loop 

; Subroutine to convert a BCD digit to decimal
check_bcd PROC
    ; Initialize the decimal value to 0
    MOV r6, #0    
	
    ; Compare the BCD digit with each possible value
    CMP r5, #2_0000          
    MOVEQ r6, #0
    CMP r5, #2_0001
    MOVEQ r6, #1
    CMP r5, #2_0010
    MOVEQ r6, #2
    CMP r5, #2_0011
    MOVEQ r6, #3
    CMP r5, #2_0100
    MOVEQ r6, #4
    CMP r5, #2_0101
    MOVEQ r6, #5
    CMP r5, #2_0110
    MOVEQ r6, #6
    CMP r5, #2_0111
    MOVEQ r6, #7
    CMP r5, #2_1000
    MOVEQ r6, #8
    CMP r5, #2_1001
    MOVEQ r6, #9

    BX LR                     

    ENDP

ninth
    ; Call the BCD to decimal conversion procedure
    B BcdToDecimal         
    
finish

