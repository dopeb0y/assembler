%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    Mov AH, 0x9 ;один пит взяли если 0х1
    
    LEA EBX, [A]
    mov ecx 0x8
    XOR ESI,ESI
    XOR DL, DL

next_bit:
    RCR AH,1 ; cдвинули на 1
    ;xor ESI, ESI
    ;Rcl CL, 1 ; сдвиг через регистр регистр числа переноса
    ; послейдний бит уходит в флаг и после 8 раз все вернется
    JNC skip
    MOV AL, [EBX + ESI]
    ADD DL ,AL
skip:
    INC ESI
    LOOP next_bit

    ret
    
section .data

A: DB 4,4,21,34,42,45,63,68