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

  ret

LOAD_WAVEFORM_RAM::
  ; make sure CH3 is disabled before we load data
  ld a, $00
  ld [$FF1A], a

  ld hl, WAVERAM

  ld de, $FF30

  REPT $10
    ld a, [hli]
    ld [de], a
    inc e
  ENDR

  ; re-enable CH3
  ld a, $80
  ld [$FF1A], a

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

SOUND_3_INIT::
  ld a, %10000000
  ld [$FF1A], a
  ld a, %00100000
  ld [$FF1C], a

  call LOAD_WAVEFORM_RAM
  
  ret

WAIT_FOR_CH3_FREE::
  ld a, [$FF26]
  and $04
  jp nz, WAIT_FOR_CH3_FREE
  ret

SOUND_3_HL::
  ; take address in (hl) and play sound
  ; corresponding to data stored in hl and hl+1
  ;
  ; leaves (hl) pointing to next table entry
  ; i.e. hl+3

  ld a, [hli]
  ld [$FF1B], a
  ld a, [hli]
  ld [$FF1D], a
  ld a, [hli]
  or $C0
  ld [$FF1E], a
  ret
  

Section "Waveform RAM", ROM0[WAVERAM]
  dl $FFEDCA98, $8ABCDEFF, $001234567, $76532100

Section "CH3 Data", ROM0[SOUNDROM]
  ; CH3 data structure
  ; length - 8b
  ; frequency - 11b (lsb of 16b word)
  db $70
  dw $0706

  db $70
  dw $0721

  db $73
  dw $0739

  db $70
  dw $0744

  db $70
  dw $0759

  db $70
  dw $0768

  db $70
  dw $0778

  db $70
  dw $0783

