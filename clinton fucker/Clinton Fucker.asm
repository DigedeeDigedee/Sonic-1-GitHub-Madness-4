
clifuck.Timer	=	$30
clifuck.Accel	=	$30
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
.SayHi:
	nop
.Exit:
	rts

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
.Exit:
	rts
CliFucker_Main:
	lea 	v_player, a1
	move.w 	#$450, d0
	move.w	#$30, d1
	jsr	ChaseObject
	jsr	SpeedToPos
	jsr	DisplaySprite
	rts

SprPat_Clinton:	include		"clinton fucker/Clinton.asm"
		even

Nem_Clinton:	binclude	"clinton fucker/Clinton.nem"
		even