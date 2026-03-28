; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

	phase ol_obj_free
ol_test_target_x:	ds.w 1					; Target X position
ol_test_target_y:	ds.w 1					; Target Y position
	dephase

; ------------------------------------------------------------------------------
; Test object
; ------------------------------------------------------------------------------

ol_TestObject:
	move.l	#ol_TestObjectIdle,ol_obj_update(a0)		; Set idle state
	move.l	#ol_DrawTestObject,ol_obj_draw(a0)		; Set draw function

	move.w	ol_obj_x(a0),d0					; Block align X position
	andi.w	#~$F,d0
	addq.w	#8,d0
	move.w	d0,ol_obj_x(a0)
	move.w	d0,ol_test_target_x(a0)

	move.w	ol_obj_y(a0),d0					; Block align Y position
	andi.w	#~$F,d0
	addq.w	#8,d0
	move.w	d0,ol_obj_y(a0)
	move.w	d0,ol_test_target_y(a0)

; ------------------------------------------------------------------------------
; Idle state
; ------------------------------------------------------------------------------

ol_TestObjectIdle:
	move.b	ol_p1_ctrl_hold.w,d0				; Get controller data
	btst	#0,d0						; Is up being held?
	beq.s	.CheckDown					; If not, branch

	move.w	ol_obj_x(a0),ol_test_target_x(a0)		; Set target position up
	move.w	ol_obj_y(a0),d1
	subi.w	#$10,d1
	move.w	d1,ol_test_target_y(a0)

.CheckDown:
	btst	#1,d0						; Is down being held?
	beq.s	.CheckLeft					; If not, branch

	move.w	ol_obj_x(a0),ol_test_target_x(a0)		; Set target position down
	move.w	ol_obj_y(a0),d1
	addi.w	#$10,d1
	move.w	d1,ol_test_target_y(a0)

.CheckLeft:
	btst	#2,d0						; Is left being held?
	beq.s	.CheckRight					; If not, branch

	move.w	ol_obj_x(a0),d1					; Set target position left
	subi.w	#$10,d1
	move.w	d1,ol_test_target_x(a0)
	move.w	ol_obj_y(a0),ol_test_target_y(a0)

.CheckRight:
	btst	#3,d0						; Is right being held?
	beq.s	.CheckSolid					; If not, branch

	move.w	ol_obj_x(a0),d1					; Set target position right
	addi.w	#$10,d1
	move.w	d1,ol_test_target_x(a0)
	move.w	ol_obj_y(a0),ol_test_target_y(a0)

.CheckSolid:
	move.w	ol_test_target_x(a0),d0				; Is there a solid block our the target position?
	move.w	ol_test_target_y(a0),d1
	bsr.w	ol_CheckBlockSolid
	bne.s	.Draw						; If so, branch
	move.l	#ol_TestObjectMove,ol_obj_update(a0)		; If not, set move state

.Draw:
	bra.w	ol_DrawObject					; Draw sprite

; ------------------------------------------------------------------------------
; Move state
; ------------------------------------------------------------------------------

ol_TestObjectMove:
	move.w	ol_test_target_x(a0),d0				; Should we move horizontally?
	cmp.w	ol_obj_x(a0),d0
	beq.s	.CheckY						; If not, branch
	bgt.s	.MoveRight					; If we should move right, branch

.MoveLeft:
	subq.w	#2,ol_obj_x(a0)					; Move left
	bra.s	.Draw						; Draw sprite

.MoveRight:
	addq.w	#2,ol_obj_x(a0)					; Move right
	bra.s	.Draw						; Draw sprite

.CheckY:
	move.w	ol_test_target_y(a0),d0				; Should we move vertically?
	cmp.w	ol_obj_y(a0),d0
	beq.s	.MoveDone					; If not, branch
	bgt.s	.MoveDown					; If we should move down, branch

.MoveUp:
	subq.w	#2,ol_obj_y(a0)					; Move up
	bra.s	.Draw						; Draw sprite

.MoveDown:
	addq.w	#2,ol_obj_y(a0)					; Move down
	bra.s	.Draw						; Draw sprite

.MoveDone:
	move.l	#ol_TestObjectIdle,ol_obj_update(a0)		; Set idle state
	bra.w	ol_TestObjectIdle

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