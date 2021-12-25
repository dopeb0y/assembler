%include "io.inc"
;a/b-c
;13, 18, 3
section .text
global CMAIN
CMAIN:
    XOR  DX, DX   ;обнуляем регистр DX, так как старшие биты делимого берутся из него
    ;записываем числа в регистры 
    MOV  AX, 0x000D
    MOV  BX, 0x0012
    MOV  CX, 0x0003
    IDIV  BX     ;13/18=0(ост.13)
    SUB  AX, CX ;0-3=-3
    PRINT_DEC 2, AX ;выводим целую часть результата
    NEWLINE
    PRINT_DEC 2, DX ;выводим остаток от деления
    NEWLINE
;15, -12, -18
    XOR  DX, DX   ;обнуляем регистр DX, так как старшие биты делимого берутся из него
    ;записываем числа в регистры 
    MOV  AX, 0x000F
    MOV  BX, 0xFFF4
    MOV  CX, 0xFFEE
    IDIV  BX        ;15/(-12)=-1(ост.3)
    SUB  AX, CX     ;-1-(-18)=18-1=17
    PRINT_DEC 2, AX ;выводим целую часть результата
    NEWLINE
    PRINT_DEC 2, DX ;выводим остаток от деления
    ret