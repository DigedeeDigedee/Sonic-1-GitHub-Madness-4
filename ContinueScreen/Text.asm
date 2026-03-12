; ---------------------------------------------------------------------------
; Shitty but fast cyrillic text render routine for Felix
;
; parameters are:
; a1 = text pointer
; d6 = start row number
; d5 = start column number
;
; cyrillic you're shit so fat you can't even see your own dick
; one two three uh my baby dont mess around because she loves me so and this
; ---------------------------------------------------------------------------
ContinueText_Draw:
	lea	(vdp_data_port).l, a6	; data port, offest by +4 bytes for control port
	move.l	#$800000, d4		; d4 = newline constant

	moveq 	#0, d3
	moveq 	#0, d0

	; calculate starting vram position
	locVRAM	vram_fg, d7		; d7 = VRAM plane location/req base

	move.l	d6, d0			; d0 = Row. so d6 doesn't need to be cleared
	lsl.w	#7, d0			; d0 = Row * $80
	add.w	d5, d0			; + Column
	swap	d0
	add.l	d7, d0			; d0 = VRAM offset

	; draw
	move.w	#$6000|$0360, d3	; color pal 4 ($6000), base location $360
	move.l	d0, 4(a6)
	
	move.b 	(a1)+, d4		; copy amount of chars to draw

.DrawLoop:
	move.w	d3, d0			; d0 = palette/tile attributes and base tile number
	add.b	(a1)+, d0		; add tile number
	move.w	d0, (a6)		; send tile
	dbf	d4, .DrawLoop		; and keep doing it until we're done

	rts

; ---------------------------------------------------------------------------
; Initialization routine. this is entirely unnecessary oops
; ---------------------------------------------------------------------------
ContinueText_Init:
	writeVRAM	ContinueText_Font, $6C00
	rts

ContinueText_Font: bincludeEndMarker "ContinueScreen/Graphics/Tile/Font.bin"
	even