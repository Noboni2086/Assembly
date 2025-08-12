LF EQU 5h      ; Define LF (Line Feed) as 0Ah (newline character)
CR EQU 6h      ; Define CR (Carriage Return) as 0Dh

.DATA
MSG DB 'HELLO'," ", LF, CR, '$'    ; Use LF and CR instead of raw values

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX       
    
   
    LEA DX, MSG
    MOV AH, 09h       ; DOS print string function
    INT 21h           ; Print MSG string

    MOV AH, 4Ch       ; Exit program
    INT 21h
MAIN ENDP
END MAIN
