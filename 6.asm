
.MODEL SMALL
.STACK 100H
.DATA  


C DB ?        ; a variable to store input
g DB "a $"    ; a message to print if input is 'a'
J DB "CANT $" ; a message if input is not 'a'

    
.CODE 

MAIN PROC 



MOV AX, @DATA 
MOV DS, AX 
       
MOV CX, 0      

    

    MOV AH, 1  
    INT 21H  
    MOV BH, AL 
    
    CMP CX,50
    JL LOOP50 
    

    MOV AH, 9 
    LEA DX,j
    INT 21H
    JMP EXIT
    
    
   

LOOP50: 

    INC CX

    MOV AH, 2 
    
    MOV DL, BH 
    INT 21H 
    
    cmp cx ,50
    JL LOOP50
    
    

    
  

EXIT:
    MOV AH, 4Ch
    INT 21H

MAIN ENDP 
END MAIN
