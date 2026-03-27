; ---------------------------------------------------------------------------
; Object 7A - SLZ Boss I HATE THIS SHIT FUCK YOU SLZ
; ---------------------------------------------------------------------------

BossStarLight:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	slz_bosser_Index(pc,d0.w),d1
		jmp	slz_bosser_Index(pc,d1.w)

; ===========================================================================

slz_bosser_Index:
		dc.w slz_bosser_Main-slz_bosser_Index
		dc.w slz_bosser_ShipMain-slz_bosser_Index
		dc.w slz_bosser_FaceMain-slz_bosser_Index
		dc.w slz_bosser_FlameMain-slz_bosser_Index
		dc.w slz_bosser_TubeMain-slz_bosser_Index

; ===========================================================================

slz_bosser_ObjData:
		dc.b 2,0,4
		dc.b 4,1,4
		dc.b 6,7,4
		dc.b 8,0,3

; ===========================================================================

slz_bosser_Main:
		move.w	#boss_slz_x+$188,obX(a0)
		move.w	#boss_slz_y+$18,obY(a0)
		move.w	obX(a0),objoff_30(a0)
		move.w	obY(a0),objoff_38(a0)

		move.b	#$F,obColType(a0)
		move.b	#8,obColProp(a0)

		move.w	#59,objoff_3C(a0) ; jump delay

		lea	slz_bosser_ObjData(pc),a2
		movea.l	a0,a1
		moveq	#3,d1

.loadLoop:
		jsr	(FindNextFreeObj).l
		bne.s	.done

		move.b	#$7A,obID(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)

		bclr	#0,obStatus(a0)
		clr.b	ob2ndRout(a1)

		move.b	(a2)+,obRoutine(a1)
		move.b	(a2)+,obAnim(a1)
		move.b	(a2)+,obPriority(a1)

		move.l	#Map_Eggman,obMap(a1)
		move.w	#make_art_tile(ArtTile_Eggman,0,0),obGfx(a1)
		move.b	#4,obRender(a1)
		move.b	#$20,obActWid(a1)

		move.l	a0,objoff_34(a1)
		dbf	d1,.loadLoop

.done:
		rts
slz_bosser_ShipMain:
		moveq	#0,d0
		move.b	ob2ndRout(a0),d0
		move.w	slz_bosser_ShipIndex(pc,d0.w),d0
		jsr	slz_bosser_ShipIndex(pc,d0.w)

		lea	(Ani_Eggman).l,a1
		jsr	(AnimateSprite).l

		moveq	#3,d0
		and.b	obStatus(a0),d0
		andi.b	#$FC,obRender(a0)
		or.b	d0,obRender(a0)

		jmp	(DisplaySprite).l

slz_bosser_ShipIndex:
		dc.w slz_bosser_Wait-slz_bosser_ShipIndex
		dc.w slz_bosser_Hop-slz_bosser_ShipIndex

slz_bosser_Wait:
		subq.w	#1,objoff_3C(a0)
		bpl.s	.noaction

		; Face player
		move.w	#$100,d1
		bset	#0,obStatus(a0)

		move.w	(v_player+obX).w,d0
		sub.w	obX(a0),d0
		bcc.s	.right

		neg.w	d1
		bclr	#0,obStatus(a0)

.right:
		move.w	#-$380,obVelY(a0)
		move.w	d1,obVelX(a0)

		addq.b	#2,ob2ndRout(a0)
		move.b	#0,obAnim(a0)

.noaction:
		rts

slz_bosser_Hop:
		jmp	SpeedToPos
		addi.w	#$18,obVelY(a0)

		tst.w	obVelY(a0)
		bmi.s	.notlanded

		jsr	(ObjFloorDist).l
		tst.w	d1
		bpl.s	.notlanded

		add.w	d1,obY(a0)
		clr.w	obVelY(a0)
		clr.w	obVelX(a0)

		subq.b	#2,ob2ndRout(a0)
		move.w	#59,objoff_3C(a0)

.notlanded:
		rts

slz_bosser_FaceMain:
		movea.l	objoff_34(a0),a1
		move.b	ob2ndRout(a1),d0

		moveq	#1,d1
		cmpi.b	#2,d0
		bne.s	.ok
		moveq	#5,d1

.ok:
		move.b	d1,obAnim(a0)

		bra.s	slz_bosser_DisplayFollow


slz_bosser_FlameMain:
		move.b	#8,obAnim(a0)
		bra.s	slz_bosser_DisplayFollow

slz_bosser_TubeMain:
		move.l	#Map_BossItems,obMap(a0)
		move.w	#make_art_tile(ArtTile_Eggman_Weapons,1,0),obGfx(a0)
		move.b	#3,obFrame(a0)


slz_bosser_DisplayFollow:
		movea.l	objoff_34(a0),a1

		move.w	obX(a1),obX(a0)
		move.w	obY(a1),obY(a0)
		move.b	obStatus(a1),obStatus(a0)

		moveq	#3,d0
		and.b	obStatus(a0),d0
		andi.b	#$FC,obRender(a0)
		or.b	d0,obRender(a0)

		jmp	(DisplaySprite).l