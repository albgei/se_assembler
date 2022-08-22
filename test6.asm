ORG 00H
JMP INIT ; Interrupts Überspringen
ORG 03H ;
JMP EINFAHRT ; 

ORG 013H ;
JMP AUSFAHRT ;

INIT: 
SETB IT0 ; ExternerInterrupt0 reagiert auf Flanken
SETB EX0 ; Schaltet EX0 frei
SETB IT1 ; EX1 reagiert jetzt auf Flanken
SETB EX1 ; Schaltet EX1 frei
SETB EA ; Aktiviert die Verwendung von Interrupts
MOV R0, #00011111B ; 


MAIN: 
MOV P0, R0 ;
JMP MAIN ;


EINFAHRT:
MOV A, R0 ; 
ANL A, #00011111B ;
JZ VOLL ;
DEC R0 ; 
SETB P0.5 ;
SETB P0.7 ;
CALL PAUSE ;
CLR P0.5 ; 
CLR P0.7 ;
VOLL: RETI ; 


AUSFAHRT:
MOV A, R0 ; 
CJNE A, #00011111B, WEITER ;
JMP LEER ; 
WEITER:
SETB P0.6 ;
INC R0 ;
CALL PAUSE ;
CLR P0.6 ; 
LEER: RETI


PAUSE: MOV R4, #0FFH ;
WAIT: DJNZ R4, WAIT
RET
END