; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Initialize scripting
; ------------------------------------------------------------------------------

ol_InitScript:
	lea	ol_TextboxGfx,a0				; Load textbox graphics
	move.l	#ol_vramWriteCmd(ol_TEXTBOX_VRAM),ol_VDP_CTRL
	jsr	(NemDec).l

; ------------------------------------------------------------------------------
; Reset scripting
; ------------------------------------------------------------------------------

ol_ResetScript:
	moveq	#0,d0						; Zero
	move.b	d0,ol_script_flags.w				; Clear script flags
	move.l	d0,ol_script_addr.w				; Clear script address
	move.w	d0,ol_script_text_cmd.w				; Clear script text VDP command
	move.l	d0,ol_script_icon_addr.w			; Clear script icon data address
	move.l	d0,ol_script_icon_anim+ol_anim_addr.w		; Clear script icon animation script
	move.w	d0,ol_script_icon_frame.w			; Clear script icon frame ID

	move.w	#$9200,ol_VDP_CTRL				; Hide textbox
	rts

; ------------------------------------------------------------------------------
; Start script
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a1.l - Script address
; ------------------------------------------------------------------------------

ol_StartScript:
	bsr.s	ol_ResetScript					; Reset scripting
	bset	#0,ol_script_flags.w				; Force textbox redraw
	move.l	a1,ol_script_addr.w				; Set script address
	rts

; ------------------------------------------------------------------------------
; Run script
; ------------------------------------------------------------------------------

ol_RunScript:
	move.l	ol_script_addr.w,d0				; Get script address
	beq.s	.End						; If it's not set, branch

	btst	#3,ol_script_flags.w				; Is text being drawn?
	bne.s	.End						; If so, branch
	btst	#5,ol_script_flags.w				; Are we waiting for the user?
	beq.s	.NoUserWait					; If not, branch
	
	btst	#6,ol_p1_ctrl_tap.w				; Has A been pressed?
	beq.s	.End						; If not, branch
	bclr	#5,ol_script_flags.w				; Stop waiting

.NoUserWait:
	movea.l	d0,a0						; Prepare to read script

.Loop:
	move.w	(a0)+,d0					; Get command
	bmi.s	.ScriptDone					; If the script is done, branch
	add.w	d0,d0						; Run command
	add.w	d0,d0
	jsr	.Commands(pc,d0.w)
	bra.s	.Loop						; Get next command
	
.End:
	rts

.ScriptDone:
	clr.b	ol_script_flags.w				; Clear script flags
	clr.l	ol_script_addr.w				; Clear script address
	rts

; ------------------------------------------------------------------------------

.Commands:
	bra.w	ol_ScriptText					; Draw text
	bra.w	ol_ScriptWaitUser				; Wait for user
	bra.w	ol_ScriptShowTextbox				; Show textbox
	bra.w	ol_ScriptHideTextbox				; Hide textbox
	bra.w	ol_ScriptClearTextbox				; Clear textbox
	bra.w	ol_ScriptShowIcon				; Show icon
	bra.w	ol_ScriptHideIcon				; Hide icon

; ------------------------------------------------------------------------------
; Exit script
; ------------------------------------------------------------------------------

ol_ExitScript:
	move.l	a0,ol_script_addr.w				; Update script address
	rts

; ------------------------------------------------------------------------------
; Draw text
; ------------------------------------------------------------------------------

ol_ScriptText:
	bset	#3,ol_script_flags.w				; Start drawing text
	move.l	#ol_ExitScript,(sp)				; Exit script
	rts

; ------------------------------------------------------------------------------
; Wait for user
; ------------------------------------------------------------------------------

ol_ScriptWaitUser:
	bset	#5,ol_script_flags.w				; Start waiting
	move.l	#ol_ExitScript,(sp)				; Exit script
	rts

; ------------------------------------------------------------------------------
; Show textbox
; ------------------------------------------------------------------------------

ol_ScriptShowTextbox:
	bset	#2,ol_script_flags.w				; Show textbox
	rts

; ------------------------------------------------------------------------------
; Hide textbox
; ------------------------------------------------------------------------------

ol_ScriptHideTextbox:
	bclr	#2,ol_script_flags.w				; Hide textbox
	rts

; ------------------------------------------------------------------------------
; Clear textbox
; ------------------------------------------------------------------------------

ol_ScriptClearTextbox:
	bset	#0,ol_script_flags.w				; Clear textbox
	clr.w	ol_script_text_cmd.w				; Reset text VDP command offset
	rts

; ------------------------------------------------------------------------------
; Show icon
; ------------------------------------------------------------------------------

ol_ScriptShowIcon:
	move.w	(a0)+,d0					; Get icon animation ID
	move.l	(a0)+,ol_script_icon_addr.w			; Set icon data address
	beq.s	.ShowIcon					; If it's not set, branch

	movea.l	ol_script_icon_addr.w,a1			; Set icon animation
	movea.l	$C(a1),a2
	add.w	d0,d0
	adda.w	(a2,d0.w),a2
	lea	ol_script_icon_anim.w,a1
	bsr.w	ol_SetAnimation

.ShowIcon:
	bset	#1,ol_script_flags.w				; Make space for icon
	bra.s	ol_ScriptClearTextbox				; Clear textbox

; ------------------------------------------------------------------------------
; Hide icon
; ------------------------------------------------------------------------------

ol_ScriptHideIcon:
	clr.l	ol_script_icon_addr.w				; Clear icon data address
	lea	ol_script_icon_anim.w,a1			; Clear icon animation
	bsr.w	ol_ClearAnimation
	
	bclr	#1,ol_script_flags.w				; Don't make space for icon
	bra.s	ol_ScriptClearTextbox				; Clear textbox

; ------------------------------------------------------------------------------
; Update graphics related to scripting
; ------------------------------------------------------------------------------

ol_UpdateScriptGfx:
	bclr	#0,ol_script_flags.w				; Should we redraw the textbox?
	beq.s	.NoTextboxRedraw				; If not, branch
	
	lea	ol_TextboxMapNoIcon,a1				; Textbox with no icon
	btst	#1,ol_script_flags.w				; Should there be space for an icon?
	beq.s	.DrawTextbox					; If not, branch
	lea	ol_TextboxMapIcon,a1				; Textbox with icon

.DrawTextbox:
	move.l	#ol_vramWriteCmd(ol_WINDOW_VRAM+$A00)|$8000,d0	; Draw textbox
	moveq	#$28,d1
	moveq	#8,d2
	move.w	#ol_TEXTBOX_VRAM/$20,d3
	bsr.w	ol_DrawTilemap

.NoTextboxRedraw:
	move.w	#$9200,d0					; Hide textbox
	btst	#2,ol_script_flags.w				; Should we show the textbox?
	beq.s	.SetTextboxVisible				; If not, branch
	move.w	#$9294,d0					; If so, show textbox

.SetTextboxVisible:
	move.w	d0,ol_VDP_CTRL					; Set textbox visibility

	btst	#3,ol_script_flags.w				; Is text being drawn?
	beq.s	.End						; If not, branch
	movea.l	ol_script_addr.w,a0				; Get text from script

.TextLoop:
	moveq	#0,d0						; Get character
	move.b	(a0)+,d0
	beq.s	.TextDone					; If it's a terminator, branch
	bmi.s	.NewTextLine					; If it's a new line, branch

	move.w	#ol_vramWriteCmd(ol_WINDOW_VRAM+$A82)>>16,d1	; Get VDP command
	add.w	ol_script_text_cmd.w,d1
	btst	#1,ol_script_flags.w				; Is there space for an icon?
	beq.s	.SetTextVdpCommand				; If not, branch
	addi.w	#$10,d1						; If so, offset text further to the right
	
.SetTextVdpCommand:
	move.w	d1,ol_VDP_CTRL					; Set VDP command
	move.w	#ol_vramWriteCmd(ol_WINDOW_VRAM)&$FFFF,ol_VDP_CTRL
	addq.w	#2,ol_script_text_cmd.w				; Advance VDP command

	addi.w	#(ol_TEXTBOX_VRAM/$20)-$20,d0			; Draw character
	move.w	d0,ol_VDP_DATA
	
	move.l	a0,ol_script_addr.w				; Update script address
	rts

.NewTextLine:
	move.w	ol_script_text_cmd.w,d0				; Advance VDP command to next line
	andi.w	#~$7F,d0
	addi.w	#$80,d0
	move.w	d0,ol_script_text_cmd.w
	bra.s	.TextLoop					; Continue drawing text

.TextDone:
	move.w	a0,d0						; Even align script address
	andi.w	#1,d0
	adda.w	d0,a0

	move.l	a0,ol_script_addr.w				; Update script address
	bclr	#3,ol_script_flags.w				; Clear text draw flag

.End:
	rts

; ------------------------------------------------------------------------------
; Draw textbox icon
; ------------------------------------------------------------------------------

ol_DrawTextboxIcon:
	btst	#1,ol_script_flags.w				; Is there space for an icon?
	beq.s	.End						; If not, branch
	
	move.l	ol_script_icon_addr.w,d0			; Get icon data
	beq.s	.End						; If it's not set, branch
	movea.l	d0,a0						; Prepare to read icon data

	lea	ol_script_icon_anim.w,a1			; Update icon animation
	bsr.w	ol_UpdateAnimation

	movea.l	8(a0),a1					; Draw icon sprite
	moveq	#34,d0
	move.w	#192,d1
	moveq	#0,d2
	move.w	#(ol_TEXTBOX_VRAM/$20)+$69,d3
	move.b	ol_script_icon_anim+ol_anim_frame.w,d4
	bsr.w	ol_DrawSprite

	movea.l	(a0),a1						; Load icon graphics
	movea.l	4(a0),a2
	move.b	ol_script_icon_anim+ol_anim_frame.w,d0
	cmp.b	ol_script_icon_anim+ol_anim_prev_frame.w,d0
	beq.s	.End
	move.w	#ol_TEXTBOX_VRAM+($69*$20),d1
	bra.w	ol_LoadSpriteGfx

.End:
	rts

; ------------------------------------------------------------------------------