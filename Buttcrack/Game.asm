GM_ButtcrackMan:
	jsr	(PaletteFadeOut).l
	jsr	(ClearScreen).l
	jsr	(ClearPLC).l

	lea	(v_objspace).w, a0
	move.l	#$7FF, d0
	moveq	#0, d1

.ClearObjectRAM:
	move.l	d1, (a0)+
	dbra	d0, .ClearObjectRAM

.GameLoop:
	bra.s 	.GameLoop

.Exit:
	rts