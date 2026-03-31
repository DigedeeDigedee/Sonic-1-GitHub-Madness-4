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

	subq.w	#1,d0						; Decrement length for loop
	bmi.s	.End						; If there's no length, branch

.LoadLoop:
	move.w	(a1)+,(a2)+					; Load palette
	dbf	d0,.LoadLoop					; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------
; Fade palette in
; ------------------------------------------------------------------------------

ol_FadePaletteIn:
	move.b	#1,ol_palette_fade_flag.w			; Fade palette in
	rts

; ------------------------------------------------------------------------------
; Fade palette to black
; ------------------------------------------------------------------------------

ol_FadePaletteToBlack:
	move.b	#2,ol_palette_fade_flag.w			; Fade palette to black
	rts

; ------------------------------------------------------------------------------
; Fade palette to white
; ------------------------------------------------------------------------------

ol_FadePaletteToWhite:
	move.b	#3,ol_palette_fade_flag.w			; Fade palette to white
	rts

; ------------------------------------------------------------------------------
; Wait for palette fade
; ------------------------------------------------------------------------------

ol_WaitPaletteFade:
	bsr.w	ol_UpdateCram					; Update CRAM
	bsr.w	ol_VSync					; VSync

	tst.b	ol_palette_fade_flag.w				; Are we done fading?
	bne.s	ol_WaitPaletteFade				; If not, wait
	rts

; ------------------------------------------------------------------------------
; Update CRAM buffer
; ------------------------------------------------------------------------------

ol_UpdateCram:
	move.b	ol_palette_fade_flag.w,d0			; Should we be fading?
	beq.s	.GetCramData					; If not, branch
	cmpi.b	#1,d0						; Should we fade the palette in?
	beq.s	.FadeFrom					; If so, branch
	cmpi.b	#2,d0						; Should we fade to black?
	beq.s	.FadeToBlack					; If so, branch

.FadeToWhite:
	addq.w	#1,ol_palette_fade.w				; Fade to white
	cmpi.w	#7*2,ol_palette_fade.w				; Have we faded all the way?
	blt.s	.GetCramData					; If not, branch
	
	move.w	#7*2,ol_palette_fade.w				; Cap at white
	bra.s	.FadeDone					; Fade is done

.FadeToBlack:
	subq.w	#1,ol_palette_fade.w				; Fade to black
	cmpi.w	#-7*2,ol_palette_fade.w				; Have we faded all the way?
	bgt.s	.GetCramData					; If not, branch
	
	move.w	#-7*2,ol_palette_fade.w				; Cap at black
	bra.s	.FadeDone					; Fade is done

.FadeFrom:
	tst.w	ol_palette_fade.w				; Have we faded all the way?
	beq.s	.FadeDone					; If so, branch
	bmi.s	.FadeFromBlack					; If we are fading from black, branch

.FadeFromWhite:
	subq.w	#1,ol_palette_fade.w				; Fade from white
	bne.s	.GetCramData					; If we are not done fading, branch
	bra.s	.FadeDone					; Fade is done

.FadeFromBlack:
	addq.w	#1,ol_palette_fade.w				; Fade from white
	bne.s	.GetCramData					; If we are not done fading, branch

.FadeDone:
	clr.b	ol_palette_fade_flag.w				; Stop fading

.GetCramData:
	lea	ol_palette.w,a0					; Palette buffer
	lea	ol_cram_buffer.w,a1				; CRAM buffer
	
	moveq	#0,d0						; Clear color value

	move.w	ol_palette_fade.w,d2				; Get brightness tables
	andi.w	#~1,d2
	lea	.BrightnessRedBlue(pc,d2.w),a2
	lea	.BrightnessGreen(pc),a3
	lsl.w	#4,d2
	adda.w	d2,a3
	
	moveq	#$40-1,d3					; Number of colors
	
.Loop:
	move.b	(a0)+,d0					; Store blue
	move.b	(a2,d0.w),(a1)+
	
	move.b	(a0)+,d0					; Store green and red
	moveq	#$E,d1
	and.b	d0,d1
	sub.b	d1,d0
	move.b	(a3,d0.w),d0
	or.b	(a2,d1.w),d0
	move.b	d0,(a1)+
	
	dbf	d3,.Loop					; Loop until colors are processed
	rts

; ------------------------------------------------------------------------------

	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.BrightnessRedBlue:
	dc.b	$00, $00, $02, $02, $04, $04, $06, $06, $08, $08, $0A, $0A, $0C, $0C
	dc.b	$0E, $0E
	dc.b	$0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
	
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.BrightnessGreen:
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40
	dc.b	$40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40
	dc.b	$60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60
	dc.b	$60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60
	dc.b	$80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
	dc.b	$80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
	dc.b	$A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0
	dc.b	$A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0
	dc.b	$C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0
	dc.b	$C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
	dc.b	$E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0

; ------------------------------------------------------------------------------