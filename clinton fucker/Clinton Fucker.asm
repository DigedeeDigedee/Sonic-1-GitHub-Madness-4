
clifuck.Timer	=	$30
clifuck.Accel	=	$32
clifuck.Speed   =	$36

;REND.XMIRR	= 0
;REND.YMIRR	= 1
;REND.CAMOFF	= 2
;REND.CAMOFF2	= 3
;REND.HEIGHT	= 4
;REND.RAW	= 5
;REND.BEHIND	= 6
;REND.TOGGLE	= 7


ClintonFucker:
	moveq	#0,d0
	move.b	obRoutine(a0),d0
	move.w	.Index(pc,d0.w),d1
	jmp	.Index(pc,d1.w)
; --------------------------------------------------------------
.Index:		
	dc.w CliFucker_Init-.Index
	dc.w CliFucker_Wait-.Index
	dc.w CliFucker_Init2-.Index
	dc.w CliFucker_Main-.Index
; --------------------------------------------------------------

CliFucker_Init:
	addq.b	#2,obRoutine(a0)
	move.b	#bgm_Fade,d0
	jsr	QueueSound2

CliFucker_Wait:
	addq.w	#1,clifuck.Timer(a0)
	cmpi.w	#60*3,clifuck.Timer(a0)
	beq.s	.SayHi
	cmpi.w	#60*5,clifuck.Timer(a0)
	ble.s	.Exit
	addq.b	#2,obRoutine(a0)

.Exit:
	rts

.SayHi:
	move.b	#dClintonHi,d0
	jmp	MegaPCM_PlaySample

CliFucker_Init2:
	tst.l	(v_plc_buffer).w
	bne.s	.Exit
	move.l	#Nem_Clinton,v_plc_buffer	; copy PLC to RAM directly
	move.w	#$8000,v_plc_buffer+4		
	addq.b	#2,obRoutine(a0)
	move.l	#SprPat_Clinton,obMap(a0)
	move.w	#$8000/32,obGfx(a0)
	move.b	#4,obRender(a0)
	move.b	#4,obPriority(a0)
	move.b	#$14,obActWid(a0)
	move.b	#$10,obHeight(a0)
	move.b	#8,obWidth(a0)
	move.b	#1,obFrame(a0)
	move.w	#80,clifuck.Speed(a0)
	move.w	#32,clifuck.Accel(a0)
	move.w	#0,(v_limitleft1).w
	move.w	#0,(v_limitleft2).w
	st	v_clintonfucker
.Exit:
	rts
CliFucker_Main:
	add.l	#$2000,clifuck.Speed(a0)
	lea 	v_player, a1
	move.w	obX(a1),d0
	move.w	obX(a0),d1
	sub.w	d0,d1
	bpl.s	.ToLeft
	bset	#0,obStatus(a0)
	bra.s	.Skip
.ToLeft
	bclr	#0,obStatus(a0)
.Skip
	move.w 	clifuck.Speed(a0), d0
	move.w	clifuck.Accel(a0), d1
	jsr	ChaseObject
	jsr	SpeedToPos
	lea	Ani_Clinton,a1
	jsr	AnimateSprite
	jsr	DisplaySprite
	rts


Ani_Clinton:
.tbl:
	dc.w	clintonwalk-.tbl

clintonwalk:	dc.b	4
	dc.b	1,2,3,4,5,6,7,-1
	even

SprPat_Clinton:	include		"clinton fucker/Clinton.asm"
		even

Nem_Clinton:	binclude	"clinton fucker/Clinton.nem"
		even