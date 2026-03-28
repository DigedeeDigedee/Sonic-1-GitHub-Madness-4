; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Test object
; ------------------------------------------------------------------------------

ol_TestObject:
	move.l	#ol_TestObjectUpdate,ol_obj_update(a0)		; Set update function
	move.l	#ol_DrawTestObject,ol_obj_draw(a0)		; Set draw function

; ------------------------------------------------------------------------------
; Update state
; ------------------------------------------------------------------------------

ol_TestObjectUpdate:
	move.b	ol_p1_ctrl_hold.w,d0				; Get controller data
	btst	#0,d0						; Is up being held?
	beq.s	.CheckDown					; If not, branch
	
	subq.w	#1,ol_obj_y(a0)					; Move up
	move.w	ol_map_top.w,d1					; Get top boundary
	cmp.w	ol_obj_y(a0),d1					; Has the camera gone past the top boundary?
	ble.s	.CheckDown					; If not, branch
	move.w	d1,ol_obj_y(a0)					; If so, cap at top boundary

.CheckDown:
	btst	#1,d0						; Is down being held?
	beq.s	.CheckLeft					; If not, branch
	
	addq.w	#1,ol_obj_y(a0)					; Move down
	move.w	ol_map_bottom.w,d1				; Get bottom boundary
	cmp.w	ol_obj_y(a0),d1					; Has the camera gone past the bottom boundary?
	bge.s	.CheckLeft					; If not, branch
	move.w	d1,ol_obj_y(a0)					; If so, cap at bottom boundary

.CheckLeft:
	btst	#2,d0						; Is left being held?
	beq.s	.CheckRight					; If not, branch

	subq.w	#1,ol_obj_x(a0)					; Move left
	move.w	ol_map_left.w,d1				; Get left boundary
	cmp.w	ol_obj_x(a0),d1					; Has the camera gone past the left boundary?
	ble.s	.CheckRight					; If not, branch
	move.w	d1,ol_obj_x(a0)					; If so, cap at left boundary

.CheckRight:
	btst	#3,d0						; Is right being held?
	beq.s	.Draw						; If not, branch
	
	addq.w	#1,ol_obj_x(a0)					; Move right
	move.w	ol_map_right.w,d1				; Get right boundary
	cmp.w	ol_obj_x(a0),d1					; Has the camera gone past the right boundary?
	bge.s	.Draw						; If not, branch
	move.w	d1,ol_obj_x(a0)					; If so, cap at right boundary

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