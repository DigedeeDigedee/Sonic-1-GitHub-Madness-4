; ---------------------------------------------------------------------------

ObjIZ:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	ObjIZ_Index(pc,d0.w),d1
		jmp	ObjIZ_Index(pc,d1.w)
; ---------------------------------------------------------------------------

ObjIZ_Index:	dc.w ObjIZ_Init-ObjIZ_Index, ObjIZ_Act-ObjIZ_Index, ObjIZ_Disp-ObjIZ_Index, ObjIZ_Die-ObjIZ_Index
; ---------------------------------------------------------------------------

ObjIZ_Init:
		move.b	#$13,obHeight(a0)
		move.b	#8,obWidth(a0)
		move.l	#Map_IZ,obMap(a0)
		move.w	#make_art_tile(ArtTile_CBZ_IZ,0,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.b	#4,obPriority(a0)
		move.b	#5,obColType(a0)
		move.b	#$C,obActWid(a0)
		bsr.w	ObjectFall
		jsr	(ObjHitFloor).l
		tst.w	d1
		bpl.s	locret_6F94
		add.w	d1,obY(a0)
		move.w	#0,obVelY(a0)
		addq.b	#2,obRoutine(a0)

locret_6F94:
		rts
; ---------------------------------------------------------------------------

ObjIZ_Act:
		moveq	#0,d0
		move.b	ob2ndRout(a0),d0
		move.w	ObjIZ_ActIndex(pc,d0.w),d1
		jsr	ObjIZ_ActIndex(pc,d1.w)
;		lea	(Ani_IZ).l,a1
;		bsr.w	AnimateSprite
		bra.w	RememberState
; ---------------------------------------------------------------------------

ObjIZ_ActIndex:	dc.w ObjIZ_Move-ObjIZ_ActIndex, ObjIZ_Boom-ObjIZ_ActIndex
; ------------------------------------------------------------------ ---------

ObjIZ_Move:
		subq.w	#1,hog_launchflag(a0)
		bpl.s	loc_6FE6
		addq.b	#2,ob2ndRout(a0)
		move.w	#$FF,hog_launchflag(a0)
		move.w	#$40,obVelX(a0)
		move.b	#1,obAnim(a0)
		bchg	#0,obStatus(a0)
		bne.s	loc_6FDE
		neg.w	obVelX(a0)

loc_6FDE:
		move.b	#0,hog_backup(a0)
		rts
; ---------------------------------------------------------------------------

loc_6FE6:
		tst.b	hog_backup(a0)
		bne.s	locret_6FF4
		cmpi.b	#2,obFrame(a0)
		beq.s	loc_6FF6

locret_6FF4:
		rts
; ---------------------------------------------------------------------------

loc_6FF6:
		move.b	#1,hog_backup(a0)
		bsr.w	FindFreeObj
		bne.s	locret_701A
		_move.b	#id_Cannonball,(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		addi.w	#$10,obY(a1)

locret_701A:
		rts
; ---------------------------------------------------------------------------

ObjIZ_Boom:
		subq.w	#1,hog_launchflag(a0)
		bmi.s	loc_7032
		bsr.w	SpeedToPos
		jsr	(ObjHitFloor).l
		add.w	d1,obY(a0)
		rts
; ---------------------------------------------------------------------------

loc_7032:
		subq.b	#2,ob2ndRout(a0)
		move.w	#$3B,hog_launchflag(a0)
		move.w	#0,obVelX(a0)
		move.b	#0,obAnim(a0)
		tst.b	obj.Render(a0)
		bpl.s	locret_7054
		move.b	#2,obj.Anim(a0)

locret_7054:
		rts
; ---------------------------------------------------------------------------

ObjIZ_Disp:
		bsr.w	DisplaySprite
		rts
; ---------------------------------------------------------------------------

ObjIZ_Die:
		bsr.w	DeleteObject
		rts

Ani_IZ:
		dc.w Ani_IZ.frame1-Ani_IZ
		dc.w Ani_IZ.frame2-Ani_IZ
		dc.w Ani_IZ.frame3-Ani_IZ
Ani_IZ.frame1:
		dc.b $F, 0, afEnd
		even
Ani_IZ.frame2:
		dc.b $B, 1, 0, $21, 0, afEnd
		even
Ani_IZ.frame3:
		dc.b $14, 0, 2, 0, afBack, 1
		even