; SOUND.ASM
; audio subroutines

SECTION "Sound",ROM0
INIT_SOUND::
  ld a, %01110111
  ld [$FF24], a
  ld a, %00110011
  ld [$FF25], a
  ld a, %10000000
  ld [$FF26], a
  ret

SOUND_1::
  ld a, %00010110
  ld [$FF10], a

  ld a, %10000000
  ld [$FF11], a

  ld a, %01110000
  ld [$FF12], a

  ld a, %00000000
  ld [$FF13], a

  ld a, %11000011
  ld [$FF14], a

  ret

SOUND_2::
  ld a, %10000000
  ld [$FF16], a

  ld a, %01110000
  ld [$FF17], a

  ld a, %00000000
  ld [$FF18], a

  ld a, %11000011
  ld [$FF19], a

  ret

