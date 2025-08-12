

; Print hellow 5 time 

.Model small
.Stack 100
.DATA  
 HELLOW DB "HELOOW WORLD $"  
 C DB 0
 
.Code 

MAIN PROC 

    mov AX,@DATA 
    MOV DS,AX 
    
    MOV BL,; BL= 0
    
    
    
Start:

    L:   
    
      INC BL;-0-----1;  
       
      MOV AH,9
      LEA DX,HELLOW
      INT 21H 
      
      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV DL,0DH
      INT 21H 
      
      Cmp BL,5
      
      JL Start
       MOV c,BL
      
      JE EXIT
      
      
    EXIT:
     MOV AH , 4CH
     INT 21H
      
MAIN ENDP 
END 
    
    
    
    
    