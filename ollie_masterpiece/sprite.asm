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
	move.w	ol_sprites,ol_sprite_slot.w			; Reset sprite slot address
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
	move.l	d0,(a0)+					; Clear unused sprite slot
	move.l	d0,(a0)+
	dbf	d1,.ClearUnused					; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------