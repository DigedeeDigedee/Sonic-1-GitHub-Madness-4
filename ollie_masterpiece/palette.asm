; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Load palette
; ------------------------------------------------------------------------------
; ARGUMENTS
;	a1.l - Palette data address
;	d0.w - Palette length
;	d1.w - First slot to load into
; ------------------------------------------------------------------------------

ol_LoadPalette:
	lea	ol_palette.w,a2					; Get palette buffer
	adda.w	d1,a2
	adda.w	d1,a2
	bra.s	ol_LoadPaletteData				; Load palette data

; ------------------------------------------------------------------------------
; Load fade palette
; ------------------------------------------------------------------------------
; ARGUMENTS
;	a1.l - Palette data address
;	d0.w - Palette length
;	d1.w - First slot to load into
; ------------------------------------------------------------------------------

ol_LoadFadePalette:
	lea	ol_palette_fade.w,a2				; Get palette buffer
	adda.w	d1,a2
	adda.w	d1,a2

; ------------------------------------------------------------------------------
; Load palette data
; ------------------------------------------------------------------------------
; ARGUMENTS
;	a1.l - Palette data address
;	a2.l - Palette buffer address
;	d0.w - Palette length
; ------------------------------------------------------------------------------

ol_LoadPaletteData:
	subq.w	#1,d0						; Decrement length for loop
	bmi.s	.End						; If there's no length, branch

.LoadLoop:
	move.w	(a1)+,(a2)+					; Load palette
	dbf	d0,.LoadLoop					; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------