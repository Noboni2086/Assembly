
; NON stop print hellow

.Model small
.Stack 100
.DATA  
 HELLOW DB "HELOOW WORLD $" 
 
.Code 

MAIN PROC 

    mov AX,@DATA 
    MOV DS,AX  
    
    NON_LOOP:    
     
      MOV AH,9
      LEA DX,HELLOW
      INT 21H 
      
      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV DL,0DH
      INT 21H
      
      JMP NON_LOOP 
      
MAIN ENDP 
END 
    
    
    