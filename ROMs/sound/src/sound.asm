; SOUND.ASM
; audio subroutines

WAVERAM EQU $0400
SOUNDROM EQU $0300

SECTION "Sound",ROM0
INIT_SOUND::
  ld a, %01110111
  ld [$FF24], a
  ld a, %11111111
  ld [$FF25], a
  ld a, %10000000
  ld [$FF26], a

  ; BEGIN WAVEFORM RAM

  ; make sure CH3 is disabled before we load data
  ld a, $00
  ld [$FF1A], a

  ld hl, WAVERAM

  ld d, $FF
  ld e, $30

REPT $10
  ld a, [hli]
  ld [de], a
  inc e
ENDR

  ; END WAVEFORM RAM

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

SOUND_3::
  ld a, %10000000
  ld [$FF1A], a

  ld a, %00000000
  ld [$FF1B], a

  ld a, %00100000
  ld [$FF1C], a

  ld a, %00000000
  ld [$FF1D], a

  ld a, %11000110
  ld [$FF1E], a

  ret

Section "Waveform RAM", ROM0[WAVERAM]
  dl $64200000, $FFFFECA8, $75310000, $0FFFFDB9

Section "CH3 Data", ROM0
  ; CH3 data structure
  ; length - 8b
  ; frequency - 11b (lsb of 16b space)
  db $00
  dw %11000000000

  db $00
  dw %11000001000

  db $00
  dw %11000010000

