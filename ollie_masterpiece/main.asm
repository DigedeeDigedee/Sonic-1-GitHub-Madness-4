; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

	include "variables.inc"

; ------------------------------------------------------------------------------
; Clear buffer
; ------------------------------------------------------------------------------

ol_clearBuffer macro start, end
	if (end-start)>0
		lea	start,a0				; Start address
		moveq	#0,d0					; Zero
		if (end-start)>=4
			moveq	#(end-start)/4-1,d1		; Size in longwords

		.Clear:
			move.l	d0,(a0)+			; Clear data
			dbf	d1,.Clear			; Loop until finished
		endif
		if ((end-start)&2)<>0
			move.w	d0,(a0)+			; Clear remaining word
		endif
		if ((end-start)&1)<>0
			move.b	d0,(a0)+			; Clear remaining byte
		endif
	endif
	endm

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

GM_OllieMasterpiece:
	moveq	#bgm_Fade|(~$FF),d0				; Fade out sound
	jsr	QueueSound2
	jsr	PaletteFadeOut					; Fade palette

	disable_ints						; Disable interrupts
	jsr	ClearScreen					; Clear screen

	ol_clearBuffer ol_buffers,ol_buffers_end		; Clear buffers
	ol_clearBuffer ol_variables,ol_variables_end		; Clear variables

	illegal

; ------------------------------------------------------------------------------