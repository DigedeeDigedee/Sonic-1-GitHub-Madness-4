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