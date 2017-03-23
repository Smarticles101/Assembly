.global _start


_start:
 MOV R0, #50
 MOV R1, #2
 B _loop

_decrement:
 SUBGT R0, R0, R1

_loop:
 CMP R0, R1
 BNE _decrement

end:
 MOV R7, #1
 SWI 0
