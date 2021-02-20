; SOUND.ASM
; audio subroutines

INCLUDE "hardware.asm"

INIT_SOUND:
  ld a, %10000000
  ld [rNR52], a
  ld a, %01110111
  ld [rNR50], a
  ld a, %00000010
  ld [rNR51], a
  ld a, %10111111
  ld [rNR21], a
  ld a, %11110111
  ld [rNR22], a
  ld a, %01000110
  ld [rNR24], a
  ret

SOUND_POINT:
  ld a,%10000001
  ld [rNR42],a
  ld a,%10001010
  ld [rNR43],a
  ld a,%11111111
  ld [rNR50],a
  ld [rNR51],a
  ld a,%10000000
  ld [rNR44],a
  ret

SOUND_PADDLE:
  ld a,%10000001
  ld [rNR42],a
  ld a,%00101010
  ld [rNR43],a
  ld a,%11111111
  ld [rNR50],a
  ld [rNR51],a
  ld a,%10000000
  ld [rNR44],a
  ret

SOUND_EDGE:
  ld a,%10000001
  ld [rNR42],a
  ld a,%00111010
  ld [rNR43],a
  ld a,%11111111
  ld [rNR50],a
  ld [rNR51],a
  ld a,%10000000
  ld [rNR44],a
  ret

SOUND_WIN:
  ld a,%10000111
  ld [rNR42],a
  ld a,%01111011
  ld [rNR43],a
  ld a,%11011110
  ld [rNR50],a
  ld [rNR51],a
  ld a,%10000000
  ld [rNR44],a
  ret
