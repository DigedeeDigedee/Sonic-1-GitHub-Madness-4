; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Initialize the VDP
; ------------------------------------------------------------------------------

ol_InitVdp:
	lea	.Registers(pc),a0				; VDP registers
	lea	ol_VDP_CTRL,a1					; VDP control port
	moveq	#(.RegistersEnd-.Registers)/2-1,d0		; Number of VDP registers

.SetRegisters:
	move.w	(a0)+,(a1)					; Set VDP register
	dbf	d0,.SetRegisters				; Loop until finished

	ol_fillVram 0,$10000,0,(a1),ol_VDP_DATA-ol_VDP_CTRL(a1)	; Clear VRAM
	move.w	#$8F02,(a1)

	bra.s	ol_ClearScreen2					; Clear screen

; ------------------------------------------------------------------------------

.Registers:
	dc.w	$8004						; Disable H-BLANK interrupt
	dc.w	$8134						; Disable display, enable V-BLANK interrupt and DMA
	dc.w	$8200+(ol_PLANE_A_VRAM>>10)			; Plane A address
	dc.w	$8300+(ol_WINDOW_VRAM>>10)			; Window plane address
	dc.w	$8400+(ol_PLANE_B_VRAM>>13)			; Plane B address
	dc.w	$8500+(ol_SPRITES_VRAM>>9)			; Sprite table address
	dc.w	$8720						; Background color
	dc.w	$8B03						; Line horizontal scroll, full vertical scroll
	dc.w	$8C81						; H40 mode
	dc.w	$8D00+(ol_HSCROLL_VRAM>>10)			; Horizontal scroll table address
	dc.w	$8F01						; Auto-increment (set for VRAM clear)
	dc.w	$9001						; 64x32 plane size
	dc.w	$9100						; Window horizontal position
	dc.w	$9200						; Window vertical position
.RegistersEnd:

; ------------------------------------------------------------------------------
; Disable display
; ------------------------------------------------------------------------------

ol_DisableDisplay:
	move.w	#$8134,ol_VDP_CTRL				; Disable display
	rts

; ------------------------------------------------------------------------------
; Enable display
; ------------------------------------------------------------------------------

ol_EnableDisplay:
	move.w	#$8174,ol_VDP_CTRL				; Enable display
	rts

; ------------------------------------------------------------------------------
; Clear screen
; ------------------------------------------------------------------------------

ol_ClearScreen:
	lea	ol_VDP_CTRL,a0					; Clear part of VRAM
	move.w	#$8F01,(a0)
	ol_fillVram $C000,$4000,0,(a0),ol_VDP_DATA-ol_VDP_CTRL(a0)
	move.w	#$8F02,(a0)
	
	move.l	#$91009200,(a0)					; Hide window plane

ol_ClearScreen2:
	lea	ol_hscroll,a0					; Horizontal scroll buffer
	moveq	#0,d0						; Zero
	move.w	#(ol_hscroll_end-ol_hscroll)/4-1,d1		; Length to clear

.ClearHScroll:
	move.l	d0,(a0)+					; Clear horizontal scroll buffer
	dbf	d1,.ClearHScroll				; Loop until finished

	move.l	d0,ol_vscroll.w					; Clear vertical scroll buffer

	bsr.w	ol_InitGfxDma					; Initialize graphics DMA queue
	bra.w	ol_InitSprites					; Initialize sprites

; ------------------------------------------------------------------------------
; Draw tilemap
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	a1.l - Tilemap address
;	d0.l - VDP command
;	d1.w - Tilemap width
;	d2.w - Tilemap height
;	d3.w - Base tile ID/flags
; ------------------------------------------------------------------------------

ol_DrawTilemap:
	subq.w	#1,d1						; Decrement width for loop
	bmi.s	.End						; If it's invalid, branch
	subq.w	#1,d2						; Decrement height for loop
	bmi.s	.End						; If it's invalid, branch

	lea	ol_VDP_CTRL,a2					; VDP control port
	lea	ol_VDP_DATA-ol_VDP_CTRL(a2),a3			; VDP data port

.RowLoop:
	move.l	d0,(a2)						; Set VDP command
	move.w	d1,d4						; Get row width

.TileLoop:
	move.w	(a1)+,d5					; Get tile
	add.w	d3,d5						; Add base tile ID/flags
	move.w	d5,(a3)						; Draw tile
	dbf	d4,.TileLoop					; Loop until finished

	addi.l	#$800000,d0					; Next row
	dbf	d2,.RowLoop					; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------
; Initialize graphics DMA queue
; ------------------------------------------------------------------------------

ol_InitGfxDma:
	jmp	InitDMAQueue					; Initialize queue

; ------------------------------------------------------------------------------
; Queue graphics data for DMA
; ------------------------------------------------------------------------------
; ARGUMENTS:
;	d1.l - Graphics data address
;	d2.w - VRAM address
;	d3.w - Graphics data length in words
; ------------------------------------------------------------------------------

ol_QueueGfxDma:
	jmp	QueueDMATransfer				; Queue graphics

; ------------------------------------------------------------------------------
; Flush graphics DMA queue
; ------------------------------------------------------------------------------

ol_FlushGfxDma:
	jmp	ProcessDMAQueue					; Flush queue

; ------------------------------------------------------------------------------