; INPUT.ASM
; manage button input

INPUT EQU $FF00

UP_MASK EQU %01000000
DOWN_MASK EQU %10000000
LEFT_MASK EQU %00100000
RIGHT_MASK EQU %00010000
A_MASK EQU %00000001
B_MASK EQU %00000010
START_MASK EQU %00001000

GET_INPUT:
  ld a,$20
  ld [INPUT],a
  ld a,[INPUT]
  ld a,[INPUT]
  or $F0
  swap a
  ld b,a
  ld a,$10
  ld [INPUT],a
  ld a,[INPUT]
  ld a,[INPUT]
  or $F0
  and b
  cpl
  ld [LAST_INPUT],a
  ld a,$30
  ld [INPUT],a
  ret

WAIT_START:
  call GET_INPUT
  ld a,[LAST_INPUT]
  and START_MASK
  jr z,WAIT_START
  ret
