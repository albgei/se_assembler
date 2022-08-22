start:
MOV P0, #0xFF
mov A, P0
ANL A, #0x0F
SWAP A
ORL A, #0x0F
MOV P0, A
jmp start
end