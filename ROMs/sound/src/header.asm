; HEADER.ASM
; cartridge header data

SECTION	"Org $00",ROM0[$00]
  jp $100

SECTION	"Org $08",ROM0[$08]
  jp $100

SECTION	"Org $10",ROM0[$10]
  jp $100

SECTION	"Org $18",ROM0[$18]
  jp $100

SECTION	"Org $20",ROM0[$20]
  jp $100

SECTION	"Org $28",ROM0[$28]
  jp $100

SECTION	"Org $30",ROM0[$30]
  jp $100

SECTION	"Org $38",ROM0[$38]
  jp $100

SECTION	"V-Blank",ROM0[$40]
  reti

SECTION	"LCD",ROM0[$48]
  reti

SECTION	"Timer",ROM0[$50]
  reti

SECTION	"Serial",ROM0[$58]
  reti

SECTION	"Joypad",ROM0[$60]
  reti

SECTION	"Start",ROM0[$100]
  nop
  jp START
  DB  $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D
  DB  $00,$08,$11,$1F,$88,$89,$00,$0E,$DC,$CC,$6E,$E6,$DD,$DD,$D9,$99
  DB  $BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E
  DB "SOUND",0,0,0,0,0,0
  DB "    "
  DB $00
  DB $00
  DB $00
  DB $00
  DB $00
  DB $00
  DB $00
  DB $01
  DB $33
  DB $00
  DB $00
  DW $00
