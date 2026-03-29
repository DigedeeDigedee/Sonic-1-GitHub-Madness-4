; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; NPC objects
; ------------------------------------------------------------------------------

ol_NpcObject:
	move.l	#ol_NpcUpdate,ol_obj_update(a0)			; Set update state
	move.l	#ol_NpcDraw,ol_obj_draw(a0)			; Set draw function

	bsr.w	ol_AlignObjectGrid				; Align to grid

; ------------------------------------------------------------------------------
; Update state
; ------------------------------------------------------------------------------

ol_NpcUpdate:
	bsr.w	ol_SolidObject					; Mark as solid

	bsr.w	ol_CheckInteractObject				; Are we being interacted with?
	beq.s	.NoInteract					; If not, branch

	lea	.TestScript(pc),a1				; Start test script
	bsr.w	ol_StartScript

.NoInteract:
	bra.w	ol_DrawObject					; Draw sprite

; ------------------------------------------------------------------------------

.TestScript:
	ol_scriptShowIcon ol_PlayerIcon, 0
	ol_scriptShowTextbox

	ol_scriptText
	dc.b	"Hello world!", -1
	ol_scriptTextEnd
	
	ol_scriptWaitUser

	ol_scriptText
	dc.b	-1
	dc.b	"I GOT BLISTERS ON MY FINGERS!!"
	ol_scriptTextEnd

	ol_scriptWaitUser
	ol_scriptClearTextbox

	ol_scriptText
	dc.b	"Yak yak yak yak yak yak.", -1
	dc.b	-1
	dc.b	"I wonder what lead tastes", -1
	dc.b	"like... ^_^"
	ol_scriptTextEnd

	ol_scriptWaitUser

	ol_scriptEnd

; ------------------------------------------------------------------------------
; Draw function
; ------------------------------------------------------------------------------

ol_NpcDraw:
	lea	ol_PlayerSprites,a1				; Draw sprite
	move.w	ol_obj_x(a0),d0
	sub.w	ol_camera_x.w,d0
	move.w	ol_obj_y(a0),d1
	sub.w	ol_camera_y.w,d1
	moveq	#0,d2
	moveq	#1,d3
	moveq	#0,d4
	bra.w	ol_DrawSprite

; ------------------------------------------------------------------------------