

.MODEL SMALL
.STACK 100H

.DATA         
   MSG DB "ENTER A NUMBER: $" 
   MSG_INVALID DB "INVALID INPUT$"   
   MSG_LESS DB "LESS THAN 5$"
   MSG_GREATER DB "GREATER THAN 5$"  
   MSG_EQUAL DB "EQUAL TO 5$"

.CODE
    MAIN PROC    
        MOV AX, @DATA
        MOV DS, AX 
        
      
                   
      
        
        ; READ THE VALUE
        MOV AH, 1
        INT 21H
        MOV BH, AL 
    
        ; PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
    
     MOV ah,2
     MOV dl,bh
     INT 21H
     
        
    
        
    
    MAIN ENDP
END