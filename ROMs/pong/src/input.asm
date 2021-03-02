; INPUT.ASM
; manage button input

INCLUDE "ramvars.asm"

SECTION "Input",ROM0

GET_INPUT::
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

WAIT_START::
  call GET_INPUT
  ld a,[LAST_INPUT]
  and START_MASK
  jr z,WAIT_START
  ret
