; SOUND.ASM
; main code

; --- Program Start ---
SECTION "Program Start",ROM0[$0150]
START::
  di                         ; disable interrupts
  ld sp, $FFFE               ; set the stack to $FFFE

  call INIT_SOUND

UPDATE:
  call SOUND_1

  call DELAY

DELAY:
ld a, $FF
ld b, $FF
.delay:
  dec b
  jr nz, .delay
  dec a
  jr nz, .delay
  ret
