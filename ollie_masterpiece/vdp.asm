; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

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

	jsr	ClearScreen.w					; Clear screen
	bra.w	ol_InitSprites					; Initialize sprites

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