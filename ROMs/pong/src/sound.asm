; SOUND.ASM
; audio subroutines

INCLUDE "hardware.asm"

INIT_SOUND:
	ld a, %10000000
	ld [rNR52], a
	ld a, %01110111
	ld [rNR50], a
	ld a, %00000010
	ld [rNR51], a
	ld a, %10111111
	ld [rNR21], a
	ld a, %11110111
	ld [rNR22], a
	ld a, %01000110
	ld [rNR24], a
	ret
