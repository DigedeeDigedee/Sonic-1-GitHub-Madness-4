; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Initialize sprites
; ------------------------------------------------------------------------------

ol_InitSprites:
	lea	ol_sprites.w,a0					; Sprite table
	move.w	a0,ol_sprite_slot				; Set sprite slot address

	moveq	#0,d0						; Zero
	moveq	#1,d1						; Link value
	moveq	#$50-1,d2					; Number of sprites
	move.w	d2,ol_sprites_left.w				; Set number of sprite slots left

.InitLoop:
	move.l	d0,(a0)+					; Clear sprite slot
	move.l	d0,(a0)+
	
	move.b	d1,-5(a0)					; Set link value
	addq.b	#1,d1						; Next link value
	dbf	d2,.InitLoop					; Loop until finished
	
	move.b	d0,-5(a0)					; Set last link value
	rts

; ------------------------------------------------------------------------------
; Start sprite drawing
; ------------------------------------------------------------------------------

ol_StartSpriteDraw:
	move.w	#ol_sprites,ol_sprite_slot.w			; Reset sprite slot address
	move.w	#$50-1,ol_sprites_left.w			; Reset sprite slots left
	rts

; ------------------------------------------------------------------------------
; End sprite drawing
; ------------------------------------------------------------------------------

ol_EndSpriteDraw:
	move.w	ol_sprites_left.w,d1				; Get sprite slots left
	bmi.s	.End						; If there are none, branch
	
	movea.w	ol_sprite_slot.w,a0				; Get first unused sprite slot
	moveq	#0,d0						; Zero

.ClearUnused:
	move.w	d0,(a0)						; Move unused sprite slot off-screen
	addq.w	#8,a0
	dbf	d1,.ClearUnused					; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------
; Draw sprite
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d0.w - X position
;	d1.w - Y position
;	d2.b - Draw flags
;	d3.w - Sprite tile
;	d4.w - Sprite frame ID
;	a1.l - Sprite data address
; ------------------------------------------------------------------------------

ol_DrawSprite:
	move.w	ol_sprites_left.w,d7				; Get number of sprite slots left
	bmi.w	.End						; If there are none left, branch

	movea.w	ol_sprite_slot.w,a2				; Get first free sprite slot
	moveq	#1-1,d6						; 1 sprite piece/Zero

	btst	#5,d2						; Should we directly draw 1 sprite piece?
	bne.s	.Draw						; If so, branch

	add.w	d4,d4						; Get sprite frame data
	adda.w	(a1,d4.w),a1

	move.w	(a1)+,d6					; Get number of sprite pieces
	subq.w	#1,d6
	bmi.w	.DrawDone					; If there are none, branch

.Draw:
	addi.w	#128,d0						; Move position on screen
	addi.w	#128,d1

	moveq	#0,d4						; Clear flip offset
	moveq	#0,d5						; Clear flip table 

; ------------------------------------------------------------------------------

	lsr.b	#1,d2						; Should the sprite be flipped horizontally?
	bcs.s	.DrawXFlip					; If so, branch
	lsr.b	#1,d2						; Should the sprite be flipped vertically?
	bcs.w	.DrawYFlip					; If so, branch

.DrawNoFlip:
	move.b	(a1)+,d2					; Get Y position
	ext.w	d2
	add.w	d1,d2
	
	cmpi.w	#-32+128,d2					; Is this sprite piece on-screen?
	ble.s	.SkipPieceNoFlip				; If so, branch
	cmpi.w	#224+128,d2	
	bge.s	.SkipPieceNoFlip				; If so, branch
	move.w	d2,(a2)+					; Set sprite Y position
	
	move.b	(a1)+,(a2)+					; Set sprite size
	addq.w	#1,a2						; Skip link value

	move.w	(a1)+,d2					; Set sprite tile
	add.w	d3,d2
	move.w	d2,(a2)+

	move.w	(a1)+,d2					; Get X position
	add.w	d0,d2
	
	cmpi.w	#-32+128,d2					; Is this sprite piece on-screen?
	ble.s	.SkipPieceNoFlip2				; If so, branch
	cmpi.w	#320+128,d2	
	bge.s	.SkipPieceNoFlip2				; If so, branch
	move.w	d2,(a2)+					; Set sprite X position

	subq.w	#1,d7						; Decrement number of sprite slots left
	dbmi	d6,.DrawNoFlip					; Loop until finished
	bra.w	.DrawDone					; Finish drawing

.SkipPieceNoFlip:
	addq.w	#5,a1						; Skip to next sprite piece
	dbf	d6,.DrawNoFlip					; Loop until finished
	bra.w	.DrawDone					; Finish drawing

.SkipPieceNoFlip2:
	subq.w	#6,a2						; Undo sprite slot writing
	dbf	d6,.DrawNoFlip					; Loop until finished
	bra.w	.DrawDone					; Finish drawing

; ------------------------------------------------------------------------------

.DrawXFlip:
	lsr.b	#1,d2						; Should the sprite also be flipped vertically?
	bcs.s	.DrawXYFlip					; If so, branch
	
.DrawXFlipLoop:
	move.b	(a1)+,d2					; Get Y position
	ext.w	d2
	add.w	d1,d2
	
	cmpi.w	#-32+128,d2					; Is this sprite piece on-screen?
	ble.s	.SkipPieceXFlip					; If so, branch
	cmpi.w	#224+128,d2	
	bge.s	.SkipPieceXFlip					; If so, branch
	move.w	d2,(a2)+					; Set sprite Y position
	
	move.b	(a1)+,d5					; Get and set sprite size
	move.b	d5,(a2)+
	addq.w	#1,a2						; Skip link value

	move.w	(a1)+,d2					; Set flipped sprite tile
	add.w	d3,d2
	eori.w	#$800,d2
	move.w	d2,(a2)+

	move.w	(a1)+,d2					; Get flipped X position
	neg.w	d2
	move.b	.XFlipOffsets(pc,d5.w),d4
	sub.w	d4,d2
	add.w	d0,d2
	
	cmpi.w	#-32+128,d2					; Is this sprite piece on-screen?
	ble.s	.SkipPieceXFlip2				; If so, branch
	cmpi.w	#320+128,d2	
	bge.s	.SkipPieceXFlip2				; If so, branch
	move.w	d2,(a2)+					; Set sprite X position

	subq.w	#1,d7						; Decrement number of sprite slots left
	dbmi	d6,.DrawXFlipLoop				; Loop until finished
	bra.w	.DrawDone					; Finish drawing

.SkipPieceXFlip:
	addq.w	#5,a1						; Skip to next sprite piece
	dbf	d6,.DrawXFlipLoop				; Loop until finished
	bra.w	.DrawDone					; Finish drawing

.SkipPieceXFlip2:
	subq.w	#6,a2						; Undo sprite slot writing
	dbf	d6,.DrawXFlipLoop				; Loop until finished
	bra.w	.DrawDone					; Finish drawing

; ------------------------------------------------------------------------------

.XFlipOffsets:
	dc.b	8,   8,   8,   8
	dc.b	$10, $10, $10, $10
	dc.b	$18, $18, $18, $18
	dc.b	$20, $20, $20, $20

; ------------------------------------------------------------------------------

.DrawXYFlip:
	move.b	(a1)+,d2					; Get flipped Y position
	ext.w	d2
	neg.w	d2

	move.b	(a1)+,d5					; Get size
	
	move.b	.YFlipOffsets(pc,d5.w),d4			; Apply flip offset to Y position
	sub.w	d4,d2
	add.w	d1,d2
	
	cmpi.w	#-32+128,d2					; Is this sprite piece on-screen?
	ble.s	.SkipPieceXYFlip				; If so, branch
	cmpi.w	#224+128,d2	
	bge.s	.SkipPieceXYFlip				; If so, branch
	move.w	d2,(a2)+					; Set sprite Y position
	
	move.b	d5,(a2)+					; Set sprite size
	addq.w	#1,a2						; Skip link value

	move.w	(a1)+,d2					; Set flipped sprite tile
	add.w	d3,d2
	eori.w	#$1800,d2
	move.w	d2,(a2)+

	move.w	(a1)+,d2					; Get flipped X position
	neg.w	d2
	move.b	.XFlipOffsets(pc,d5.w),d4
	sub.w	d4,d2
	add.w	d0,d2
	
	cmpi.w	#-32+128,d2					; Is this sprite piece on-screen?
	ble.s	.SkipPieceXYFlip2				; If so, branch
	cmpi.w	#320+128,d2	
	bge.s	.SkipPieceXYFlip2				; If so, branch
	move.w	d2,(a2)+					; Set sprite X position

	subq.w	#1,d7						; Decrement number of sprite slots left
	dbmi	d6,.DrawXYFlip					; Loop until finished
	bra.s	.DrawDone					; Finish drawing

.SkipPieceXYFlip:
	addq.w	#5,a1						; Skip to next sprite piece
	dbf	d6,.DrawXYFlip					; Loop until finished
	bra.s	.DrawDone					; Finish drawing

.SkipPieceXYFlip2:
	subq.w	#6,a2						; Undo sprite slot writing
	dbf	d6,.DrawXYFlip					; Loop until finished
	bra.s	.DrawDone					; Finish drawing

; ------------------------------------------------------------------------------

.YFlipOffsets:
	dc.b	8, $10, $18, $20
	dc.b	8, $10, $18, $20
	dc.b	8, $10, $18, $20
	dc.b	8, $10, $18, $20

; ------------------------------------------------------------------------------

.DrawYFlip:
	move.b	(a1)+,d2					; Get flipped Y position
	ext.w	d2
	neg.w	d2

	move.b	(a1)+,d5					; Get size
	
	move.b	.YFlipOffsets(pc,d5.w),d4			; Apply flip offset to Y position
	sub.w	d4,d2
	add.w	d1,d2
	
	cmpi.w	#-32+128,d2					; Is this sprite piece on-screen?
	ble.s	.SkipPieceYFlip					; If so, branch
	cmpi.w	#224+128,d2	
	bge.s	.SkipPieceYFlip					; If so, branch
	move.w	d2,(a2)+					; Set sprite Y position
	
	move.b	d5,(a2)+					; Set sprite size
	addq.w	#1,a2						; Skip link value

	move.w	(a1)+,d2					; Set flipped sprite tile
	add.w	d3,d2
	eori.w	#$1000,d2
	move.w	d2,(a2)+

	move.w	(a1)+,d2					; Get X position
	add.w	d0,d2
	
	cmpi.w	#-32+128,d2					; Is this sprite piece on-screen?
	ble.s	.SkipPieceYFlip2				; If so, branch
	cmpi.w	#320+128,d2	
	bge.s	.SkipPieceYFlip2				; If so, branch
	move.w	d2,(a2)+					; Set sprite X position

	subq.w	#1,d7						; Decrement number of sprite slots left
	dbmi	d6,.DrawYFlip					; Loop until finished
	bra.s	.DrawDone					; Finish drawing

.SkipPieceYFlip:
	addq.w	#5,a1						; Skip to next sprite piece
	dbf	d6,.DrawYFlip					; Loop until finished
	bra.s	.DrawDone					; Finish drawing

.SkipPieceYFlip2:
	subq.w	#6,a2						; Undo sprite slot writing
	dbf	d6,.DrawYFlip					; Loop until finished

; ------------------------------------------------------------------------------

.DrawDone:
	move.w	a2,ol_sprite_slot.w				; Update sprite slot address
	move.w	d7,ol_sprites_left.w				; Update number of sprite slots left

.End:
	rts

; ------------------------------------------------------------------------------