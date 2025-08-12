.model  small
.stack 100h
.data

  msg1 db "Enter first input: $"
  msg2 db "INVALID $"    
  msg3 db "NUMBER: $" 
  
  VA1 db ?

.code  
MAIN PROC

  mov ax, @data
  mov ds, ax
  

  lea dx, msg1
  mov ah, 9
  int 21h

 
  mov ah, 1
  int 21h
  mov VA1, al
  mov bh, al 
 

  ; Condition: if input < 41h ('A')
  cmp bh,41H
  jl NUM 
  JGE Smalandcap
  
  
  lea dx, msg2
  mov ah, 9
  int 21h
  jmp EXIT
  
  
  
             
Smalandcap:
;cap to small  

 cmp bh,5AH  
 
 jle TE ;bh<=Z 
 
 JG cap ;bh>Z 
 
 cap:  
  cmp bh,61H 
  JGE cap1   ; bh>a  
  
  lea dx, msg2
  mov ah, 9
  int 21h
  jmp EXIT
  
  cap1: 
  
  cmp bh,7AH 
  
  JLE cap2   ;bh<z  go to cap   
  
  lea dx, msg2
  mov ah, 9
  int 21h
  jmp EXIT
  
  
  
   cap2:
    sub bh,20H 
    mov AH,2
    mov dl,bh
    int 21h  
    
    jmp EXIT
      

 
  TE:
   add bh,20H
    mov AH,2
    mov dl,bh
    int 21h  
    
    jmp EXIT
 
  
 
 

NUM:  

 cmp bh,30h   
 jge print 
 
 lea dx, msg2
 mov ah, 9
 int 21h
 jmp EXIT
 jmp EXIT 
 
   print:
    CMP BH,39H
       jLe T  
       lea dx, msg2
       mov ah, 9
       int 21h
       jmp EXIT
       
        T:
         lea dx, msg3
         mov ah, 9
         int 21h
         lea dx, msg2
         


EXIT:
  mov ah, 4ch
  int 21h

MAIN ENDP
END MAIN
