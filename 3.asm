
    
    
    


  .MODEL SMALL
.STACK 100H
.DATA  
    HELLOW DB "HELOOW WORLD $"       
    p DB "POSI $"  
    n DB "nega $" 
    C DB ? 
.CODE 

MAIN PROC 

    MOV AX, @DATA 
    MOV DS, AX 

    
    MOV AH, 1  
    INT 21H
    MOV C, AL

    
    CMP AL, '-'
    JE NEGA 
    JNE POS 
    

POS:
    
    MOV AH, 9
    LEA DX, p 
    INT 21H
    JMP EXIT 
    
    

NEGA:
 
MOV AH, 1  
    INT 21H
    MOV C, AL
   
    MOV AH, 9
    LEA DX, n 
    INT 21H
    JMP EXIT

EXIT:
    MOV AH, 4Ch
    INT 21H

MAIN ENDP 
END MAIN
