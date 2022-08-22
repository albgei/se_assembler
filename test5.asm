JMP INIT ; Interrupts Überspringen

INIT: 
MOV P0,#0xFF;

MAIN:
MOV A,P0;
ANL A,#0xCC
RL A;
RL A;
RL A;
ORL A,#0xF0
SWAP A
ANL P0,A;


JMP MAIN ; Endlosschleife, bis Interrupt
        
END 