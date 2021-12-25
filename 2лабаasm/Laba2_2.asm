%include "io.inc"
;доступ к упакованному массиву
;2, 14, 23, 4, 7, 18, 1, 30
section .text
global CMAIN
CMAIN:
    LEA     ESI, [A]
;Для извлечения первого элемента
    MOV     AL, [ESI]
    MOV     DL, 0xF8    ;маска 
    AND     AL, DL      ;маскируем 
    SHR     AL, 3       ;сдвигаем биты вправо для получение искомого числа    
    PRINT_UDEC 1, AL    ;выводим искомое число
    NEWLINE
;Для извлечения второго элемента
;достаем старшие 3 бита
    MOV     AL, [ESI]
    MOV     DL, 0x07
    AND     AL, DL
    SHL     AL, 2         ;ставим извлеченнные биты на нужные позиции
    MOV     BL, AL        ;сохряняем старшие три бита   
    ;достаем младшие 2 бита из второго элемента      
    MOV     AL, [ESI + 1]       
    MOV     DL, 0xC0
    AND     AL, DL
    SHR     AL, 6
    OR      AL, BL ;накладываем старшие и младшие биты, чтобы получить число полностью
    PRINT_UDEC 1, AL
    NEWLINE
;Для извлечения третьего элемента
    MOV     AL, [ESI + 1]
    MOV     DL, 0x3E
    AND     AL, DL
    SHR     AL, 1
    PRINT_UDEC 1, AL
    NEWLINE
;Для извлечения четвертого элемента
;достаем 1 старший бит
    MOV     AL, [ESI + 1]
    MOV     DL, 0x01
    AND     AL, DL
    SHL     AL, 4
    MOV     BL, AL
;достаем 4 младших бита
    MOV     AL, [ESI + 2]
    MOV     DL, 0xF0
    AND     AL, DL
    SHR     AL, 4
    OR      AL, BL 
    PRINT_UDEC 1, AL
    NEWLINE
;Для извлечения пятого элемента   
;достаем старшие 4 бита                                              
    MOV     AL, [ESI + 2]
    MOV     DL, 0x0F
    AND     AL, DL
    SHL     AL, 1
    MOV     BL, AL
;достаем 1 младший бит
    MOV     AL, [ESI + 3]
    MOV     DL, 0x80
    AND     AL, DL
    SHR     AL, 7
    OR      AL, BL 
    PRINT_UDEC 1, AL
    NEWLINE 
;Для извлечения шестого элемента       
    MOV     AL, [ESI + 3]
    MOV     DL, 0x7C
    AND     AL, DL
    SHR     AL, 2
    PRINT_UDEC 1, AL
    NEWLINE
;Для извлечения седьмого элемента    
;достаем старшие 2 бита
    MOV     AL, [ESI + 3]
    MOV     DL, 0x03
    AND     AL, DL
    SHL     AL, 3
    MOV     BL, AL
;достаем 3 младших бита
    MOV     AL, [ESI + 4]
    MOV     DL, 0xE0
    AND     AL, DL
    SHR     AL, 5
    OR      AL, BL 
    PRINT_UDEC 1, AL
    NEWLINE 
;Для извлечения восьмого элемента    
    MOV     AL, [ESI + 4] 
    MOV     DL, 0x1F
    AND     AL, DL
    PRINT_UDEC 1, AL
    NEWLINE        
    ret
A: DB 0x13, 0xAE, 0x43, 0xC8, 0x3E    