; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Disable H-BLANK interrupt
; ------------------------------------------------------------------------------

ol_DisableHBlank:
	move.l	#$80048ADF,ol_VDP_CTRL				; Set H-BLANK interrupt VDP settings
	move.w	#$4E73,ol_hblank_jmp.w				; Disable H-BLANK interrupt
	rts

; ------------------------------------------------------------------------------
; Initialize H-BLANK interrupt
; ------------------------------------------------------------------------------

ol_InitHBlank:
	move.l	#$80048A00,ol_VDP_CTRL				; Set H-BLANK interrupt VDP settings
	move.w	#$4E73,ol_hblank_jmp.w				; Disable H-BLANK interrupt

	lea	ol_HBlank(pc),a0				; H-BLANK routine
	lea	ol_hblank_routine,a1				; H-BLANK routine buffer
	moveq	#(ol_HBlankEnd-ol_HBlank)/2-1,d0		; Length to copy

.CopyHBlank:
	move.w	(a0)+,(a1)+					; Copy H-BLANK routine
	dbf	d0,.CopyHBlank					; Loop until finished

	lea	ol_hblank_1,a0					; H-BLANK buffers
	moveq	#0,d0						; Zero
	move.w	#(ol_hblank_2_end-ol_hblank_1)/4-1,d1		; Length to clear

.ClearBuffers:
	move.l	d0,(a0)+					; Clear H-BLANK buffers
	dbf	d1,.ClearBuffers				; Loop until finished

	move.l	#ol_hblank_1,ol_hblank_write.w			; Set H-BLANK buffer write address
	move.b	d0,ol_hblank_flags.w				; Clear H-BLANK flags
	rts

; ------------------------------------------------------------------------------
; Reset H-BLANK interrupt (call during V-BLANK)
; ------------------------------------------------------------------------------

ol_ResetHBlank:
	bclr	#0,ol_hblank_flags.w				; Should we swap H-BLANK buffers?
	beq.s	.NoHBlankSwap					; If not, branch

	lea	ol_hblank_1,a0					; Use H-BLANK buffer 1 for writing
	bchg	#1,ol_hblank_flags.w				; Swap buffers
	bne.s	.SetHBlankWrite					; If we are using buffer 1 for writing, branch
	adda.w	#ol_hblank_2-ol_hblank_1,a0			; Use H-BLANK buffer 2 for writing

.SetHBlankWrite:
	move.l	a0,ol_hblank_write.w				; Set H-BLANK buffer write address

.NoHBlankSwap:
	lea	ol_hblank_1,a0					; Use H-BLANK buffer 1 for reading
	lea	ol_HBlank1,a1					; Use H-BLANK routine 1
	btst	#1,ol_hblank_flags.w				; Should we be using buffer 2?
	bne.s	.SetVScroll					; If not, branch
	adda.w	#ol_hblank_2-ol_hblank_1,a0			; Use H-BLANK buffer 2 for reading
	adda.w	#ol_HBlank2-ol_HBlank1,a1			; Use H-BLANK routine 2

.SetVScroll:
	lea	ol_VDP_CTRL,a2					; VDP control port
	lea	ol_VDP_DATA-ol_VDP_CTRL(a2),a3			; VDP data port

	move.l	#ol_vsramWriteCmd(0),(a2)			; Set vertical scroll
	move.w	ol_vscroll.w,(a3)
	move.w	(a0)+,(a3)

	move.w	#$4EF9,ol_hblank_jmp.w				; Setup H-BLANK interrupt
	move.l	a1,ol_hblank_addr.w
	move.w	a0,$E(a1)
	move.w	#$8014,(a2)					; Enable H-BLANK interrupt
	rts

; ------------------------------------------------------------------------------
; Get H-BLANK buffer write address
; ------------------------------------------------------------------------------
; RETURNS:
;	a1.l  - H-BLANK buffer write address
;	eq/ne - Can write/Cannot write
; ------------------------------------------------------------------------------

ol_GetHBlankWrite:
	btst	#0,ol_hblank_flags.w				; Is a H-BLANK buffer swap queued?
	bne.s	.End						; If so, branch
	movea.l	ol_hblank_write.w,a1				; Get H-BLANK buffer

.End:
	rts

; ------------------------------------------------------------------------------
; Swap H-BLANK buffers
; ------------------------------------------------------------------------------

ol_SwapHBlank:
	bset	#0,ol_hblank_flags.w				; Swap H-BLANK buffers
	rts

; ------------------------------------------------------------------------------
; H-BLANK interrupt routine
; ------------------------------------------------------------------------------

ol_HBlank:
	phase ol_hblank_routine

; ------------------------------------------------------------------------------
	
ol_HBlank1:
	move.l	#ol_vsramWriteCmd(2),ol_VDP_CTRL		; Set background vertical scroll
	move.w	ol_hblank_1+2,ol_VDP_DATA

	addq.w	#2,ol_HBlank1+$E				; Advance vertical scroll buffer
	cmpi.w	#ol_hblank_1_end&$FFFF,ol_HBlank1+$E		; Are we done?
	bcs.s	.End						; If not, branch

	move.w	#$8004,ol_VDP_CTRL				; If so, disable H-BLANK interrupt
	move.w	#$4E73,ol_hblank_jmp.w

.End:
	rte

; ------------------------------------------------------------------------------

ol_HBlank2:
	move.l	#ol_vsramWriteCmd(2),ol_VDP_CTRL		; Set background vertical scroll
	move.w	ol_hblank_2+2,ol_VDP_DATA

	addq.w	#2,ol_HBlank2+$E				; Advance vertical scroll buffer
	cmpi.w	#ol_hblank_2_end&$FFFF,ol_HBlank2+$E		; Are we done?
	bcs.s	.End						; If not, branch

	move.w	#$8004,ol_VDP_CTRL				; If so, disable H-BLANK interrupt
	move.w	#$4E73,ol_hblank_jmp.w

.End:
	rte

; ------------------------------------------------------------------------------

	dephase
ol_HBlankEnd:

; ------------------------------------------------------------------------------