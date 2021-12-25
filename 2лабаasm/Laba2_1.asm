%include "io.inc"
; посчитать количество положительных элементов в массиве
;ответ: 5
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    LEA     EBX, [A]    ;загружаем индекс первого элемента массива
    MOV     ECX, 8      ;задаем счетчику цикла значение количества элементов массива
    XOR     DL, DL      ;обнуляем  счетчик положительных элементов
next:    
    MOV     AL, [EBX]   ;Загружаем значение элемента массива
    CMP     AL, 0       ;сравниваем его с нулем
    JNG     skip        ;если он меньше или равен нулю, то пропускаем 
    INC     DL          ;Если он больше, то увеличиваем счетчик   
skip:
    INC     EBX         ;увеличиваем индекс, чтобы рассмотреть следующие значения
    LOOP    next        ;вводим цикл для перебора всех элементов массива
    PRINT_UDEC 2, DL    ;выводим количество элементов положительных элементов массива
    ret
section .data
A: DB 3, -14, 32, 16, -52, -8, 7, 26    