; ----------------------------------------------------------------------------
; "Classic" Needlemouse Boss
;
; This is in reference to an old hack I made, Needlemouse Adventure.
; It's a niche joke not a lot of people will get but I'm partly doing it
; to vent some steam.
; ----------------------------------------------------------------------------

; "Normal" object status bitfield
;
;STAT.XDIR	= 0
;STAT.YDIR	= 1
;STAT.UNK2	= 2
;STAT.LIFTING	= 3 
;STAT.UNK4	= 4
;STAT.PUSHED	= 5 
;STAT.UNK6	= 6
;STAT.KILLED	= 7
;
;; "Physics" object status bitfield
;
;PHYS.DIR	= 0
;PHYS.AIRBORNE	= 1
;PHYS.ROLLING	= 2
;PHYS.LIFTED	= 3
;PHYS.ROLLJUMP	= 4
;PHYS.PUSH	= 5
;PHYS.WATER	= 6
;PHYS.KILLED	= 7
;
;; Object rendering bitfield
;
;REND.XMIRR	= 0
;REND.YMIRR	= 1
;REND.CAMOFF	= 2
;REND.CAMOFF2	= 3
;REND.HEIGHT	= 4
;REND.RAW	= 5
;REND.BEHIND	= 6
;REND.TOGGLE	= 7

NEEDLB_VRAM	= $8000
NEEDLB_GFX	= (NEEDLB_VRAM/32)+$2000

ObjNeedleBoss:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	.Index(pc,d0.w),d1
		jmp	.Index(pc,d1.w)

; ----------------------------------------------------------------------------
.Index	
	dc.w	NeedleBoss_Init-.Index
	dc.w	NeedleBoss_WalkIn-.Index
	dc.w	NeedleBoss_Stand-.Index
; ----------------------------------------------------------------------------

NeedleBoss_Init:
		tst.l	v_plc_buffer.w
		beq.s	.Go
		rts
.Go
		add.b	#2, obRoutine(a0)
		move.l	#Map_NeedleBoss, obMap(a0)
		move.w	#NEEDLB_GFX,obGfx(a0)
		move.b	#4,obRender(a0)
		move.b	#16,obWidth(a0)
		move.b	#16,obHeight(a0)
		move.b	#16,obActWid(a0)
		move.b	#2,obPriority(a0)
		move.b	#8,obFrame(a0)
		move.b	#0,obAnim(a0)
		bset	#0,obStatus(a0)

		; load palette

		lea	(v_palette+32).w,a1
		lea	Pal_NeedleBoss,a2

		rept	8
		move.l	(a2)+,(a1)+
		endr

NeedleBoss_WalkIn:
		sub.w	#2,obX(a0)
		cmpi.w	#$480,obX(a0)
		bgt.s	.Skip
		addq.b	#2,obRoutine(a0)
		move.b	#1,obAnim(a0)
.Skip
NeedleBoss_Stand:
		lea	Ani_NeedleBoss(pc),a1
		jsr	AnimateSprite.l
		jmp	DisplaySprite.l



; ----------------------------------------------------------------------------
; Ani_NeedleBoss
; ----------------------------------------------------------------------------

Ani_NeedleBoss:
.t
	dc.w	.walkin-.t
	dc.w	.stand-.t
.walkin:
	dc.b	4
	dc.b	2,3,4,5,6,7,afEnd
	even
.stand
	dc.b	12
	dc.b	$E,2,1,afBack,1
	even

ArtList_NeedleBoss:
	dc.l	Nem_NeedleBoss
	dc.w	NEEDLB_VRAM
	dc.l	-1


Map_NeedleBoss:
	include	"_incObj/NeedleBoss/NeedleBoss Map.asm"

Nem_NeedleBoss:
	incbin	"_incObj/NeedleBoss/NeedleBoss.nem"
	even
Pal_NeedleBoss:
	incbin	"_incObj/NeedleBoss/NeedleBoss.pal"