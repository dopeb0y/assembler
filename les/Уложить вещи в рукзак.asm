%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    LEA EBX, [A]
        
    XOR AH, AH 
    
l2:
    CALL pack_knapsack
    CMP DL, 71
    JNZ  l1
    PRINT_HEX 1,AH
    RET
    
    
l1:
    INC AH
    JNZ l2
    PRINT_UDEC 1, DL
    
    
pack_knapsack:
    PUSH EAX
    PUSH ECX
    PUSH ESI
    
    MOV ECX, 0x8
    XOR ESI, ESI    
    XOR DL,DL
    
next_bit:
    RCR AH, 1
    JNC skip
    MOV AL, [EBX + ESI]
    ADD DL, AL
    
skip:
    INC ESI
    LOOP next_bit
    
    POP ESI
    POP ECX
    POP EAX
     
    ret
    
    
section .data

A: DB 4,5,21,34,42,45,63,68