.MODEL SMALL
.STACK 100H
.DATA  
    C DB ?
    h DB "OK $"
    g DB "NOT OK $" 
.CODE 

MAIN PROC 

    MOV AX, @DATA 
    MOV DS, AX  
    
    ; Read 4 characters
    MOV AH, 1  
    INT 21H  
    MOV BH, AL

    MOV AH, 1  
    INT 21H  
    MOV BL, AL
    
    MOV AH, 1  
    INT 21H
    MOV CL, AL

    MOV AH, 1  
    INT 21H
    MOV CH, AL 

    ; Compare each character with expected values
    CMP BH, 41H       ; 'A'
    JNE NOT1  
    
    CMP BL, 42H       ; 'B'
    JNE NOT1

    CMP CL, 43H       ; 'C'
    JNE NOT1

    CMP CH, 44H       ; 'D'
    JNE NOT1

    
    MOV AH, 9
    LEA DX, h
    INT 21H
    JMP EXIT

NOT1:
    MOV AH, 9
    LEA DX, g
    INT 21H

EXIT:
    MOV AH, 4Ch
    INT 21H

MAIN ENDP 
END MAIN
