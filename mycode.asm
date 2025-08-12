.MODEL SMALL
.STACK 100H
.DATA
    BYTE1 DB 5

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Your calculation ---
    ADD BYTE1, 2   ; BYTE1 now holds the numerical value 7
    MOV AL, BYTE1  ; Load the 8-bit value into the AL register (AL = 7)


    ; --- Code to display the result ---

    ; Step 1: Convert the number to its ASCII character representation.
    ; The number 7 is not the same as the character '7'.
    ; To convert, we add the ASCII value of '0'.
    ADD AL, '0'    ; AL now holds the ASCII code for '7' (which is 55d or 37h)
    ; You could also write this as 'ADD AL, 48' or 'ADD AL, 30h'

    ; Step 2: Call the DOS function to print a character.
    MOV AH, 02h    ; Place the "Display Character" function number into AH.
    MOV DL, AL     ; This function requires the character to be in the DL register.
    INT 21h        ; Execute the DOS interrupt. The character in DL will be printed.


    ; --- End the program properly ---
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN