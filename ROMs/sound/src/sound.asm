; SOUND.ASM
; audio subroutines

INCLUDE "hardware.asm"

SECTION "Sound",ROM0
INIT_SOUND::
  ld a, $80
  ld [rNR52], a
  ld a, $77
  ld [rNR50], a
  ld a, $FF
  ld [rNR51], a
  ret

SOUND_1::
  ld a, $16
  ld [rNR10], a

  ld a, $40
  ld [rNR11], a

  ld a, $73
  ld [rNR12], a

  ld a, $00
  ld [rNR13], a

  ld a, $C3
  ld [rNR14], a
  ret
