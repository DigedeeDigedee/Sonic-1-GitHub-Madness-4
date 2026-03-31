; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Initialize objects
; ------------------------------------------------------------------------------

ol_InitObjects:
	lea	ol_objects,a0					; Object pool
	moveq	#0,d0						; Zero
	move.w	#(ol_objects_end-ol_objects)/4-1,d1		; Length to clear

.ClearObjects:
	move.l	d0,(a0)+					; Clear object pool
	dbf	d1,.ClearObjects				; Loop until finished

	lea	ol_object_draw,a0				; Object draw queue
	move.w	#(ol_object_draw_end-ol_object_draw)/4-1,d1	; Length to clear

.ClearObjectDraw:
	move.l	d0,(a0)+					; Clear object draw queue
	dbf	d1,.ClearObjectDraw				; Loop until finished
	rts

; ------------------------------------------------------------------------------
; Update objects
; ------------------------------------------------------------------------------

ol_UpdateObjects:
	lea	ol_objects.w,a0					; Object pool

	move.l	ol_obj_update(a0),d0				; Get player update function
	beq.s	.SkipPlayer					; If it's not set, branch

	move.l	ol_obj_x(a0),ol_obj_prev_x(a0)			; Set player previous position
	move.l	ol_obj_y(a0),ol_obj_prev_y(a0)

	movea.l	d0,a1						; Run player update function
	jsr	(a1)
	
.SkipPlayer:
	clr.w	ol_solid_objects				; Clear solid object list

	adda.w	#ol_obj_struct_size,a0				; Go to object spawn pool
	moveq	#ol_OBJECT_SPAWN_COUNT-1,d7			; Object spawn pool slot count

.UpdateLoop:
	move.l	ol_obj_update(a0),d0				; Get update function
	beq.s	.NextObject					; If it's not set, branch
	
	move.l	ol_obj_x(a0),ol_obj_prev_x(a0)			; Set previous position
	move.l	ol_obj_y(a0),ol_obj_prev_y(a0)

	move.l	d7,-(sp)					; Update object
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

	cmpi.w	#$3F*2,(a1)					; Is this layer's queue full?
	bcc.s	.End						; If so, branch

	addq.w	#2,(a1)						; Increment objects queued
	adda.w	(a1),a1						; Add object to queue
	move.w	a0,(a1)

.End:
	rts

; ------------------------------------------------------------------------------
; Spawn object
; ------------------------------------------------------------------------------
; RETURNS:
;	a1.l  - Object slot address (if available)
;	eq/ne - Object slot found/No object slot found
; ------------------------------------------------------------------------------

ol_SpawnObject:
	lea	ol_object_spawn.w,a1				; Object spawn pool
	moveq	#ol_OBJECT_SPAWN_COUNT-1,d0			; Object spawn pool slot count

.FindSlot:
	tst.l	ol_obj_update(a1)				; Is this slot available?
	beq.s	.End						; If so, branch

	adda.w	#ol_obj_struct_size,a1				; Next object
	dbf	d0,.FindSlot					; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------
; Move object
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l - Object slot address
; ------------------------------------------------------------------------------

ol_MoveObject:
	movem.w	ol_obj_x_speed(a0),d0-d1			; Get speeds
	lsl.l	#8,d0
	lsl.l	#8,d1

	add.l	d0,ol_obj_x(a0)					; Add to position
	add.l	d1,ol_obj_y(a0)
	rts

; ------------------------------------------------------------------------------
; Check if an object is moving
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l  - Object slot address
; RETURNS:
;	eq/ne - Not moving/Moving
; ------------------------------------------------------------------------------

ol_CheckObjectMove:
	move.l	a1,-(sp)					; Save registers

	movea.w	a0,a1						; Check movement
	bsr.s	ol_CheckOtherObjectMove

	movea.l	(sp)+,a1					; Restore registers
	rts

; ------------------------------------------------------------------------------
; Check if some other object is moving
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a1.l  - Object slot address
; RETURNS:
;	eq/ne - Not moving/Moving
; ------------------------------------------------------------------------------

ol_CheckOtherObjectMove:
	movem.l	d0-d1,-(sp)					; Save registers

	move.l	ol_obj_x(a1),d0					; Get horizontal distance traveled
	sub.l	ol_obj_prev_x(a1),d0
	move.l	ol_obj_y(a1),d1					; Get vertical distance traveled
	sub.l	ol_obj_prev_y(a1),d1
	or.l	d0,d1						; Combine and check if we moved
	
	movem.l	(sp)+,d0-d1					; Restore registers
	rts

; ------------------------------------------------------------------------------
; Do grid movement left
; ------------------------------------------------------------------------------
; RETURNS:
;	eq/ne - Cannot move/Can move
; ------------------------------------------------------------------------------

ol_MoveObjectGridLeft:
	bsr.w	ol_AlignObjectGrid				; Align to grid
	
	andi.b	#~ol_OBJECT_DIRECTION,ol_obj_flags(a0)		; Set direction to left
	if ol_OBJECT_LEFT<>0
		ori.b	#ol_OBJECT_LEFT,ol_obj_flags(a0)
	endif

	move.w	ol_obj_target_x(a0),d0				; Is there a solid block in the way?
	subi.w	#$10,d0
	move.w	ol_obj_target_y(a0),d1
	bsr.w	ol_CheckSolidBlock
	bne.s	.End						; If so, branch

	bsr.w	ol_CheckSolidObject				; Is there a solid object in the way?
	bne.s	.End						; If so, branch

	move.w	d0,ol_obj_target_x(a0)				; Set target position left
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
	bsr.w	ol_AlignObjectGrid				; Align to grid

	andi.b	#~ol_OBJECT_DIRECTION,ol_obj_flags(a0)		; Set direction to right
	if ol_OBJECT_RIGHT<>0
		ori.b	#ol_OBJECT_RIGHT,ol_obj_flags(a0)
	endif

	move.w	ol_obj_target_x(a0),d0				; Is there a solid block in the way?
	addi.w	#$10,d0
	move.w	ol_obj_target_y(a0),d1
	bsr.w	ol_CheckSolidBlock
	bne.s	.End						; If so, branch

	bsr.w	ol_CheckSolidObject				; Is there a solid object in the way?
	bne.s	.End						; If so, branch

	move.w	d0,ol_obj_target_x(a0)				; Set target position right
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
	bsr.w	ol_AlignObjectGrid				; Align to grid

	andi.b	#~ol_OBJECT_DIRECTION,ol_obj_flags(a0)		; Set direction to up
	if ol_OBJECT_UP<>0
		ori.b	#ol_OBJECT_UP,ol_obj_flags(a0)
	endif

	move.w	ol_obj_target_x(a0),d0				; Is there a solid block in the way?
	move.w	ol_obj_target_y(a0),d1
	subi.w	#$10,d1
	bsr.w	ol_CheckSolidBlock
	bne.s	.End						; If so, branch

	bsr.w	ol_CheckSolidObject				; Is there a solid object in the way?
	bne.s	.End						; If so, branch

	move.w	d1,ol_obj_target_y(a0)				; Set target position up
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
	bsr.w	ol_AlignObjectGrid				; Align to grid

	andi.b	#~ol_OBJECT_DIRECTION,ol_obj_flags(a0)		; Set direction to down
	if ol_OBJECT_DOWN<>0
		ori.b	#ol_OBJECT_DOWN,ol_obj_flags(a0)
	endif

	move.w	ol_obj_target_x(a0),d0				; Is there a solid block in the way?
	move.w	ol_obj_target_y(a0),d1
	addi.w	#$10,d1
	bsr.w	ol_CheckSolidBlock
	bne.s	.End						; If so, branch

	bsr.w	ol_CheckSolidObject				; Is there a solid object in the way?
	bne.s	.End						; If so, branch

	move.w	d1,ol_obj_target_y(a0)				; Set target position down
	andi.w	#~4,sr						; Can move

.End:
	rts

; ------------------------------------------------------------------------------
; Align object for grid movement
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l - Object slot address
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
; Move object towards its target position on grid
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l  - Object slot address
; RETURNS:
;	eq/ne - Target reached/Target not reached
; ------------------------------------------------------------------------------

ol_MoveObjectGrid:
	movem.w	ol_obj_x_speed(a0),d0-d1			; Get speeds
	lsl.l	#8,d0
	lsl.l	#8,d1
	
	move.w	ol_obj_target_x(a0),d2				; Should we move horizontally?
	cmp.w	ol_obj_x(a0),d2
	beq.s	.CheckY						; If not, branch
	bgt.s	.MoveRight					; If we should move right, branch

.MoveLeft:
	sub.l	d0,ol_obj_x(a0)					; Move left
	cmp.w	ol_obj_x(a0),d2					; Did we pass by the target position?
	blt.s	.TargetNotReached				; If not, branch

	move.w	d2,ol_obj_x(a0)					; If so, relocate to target position
	bra.s	.TargetReached					; Target reached

.MoveRight:
	add.l	d0,ol_obj_x(a0)					; Move right
	cmp.w	ol_obj_x(a0),d2					; Check if target has been reached
	bgt.s	.TargetNotReached				; If not, branch
	
	move.w	d2,ol_obj_x(a0)					; If so, relocate to target position
	bra.s	.TargetReached					; Target reached

.CheckY:
	move.w	ol_obj_target_y(a0),d2				; Should we move vertically?
	cmp.w	ol_obj_y(a0),d2
	beq.s	.End						; If not, branch
	bgt.s	.MoveDown					; If we should move down, branch

.MoveUp:
	sub.l	d1,ol_obj_y(a0)					; Move up
	cmp.w	ol_obj_y(a0),d2					; Check if target has been reached
	blt.s	.TargetNotReached				; If not, branch

	move.w	d2,ol_obj_y(a0)					; If so, relocate to target position
	bra.s	.TargetReached					; Target reached

.MoveDown:
	add.l	d1,ol_obj_y(a0)					; Move down
	cmp.w	ol_obj_y(a0),d2					; Check if target has been reached
	bgt.s	.TargetNotReached				; If not, branch

	move.w	d2,ol_obj_y(a0)					; If so, relocate to target position

.TargetReached:
	ori.w	#4,sr						; Target reached
	rts

.TargetNotReached:
	andi.w	#~4,sr						; Target not reached

.End:
	rts

; ------------------------------------------------------------------------------
; Mark an object as solid
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l - Object slot address
; ------------------------------------------------------------------------------

ol_SolidObject:
	lea	ol_solid_objects,a1				; Get solid object list
	cmpi.w	#$1F*2,(a1)					; Is it full?
	bcc.s	.End						; If so, branch

	addq.w	#2,(a1)						; Add ourselves to the list
	adda.w	(a1),a1
	move.w	a0,(a1)

.End:
	rts

; ------------------------------------------------------------------------------
; Check if an object at a position is solid
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d0.w  - X position
;	d1.w  - Y position
;	a0.l  - Object slot address
; RETURNS:
;	eq/ne - No solid object found/Solid object found
; ------------------------------------------------------------------------------

ol_CheckSolidObject:
	cmpa.w	#ol_player_object,a0				; Are we the player object?
	beq.s	.IsPlayer					; If so, branch
	ori.w	#4,sr						; No solid object found
	rts

.IsPlayer:
	lea	ol_solid_objects,a2				; Get solid object list
	tst.w	(a2)						; Are there any entries in the list?
	beq.s	.End						; If not, branch

	movem.w	d0-d1,-(sp)					; Save registers

	andi.w	#~$F,d0						; Align check position to grid
	andi.w	#~$F,d1

	lea	2(a2),a3					; Get list entries

.CheckLoop:
	movea.w	(a3)+,a1					; Get object
	tst.l	ol_obj_update(a1)				; Was this object deleted?
	beq.s	.NextObject					; If so, branch

	move.w	ol_obj_x(a1),d2					; Get object's position
	move.w	ol_obj_y(a1),d3
	andi.w	#~$F,d2
	andi.w	#~$F,d3

	cmp.w	d0,d2						; Is this object at the position we are checking?
	bne.s	.NextObject					; If not, branch
	cmp.w	d1,d3
	bne.s	.NextObject					; If not, branch

	movem.w	(sp)+,d0-d1					; Restore registers
	andi.w	#~4,sr						; Solid object found
	rts

.NextObject:
	subq.w	#2,(a2)						; Decrement entry count
	bne.s	.CheckLoop					; If we aren't done, branch

	movem.w	(sp)+,d0-d1					; Restore registers

.End:
	rts

; ------------------------------------------------------------------------------
; Check if the player is interacting with an object
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a0.l  - Object slot address
; RETURNS:
;	eq/ne - No interaction/Interaction
; ------------------------------------------------------------------------------

ol_CheckInteractObject:
	tst.l	ol_script_addr.w				; Is a script active?
	bne.s	.NoInteract					; If so, branch
	btst	#6,ol_p1_ctrl_tap.w				; Has A been pressed?
	beq.s	.End						; If not, branch

	bsr.w	ol_CheckObjectMove				; Are we moving?
	bne.s	.NoInteract					; If so, branch

	lea	ol_player_object.w,a1				; Get player
	tst.l	ol_obj_update(a1)				; Was the player deleted?
	beq.s	.End						; If so, branch
	bsr.w	ol_CheckOtherObjectMove				; Is the player moving?
	bne.s	.NoInteract					; If so, branch

	moveq	#~$F,d4						; Position alignment mask

	move.w	ol_obj_x(a0),d0					; Get our position
	move.w	ol_obj_y(a0),d1
	and.w	d4,d0
	and.w	d4,d1

	move.w	ol_obj_x(a1),d2					; Get player's position
	move.w	ol_obj_y(a1),d3
	and.w	d4,d2
	and.w	d4,d3

	moveq	#0,d4						; Handle direction specific checks
	move.b	ol_obj_flags(a1),d4
	andi.b	#ol_OBJECT_DIRECTION,d4
	add.w	d4,d4
	jmp	.DirectionCheck(pc,d4.w)

.NoInteract:
	ori.w	#4,sr						; No interaction
	rts

.Interact:
	andi.w	#~4,sr						; Interaction

.End:
	rts

; ------------------------------------------------------------------------------

.DirectionCheck:
	bra.s	.CheckDown					; Down
	bra.s	.CheckUp					; Up
	bra.s	.CheckRight					; Right
	; Left falls through

; ------------------------------------------------------------------------------

.CheckLeft:
	addi.w	#$10,d0						; Is the player directly right of us?
	cmp.w	d0,d2
	bne.s	.NoInteract					; If not, branch
	
	andi.b	#~ol_OBJECT_DIRECTION,ol_obj_flags(a0)		; Set our direction to right
	if ol_OBJECT_RIGHT<>0
		ori.b	#ol_OBJECT_RIGHT,ol_obj_flags(a0)
	endif
	bra.s	.Interact					; Interaction detected

; ------------------------------------------------------------------------------

.CheckDown:
	subi.w	#$10,d1						; Is the player directly above us?
	cmp.w	d1,d3
	bne.s	.NoInteract					; If not, branch
	
	andi.b	#~ol_OBJECT_DIRECTION,ol_obj_flags(a0)		; Set our direction to up
	if ol_OBJECT_UP<>0
		ori.b	#ol_OBJECT_UP,ol_obj_flags(a0)
	endif
	bra.s	.Interact					; Interaction detected

; ------------------------------------------------------------------------------

.CheckUp:
	addi.w	#$10,d1						; Is the player directly below us?
	cmp.w	d1,d3
	bne.s	.NoInteract					; If not, branch
	
	andi.b	#~ol_OBJECT_DIRECTION,ol_obj_flags(a0)		; Set our direction to down
	if ol_OBJECT_DOWN<>0
		ori.b	#ol_OBJECT_DOWN,ol_obj_flags(a0)
	endif
	bra.s	.Interact					; Interaction detected

; ------------------------------------------------------------------------------

.CheckRight:
	subi.w	#$10,d0						; Is the player directly right of us?
	cmp.w	d0,d2
	bne.s	.NoInteract					; If not, branch
	
	andi.b	#~ol_OBJECT_DIRECTION,ol_obj_flags(a0)		; Set our direction to left
	if ol_OBJECT_LEFT<>0
		ori.b	#ol_OBJECT_LEFT,ol_obj_flags(a0)
	endif
	bra.s	.Interact					; Interaction detected

; ------------------------------------------------------------------------------