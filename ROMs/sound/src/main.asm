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
  call SOUND_2
  call DELAY
  jp UPDATE

DELAY:
ld a, $FF
ld b, $FF
ld c, $03
.delay:
  dec b
  jr nz, .delay
  dec b
  dec a
  jr nz, .delay
  dec c
  jr nz, .delay
  ret

