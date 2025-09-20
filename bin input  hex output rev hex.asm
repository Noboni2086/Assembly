.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "INPUT: $"
MSG2 DB "OUTPUT: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV BX,0          

MOV AH, 9
lea DX, MSG1
INT 21H


INPUT_LOOP:
    MOV AH,1          
    INT 21H
    CMP AL,13  
       
    JE OUTPUT
    CMP AL,'0'      
    JE BIN_ZERO
    CMP AL,'1'
    JE BIN_ONE
    JMP INPUT_LOOP   

BIN_ZERO:
    SHL BX,1          
    JMP INPUT_LOOP

BIN_ONE:
    SHL BX,1          
    OR BX,1           
    JMP INPUT_LOOP

OUTPUT:

    lea DX, MSG2
    mov AH,09H
    INT 21H

  
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    MOV CX,4         

OUTPUT_LOOP:
    MOV DL, BH
    SHR DL,4         
    ROL BX,4          
    CMP DL,10
	push dx
	
    JGE PRINT_LETTER
    ADD DL,48         
    JMP PRINT_CHAR

PRINT_LETTER:

    ADD DL,55      

PRINT_CHAR: 


    MOV AH,2          
    INT 21H
    LOOP OUTPUT_LOOP

  
  
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
  
mov cx ,4

rev:
    pop ax              ; get pushed value (DL contains numeric nibble)
    
    and al,0Fh          ; ensure only lower 4 bits are used ? important fix
    
    shl bx,4            ; make space for new nibble
    or bl,al            ; insert nibble into BX
    
    ; optional printing of reversed nibble
    mov dl,al           ; take nibble
    cmp dl,10
    jl rev_digit
    add dl,55           ; convert 10-15 ? 'A'-'F'
    jmp rev_print
rev_digit:
    add dl,48           ; convert 0-9 ? '0'-'9'
rev_print:
    mov ah,2
    int 21h
    
    loop rev

 
   MOV AH,4CH
    INT 21H
	

MAIN ENDP
END MAIN
