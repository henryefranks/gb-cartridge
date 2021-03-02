; GRAPHICS.ASM
; graphics subroutines

INCLUDE "hardware.asm"
INCLUDE "ramvars.asm"

SECTION "Graphics",ROM0

CLEAR_OAM::
  ;; clearing the OAM RAM
  ld hl,_OAMRAM		;load OAM address ($FE00)
  ld c,$A0			;counter
.clear_OAM_loop:
  ld [hl],0
  inc hl
  dec c
  jp nz,.clear_OAM_loop
  ret

CLEAR_MAP::
  ld hl,_SCRN0		;load bg map address ($9800)
  ld bc,32*32			;16 bit counter
.clear_map_loop:
  ld a,0
  ld [hl+],a
  dec bc
  ld a,b
  or c
  jr nz,.clear_map_loop
  ret

LOAD_TILES::
  ld hl,TILES
  ld de,_VRAM
  ld bc,23*16
.load_tiles_loop:
  ld a,[hl+]
  ld [de],a
  inc de
  dec bc
  ld a,b
  or c
  jr nz,.load_tiles_loop
  ret

LOAD_MAP::
  ld bc,40*4
  ld l,0
  ld hl,TITLE_MAP
  ld de,_SCRN0
  ld c,16				;counter
.load_map_loop:
  ld a,[hl+]
  ld [de],a
  inc de
  dec c
  jr nz,.load_map_loop
  ret
