; PONG.ASM
; main code

INCLUDE "hardware.asm"
INCLUDE "ramvars.asm"

; --- Program Start ---
SECTION "Program Start",ROM0[$0150]
START::
  di		  		               ; disable interrupts
  ld sp,$FFFE			           ; set the stack to $FFFE
  call WAIT_VBLANK

  ld a,0
  ldh [rLCDC],a		           ; turn off LCD
  call CLEAR_OAM		         ; clear existing data
  call CLEAR_MAP
  call LOAD_TILES
  call LOAD_MAP		           ; title at top of screen

  ld a,%11100100		         ; normal palette
  ldh [rBGP],a		           ; backgound palette
  ld [rOBP0],a		           ; sprite palette
  ld [rOBP1],a		           ; sprite palette 2

  ;; creating sprites
  call SHOW_START
  call LOAD_SCORES
  call SPAWN_BALL
  call SPAWN_P1
  call SPAWN_P2
  call INIT_SOUND
  ld a,%10010011
  ldh [rLCDC],a		           ; turn on LCD
  call WAIT_START		         ; wait for user interaction
  ld a,60
  ld [DELAY_FRAMES],a
  ld a,$80
  ld [MOVE_DIR],a

  call HIDE_START

; --- Subroutines ---

UPDATE:
  call WAIT_VBLANK
  ld a,[DELAY_FRAMES]
  cp 0
  jr nz,.delay
  call MOVE_BALL
  call DETECT_HIT
  ld a,[P1_S_TILE]
  cp $16
  jp z,GAME_END
  ld a,[P2_S_TILE]
  cp $16
  jp z,GAME_END
.delay:
  call GET_INPUT
  call MOVE_PADDLE_1
  call MOVE_PADDLE_2

  ld a,[DELAY_FRAMES]
  cp 0
  jr z,UPDATE
  dec a
  ld [DELAY_FRAMES],a
  jp UPDATE

GAME_END:
  call SOUND_WIN
  call SHOW_START
  call WAIT_START

  call WAIT_VBLANK
  ld a,$0C
  ld [P1_S_TILE],a
  ld [P2_S_TILE],a
  ld a,CENTRE
  ld [BALL_Y],a
  ld [BALL_X],a
  ld a,CENTRE+4
  ld [P_11_Y],a
  sub 8
  ld [P_12_Y],a
  ld a,CENTRE+4
  ld [P_21_Y],a
  sub 8
  ld [P_22_Y],a
  ld a,$80
  ld [MOVE_DIR],a
  ld a,60
  ld [DELAY_FRAMES],a
  call HIDE_START

  jp UPDATE
