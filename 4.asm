

  .MODEL SMALL
.STACK 100H
.DATA  
    HELLOW DB "HELOOW WORLD $"       
    p DB "big $"  
    n DB "eq $"
    k DB "smal $"
    
    C DB ? 
.CODE 

MAIN PROC 

    MOV AX, @DATA 
    MOV DS, AX  
    
    MOV CH,5 
    ADD CH ,30H

    
    MOV AH, 1  
    INT 21H
    MOV C, AL
    

    
    CMP AL,CH 
    
    JE NEGA 
    JG POS 
    JL SMALLL
    

POS:
    
    MOV AH, 9
    LEA DX, p 
    INT 21H
    JMP EXIT 
    
    

NEGA:
 

   
    MOV AH, 9
    LEA DX, n 
    INT 21H
    JMP EXIT 
    
SMALLL: 
 MOV AH, 9
    LEA DX, k 
    INT 21H
    JMP EXIT
  

EXIT:
    MOV AH, 4Ch
    INT 21H

MAIN ENDP 
END MAIN
