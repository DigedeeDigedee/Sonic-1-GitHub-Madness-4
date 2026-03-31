; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Battle
; ------------------------------------------------------------------------------

ol_Battle:
	moveq	#bgm_Fade|(~$FF),d0				; Fade out sound
	jsr	QueueSound2

	move.w	#$2700,sr					; Setup interrupts
	move.w	#$4EF9,ol_vblank_jmp.w
	move.l	#ol_SoundVBlank,ol_vblank_addr.w
	bsr.w	ol_InitHBlank
	move.w	#$2000,sr
	
	bsr.w	ol_ClearScreen					; Clear screen

	clr.l	ol_p1_ctrl_hold.w				; Clear controller data

	lea	ol_MainPalette,a1				; Load main palette
	moveq	#$10,d0
	moveq	#0,d1
	bsr.w	ol_LoadPalette
	
	lea	ol_TestBgGfx,a0
	move.l	#ol_vramWriteCmd(0),ol_VDP_CTRL
	jsr	NemDec
	
	lea	ol_TestBgPalette,a1
	moveq	#$10,d0
	moveq	#$10,d1
	bsr.w	ol_LoadPalette
	
	lea	ol_TestBgMap,a1
	move.l	#ol_vramWriteCmd(ol_PLANE_B_VRAM),d0
	moveq	#$28,d1
	moveq	#$1C,d2
	move.w	#$2000,d3
	bsr.w	ol_DrawTilemap

	bsr.w	ol_InitObjects					; Initialize objects
	bsr.w	ol_InitScript					; Initialize scripting

	bsr.w	ol_UpdateObjects				; Update objects
	
	bsr.w	ol_StartSpriteDraw				; Start sprite drawing
	bsr.w	ol_DrawObjects					; Draw object sprites
	bsr.w	ol_EndSpriteDraw				; End sprite drawing

	clr.w	ol_hblank_test.w
	bsr.w	ol_TestHBlankEffect
	
	move.w	#$2700,sr					; Set V-BLANK interrupt routine
	move.l	#ol_BattleVBlank,ol_vblank_addr.w
	move.w	#$2000,sr
	
	move.w	#$8174,ol_VDP_CTRL				; Enable display
	bsr.w	ol_FadePaletteIn				; Fade palette in

	lea	.TestScript(pc),a1				; Start test script
	bsr.w	ol_StartScript

; ------------------------------------------------------------------------------

.Loop:
	bsr.w	ol_UpdateCram					; Update CRAM
	bsr.w	ol_VSync					; VSync

	bsr.w	ol_UpdateObjects				; Update objects

	bsr.w	ol_RunScript					; Run script

	bsr.w	ol_StartSpriteDraw				; Start sprite drawing
	bsr.w	ol_DrawTextboxIcon				; Draw textbox icon
	bsr.w	ol_DrawObjects					; Draw object sprites
	bsr.w	ol_EndSpriteDraw				; End sprite drawing

	bsr.w	ol_TestHBlankEffect

	bra.s	.Loop						; Loop

; ------------------------------------------------------------------------------

.TestScript:
	ol_scriptShowIcon ol_PlayerIcon, 0
	ol_scriptShowTextbox

	ol_scriptText
	dc.b	"ha ha drugz funny lul", -1
	ol_scriptTextEnd
	
	ol_scriptWaitUser

	ol_scriptEnd

; ------------------------------------------------------------------------------
; Battle V-BLANK interrupt routine
; ------------------------------------------------------------------------------

ol_BattleVBlank:
	movem.l	d0-a6,-(sp)					; Save registers

	move.w	ol_VDP_CTRL,d0					; Clear VDP write latch

	tst.b	ol_vsync_flag.w					; Are we lagging?
	beq.s	.SkipUpdates					; If so, branch

	clr.b	ol_vsync_flag.w					; Clear VSync flag
	addq.l	#1,ol_frame_count.w				; Increment frame count
	
	jsr	ReadJoypads					; Read joypads

	lea	ol_VDP_CTRL,a0					; VDP control port
	lea	ol_VDP_DATA-ol_VDP_CTRL(a0),a1			; VDP data port

	ol_dmaCram ol_cram_buffer,0,$80,(a0)			; Load palette into CRAM
	ol_dmaVram ol_sprites,ol_SPRITES_VRAM,$280,(a0)		; Load sprites into VRAM
	ol_dmaVram ol_hscroll,ol_HSCROLL_VRAM,$380,(a0)		; Load horizontal scroll table into VRAM

	bsr.w	ol_UpdateScriptGfx				; Update script graphics
	bsr.w	ol_FlushGfxDma					; Flush graphics DMA queue

.SkipUpdates:
	bsr.w	ol_ResetHBlank					; Reset H-BLANK interrupt

	move.w	#$2000,sr					; Enable interrupts
	jsr	UpdateMusic					; Update sound driver

	movem.l	(sp)+,d0-a6					; Restore registers
	rte

; ------------------------------------------------------------------------------
; Test H-BLANK effect
; ------------------------------------------------------------------------------

ol_TestHBlankEffect:
	bsr.w	ol_GetHBlankWrite				; Get H-BLANK buffer write address
	bne.s	.End						; If we cannot write to it, branch

	lea	.Sine(pc),a0					; Get sine table
	move.w	ol_hblank_test.w,d0
	adda.w	d0,a0

	move.w	#224-1,d0					; Number of scanlines

.Loop:
	move.w	(a0)+,(a1)+					; Copy sine data
	dbf	d0,.Loop					; Loop until finished

	addq.w	#2,ol_hblank_test.w				; Increment sine index
	andi.w	#$1FE,ol_hblank_test.w
	
	bra.w	ol_SwapHBlank					; Swap H-BLANK buffers

.End:
	rts

; ------------------------------------------------------------------------------

.Sine:
	dc.w	$0000, $0006, $000C, $0012, $0019, $001F, $0025, $002B, $0031, $0038, $003E, $0044, $004A, $0050, $0056, $005C
	dc.w	$0061, $0067, $006D, $0073, $0078, $007E, $0083, $0088, $008E, $0093, $0098, $009D, $00A2, $00A7, $00AB, $00B0
	dc.w	$00B5, $00B9, $00BD, $00C1, $00C5, $00C9, $00CD, $00D1, $00D4, $00D8, $00DB, $00DE, $00E1, $00E4, $00E7, $00EA
	dc.w	$00EC, $00EE, $00F1, $00F3, $00F4, $00F6, $00F8, $00F9, $00FB, $00FC, $00FD, $00FE, $00FE, $00FF, $00FF, $00FF
	dc.w	$0100, $00FF, $00FF, $00FF, $00FE, $00FE, $00FD, $00FC, $00FB, $00F9, $00F8, $00F6, $00F4, $00F3, $00F1, $00EE
	dc.w	$00EC, $00EA, $00E7, $00E4, $00E1, $00DE, $00DB, $00D8, $00D4, $00D1, $00CD, $00C9, $00C5, $00C1, $00BD, $00B9
	dc.w	$00B5, $00B0, $00AB, $00A7, $00A2, $009D, $0098, $0093, $008E, $0088, $0083, $007E, $0078, $0073, $006D, $0067
	dc.w	$0061, $005C, $0056, $0050, $004A, $0044, $003E, $0038, $0031, $002B, $0025, $001F, $0019, $0012, $000C, $0006
	dc.w	$0000, $FFFA, $FFF4, $FFEE, $FFE7, $FFE1, $FFDB, $FFD5, $FFCF, $FFC8, $FFC2, $FFBC, $FFB6, $FFB0, $FFAA, $FFA4
	dc.w	$FF9F, $FF99, $FF93, $FF8B, $FF88, $FF82, $FF7D, $FF78, $FF72, $FF6D, $FF68, $FF63, $FF5E, $FF59, $FF55, $FF50
	dc.w	$FF4B, $FF47, $FF43, $FF3F, $FF3B, $FF37, $FF33, $FF2F, $FF2C, $FF28, $FF25, $FF22, $FF1F, $FF1C, $FF19, $FF16
	dc.w	$FF14, $FF12, $FF0F, $FF0D, $FF0C, $FF0A, $FF08, $FF07, $FF05, $FF04, $FF03, $FF02, $FF02, $FF01, $FF01, $FF01
	dc.w	$FF00, $FF01, $FF01, $FF01, $FF02, $FF02, $FF03, $FF04, $FF05, $FF07, $FF08, $FF0A, $FF0C, $FF0D, $FF0F, $FF12
	dc.w	$FF14, $FF16, $FF19, $FF1C, $FF1F, $FF22, $FF25, $FF28, $FF2C, $FF2F, $FF33, $FF37, $FF3B, $FF3F, $FF43, $FF47
	dc.w	$FF4B, $FF50, $FF55, $FF59, $FF5E, $FF63, $FF68, $FF6D, $FF72, $FF78, $FF7D, $FF82, $FF88, $FF8B, $FF93, $FF99
	dc.w	$FF9F, $FFA4, $FFAA, $FFB0, $FFB6, $FFBC, $FFC2, $FFC8, $FFCF, $FFD5, $FFDB, $FFE1, $FFE7, $FFEE, $FFF4, $FFFA
	; Extra data for cosine/wrapping
	dc.w	$0000, $0006, $000C, $0012, $0019, $001F, $0025, $002B, $0031, $0038, $003E, $0044, $004A, $0050, $0056, $005C
	dc.w	$0061, $0067, $006D, $0073, $0078, $007E, $0083, $0088, $008E, $0093, $0098, $009D, $00A2, $00A7, $00AB, $00B0
	dc.w	$00B5, $00B9, $00BD, $00C1, $00C5, $00C9, $00CD, $00D1, $00D4, $00D8, $00DB, $00DE, $00E1, $00E4, $00E7, $00EA
	dc.w	$00EC, $00EE, $00F1, $00F3, $00F4, $00F6, $00F8, $00F9, $00FB, $00FC, $00FD, $00FE, $00FE, $00FF, $00FF, $00FF
	dc.w	$0100, $00FF, $00FF, $00FF, $00FE, $00FE, $00FD, $00FC, $00FB, $00F9, $00F8, $00F6, $00F4, $00F3, $00F1, $00EE
	dc.w	$00EC, $00EA, $00E7, $00E4, $00E1, $00DE, $00DB, $00D8, $00D4, $00D1, $00CD, $00C9, $00C5, $00C1, $00BD, $00B9
	dc.w	$00B5, $00B0, $00AB, $00A7, $00A2, $009D, $0098, $0093, $008E, $0088, $0083, $007E, $0078, $0073, $006D, $0067
	dc.w	$0061, $005C, $0056, $0050, $004A, $0044, $003E, $0038, $0031, $002B, $0025, $001F, $0019, $0012, $000C, $0006
	dc.w	$0000, $FFFA, $FFF4, $FFEE, $FFE7, $FFE1, $FFDB, $FFD5, $FFCF, $FFC8, $FFC2, $FFBC, $FFB6, $FFB0, $FFAA, $FFA4
	dc.w	$FF9F, $FF99, $FF93, $FF8B, $FF88, $FF82, $FF7D, $FF78, $FF72, $FF6D, $FF68, $FF63, $FF5E, $FF59, $FF55, $FF50
	dc.w	$FF4B, $FF47, $FF43, $FF3F, $FF3B, $FF37, $FF33, $FF2F, $FF2C, $FF28, $FF25, $FF22, $FF1F, $FF1C, $FF19, $FF16
	dc.w	$FF14, $FF12, $FF0F, $FF0D, $FF0C, $FF0A, $FF08, $FF07, $FF05, $FF04, $FF03, $FF02, $FF02, $FF01, $FF01, $FF01
	dc.w	$FF00, $FF01, $FF01, $FF01, $FF02, $FF02, $FF03, $FF04, $FF05, $FF07, $FF08, $FF0A, $FF0C, $FF0D, $FF0F, $FF12
	dc.w	$FF14, $FF16, $FF19, $FF1C, $FF1F, $FF22, $FF25, $FF28, $FF2C, $FF2F, $FF33, $FF37, $FF3B, $FF3F, $FF43, $FF47
	dc.w	$FF4B, $FF50, $FF55, $FF59, $FF5E, $FF63, $FF68, $FF6D, $FF72, $FF78, $FF7D, $FF82, $FF88, $FF8B, $FF93, $FF99
	dc.w	$FF9F, $FFA4, $FFAA, $FFB0, $FFB6, $FFBC, $FFC2, $FFC8, $FFCF, $FFD5, $FFDB, $FFE1, $FFE7, $FFEE, $FFF4, $FFFA	

; ------------------------------------------------------------------------------