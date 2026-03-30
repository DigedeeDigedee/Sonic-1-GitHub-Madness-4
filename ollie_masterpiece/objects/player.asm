; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

ol_player_anim		equ ol_obj_free				; Animation

; ------------------------------------------------------------------------------
; Player object
; ------------------------------------------------------------------------------

ol_PlayerObject:
	move.l	#ol_PlayerUpdate,ol_obj_update(a0)		; Set update state
	move.l	#ol_PlayerDraw,ol_obj_draw(a0)			; Set draw function

	bsr.w	ol_AlignObjectGrid				; Align to grid

	move.w	#$180,ol_obj_x_speed(a0)			; Set speed
	move.w	#$180,ol_obj_y_speed(a0)

; ------------------------------------------------------------------------------
; Update state
; ------------------------------------------------------------------------------

ol_PlayerUpdate:
	bsr.w	ol_MoveObjectGrid				; Do grid movement
	bne.s	.Draw						; If we are still moving, branch

	tst.l	ol_script_addr.w				; Is a script active?
	bne.s	.Draw						; If so, branch

	btst	#0,ol_p1_ctrl_hold.w				; Is up being held?
	beq.s	.CheckDown					; If not, branch
	bsr.w	ol_MoveObjectGridUp				; Move up
	bra.s	.Draw						; Draw sprite

.CheckDown:
	btst	#1,ol_p1_ctrl_hold.w				; Is down being held?
	beq.s	.CheckLeft					; If not, branch
	bsr.w	ol_MoveObjectGridDown				; Move down
	bra.s	.Draw						; Draw sprite

.CheckLeft:
	btst	#2,ol_p1_ctrl_hold.w				; Is left being held?
	beq.s	.CheckRight					; If not, branch
	bsr.w	ol_MoveObjectGridLeft				; Move left
	bra.s	.Draw						; Draw sprite

.CheckRight:
	btst	#3,ol_p1_ctrl_hold.w				; Is right being held?
	beq.s	.Draw						; If not, branch
	bsr.w	ol_MoveObjectGridRight				; Move right

.Draw:
	lea	ol_player_anim(a0),a1				; Animation structure
	lea	ol_PlayerAnims,a2				; Animation scripts

	move.b	ol_obj_flags(a0),d0				; Get direction as animation ID
	andi.w	#ol_OBJECT_DIRECTION,d0
	tst.l	ol_script_addr.w				; Is a script active?
	bne.s	.SetAnimation					; If so, branch
	move.b	ol_p1_ctrl_hold.w,d1				; Is the D-pad being held?
	andi.b	#$F,d1
	beq.s	.SetAnimation					; If not, branch
	addq.w	#4,d0						; If so, use movement animation ID

.SetAnimation:
	add.w	d0,d0						; Set animation
	adda.w	(a2,d0.w),a2
	bsr.w	ol_SetAnimation

	bsr.w	ol_UpdateAnimation				; Update animation
	bra.w	ol_DrawObject					; Draw sprite

; ------------------------------------------------------------------------------
; Draw function
; ------------------------------------------------------------------------------

ol_PlayerDraw:
	lea	ol_PlayerSprites,a1				; Draw sprite
	move.w	ol_obj_x(a0),d0
	sub.w	ol_camera_x.w,d0
	move.w	ol_obj_y(a0),d1
	sub.w	ol_camera_y.w,d1
	moveq	#0,d2
	move.w	#ol_PLAYER_VRAM/$20,d3
	move.b	ol_player_anim+ol_anim_frame(a0),d4
	bra.w	ol_DrawSprite

; ------------------------------------------------------------------------------