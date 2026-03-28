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
	jsr	NemDec.w

; ------------------------------------------------------------------------------
; Reset scripting
; ------------------------------------------------------------------------------

ol_ResetScript:
	moveq	#0,d0						; Zero
	move.l	d0,ol_script_address.w				; Clear script address
	move.b	d0,ol_script_flags.w				; Clear script flags
	move.w	d0,ol_script_text_cmd.w				; Clear script text VDP command
	rts

; ------------------------------------------------------------------------------
; Start script
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a1.l - Script address
; ------------------------------------------------------------------------------

ol_StartScript:
	bsr.s	ol_ResetScript					; Reset scripting
	move.l	a1,ol_script_address.w				; Set script address
	bset	#0,ol_script_flags.w				; Force textbox redraw
	rts

; ------------------------------------------------------------------------------
; Run script
; ------------------------------------------------------------------------------

ol_RunScript:
	move.l	ol_script_address.w,d0				; Get script address
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
	clr.l	ol_script_address.w				; Clear script address
	clr.b	ol_script_flags.w				; Clear script flags
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
	move.l	a0,ol_script_address.w				; Update script address
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
	addq.w	#4,a0
	
	bset	#1,ol_script_flags.w				; Show icon
	bra.s	ol_ScriptClearTextbox				; Clear textbox

; ------------------------------------------------------------------------------
; Hide icon
; ------------------------------------------------------------------------------

ol_ScriptHideIcon:
	bclr	#1,ol_script_flags.w				; Hide icon
	bra.s	ol_ScriptClearTextbox				; Clear textbox

; ------------------------------------------------------------------------------
; Update graphics related to scripting
; ------------------------------------------------------------------------------

ol_UpdateScriptGfx:
	bclr	#0,ol_script_flags.w				; Should we redraw the textbox?
	beq.s	.NoTextboxRedraw				; If not, branch
	
	lea	ol_TextboxMapNoIcon,a1				; Textbox with no icon
	btst	#1,ol_script_flags.w				; Should we draw the icon?
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
	movea.l	ol_script_address.w,a0				; Get text from script

.TextLoop:
	moveq	#0,d0						; Get character
	move.b	(a0)+,d0
	beq.s	.TextDone					; If it's a terminator, branch
	bmi.s	.NewTextLine					; If it's a new line, branch

	move.w	#ol_vramWriteCmd(ol_WINDOW_VRAM+$A82)>>16,d1	; Get VDP command
	add.w	ol_script_text_cmd.w,d1
	btst	#1,ol_script_flags.w				; Should we draw the icon?
	beq.s	.SetTextVdpCommand				; If not, branch
	addi.w	#$10,d1						; If so, offset text further to the right
	
.SetTextVdpCommand:
	move.w	d1,ol_VDP_CTRL					; Set VDP command
	move.w	#ol_vramWriteCmd(ol_WINDOW_VRAM)&$FFFF,ol_VDP_CTRL
	addq.w	#2,ol_script_text_cmd.w				; Advance VDP command

	addi.w	#(ol_TEXTBOX_VRAM/$20)-$20,d0			; Draw character
	move.w	d0,ol_VDP_DATA
	
	move.l	a0,ol_script_address.w				; Update script address
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

	move.l	a0,ol_script_address.w				; Update script address
	bclr	#3,ol_script_flags.w				; Clear text draw flag

.End:
	rts

; ------------------------------------------------------------------------------