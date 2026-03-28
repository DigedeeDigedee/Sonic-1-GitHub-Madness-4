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