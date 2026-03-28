; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Update objects
; ------------------------------------------------------------------------------

ol_UpdateObjects:
	lea	ol_objects.w,a0					; Object pool
	moveq	#ol_OBJECT_COUNT-1,d7				; Object count

.UpdateLoop:
	move.l	ol_obj_update(a0),d0				; Get update function
	beq.s	.NextObject					; If it's not set, branch

	move.l	d7,-(sp)					; Run update function
	movea.l	d0,a1
	jsr	(a1)
	move.l	(sp)+,d7

.NextObject:
	adda.w	#ol_obj_struct_size,a0				; Next object
	dbf	d7,.UpdateLoop					; Loop until finished
	rts

; ------------------------------------------------------------------------------
; Draw objects
; ------------------------------------------------------------------------------

ol_DrawObjects:
	lea	ol_object_draw.w,a1				; Object draw queue
	moveq	#8-1,d7						; Number of layers

.LayerLoop:
	tst.w	(a1)						; Is this layer's queue empty?
	beq.s	.NextLayer					; If so, branch
	lea	2(a1),a2					; Get this layer's queue

.ObjectLoop:
	movea.w	(a2)+,a0					; Get object to draw

	tst.l	ol_obj_update(a0)				; Was this object deleted?
	beq.s	.NextObject					; If so, branch
	
	move.l	ol_obj_draw(a0),d0				; Get draw function
	beq.s	.NextObject					; If it's not set, branch

	movem.l	d7/a1-a2,-(sp)					; Run draw function
	movea.l	d0,a1
	jsr	(a1)
	movem.l	(sp)+,d7/a1-a2

.NextObject:
	subq.w	#2,(a1)						; Decrement object count
	bne.s	.ObjectLoop					; If there's still more objects to draw, loop

.NextLayer:
	adda.w	#$80,a1						; Next layer
	cmpa.w	#ol_object_draw_end,a1				; Are we at the end?
	bcs.s	.LayerLoop					; If not, loop
	rts

; ------------------------------------------------------------------------------
; Draw object
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l - Object slot address
; ------------------------------------------------------------------------------

ol_DrawObject:
	move.w	ol_obj_layer(a0),d0				; Get object layer's queue
	lsr.w	#1,d0
	andi.w	#$380,d0
	lea	ol_object_draw.w,a1
	adda.w	d0,a1

	cmpi.w	#$7E,(a1)					; Is this layer's queue full?
	bcc.s	.End						; If so, branch

	addq.w	#2,(a1)						; Increment objects queued
	adda.w	(a1),a1						; Add object to queue
	move.w	a0,(a1)

.End:
	rts

; ------------------------------------------------------------------------------
; Do grid movement left
; ------------------------------------------------------------------------------
; RETURNS:
;	eq/ne - Cannot move/Can move
; ------------------------------------------------------------------------------

ol_MoveObjectGridLeft:
	bsr.s	ol_AlignObjectGrid				; Align to grid

	move.w	ol_obj_target_x(a0),d0				; Is there a solid block in the way?
	subi.w	#$10,d0
	move.w	ol_obj_target_y(a0),d1
	bsr.w	ol_CheckBlockSolid
	bne.s	.End						; If so, branch

	subi.w	#$10,ol_obj_target_x(a0)			; Set target position left
	andi.w	#~4,sr						; Can move

.End:
	rts

; ------------------------------------------------------------------------------
; Do grid movement right
; ------------------------------------------------------------------------------
; RETURNS:
;	eq/ne - Cannot move/Can move
; ------------------------------------------------------------------------------

ol_MoveObjectGridRight:
	bsr.s	ol_AlignObjectGrid				; Align to grid

	move.w	ol_obj_target_x(a0),d0				; Is there a solid block in the way?
	addi.w	#$10,d0
	move.w	ol_obj_target_y(a0),d1
	bsr.w	ol_CheckBlockSolid
	bne.s	.End						; If so, branch

	addi.w	#$10,ol_obj_target_x(a0)			; Set target position right
	andi.w	#~4,sr						; Can move
	
.End:
	rts

; ------------------------------------------------------------------------------
; Do grid movement up
; ------------------------------------------------------------------------------
; RETURNS:
;	eq/ne - Cannot move/Can move
; ------------------------------------------------------------------------------

ol_MoveObjectGridUp:
	bsr.s	ol_AlignObjectGrid				; Align to grid

	move.w	ol_obj_target_x(a0),d0				; Is there a solid block in the way?
	move.w	ol_obj_target_y(a0),d1
	subi.w	#$10,d1
	bsr.w	ol_CheckBlockSolid
	bne.s	.End						; If so, branch

	subi.w	#$10,ol_obj_target_y(a0)			; Set target position up
	andi.w	#~4,sr						; Can move

.End:
	rts

; ------------------------------------------------------------------------------
; Do grid movement down
; ------------------------------------------------------------------------------
; RETURNS:
;	eq/ne - Cannot move/Can move
; ------------------------------------------------------------------------------

ol_MoveObjectGridDown:
	bsr.s	ol_AlignObjectGrid				; Align to grid

	move.w	ol_obj_target_x(a0),d0				; Is there a solid block in the way?
	move.w	ol_obj_target_y(a0),d1
	addi.w	#$10,d1
	bsr.w	ol_CheckBlockSolid
	bne.s	.End						; If so, branch

	addi.w	#$10,ol_obj_target_y(a0)			; Set target position down
	andi.w	#~4,sr						; Can move

.End:
	rts

; ------------------------------------------------------------------------------
; Align object for grid movement
; ------------------------------------------------------------------------------

ol_AlignObjectGrid:
	move.w	ol_obj_x(a0),d0					; Reset X position
	andi.w	#~$F,d0
	addq.w	#8,d0
	move.w	d0,ol_obj_x(a0)
	move.w	d0,ol_obj_target_x(a0)

	move.w	ol_obj_y(a0),d0					; Reset Y position
	andi.w	#~$F,d0
	addq.w	#8,d0
	move.w	d0,ol_obj_y(a0)
	move.w	d0,ol_obj_target_y(a0)
	rts

; ------------------------------------------------------------------------------
; Move object towards its target position
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l  - Object slot address
; RETURNS:
;	eq/ne - Target reached/Target not reached
; ------------------------------------------------------------------------------

ol_MoveObjectGrid:
	move.w	ol_obj_grid_speed(a0),d0			; Get speed
	ext.l	d0
	lsl.l	#8,d0
	
	move.w	ol_obj_target_x(a0),d1				; Should we move horizontally?
	cmp.w	ol_obj_x(a0),d1
	beq.s	.CheckY						; If not, branch
	bgt.s	.MoveRight					; If we should move right, branch

.MoveLeft:
	sub.l	d0,ol_obj_x(a0)					; Move left
	cmp.w	ol_obj_x(a0),d1					; Did we pass by the target position?
	ble.s	.End						; If not, branch
	move.w	d1,ol_obj_x(a0)					; If so, relocate to target position
	ori.w	#4,sr						; Target reached
	rts

.MoveRight:
	add.l	d0,ol_obj_x(a0)					; Move right
	cmp.w	ol_obj_x(a0),d1					; Check if target has been reached
	bge.s	.End						; If not, branch
	move.w	d1,ol_obj_x(a0)					; If so, relocate to target position
	ori.w	#4,sr						; Target reached
	rts

.CheckY:
	move.w	ol_obj_target_y(a0),d1				; Should we move vertically?
	cmp.w	ol_obj_y(a0),d1
	beq.s	.End						; If not, branch
	bgt.s	.MoveDown					; If we should move down, branch

.MoveUp:
	sub.l	d0,ol_obj_y(a0)					; Move up
	cmp.w	ol_obj_y(a0),d1					; Check if target has been reached
	ble.s	.End						; If not, branch
	move.w	d1,ol_obj_y(a0)					; If so, relocate to target position
	ori.w	#4,sr						; Target reached
	rts

.MoveDown:
	add.l	d0,ol_obj_y(a0)					; Move down
	cmp.w	ol_obj_y(a0),d1					; Check if target has been reached
	bge.s	.End						; If not, branch
	move.w	d1,ol_obj_y(a0)					; If so, relocate to target position
	ori.w	#4,sr						; Target reached

.End:
	rts

; ------------------------------------------------------------------------------