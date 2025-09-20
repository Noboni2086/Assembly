.MODEL SMALL
.STACK 100H

.DATA  
    TXT DB "ENTER BINARY VALUE: $"  
    NEWLINE DB 10, 13, "$"

.CODE
    MAIN PROC   
        MOV AX, @DATA  
        MOV DS, AX 
        
        MOV CL, 4
        MOV BX, 0 
        
        INPUT:
            MOV AH, 1
            INT 21H
            CMP AL, 13
            JE OUTPUT
            
           
            CMP AL, 41H
            JGE LETTER
            
            
            SUB AL, 30H
            JMP SHIFT
            
        LETTER:
            SUB AL, 37H 
          
        
        SHIFT:
            SHL BX, CL
            OR BL, AL 
            JMP INPUT
            
        OUTPUT:  
            MOV AH, 9
            LEA DX, NEWLINE
            INT 21H
            MOV CX, 16
            
        OUTPUT_1:   
        
            rol BX, 1     
            
            JNC ZERO  ;
            
            
            MOV AH, 2
            MOV DL,'1'  
            push dx
            INT 21H
            
           
            JMP LOOP_
            
        ZERO: 
         
            MOV AH, 2
            MOV DL, '0' 
            push dx
            INT 21H  
            JMP LOOP_ 
        LOOP_: 
         
            LOOP OUTPUT_1 
            MOV AH, 9
            LEA DX, NEWLINE
            INT 21H  
            
            
mov bx,0          
mov cx,16  

rev:
    pop ax 
            
    sub al,30h     
    shl bx,1      
    or bl,al       

    
    add al,30h     
    mov dl,al
    mov ah,2
    int 21h

    loop rev

            
    MAIN ENDP
END