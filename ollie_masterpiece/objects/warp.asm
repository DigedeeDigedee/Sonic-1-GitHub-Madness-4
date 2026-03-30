; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Warp object
; ------------------------------------------------------------------------------

ol_WarpObject:
	move.l	#ol_WarpUpdate,ol_obj_update(a0)		; Set update state
	bsr.w	ol_AlignObjectGrid				; Align to grid

; ------------------------------------------------------------------------------
; Update state
; ------------------------------------------------------------------------------

ol_WarpUpdate:
	lea	ol_player_object.w,a1				; Has the player collided with us?
	move.w	ol_obj_x(a1),d0
	cmp.w	ol_obj_x(a0),d0
	bne.s	.End						; If not, branch
	move.w	ol_obj_y(a1),d0
	cmp.w	ol_obj_y(a0),d0
	bne.s	.End						; If not, branch

	move.b	ol_obj_subtype(a0),ol_map_next_id.w		; Set next map ID
	move.b	ol_obj_subtype_2(a0),ol_map_entry_id.w		; Set map entry ID
	move.b	ol_obj_flags(a1),d0				; Set map spawn direction
	andi.b	#ol_OBJECT_DIRECTION,d0
	move.b	d0,ol_map_spawn_direction.w

.End:
	rts

; ------------------------------------------------------------------------------