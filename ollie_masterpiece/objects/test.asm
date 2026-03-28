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
	bpl.s	.CheckDown					; If we haven't gone out of bounds, branch
	clr.w	ol_obj_y(a0)					; If we have, prevent from going out of bounds

.CheckDown:
	btst	#1,d0						; Is down being held?
	beq.s	.CheckLeft					; If not, branch
	addq.w	#1,ol_obj_y(a0)					; Move down
	
.CheckLeft:
	btst	#2,d0						; Is left being held?
	beq.s	.CheckRight					; If not, branch
	subq.w	#1,ol_obj_x(a0)					; Move left
	bpl.s	.CheckRight					; If we haven't gone out of bounds, branch
	clr.w	ol_obj_x(a0)					; If we have, prevent from going out of bounds

.CheckRight:
	btst	#3,d0						; Is right being held?
	beq.s	.Draw						; If not, branch
	addq.w	#1,ol_obj_x(a0)					; Move right
	
.Draw:
	bra.w	ol_DrawObject					; Draw sprite

; ------------------------------------------------------------------------------
; Draw function
; ------------------------------------------------------------------------------

ol_DrawTestObject:
	rts

; ------------------------------------------------------------------------------