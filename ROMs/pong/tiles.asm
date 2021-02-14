; +-------------------------------+
; | tiles.asm - tile and map data |
; +-------------------------------+

SECTION "Tiles",ROM0

; --- Tile array ---
TILES:
	DB $00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$7C,$7C,$66,$66,$66,$66
	DB $7C,$7C,$60,$60,$60,$60,$00,$00
	DB $00,$00,$3C,$3C,$66,$66,$66,$66
	DB $66,$66,$66,$66,$3C,$3C,$00,$00
	DB $00,$00,$46,$46,$66,$66,$76,$76
	DB $5E,$5E,$4E,$4E,$46,$46,$00,$00
	DB $00,$00,$3C,$3C,$66,$66,$60,$60
	DB $6E,$6E,$66,$66,$3E,$3E,$00,$00
	DB $00,$00,$00,$00,$00,$00,$18,$18
	DB $18,$18,$00,$00,$00,$00,$00,$00
	DB $18,$18,$18,$18,$18,$18,$18,$18
	DB $18,$18,$18,$18,$18,$18,$18,$18
	DB $00,$00,$3C,$3C,$60,$60,$3C,$3C
	DB $0E,$0E,$4E,$4E,$3C,$3C,$00,$00
	DB $00,$00,$7E,$7E,$18,$18,$18,$18
	DB $18,$18,$18,$18,$18,$18,$00,$00
	DB $00,$00,$3C,$3C,$4E,$4E,$4E,$4E
	DB $7E,$7E,$4E,$4E,$4E,$4E,$00,$00
	DB $00,$00,$7C,$7C,$66,$66,$66,$66
	DB $7C,$7C,$68,$68,$66,$66,$00,$00
	DB $00,$00,$7E,$7E,$18,$18,$18,$18
	DB $18,$18,$18,$18,$18,$18,$00,$00
	DB $00,$00,$1C,$1C,$26,$26,$63,$63
	DB $63,$63,$32,$32,$1C,$1C,$00,$00
	DB $00,$00,$0C,$0C,$1C,$1C,$0C,$0C
	DB $0C,$0C,$0C,$0C,$3F,$3F,$00,$00
	DB $00,$00,$3E,$3E,$63,$63,$07,$07
	DB $3C,$3C,$70,$70,$7F,$7F,$00,$00
	DB $00,$00,$7F,$7F,$06,$06,$1C,$1C
	DB $03,$03,$C3,$C3,$7E,$7E,$00,$00
	DB $00,$00,$0E,$0E,$1E,$1E,$36,$36
	DB $66,$66,$7F,$7F,$06,$06,$00,$00
	DB $00,$00,$7E,$7E,$60,$60,$3E,$3E
	DB $03,$03,$63,$63,$3E,$3E,$00,$00
	DB $00,$00,$3E,$3E,$60,$60,$7E,$7E
	DB $63,$63,$63,$63,$3E,$3E,$00,$00
	DB $00,$00,$7F,$7F,$63,$63,$06,$06
	DB $0C,$0C,$18,$18,$18,$18,$00,$00
	DB $00,$00,$3E,$3E,$63,$63,$3E,$3E
	DB $63,$63,$63,$63,$3E,$3E,$00,$00
	DB $00,$00,$3E,$3E,$63,$63,$63,$63
	DB $3F,$3F,$03,$03,$3E,$3E,$00,$00
	DB $18,$18,$3C,$3C,$3C,$3C,$3C,$3C
	DB $18,$18,$00,$00,$18,$18,$18,$18

; --- Tile map ---

SECTION "Map",ROM0
TITLE_MAP:
	DB $00,$00,$00,$00,$00,$00,$00,$05,$01,$02,$03,$04,$05
