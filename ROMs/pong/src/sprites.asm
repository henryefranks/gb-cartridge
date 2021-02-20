; SPRITES.ASM
; sprite setup and subroutines

INCLUDE "hardware.asm"

CENTRE EQU $54		;to help align positioning

; --- RAM vars ---

MOVE_DIR EQU _RAM+1
DELAY_FRAMES EQU _RAM+2


; --- OAM vars ---

;; start text
S1_Y EQU _OAMRAM
S1_X EQU _OAMRAM+1
S1_TILE EQU _OAMRAM+2
S1_FLAGS EQU _OAMRAM+3

S2_Y EQU _OAMRAM+4
S2_X EQU _OAMRAM+5
S2_TILE EQU _OAMRAM+6
S2_FLAGS EQU _OAMRAM+7

S3_Y EQU _OAMRAM+8
S3_X EQU _OAMRAM+9
S3_TILE EQU _OAMRAM+10
S3_FLAGS EQU _OAMRAM+11

S4_Y EQU _OAMRAM+12
S4_X EQU _OAMRAM+13
S4_TILE EQU _OAMRAM+14
S4_FLAGS EQU _OAMRAM+15

S5_Y EQU _OAMRAM+16
S5_X EQU _OAMRAM+17
S5_TILE EQU _OAMRAM+18
S5_FLAGS EQU _OAMRAM+19

;; ball sprite
BALL_Y EQU _OAMRAM+20
BALL_X EQU _OAMRAM+21
BALL_TILE EQU _OAMRAM+22
BALL_FLAGS EQU _OAMRAM+23

;; player 1 top sprite
P_11_Y EQU _OAMRAM+24
P_11_X EQU _OAMRAM+25
P_11_TILE EQU _OAMRAM+26
P_11_FLAGS EQU _OAMRAM+27

;; player 1 bottom sprite
P_12_Y EQU _OAMRAM+28
P_12_X EQU _OAMRAM+29
P_12_TILE EQU _OAMRAM+30
P_12_FLAGS EQU _OAMRAM+31

;; player 2 top sprite
P_21_Y EQU _OAMRAM+32
P_21_X EQU _OAMRAM+33
P_21_TILE EQU _OAMRAM+34
P_21_FLAGS EQU _OAMRAM+35

;; player 2 bottom sprite
P_22_Y EQU _OAMRAM+36
P_22_X EQU _OAMRAM+37
P_22_TILE EQU _OAMRAM+38
P_22_FLAGS EQU _OAMRAM+39

;; player 1 score
P1_S_Y EQU _OAMRAM+40
P1_S_X EQU _OAMRAM+41
P1_S_TILE EQU _OAMRAM+42
P1_S_FLAGS EQU _OAMRAM+43

;; player 2 score
P2_S_Y EQU _OAMRAM+44
P2_S_X EQU _OAMRAM+45
P2_S_TILE EQU _OAMRAM+46
P2_S_FLAGS EQU _OAMRAM+47


; --- subroutines ---

WAIT_VBLANK:
	ldh a,[rLY]		;get current scanline
	cp $91			;check if v-blank
	jr nz,WAIT_VBLANK
	ret

SHOW_START:
	ld a,$40
	ld [S1_Y],a
	ld [S2_Y],a
	ld [S3_Y],a
	ld [S4_Y],a
	ld [S5_Y],a
	ld a,$44
	ld [S1_X],a
	add 8
	ld [S2_X],a
	add 8
	ld [S3_X],a
	add 8
	ld [S4_X],a
	add 8
	ld [S5_X],a
	ld a,7
	ld [S1_TILE],a
	inc a
	ld [S2_TILE],a
	inc a
	ld [S3_TILE],a
	inc a
	ld [S4_TILE],a
	inc a
	ld [S5_TILE],a
	ld a,$80
	ld [S1_FLAGS],a
	ld [S2_FLAGS],a
	ld [S3_FLAGS],a
	ld [S4_FLAGS],a
	ld [S5_FLAGS],a
	ret

HIDE_START:
	call WAIT_VBLANK
	ld hl,S1_Y
	ld c,$14
.hide_loop:
	ld [hl],0
	inc hl
	dec c
	jp nz,.hide_loop
	ret

SPAWN_BALL:
	ld a,CENTRE
	ld [BALL_Y],a
	ld [BALL_X],a
	ld a,5
	ld [BALL_TILE],a
	ld a,0
	ld [BALL_FLAGS],a
	ret

SPAWN_P1:
	ld a,$B
	ld [P_11_X],a
	ld [P_12_X],a
	ld a,CENTRE+4
	ld [P_11_Y],a
	sub 8
	ld [P_12_Y],a
	ld a,6
	ld [P_11_TILE],a
	ld [P_12_TILE],a
	ld a,0
	ld [P_11_FLAGS],a
	ld [P_12_FLAGS],a
	ret

SPAWN_P2:
	ld a,$9D
	ld [P_21_X],a
	ld [P_22_X],a
	ld a,CENTRE+4
	ld [P_21_Y],a
	sub 8
	ld [P_22_Y],a
	ld a,6
	ld [P_21_TILE],a
	ld [P_22_TILE],a
	ld a,0
	ld [P_21_FLAGS],a
	ld [P_22_FLAGS],a
	ret

PADDLE_1_UP:
	ld a,[P_11_Y]
	cp 16
	ret z
	dec a
	ld [P_11_Y],a
	sub 8
	ld [P_12_Y],a
	ret

PADDLE_1_DOWN:
	ld a,[P_11_Y]
	cp 160
	ret z
	inc a
	ld [P_11_Y],a
	sub 8
	ld [P_12_Y],a
	ret

PADDLE_2_UP:
	ld a,[P_21_Y]
	cp 16
	ret z
	dec a
	ld [P_21_Y],a
	ld a,[P_22_Y]
	dec a
	ld [P_22_Y],a
	ret

PADDLE_2_DOWN:
	ld a,[P_21_Y]
	cp 160
	ret z
	inc a
	ld [P_21_Y],a
	ld a,[P_22_Y]
	inc a
	ld [P_22_Y],a
	ret

MOVE_BALL:
	ld a,[MOVE_DIR]
	and $80
	call nz,BALL_R
	call z,BALL_L
	ld a,[MOVE_DIR]
	and $40
	call nz,BALL_U
	ld a,[MOVE_DIR]
	and $20
	call nz,BALL_D
	ret

BALL_R:
	ld a,[BALL_X]
	cp 164
	jp z,RESET_BALL_R
	inc a
	ld [BALL_X],a
	ret

BALL_L:
	ld a,[BALL_X]
	cp 4
	jp z,RESET_BALL_L
	dec a
	ld [BALL_X],a
	ret

BALL_U:
	ld a,[BALL_Y]
	cp 20
	jp z,BALL_TOP
	dec a
	ld [BALL_Y],a
	ret

BALL_D:
	ld a,[BALL_Y]
	cp 155
	jp z,BALL_BOTTOM
	inc a
	ld [BALL_Y],a
	ret

BALL_TOP:
	call SOUND_EDGE
	jp MOVE_BALL_DOWN

BALL_BOTTOM:
	call SOUND_EDGE
	jp MOVE_BALL_UP

MOVE_BALL_UP:
	ld a,[MOVE_DIR]
	and $80
	or $40
	ld [MOVE_DIR],a
	ret

MOVE_BALL_DOWN:
	ld a,[MOVE_DIR]
	and $80
	or $20
	ld [MOVE_DIR],a
	ret

MOVE_BALL_STRAIGHT:
	ld a,[MOVE_DIR]
	and $80
	ld [MOVE_DIR],a
	ret

DETECT_HIT:
	ld a,[P_11_X]
	ld b,a
	ld a,[P_21_X]
	ld c,a
	ld a,[BALL_X]
	cp b
	jp z,.p1_detect
	cp c
	jp z,.p2_detect
	ret

.p1_detect:
	ld a,[P_11_Y]
	add $4
	ld b,a
	sub $8
	ld d,a
	sub $8
	ld c,a
	ld a,[BALL_Y]
	sub b
	ret nc
	ld a,[BALL_Y]
	sub c
	ret c
	call SOUND_PADDLE
	ld a,[MOVE_DIR]
	cpl
	ld [MOVE_DIR],a
	ld a,[BALL_Y]
	cp d
	jp z,MOVE_BALL_STRAIGHT
	sub d
	jp nc,MOVE_BALL_DOWN
	jp c,MOVE_BALL_UP
	ret

.p2_detect:
	ld a,[P_21_Y]
	add $4
	ld b,a
	sub $8
	ld d,a
	sub $8
	ld c,a
	ld a,[BALL_Y]
	sub b
	ret nc
	ld a,[BALL_Y]
	sub c
	ret c
	call SOUND_PADDLE
	ld a,[MOVE_DIR]
	cpl
	ld [MOVE_DIR],a
	ld a,[BALL_Y]
	cp d
	jp z,MOVE_BALL_STRAIGHT
	sub d
	jp nc,MOVE_BALL_DOWN
	jp c,MOVE_BALL_UP
	ret

RESET_BALL_R:
	ld a,[P1_S_TILE]
	inc a
	ld [P1_S_TILE],a
	jp RESET_BALL

RESET_BALL_L:
	ld a,[P2_S_TILE]
	inc a
	ld [P2_S_TILE],a
	jp RESET_BALL

RESET_BALL:
	ld a,CENTRE
	ld [BALL_X],a
	ld [BALL_Y],a
	ld a,[MOVE_DIR]
	and $80
	ld [MOVE_DIR],a
	ld a,60
	ld [DELAY_FRAMES],a
	call SOUND_POINT
	ret

LOAD_SCORES:
	ld a,$0C
	ld [P1_S_TILE],a
	ld [P2_S_TILE],a
	ld a,$10
	ld [P1_S_Y],a
	ld [P2_S_Y],a
	ld a,43
	ld [P1_S_X],a
	ld a,124
	ld [P2_S_X],a
	ld a,$80
	ld [P1_S_FLAGS],a
	ld [P2_S_FLAGS],a
	ret

SOUND_POINT:
	ld a,%10000001
	ld [rNR42],a
	ld a,%10001010
	ld [rNR43],a
	ld a,%11111111
	ld [rNR50],a
	ld [rNR51],a
	ld a,%10000000
	ld [rNR44],a
	ret

SOUND_PADDLE:
	ld a,%10000001
	ld [rNR42],a
	ld a,%00101010
	ld [rNR43],a
	ld a,%11111111
	ld [rNR50],a
	ld [rNR51],a
	ld a,%10000000
	ld [rNR44],a
	ret

SOUND_EDGE:
	ld a,%10000001
	ld [rNR42],a
	ld a,%00111010
	ld [rNR43],a
	ld a,%11111111
	ld [rNR50],a
	ld [rNR51],a
	ld a,%10000000
	ld [rNR44],a
	ret

SOUND_WIN:
	ld a,%10000111
	ld [rNR42],a
	ld a,%01111011
	ld [rNR43],a
	ld a,%11011110
	ld [rNR50],a
	ld [rNR51],a
	ld a,%10000000
	ld [rNR44],a
	ret
