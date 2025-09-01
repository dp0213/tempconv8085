
; C = (F - 32) * 5 / 9
; PLEASE OPEN README.md 

START:
    IN   00H          ; ENTER A VALUE IN I/O PORT (OO)
    SUI  20H          ; A = F - 32
    MOV  B, A         ; B = (F - 32)

    ; mULTI HL = 5 * B
    LXI  H, 0000H
    MVI  C, 05H

MUL_LOOP:
    MOV  A, L         ; add B to HL (low byte)
    ADD  B
    MOV  L, A
    JNC  MUL_NC
    INR  H            ; carry to high byte
MUL_NC:
    DCR  C
    JNZ  MUL_LOOP
    ; HL = (F - 32) * 5

   ; REPEATED DIVISION INOMING !!!!
    MVI  D, 00H       ; D = quotient

DIV_LOOP:
    ; Stop when HL < 9  --> (H == 0) AND (L < 9)
    MOV  A, H
    ORA  A            ; test H
    JNZ  DO_SUB       ; if H != 0, definitely >= 9
    MOV  A, L
    CPI  09H
    JC   DIV_DONE     ; if L < 9 and H == 0 -> done

DO_SUB:
    MOV  A, L
    SUI  09H          ; A = L - 9
    MOV  L, A
    JNC  NO_BORROW
    DCR  H            ; borrow from high byte if needed
NO_BORROW:
    INR  D            ; quotient++
    JMP  DIV_LOOP

DIV_DONE:
    MOV  A, D         ; A = Celsius
    OUT  02H          ; CHECK 02 PORT IN I/O PORT 
    HLT
