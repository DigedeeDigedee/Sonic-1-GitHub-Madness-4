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
	beq.s	.End						; If it's not set, branch
	
	move.w	(a2)+,ol_anim_speed(a1)				; Set animation speed
	move.w	(a2)+,ol_anim_end(a1)				; Set animation script end index and loop point

	clr.w	ol_anim_index(a1)				; Reset animation script index
	st.b	ol_anim_frame(a1)				; Reset animation frame ID
	clr.b	ol_anim_prev_frame(a1)				; Reset previous animation frame ID

.End:
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

	move.b	ol_anim_frame(a1),ol_anim_prev_frame(a1)	; Set previous animation frame ID

	moveq	#0,d0						; Get animation frame ID
	move.b	ol_anim_index(a1),d0
	cmp.b	ol_anim_end(a1),d0				; Are we at the end of the animation?
	bcs.s	.GetFrame					; If not, branch

	move.b	ol_anim_loop(a1),d0				; Get loop point
	cmpi.b	#-1,d0						; Should we stop animating?
	beq.s	.StopAnim					; If so, branch
	
	move.b	d0,ol_anim_index(a1)				; Go to loop point

.GetFrame:
	move.b	4(a2,d0.w),ol_anim_frame(a1)			; Get animation frame ID

	move.w	ol_anim_speed(a1),d0				; Advance animation
	add.w	d0,ol_anim_index(a1)
	rts

.StopAnim:
	move.b	ol_anim_end(a1),d0				; Get last animation frame ID
	subq.b	#1,d0
	move.b	4(a2,d0.w),ol_anim_frame(a1)

.End:
	rts

; ------------------------------------------------------------------------------