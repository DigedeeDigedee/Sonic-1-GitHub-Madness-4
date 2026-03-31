; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Overworld
; ------------------------------------------------------------------------------

ol_Overworld:
	moveq	#bgm_Fade|(~$FF),d0				; Fade out sound
	jsr	QueueSound2

.LoadMap:
	move.w	#$2700,sr					; Setup interrupts
	move.w	#$4EF9,ol_vblank_jmp.w
	move.l	#ol_SoundVBlank,ol_vblank_addr.w
	bsr.w	ol_DisableHBlank
	move.w	#$2000,sr
	
	bsr.w	ol_ClearScreen					; Clear screen
	bsr.w	ol_DisableDisplay				; Disable display

	bsr.w	ol_InitObjects					; Initialize objects
	bsr.w	ol_InitMap					; Initialize map
	bsr.w	ol_InitScript					; Initialize scripting

	lea	ol_player_object.w,a0				; Spawn player object
	move.l	#ol_PlayerObject,ol_obj_update(a0)
	move.b	ol_map_spawn_direction.w,ol_obj_flags(a0)
	move.w	ol_map_spawn_x.w,ol_obj_x(a0)
	move.w	ol_map_spawn_y.w,ol_obj_y(a0)

	bsr.w	ol_SpawnMapObjects				; Spawn map objects
	bsr.w	ol_ScrollMap					; Scroll map
	bsr.w	ol_RedrawMap					; Redraw map
	
	clr.l	ol_p1_ctrl_hold.w				; Clear controller data
	
	move.w	#$2700,sr					; Set V-BLANK interrupt routine
	move.l	#ol_OverworldVBlank,ol_vblank_addr.w
	move.w	#$2000,sr

	bsr.w	ol_EnableDisplay				; Enable display
	bsr.w	ol_FadePaletteIn				; Fade palette in

; ------------------------------------------------------------------------------

.Loop:
	bsr.s	.Update						; Run updates

	tst.b	ol_p1_ctrl_tap.w				; Should we exit?
	bmi.s	.ExitOverworld					; If so, branch

	move.b	ol_map_next_id.w,d0				; Should we warp to another map?
	cmp.b	ol_map_id.w,d0
	beq.s	.Loop						; If not, loop
	move.b	d0,ol_map_id.w					; Set next map ID

; ------------------------------------------------------------------------------

.ExitMap:
	bsr.w	ol_FadePaletteToBlack				; Fade palette to black
	bsr.s	.Update						; Run updates
	tst.b	ol_palette_fade_flag.w				; Is the palette done fading?
	bne.s	.ExitMap					; If not, loop
	bra.w	.LoadMap					; Load next map

; ------------------------------------------------------------------------------

.ExitOverworld:
	bsr.w	ol_FadePaletteToBlack				; Fade palette to black
	bsr.s	.Update						; Run updates
	tst.b	ol_palette_fade_flag.w				; Is the palette done fading?
	bne.s	.ExitOverworld					; If not, loop
	rts

; ------------------------------------------------------------------------------

.Update:
	bsr.w	ol_UpdateCram					; Update CRAM
	bsr.w	ol_VSync					; VSync

	bsr.w	ol_UpdateObjects				; Update objects

	bsr.w	ol_ScrollMap					; Scroll map
	bsr.w	ol_DrawMap					; Draw map

	bsr.w	ol_RunScript					; Run script

	bsr.w	ol_StartSpriteDraw				; Start sprite drawing
	bsr.w	ol_DrawTextboxIcon				; Draw textbox icon
	bsr.w	ol_DrawObjects					; Draw object sprites
	bra.w	ol_EndSpriteDraw				; End sprite drawing

; ------------------------------------------------------------------------------
; Overworld V-BLANK interrupt routine
; ------------------------------------------------------------------------------

ol_OverworldVBlank:
	movem.l	d0-a6,-(sp)					; Save registers

	move.w	ol_VDP_CTRL,d0					; Clear VDP write latch

	tst.b	ol_vsync_flag.w					; Are we lagging?
	beq.w	.SkipUpdates					; If so, branch

	clr.b	ol_vsync_flag.w					; Clear VSync flag
	addq.l	#1,ol_frame_count.w				; Increment frame count
	
	jsr	ReadJoypads					; Read joypads

	lea	ol_VDP_CTRL,a0					; VDP control port
	lea	ol_VDP_DATA-ol_VDP_CTRL(a0),a1			; VDP data port

	ol_dmaCram ol_cram_buffer,0,$80,(a0)			; Load palette into CRAM
	ol_dmaVram ol_sprites,ol_SPRITES_VRAM,$280,(a0)		; Load sprites into VRAM
	ol_dmaVram ol_hscroll,ol_HSCROLL_VRAM,$380,(a0)		; Load horizontal scroll table into VRAM

	move.l	#ol_vsramWriteCmd(0),(a0)			; Set vertical scroll
	move.l	ol_vscroll.w,(a1)

	bsr.w	ol_UpdateScriptGfx				; Update script graphics
	bsr.w	ol_FlushGfxDma					; Flush graphics DMA queue
	
	bsr.w	ol_DrawMapRow					; Draw map row
	bsr.w	ol_DrawMapColumn				; Draw map column

.SkipUpdates:
	move.w	#$2000,sr					; Enable interrupts
	jsr	UpdateMusic					; Update sound driver

	movem.l	(sp)+,d0-a6					; Restore registers
	rte

; ------------------------------------------------------------------------------