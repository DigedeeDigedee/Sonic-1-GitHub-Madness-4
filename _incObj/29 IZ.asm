; ---------------------------------------------------------------------------
; Object 4F - ObjIZ
; ---------------------------------------------------------------------------

ObjIZ:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	ObjIZ_Index(pc,d0.w),d1
		jmp	ObjIZ_Index(pc,d1.w)
; ===========================================================================
ObjIZ_Index:	dc.w ObjIZ_Main-ObjIZ_Index
		dc.w ObjIZ_Action-ObjIZ_Index
		dc.w ObjIZ_Animate-ObjIZ_Index
		dc.w ObjIZ_Delete-ObjIZ_Index
; ===========================================================================

ObjIZ_Main:	; Routine 0
		move.l	#Map_IZ,obMap(a0)
		move.w	#make_art_tile(ArtTile_CBZ_IZ,0,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.b	#4,obPriority(a0)
		move.b	#5,obColType(a0)
		move.b	#$C,obActWid(a0)
		move.b	#$13,obHeight(a0)
		move.b	#8,obWidth(a0)

		bsr.w	ObjectFall
		jsr	(ObjFloorDist).l
		tst.w	d1
		bpl.s	.notonfloor
		add.w	d1,obY(a0)	; match	object's position with the floor
		move.w	#0,obVelY(a0)
		addq.b	#2,obRoutine(a0) ; goto ObjIZ_Action next

.notonfloor:
		bra.w	DisplaySprite

; ===========================================================================

ObjIZ_Action:	; Routine 2
		moveq	#0,d0
		move.b	ob2ndRout(a0),d0
		move.w	ObjIZ_ActIndex(pc,d0.w),d1
		jsr	ObjIZ_ActIndex(pc,d1.w)
;		lea	(Ani_IZ).l,a1
;		bsr.w	AnimateSprite
		bra.w	RememberState

; ===========================================================================
ObjIZ_ActIndex:	dc.w .move-ObjIZ_ActIndex
		dc.w .findfloor-ObjIZ_ActIndex

.time = $30
; ===========================================================================

.move:
		subq.w	#1,.time(a0)	; subtract 1 from pause	time
		bpl.s	.wait		; if time remains, branch

		addq.b	#2,ob2ndRout(a0)
		move.w	#$80,obVelX(a0) ; move object to the left
		move.b	#1,obAnim(a0)
		bchg	#0,obStatus(a0)
		bne.s	.wait
		neg.w	obVelX(a0)	; change direction

.wait:
		rts	
; ===========================================================================

.findfloor:
		bsr.w	SpeedToPos
		jsr	(ObjFloorDist).l
		cmpi.w	#-8,d1
		blt.s	.pause
		cmpi.w	#$C,d1
		bge.s	.pause
		add.w	d1,obY(a0)	; match	object's position with the floor
		rts	

.pause:
		subq.b	#2,ob2ndRout(a0)
		move.w	#170,.time(a0)	; set pause time to 1 second
		move.w	#0,obVelX(a0)	; stop the object moving
		move.b	#0,obAnim(a0)
		rts	
; ===========================================================================

ObjIZ_Animate:	; Routine 4
;		lea	(Ani_ObjIZ).l,a1
;		bsr.w	AnimateSprite
		bra.w	DisplaySprite
; ===========================================================================

ObjIZ_Delete:	; Routine 6
		bra.w	DeleteObject
