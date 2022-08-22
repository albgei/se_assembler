; Albert Geisbauer
; 15.01.2018
; Lauflicht, das nach dem Timer-Inerrupt wird Richtung geändert
org 00
JMP INIT ; Interrupts Überspringen


ORG 0BH ; ISR für Interrupt0 wird festgelegt
CALL WECHSEL ; Weitere Bearbeitung erfolgt im UP
RETI


INIT: 
MOV TMOD, #01;
MOV TL0, #0x00;
MOV TH0, #0x80;
SETB ET0 ; Schaltet EX0 frei
SETB TR0 ;
SETB EA ; Aktiviert die Verwendung von Interrupts
SETB P1.0;
MOV P0, #0xFE ;


MAIN:
Call pause2
MOV A, P0 ;
JB P1.0, R ;
RL A;
R:
JNB P1.0, L ;
RR A;
L:
MOV P0, A ;
JMP MAIN ; Endlosschleife, bis Interrupt


WECHSEL:
MOV TL0, #0x00;
MOV TH0, #0x80;
JB P1.0 ,RW ;
SETB P1.0;
JMP LW;
RW:
JNB P1.0 ,LW ;
CLR P1.0;
LW:
RET

pause2:          ; Pause 4s
   MOV R1, #0x05 ; länge der Pause setzen
m2:
   Call pause1
   DJNZ R1,m2   
   RET           ; Zurück zur Vorigen-Sprung-Adresse 

   
pause1:           ; Pause
   MOV R0, #0x9F ; länge der Pause setzen
m1:
   DJNZ R0,m1
    RET          ; Zurück zur Vorigen-Sprung-Adresse
END 
