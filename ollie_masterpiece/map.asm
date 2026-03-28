; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Initialize map
; ------------------------------------------------------------------------------

ol_InitMap:
	moveq	#0,d0						; Get map data
	move.b	ol_map_id.w,d0
	add.w	d0,d0
	add.w	d0,d0
	lea	ol_MapIndex,a6
	movea.l	(a6,d0.w),a6

	movea.l	(a6)+,a0					; Load graphics
	move.l	#$40000000,vdp_control_port
	jsr	NemDec.w

	movea.l	(a6)+,a0					; Get palette data
	lea	v_palette_fading.w,a1				; Get palette buffer
	moveq	#$80/4-1,d0					; Length of palette

.LoadPalette:
	move.l	(a0)+,(a1)+					; Load palette
	dbf	d0,.LoadPalette					; Loop until finished

	move.l	(a6)+,ol_map_blocks.w				; Set map blocks address
	move.l	(a6)+,ol_map_chunks.w				; Set map chunks address
	move.l	(a6)+,d0					; Set map foreground address
	addq.l	#4,d0
	move.l	d0,ol_map_foreground.w
	move.l	(a6)+,ol_map_collision.w			; Set map collision address
	move.l	(a6)+,ol_map_objects.w				; Set map objects address
	move.l	(a6)+,ol_map_left.w				; Set map left and right boundaries
	move.l	(a6)+,ol_map_top.w				; Set map top and bottom boundaries
	rts
	

; ------------------------------------------------------------------------------
; Scroll map
; ------------------------------------------------------------------------------

ol_ScrollMap:
	moveq	#0,d0						; Set horizontal scroll
	move.w	ol_camera_x.w,d0
	neg.w	d0
	swap	d0
	move.l	d0,ol_scroll_x.w

	moveq	#0,d0						; Set vertical scroll
	move.w	ol_camera_y.w,d0
	neg.w	d0
	swap	d0
	move.l	d0,ol_scroll_y.w
	rts

; ------------------------------------------------------------------------------
; Draw buffered map row
; ------------------------------------------------------------------------------

ol_DrawMapRow:
	lea	ol_map_row_1,a0					; Row data (top)

	move.l	(a0),d0						; Get VDP command
	beq.s	.End						; If it's not set, branch
	clr.l	(a0)+						; Mark row as drawn
	
	lea	ol_map_row_2,a1					; Row data (bottom)
	lea	vdp_control_port,a2				; VDP control port
	lea	vdp_data_port,a3				; VDP data port

	move.w	(a0)+,d1					; Get number of blocks in first set
	move.w	d1,d2
	moveq	#(512/16)-2,d3					; Get number of blocks in second set
	sub.w	d1,d3

	move.l	d0,(a2)						; Set top VDP command (set 1)

.DrawTop1:
	move.l	(a0)+,(a3)					; Draw top tiles (set 1)
	dbf	d1,.DrawTop1					; Loop until finished

	move.l	d0,d1						; Set bottom VDP command (set 1)
	addi.l	#$800000,d1
	move.l	d1,(a2)

.DrawBottom1:
	move.l	(a1)+,(a3)					; Draw bottom tiles (set 1)
	dbf	d2,.DrawBottom1					; Loop until finished

	tst.w	d3						; Are there any other tiles to draw?
	bmi.s	.End						; If not, branch
	move.w	d3,d4						; Copy number of tiles left to draw

	move.l	#$FF80FFFF,d2					; Set top VDP command (set 2)
	and.l	d2,d0
	move.l	d0,(a2)

.DrawTop2:
	move.l	(a0)+,(a3)					; Draw top tiles (set 2)
	dbf	d3,.DrawTop2					; Loop until finished

	and.l	d2,d1						; Set bottom VDP command (set 2)
	move.l	d1,(a2)

.DrawBottom2:
	move.l	(a1)+,(a3)					; Draw bottom tiles (set 2)
	dbf	d4,.DrawBottom2					; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------
; Draw buffered map column
; ------------------------------------------------------------------------------

ol_DrawMapColumn:
	lea	ol_map_column_1,a0				; Column data (left)

	move.l	(a0),d0						; Get VDP command
	beq.s	.End						; If it's not set, branch
	clr.l	(a0)+						; Mark column as drawn
	
	lea	ol_map_column_2,a1				; Column data (right)
	lea	vdp_control_port,a2				; VDP control port
	lea	vdp_data_port,a3				; VDP data port

	move.w	#$8F80,(a2)					; Draw downwards

	move.w	(a0)+,d1					; Get number of blocks in first set
	move.w	d1,d2
	moveq	#(256/16)-2,d3					; Get number of blocks in second set
	sub.w	d1,d3

	move.l	d0,(a2)						; Set left VDP command (set 1)

.DrawLeft1:
	move.l	(a0)+,(a3)					; Draw left tiles (set 1)
	dbf	d1,.DrawLeft1					; Loop until finished

	move.l	d0,d1						; Set right VDP command (set 1)
	addi.l	#$20000,d1
	move.l	d1,(a2)

.DrawRight1:
	move.l	(a1)+,(a3)					; Draw right tiles (set 1)
	dbf	d2,.DrawRight1					; Loop until finished

	tst.w	d3						; Are there any other tiles to draw?
	bmi.s	.Finished					; If not, branch
	move.w	d3,d4						; Copy number of tiles left to draw

	move.l	#$F07FFFFF,d2					; Set left VDP command (set 2)
	and.l	d2,d0
	move.l	d0,(a2)

.DrawLeft2:
	move.l	(a0)+,(a3)					; Draw left tiles (set 2)
	dbf	d3,.DrawLeft2					; Loop until finished

	and.l	d2,d1						; Set right VDP command (set 2)
	move.l	d1,(a2)

.DrawRight2:
	move.l	(a1)+,(a3)					; Draw right tiles (set 2)
	dbf	d4,.DrawRight2					; Loop until finished

.Finished:
	move.w	#$8F02,(a2)					; Restore VDP auto increment

.End:
	rts

; ------------------------------------------------------------------------------
; Redraw map
; ------------------------------------------------------------------------------

ol_RedrawMap:
	move.w	sr,-(sp)					; Save status register
	disable_ints						; Disable interrupts

	moveq	#0,d0						; Y offset
	moveq	#(256/16)-1,d1					; Number of rows to draw

.DrawLoop:
	movem.w	d0-d1,-(sp)					; Draw row
	bsr.w	ol_BufferMapRow
	bsr.w	ol_DrawMapRow
	movem.w	(sp)+,d0-d1

	addi.w	#$10,d0						; Next row
	dbf	d1,.DrawLoop					; Loop until finished

	move.w	(sp)+,sr					; Restore status register
	rts

; ------------------------------------------------------------------------------
; Buffer map row for drawing
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d0.w - Y offset
; ------------------------------------------------------------------------------

ol_BufferMapRow:
	movea.l	ol_map_chunks,a2				; Map chunks
	movea.l	ol_map_blocks,a3				; Map blocks
	lea	ol_map_row_1,a4					; Row buffer 1
	lea	ol_map_row_2,a5					; Row buffer 2

	move.w	ol_camera_x.w,d2				; Get draw X position
	andi.w	#~$F,d2

	move.w	ol_camera_y.w,d3				; Get draw Y position
	andi.w	#~$F,d3
	add.w	d0,d3

	move.w	d3,d0						; Calculate VDP command
	andi.w	#$F0,d0
	lsl.w	#4,d0
	move.w	d2,d1
	andi.w	#$1F0,d1
	lsr.w	#2,d1
	add.w	d1,d0
	ori.w	#$4000,d0
	move.w	d0,(a4)+
	move.w	#3,(a4)+

	lsr.w	#2,d1						; Get number of blocks in first set
	subi.w	#(512/16)-1,d1
	neg.w	d1
	move.w	d1,(a4)+

	movea.l	ol_map_foreground.w,a0				; Get first chunk in chunk row
	move.w	d3,d1
	andi.w	#~$1F,d1
	asr.w	#4,d1
	adda.w	(a0,d1.w),a0
	move.w	d2,d0
	andi.w	#~$1F,d0
	asr.w	#4,d0
	adda.w	d0,a0

	move.w	d2,d0						; Get initial block offsets
	andi.w	#$10,d0
	lsr.w	#3,d0
	move.w	d3,d1
	andi.w	#$10,d1
	lsr.w	#2,d1

	moveq	#(512/16)-1,d6					; Number of blocks to buffer

.ChunkLoop:
	move.w	(a0)+,d2					; Get chunk
	lsl.w	#3,d2
	lea	(a2,d2.w),a1
	adda.w	d1,a1

.BlockLoop:
	move.w	(a1,d0.w),d2					; Get block

	move.w	d2,d3						; Get tiles to buffer
	andi.w	#$3FF,d3
	lsl.w	#3,d3
	move.l	(a3,d3.w),d4
	move.l	4(a3,d3.w),d5

	btst	#10,d2						; Is the block horizontally flipped?
	beq.s	.CheckYFlip					; If not, branch
	swap	d4						; Swap tiles
	swap	d5
	eori.l	#$8000800,d4					; Swap X flip flags
	eori.l	#$8000800,d5

.CheckYFlip:
	btst	#11,d2						; Is the block vertically flipped?
	beq.s	.BufferTiles					; If not, branch
	exg.l	d4,d5						; Swap tiles
	eori.l	#$10001000,d4					; Swap Y flip flags
	eori.l	#$10001000,d5

.BufferTiles:
	move.l	d4,(a4)+					; Buffer tiles
	move.l	d5,(a5)+

	addq.w	#2,d0						; Next block in chunk
	andi.w	#2,d0						; Should we go to the next chunk?
	beq.s	.NextChunk					; If so, branch

	dbf	d6,.BlockLoop					; Loop until finished
	rts

.NextChunk:
	dbf	d6,.ChunkLoop					; Loop until finished
	rts

; ------------------------------------------------------------------------------
; Buffer map column for drawing
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d0.w - X offset
; ------------------------------------------------------------------------------

ol_BufferMapColumn:
	movea.l	ol_map_chunks,a3				; Map chunks
	movea.l	ol_map_blocks,a4				; Map blocks
	lea	ol_map_column_1,a5				; Column buffer 1
	lea	ol_map_column_2,a6				; Column buffer 2

	move.w	ol_camera_x.w,d2				; Get draw X position
	andi.w	#~$F,d2
	add.w	d0,d2

	move.w	ol_camera_y.w,d3				; Get draw Y position
	andi.w	#~$F,d3

	move.w	d2,d0						; Calculate VDP command
	andi.w	#$1F0,d0
	lsr.w	#2,d0
	move.w	d3,d1
	andi.w	#$F0,d1
	lsl.w	#4,d1
	add.w	d1,d0
	ori.w	#$4000,d0
	move.w	d0,(a5)+
	move.w	#3,(a5)+

	move.w	d3,d1						; Get number of blocks in first set
	andi.w	#$F0,d1
	lsr.w	#4,d1
	subi.w	#(256/16)-1,d1
	neg.w	d1
	move.w	d1,(a5)+

	move.w	d2,d0						; Get chunk row offset
	andi.w	#~$1F,d0
	asr.w	#4,d0

	movea.l	ol_map_foreground.w,a0				; Get first chunk row
	movea.l	a0,a1
	move.w	d3,d1
	andi.w	#~$1F,d1
	asr.w	#4,d1
	adda.w	d1,a0

	move.w	d2,d1						; Get initial block offsets
	andi.w	#$10,d1
	lsr.w	#3,d1
	move.w	d3,d2
	andi.w	#$10,d2
	lsr.w	#2,d2

	moveq	#(256/16)-1,d7					; Number of blocks to buffer

.ChunkLoop:
	move.w	(a0)+,d3					; Get chunk
	add.w	d0,d3
	move.w	(a1,d3.w),d3
	lsl.w	#3,d3
	lea	(a3,d3.w),a2
	adda.w	d1,a2

.BlockLoop:
	move.w	(a2,d2.w),d3					; Get block

	move.w	d3,d4						; Get tiles to buffer
	andi.w	#$3FF,d4
	lsl.w	#3,d4
	move.w	(a4,d4.w),d5
	swap	d5
	move.w	4(a4,d4.w),d5
	move.w	2(a4,d4.w),d6
	swap	d6
	move.w	6(a4,d4.w),d6

	btst	#10,d3						; Is the block horizontally flipped?
	beq.s	.CheckYFlip					; If not, branch
	exg.l	d5,d6						; Swap tiles
	eori.l	#$8000800,d5					; Swap X flip flags
	eori.l	#$8000800,d6

.CheckYFlip:
	btst	#11,d3						; Is the block vertically flipped?
	beq.s	.BufferTiles					; If not, branch
	swap	d5						; Swap tiles
	swap	d6
	eori.l	#$10001000,d5					; Swap Y flip flags
	eori.l	#$10001000,d6

.BufferTiles:
	move.l	d5,(a5)+					; Buffer tiles
	move.l	d6,(a6)+

	addq.w	#4,d2						; Next block in chunk
	andi.w	#4,d2						; Should we go to the next chunk?
	beq.s	.NextChunk					; If so, branch

	dbf	d7,.BlockLoop					; Loop until finished
	rts

.NextChunk:
	dbf	d7,.ChunkLoop					; Loop until finished
	rts

; ------------------------------------------------------------------------------