; SOUND.ASM
; main code

; --- Program Start ---
SECTION "Program Start",ROM0[$0150]
START::
  di                         ; disable interrupts
  ld sp, $FFFE               ; set the stack to $FFFE

  call INIT_SOUND

  call SOUND_3
.loop
  nop
  jp .loop

UPDATE:
  call SOUND_3
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
  dec a
  dec c
  jr nz, .delay
  ret

