; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

	include "variables.inc"
	include "macros.inc"

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

GM_OllieMasterpiece:
	moveq	#bgm_Fade|(~$FF),d0				; Fade out sound
	jsr	QueueSound2.w
	jsr	PaletteFadeOut.w				; Fade out palette

	disable_ints						; Disable interrupts
	move.w	#opcode_jmpabslong,v_vintcode.jmp.w		; Setup V-BLANK interrupt
	move.l	#ol_VBlank,v_vintcode.addr.w
	move.w	#opcode_rte,(v_hintcode.jmp).w			; Disable H-BLANK interrupt

	bsr.w	ol_InitVdp					; Initialize VDP

	lea	v_ram_start,a0					; RAM to clear
	moveq	#0,d0						; Zero
	move.w	#(v_ngfx_buffer-v_ram_start_def)/4-1,d1	; Length to clear

.ClearRam:
	move.l	d0,(a0)+					; Clear RAM
	dbf	d1,.ClearRam					; Loop until finished

	bsr.w	ol_InitMap					; Initialize map

	move.w	#$E0,ol_camera_x.w
	move.w	#$80,ol_camera_y.w

	bsr.w	ol_ScrollMap					; Scroll map
	bsr.w	ol_RedrawMap					; Redraw map

	jsr	PaletteFadeIn.w					; Fade in palette
	bra.w	*

; ------------------------------------------------------------------------------
; Initialize the VDP
; ------------------------------------------------------------------------------

ol_InitVdp:
	lea	.Registers(pc),a0				; VDP registers
	lea	vdp_control_port,a1				; VDP control port
	moveq	#(.RegistersEnd-.Registers)/2-1,d0		; Number of VDP registers

.SetRegisters:
	move.w	(a0)+,(a1)					; Set VDP register
	dbf	d0,.SetRegisters				; Loop until finished

	jmp	ClearScreen.w					; Clear screen

; ------------------------------------------------------------------------------

.Registers:
	dc.w	$8004						; Disable H-BLANK interrupt
	dc.w	$8200+(vram_fg>>10)				; Plane A address
	dc.w	$8300+($D000>>10)				; Window plane address
	dc.w	$8400+(vram_bg>>13)				; Plane B address
	dc.w	$8500+(vram_sprites>>9)				; Sprite table address
	dc.w	$8720						; Background color
	dc.w	$8ADF						; H-BLANK interrupt frequency
	dc.w	$8B00						; Full screen scrolling
	dc.w	$8C81						; H40 mode
	dc.w	$8D00+(vram_hscroll>>10)			; Horizontal scroll table address
	dc.w	$8F02						; Auto-increment
	dc.w	$9001						; 64x32 plane size
	dc.w	$9100						; Window horizontal position
	dc.w	$9200						; Window vertical position
.RegistersEnd:

; ------------------------------------------------------------------------------
; VSync
; ------------------------------------------------------------------------------

ol_VSync:
	st.b	v_vbla_routine.w				; Set VSync flag
	enable_ints						; Enable interrupts

.Wait:
	tst.b	v_vbla_routine.w				; Has the V-BLANK interrupt run yet?
	bne.s	.Wait						; If not, branch
	rts

; ------------------------------------------------------------------------------
; V-BLANK interrupt
; ------------------------------------------------------------------------------

ol_VBlank:
	movem.l	d0-a6,-(sp)					; Save registers

	clr.b	v_vbla_routine.w				; Clear VSync flag
	addq.l	#1,v_vbla_count.w				; Increment frame count

	lea	vdp_control_port,a0				; VDP control port
	lea	vdp_data_port,a1				; VDP data port

	move.w	(a0),d0						; Clear VDP write latch

	move.l	#ol_vramWriteCmd(vram_hscroll),(a0)		; Set horizontal scroll
	move.l	ol_scroll_x.w,(a1)

	move.l	#ol_vsramWriteCmd(0),(a0)			; Set vertical scroll
	move.l	ol_scroll_y.w,(a1)

	ol_dmaCram v_palette,0,$80,(a0)				; Load palette into CRAM
	ol_dmaVram ol_sprites,vram_sprites,$280,(a0)		; Load sprites into VRAM

	bsr.w	ol_DrawMapRow					; Draw map row
	bsr.w	ol_DrawMapColumn				; Draw map column

	enable_ints						; Enable interrupts
	jsr	UpdateMusic					; Update sound driver

	movem.l	(sp)+,d0-a6					; Restore registers
	rte

; ------------------------------------------------------------------------------
; Includes
; ------------------------------------------------------------------------------

	include	"map.asm"

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

	include	"maps/maps.asm"

; ------------------------------------------------------------------------------