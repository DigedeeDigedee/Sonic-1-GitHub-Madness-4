; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Test object
; ------------------------------------------------------------------------------

ol_TestObject:
	move.l	#ol_TestObjectUpdate,ol_obj_update(a0)		; Set update state
	move.l	#ol_DrawTestObject,ol_obj_draw(a0)		; Set draw function

	move.w	#$180,ol_obj_grid_speed(a0)			; Set grid movement speed
	bsr.w	ol_AlignObjectGrid				; Align to grid

; ------------------------------------------------------------------------------
; Update state
; ------------------------------------------------------------------------------

ol_TestObjectUpdate:
	bsr.w	ol_MoveObjectGrid				; Do grid movement
	bne.s	.Draw						; If we are still moving, branch

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
	bra.w	ol_DrawObject					; Draw sprite

; ------------------------------------------------------------------------------
; Draw function
; ------------------------------------------------------------------------------

ol_DrawTestObject:
	lea	ol_TestSprites(pc),a1				; Draw sprite
	move.w	ol_obj_x(a0),d0
	sub.w	ol_camera_x.w,d0
	move.w	ol_obj_y(a0),d1
	sub.w	ol_camera_y.w,d1
	move.b	ol_frame_count+3.w,d2
	lsr.b	#3,d2
	andi.b	#3,d2
	moveq	#1,d3
	moveq	#0,d4
	bra.w	ol_DrawSprite

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

ol_TestSprites:
	include	"../sprites/test_sprites.asm"
	even

; ------------------------------------------------------------------------------