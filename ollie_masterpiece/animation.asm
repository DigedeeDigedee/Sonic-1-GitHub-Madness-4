; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Set animation
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a1.l - Animation structure address
;	a2.l - Animation data address
; ------------------------------------------------------------------------------

ol_SetAnimation:
	move.l	a2,ol_anim_addr(a1)				; Set animation script address
	move.w	(a2)+,ol_anim_speed(a1)				; Set animation speed
	move.b	(a2)+,ol_anim_end(a1)				; Set animation script end index
	clr.l	ol_anim_index(a1)				; Reset animation script index and frame ID
	rts

; ------------------------------------------------------------------------------
; Clear animation
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a1.l - Animation structure address
; ------------------------------------------------------------------------------

ol_ClearAnimation:
	clr.l	ol_anim_addr(a1)				; Clear animation script address
	rts

; ------------------------------------------------------------------------------
; Update animation
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a1.l - Animation structure address
; ------------------------------------------------------------------------------

ol_UpdateAnimation:
	move.l	ol_anim_addr(a1),d0				; Get animation script
	beq.s	.End						; If it's not set, branch
	movea.l	d0,a2						; Prepare to read animation script

	moveq	#0,d0						; Get animation frame ID
	move.b	ol_anim_index(a1),d0
	add.w	d0,d0
	move.w	4(a2,d0.w),ol_anim_frame(a1)

	move.w	ol_anim_speed(a1),d0				; Advance animation
	add.w	d0,ol_anim_index(a1)

	move.b	ol_anim_index(a1),d0				; Are we at the end of the animation?
	cmp.b	ol_anim_end(a1),d0
	bcs.s	.End						; If not, branch

	move.w	3(a2),d0					; Handle animation flag
	jmp	.HandleFlag(pc,d0.w)

.End:
	rts

; ------------------------------------------------------------------------------

.HandleFlag:
	bra.s	.RestartAnim					; Restart animation
	bra.s	.StopAnim					; Stop animation

; ------------------------------------------------------------------------------

.RestartAnim:
	clr.w	ol_anim_index(a1)				; Restart animation
	move.w	4(a2),ol_anim_frame(a1)				; Get first animation frame ID
	rts

; ------------------------------------------------------------------------------

.StopAnim:
	moveq	#0,d0						; Go to end of animation script
	move.b	ol_anim_end(a1),d0
	subq.b	#1,d0
	move.b	d0,ol_anim_index(a1)
	clr.b	ol_anim_index+1(a1)
	
	add.w	d0,d0						; Get last animation frame ID
	move.w	4(a2,d0.w),ol_anim_frame(a1)
	rts

; ------------------------------------------------------------------------------