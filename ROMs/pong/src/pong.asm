; PONG.ASM
; main code

; --- Includes ---
INCLUDE "hardware.asm"
INCLUDE "header.asm"
INCLUDE "tiles.asm"
INCLUDE "graphics.asm"
INCLUDE "sound.asm"
INCLUDE "sprites.asm"

; --- Program Start ---

INPUT EQU $FF00

UP_MASK EQU %01000000
DOWN_MASK EQU %10000000
LEFT_MASK EQU %00100000
RIGHT_MASK EQU %00010000
A_MASK EQU %00000001
B_MASK EQU %00000010
START_MASK EQU %00001000

; --- RAM vars ---

LAST_INPUT EQU _RAM

SECTION "Program Start",ROM0[$0150]
START:
	di					;disable interrupts
	ld sp,$FFFE			;set the stack to $FFFE
	call WAIT_VBLANK

	ld a,0
	ldh [rLCDC],a		;turn off LCD
	call CLEAR_OAM		;clear existing data
	call CLEAR_MAP
	call LOAD_TILES
	call LOAD_MAP		;title at top of screen

	ld a,%11100100		;normal palette
	ldh [rBGP],a		;backgound palette
	ld [rOBP0],a		;sprite palette
	ld [rOBP1],a		;sprite palette 2

	;; creating sprites
	call SHOW_START
	call LOAD_SCORES
	call SPAWN_BALL
	call SPAWN_P1
	call SPAWN_P2
	call INIT_SOUND
	ld a,%10010011
	ldh [rLCDC],a		;turn on LCD
	call WAIT_START		;wait for user interaction
	ld a,60
	ld [DELAY_FRAMES],a
	ld a,$80
	ld [MOVE_DIR],a

	call HIDE_START
	call UPDATE

; --- Subroutines ---

WAIT_START:
	call GET_INPUT
	ld a,[LAST_INPUT]
	and START_MASK
	jr z,WAIT_START
	ret

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

GET_INPUT:
	ld a,$20
	ld [INPUT],a
	ld a,[INPUT]
	ld a,[INPUT]
	or $F0
	swap a
	ld b,a
	ld a,$10
	ld [INPUT],a
	ld a,[INPUT]
	ld a,[INPUT]
	or $F0
	and b
	cpl
	ld [LAST_INPUT],a
	ld a,$30
	ld [INPUT],a
	ret

MOVE_PADDLE_1:
	ld a,[LAST_INPUT]
	and UP_MASK
	jp nz,PADDLE_1_UP
	ld a,[LAST_INPUT]
	and DOWN_MASK
	jp nz,PADDLE_1_DOWN
	ret

MOVE_PADDLE_2:
	ld a,[LAST_INPUT]
	and A_MASK
	jp nz,PADDLE_2_UP
	ld a,[LAST_INPUT]
	and B_MASK
	jp nz,PADDLE_2_DOWN
	ret

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
