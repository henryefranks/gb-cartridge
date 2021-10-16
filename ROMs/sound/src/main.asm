; SOUND.ASM
; main code

; --- Program Start ---
SECTION "Program Start",ROM0[$0150]
START::
  di                         ; disable interrupts
  ld sp, $FFFE               ; set the stack to $FFFE

  call INIT_SOUND
  call SOUND_3_INIT

.up
  ld hl, $0300
.call_next
  call WAIT_FOR_CH3_FREE
  call SOUND_3_HL

  ld a, 24
  sub l
  jp z, .down
  jp .call_next

.down
.call_prev
  call WAIT_FOR_CH3_FREE

  ld a, l
  sub 6
  ld l, a
  call SOUND_3_HL

  ld a, 6
  sub l
  jp z, .up
  jp .call_prev

.end
  nop
  jp .end

.reset
  ld hl, $0300
  jp .call_next

UPDATE:
  call SOUND_3
  call WAIT_FOR_CH3_FREE
  jp UPDATE

WAIT_FOR_CH3_FREE::
  ld a, [$FF26]
  and $04
  jp nz, WAIT_FOR_CH3_FREE
  ret

