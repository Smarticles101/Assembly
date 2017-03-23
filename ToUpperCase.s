@ This is a single-line comment
/*
 This is a multi-line comment
*/

.global _start

_start:
 MOV R7, #3 @ Syscall keyboard
 MOV R0, #0 @ Input stream keyboard
 MOV R2, #1 @ Read one char
 LDR R1, =character
 SWI 0

_uppercase:
 LDR R1, =character
 LDR R0, [R1]

 @ a : 0110 0001
 @   : 0010 0000  Bitclear on 32
 @ A : 0100 0001
 BIC R0, R0, #32

 STR R0, [R1]

_write:
 MOV R7, #4 @ Syscall screen output
 MOV R0, #1 @ Output monitor
 MOV R2, #1 @ Print one char
 LDR R1, =character
 SWI 0

end:
 MOV R7, #1
 SWI 0

.data
character:
 .ascii " "
