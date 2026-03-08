
	include "hipncoolstuff/ThanatosCredits/Variables.asm"

NemThanatosCredits:	binclude "hipncoolstuff/ThanatosCredits/Credits Font.nem"
EniThanatosCredits:	binclude "hipncoolstuff/ThanatosCredits/Credits Font.eni"

VDP_ThanatosCredits:
	dc.w $8700
	dc.w $8C01
	dc.w $8B03
	dc.w $9200
	dc.w $9001
	dc.w $8400+(vram_bg>>13)
	dc.w $8200+(vram_fg>>10)
	dc.w $8004
VDP_ThanatosCredits_end:

GM_ThanatosCredits:
	QueueSound_M bgm_Fade,0

	jsr	(ClearPLC).l
	jsr	(PaletteFadeOut).l

	; Configure VDP
	move.w	(v_vdp_buffer1).w,d0
	ori.b	#$BF,d0
	move.w	d0,(vdp_control_port).l
	lea	(vdp_control_port).l,a6
	move.w	#VDP_ThanatosCredits_end-VDP_ThanatosCredits-2,d0

-	move.w	VDP_ThanatosCredits(pc,d0.w),(a6)
	subq.w	#2,d0
	bne.s	-

	jsr	(ClearScreen).l
	move.w	(v_vdp_buffer1).w,d0
	ori.b	#$40,d0
	move.w	d0,(vdp_control_port).l

	; Empty object space
	lea	(v_objspace).w,a1
	moveq	#0,d0
	move.w	#$7FF,d1

-	move.l	d0,(a1)+
	dbf.w	d1,-

	; Load palette
	lea	(v_palette_fading),a1
	move.w	#$20,d1

-	move.l	PalThanatosCredits(pc,d1.w),(a1,d1.w)
	subq.w	#4,d1
	bpl.s	-

	; moveq	#0,d0 ; d0 should be clear, if not use this
	adda.w	#$20,a1
	move.w	#$60/$4-1,d1
-	move.l	d0,(a1)+
	dbf.w	d1,-

	; Load art/map
	locVRAM	$20
	lea	(NemThanatosCredits).l,a0 ; load art
	jsr	(NemDec).l

	lea	($FF0000).l,a1
	lea	(EniThanatosCredits).l,a0 ; load map
	move.w	#1,d0
	jsr	(EniDec).l


	jsr	(PaletteFadeIn).l

	bra.s	*


PalThanatosCredits:	binclude "hipncoolstuff/ThanatosCredits/Palette.pal"
	rts
