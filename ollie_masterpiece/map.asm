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
	move.l	#ol_vramWriteCmd(ol_MAP_VRAM),ol_VDP_CTRL
	jsr	NemDec

	movea.l	(a6)+,a1					; Load map palette
	moveq	#$80/2,d0
	moveq	#0,d1
	bsr.w	ol_LoadFadePalette

	move.l	(a6)+,ol_map_blocks.w				; Set map blocks address
	move.l	(a6)+,ol_map_chunks.w				; Set map chunks address
	move.l	(a6)+,d0					; Set map foreground address
	addq.l	#4,d0
	move.l	d0,ol_map_foreground.w
	move.l	(a6)+,ol_map_collision.w			; Set map collision address
	move.l	(a6)+,ol_map_objects.w				; Set map objects address
	move.l	(a6)+,ol_map_left.w				; Set map left and right boundaries
	move.l	(a6)+,ol_map_top.w				; Set map top and bottom boundaries

	moveq	#0,d0						; Set map spawn position
	move.b	ol_map_entry_id.w,d0
	add.w	d0,d0
	add.w	d0,d0
	move.l	(a6,d0.w),ol_map_spawn_x.w
	
	lea	ol_PlayerGfx,a0					; Load player graphics
	move.l	#ol_vramWriteCmd(ol_PLAYER_VRAM),ol_VDP_CTRL
	jsr	NemDec

	lea	ol_NpcGfx,a0					; Load NPC graphics
	move.l	#ol_vramWriteCmd(ol_FREE_VRAM),ol_VDP_CTRL
	jmp	NemDec

; ------------------------------------------------------------------------------
; Spawn map objects
; ------------------------------------------------------------------------------

ol_SpawnMapObjects:
	movea.l	ol_map_objects.w,a0				; Get map objects
	lea	ol_MapObjectIndex,a2				; Map object index

	move.w	(a0)+,d1					; Get number of objects
	subq.w	#1,d1
	bmi.s	.End						; If there are none, branch

.SpawnLoop:
	bsr.w	ol_SpawnObject					; Spawn object
	bne.s	.End						; If it failed, branch

	move.w	(a0)+,d0					; Set update function
	add.w	d0,d0
	add.w	d0,d0
	move.l	-4(a2,d0.w),ol_obj_update(a1)
	
	move.w	(a0)+,ol_obj_subtype(a1)			; Set subtypes

	move.w	(a0)+,ol_obj_x(a1)				; Set position
	move.w	(a0)+,ol_obj_y(a1)

	dbf	d1,.SpawnLoop					; Loop until finished

.End:
	rts
	
; ------------------------------------------------------------------------------
; Scroll map
; ------------------------------------------------------------------------------

ol_ScrollMap:
	move.w	ol_objects+ol_obj_x.w,d0			; Get camera position
	subi.w	#160,d0
	move.w	ol_objects+ol_obj_y.w,d1
	subi.w	#112,d1

	move.w	ol_map_left.w,d2				; Get left boundary
	cmp.w	d2,d0						; Has the camera gone past the left boundary?
	bge.s	.CheckRight					; If not, branch
	move.w	d2,d0						; If so, cap at left boundary

.CheckRight:
	move.w	ol_map_right.w,d2				; Get right boundary
	subi.w	#320,d2
	cmp.w	d2,d0						; Has the camera gone past the right boundary?
	ble.s	.CheckTop					; If not, branch
	move.w	d2,d0						; If so, cap at right boundary

.CheckTop:
	move.w	ol_map_top.w,d2					; Get top boundary
	cmp.w	d2,d1						; Has the camera gone past the top boundary?
	bge.s	.CheckBottom					; If not, branch
	move.w	d2,d1						; If so, cap at left boundary

.CheckBottom:
	move.w	ol_map_bottom.w,d2				; Get right boundary
	subi.w	#224,d2
	cmp.w	d2,d1						; Has the camera gone past the right boundary?
	ble.s	.SetScroll					; If not, branch
	move.w	d2,d1						; If so, cap at right boundary

.SetScroll:
	move.w	d0,ol_camera_x.w				; Set camera position
	move.w	d1,ol_camera_y.w

	moveq	#0,d2						; Set horizontal scroll
	move.w	d0,d2
	neg.w	d2
	swap	d2
	move.l	d2,ol_hscroll.w

	moveq	#0,d2						; Set vertical scroll
	move.w	d1,d2
	swap	d2
	move.l	d2,ol_vscroll.w
	rts

; ------------------------------------------------------------------------------
; Check if a block at a position is solid
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d0.w  - X position
;	d1.w  - Y position
; RETURNS:
;	eq/ne - Not solid/Solid
; ------------------------------------------------------------------------------

ol_CheckSolidBlock:
	movem.w	d0-d1,-(sp)					; Save registers

	movea.l	ol_map_foreground.w,a1				; Get chunk row
	move.w	d1,d2
	andi.w	#~$1F,d2
	asr.w	#4,d2
	adda.w	(a1,d2.w),a1
	
	move.w	d0,d2						; Get chunk
	andi.w	#~$1F,d2
	asr.w	#4,d2
	move.w	(a1,d2.w),d2

	movea.l	ol_map_chunks.w,a1				; Get chunk data
	lsl.w	#3,d2

	move.w	d0,d3						; Get block X offset
	andi.w	#$10,d3
	lsr.w	#3,d3
	add.w	d3,d2

	move.w	d1,d3						; Get block Y offset
	andi.w	#$10,d3
	lsr.w	#2,d3
	add.w	d3,d2

	move.w	(a1,d2.w),d2					; Get block
	move.w	d2,d3
	andi.w	#$3FF,d3

	movea.l	ol_map_collision.w,a1				; Is this block solid?
	tst.b	(a1,d3.w)
	beq.s	.End						; If not, branch
	andi.w	#$F000,d2					; If so, check if block's solidity is enabled

.End:
	movem.w	(sp)+,d0-d1					; Restore registers
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
	lea	ol_VDP_CTRL,a2					; VDP control port
	lea	ol_VDP_DATA-ol_VDP_CTRL(a2),a3			; VDP data port

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
	lea	ol_VDP_CTRL,a2					; VDP control port
	lea	ol_VDP_DATA-ol_VDP_CTRL(a2),a3			; VDP data port

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
	move.w	#$2700,sr					; Disable interrupts

	moveq	#0,d0						; Y offset
	moveq	#(256/16)-1,d1					; Number of rows to draw

.DrawLoop:
	movem.w	d0-d1,-(sp)					; Draw row
	bsr.w	ol_BufferMapRow
	bsr.w	ol_DrawMapRow
	movem.w	(sp)+,d0-d1

	addi.w	#$10,d0						; Next row
	dbf	d1,.DrawLoop					; Loop until finished

	move.w	ol_camera_x.w,d0				; Set previous camera position
	andi.w	#~$F,d0
	move.w	d0,ol_camera_prev_x.w
	move.w	ol_camera_y.w,d0
	andi.w	#~$F,d0
	move.w	d0,ol_camera_prev_y.w

	move.w	(sp)+,sr					; Restore status register
	rts

; ------------------------------------------------------------------------------
; Draw map
; ------------------------------------------------------------------------------

ol_DrawMap:
	move.w	ol_camera_x.w,d0				; Get camera X position
	andi.w	#~$F,d0						; Block align it
	cmp.w	ol_camera_prev_x.w,d0				; Have we moved?
	beq.s	.CheckY						; If we haven't moved, branch
	bgt.s	.Right						; If we have moved right, branch

.Left:
	move.w	d0,ol_camera_prev_x.w				; Set previous camera X position
	moveq	#0,d0						; Draw column at left side of screen
	bsr.w	ol_BufferMapColumn
	bra.s	.CheckY						; Check vertical movement

.Right:
	move.w	d0,ol_camera_prev_x.w				; Set previous camera X position
	move.w	#320,d0						; Draw column at right side of screen
	bsr.w	ol_BufferMapColumn

.CheckY:
	move.w	ol_camera_y.w,d0				; Get camera Y position
	andi.w	#~$F,d0						; Block align it
	cmp.w	ol_camera_prev_y.w,d0				; Have we moved?
	beq.s	.End						; If we haven't moved, branch
	bgt.s	.Down						; If we moved down, branch

.Up:
	move.w	d0,ol_camera_prev_y.w				; Set previous camera Y position
	moveq	#0,d0						; Draw row at top of screen
	bra.s	ol_BufferMapRow

.End:
	rts

.Down:
	move.w	d0,ol_camera_prev_y.w				; Set previous camera Y position
	move.w	#224,d0						; Draw row at bottom of screen

; ------------------------------------------------------------------------------
; Buffer map row for drawing
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d0.w - Y offset
; ------------------------------------------------------------------------------

ol_BufferMapRow:
	movea.l	ol_map_chunks.w,a2				; Map chunks
	movea.l	ol_map_blocks.w,a3				; Map blocks
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
	ori.w	#$4000|(ol_PLANE_A_VRAM&$3FFF),d0
	move.w	d0,(a4)+
	move.w	#ol_PLANE_A_VRAM/$4000,(a4)+

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
	movea.l	ol_map_chunks.w,a3				; Map chunks
	movea.l	ol_map_blocks.w,a4				; Map blocks
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
	ori.w	#$4000|(ol_PLANE_A_VRAM&$3FFF),d0
	move.w	d0,(a5)+
	move.w	#ol_PLANE_A_VRAM/$4000,(a5)+

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