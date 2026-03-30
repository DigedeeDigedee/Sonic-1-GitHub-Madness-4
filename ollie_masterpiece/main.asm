; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

GM_OllieMasterpiece:
	moveq	#bgm_Fade|(~$FF),d0				; Fade out sound
	jsr	(QueueSound2).l
	jsr	(PaletteFadeOut).l				; Fade out palette

	move.w	#$2700,sr					; Disable interrupts
	move.w	#opcode_jmpabslong,ol_vblank_jmp.w		; Setup V-BLANK interrupt
	move.l	#ol_VBlank,ol_vblank_addr.w
	move.w	#opcode_rte,ol_hblank_jmp.w			; Disable H-BLANK interrupt

	bsr.w	ol_InitVdp					; Initialize VDP

	lea	v_ram_start,a0					; Buffers and variables
	moveq	#0,d0						; Zero
	move.w	#(v_ngfx_buffer-v_ram_start_def)/4-1,d1		; Length to clear

.ClearRam:
	move.l	d0,(a0)+					; Clear buffers and variables
	dbf	d1,.ClearRam					; Loop until finished

	lea	ol_objects,a0					; Object pool
	move.w	#(ol_objects_end-ol_objects)/4-1,d1		; Length to clear

.ClearObjects:
	move.l	d0,(a0)+					; Clear object pool
	dbf	d1,.ClearObjects				; Loop until finished

	lea	ol_object_draw,a0				; Object draw queue
	move.w	#(ol_object_draw_end-ol_object_draw)/4-1,d1	; Length to clear

.ClearObjectDraw:
	move.l	d0,(a0)+					; Clear object draw queue
	dbf	d1,.ClearObjectDraw				; Loop until finished

	bsr.w	ol_InitMap					; Initialize map
	bsr.w	ol_InitScript					; Initialize scripting

	move.l	#ol_PlayerObject,ol_player_object.w		; Spawn player object
	move.w	#$188,ol_player_object+ol_obj_x.w
	move.w	#$F8,ol_player_object+ol_obj_y.w

	bsr.w	ol_SpawnMapObjects				; Spawn map objects
	bsr.w	ol_UpdateObjects				; Update objects

	bsr.w	ol_ScrollMap					; Scroll map
	bsr.w	ol_RedrawMap					; Redraw map

	bsr.w	ol_StartSpriteDraw				; Start sprite drawing
	bsr.w	ol_DrawObjects					; Draw object sprites
	bsr.w	ol_EndSpriteDraw				; End sprite drawing

	move.w	#$8174,ol_VDP_CTRL				; Enable display
	jsr	(PaletteFadeIn).l					; Fade in palette

; ------------------------------------------------------------------------------

.Loop:
	bsr.w	ol_VSync					; VSync

	bsr.w	ol_UpdateObjects				; Update objects

	bsr.w	ol_ScrollMap					; Scroll map
	bsr.w	ol_DrawMap					; Draw map

	bsr.w	ol_RunScript					; Run script

	bsr.w	ol_StartSpriteDraw				; Start sprite drawing
	bsr.w	ol_DrawTextboxIcon				; Draw textbox icon
	bsr.w	ol_DrawObjects					; Draw object sprites
	bsr.w	ol_EndSpriteDraw				; End sprite drawing

	bra.w	.Loop						; Loop

; ------------------------------------------------------------------------------
; V-BLANK interrupt
; ------------------------------------------------------------------------------

ol_VBlank:
	movem.l	d0-a6,-(sp)					; Save registers

	tst.b	ol_vsync_flag.w					; Are we lagging?
	beq.s	.SkipUpdates					; If so, branch

	clr.b	ol_vsync_flag.w					; Clear VSync flag
	addq.l	#1,ol_frame_count.w				; Increment frame count
	
	jsr	(ReadJoypads).l					; Read joypads

	lea	ol_VDP_CTRL,a0					; VDP control port
	lea	ol_VDP_DATA,a1					; VDP data port

	move.w	(a0),d0						; Clear VDP write latch

	move.l	#ol_vramWriteCmd(ol_HSCROLL_VRAM),(a0)		; Set horizontal scroll
	move.l	ol_scroll_x.w,(a1)

	move.l	#ol_vsramWriteCmd(0),(a0)			; Set vertical scroll
	move.l	ol_scroll_y.w,(a1)

	ol_dmaCram ol_palette,0,$80,(a0)			; Load palette into CRAM
	ol_dmaVram ol_sprites,ol_SPRITES_VRAM,$280,(a0)		; Load sprites into VRAM

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
; Includes
; ------------------------------------------------------------------------------

	include	"interrupt.asm"
	include	"vdp.asm"
	include	"sprite.asm"
	include	"animation.asm"
	include	"object.asm"
	include	"map.asm"
	include	"script.asm"

; ------------------------------------------------------------------------------
; Objects
; ------------------------------------------------------------------------------

	include	"objects/player.asm"
	include	"objects/warp.asm"
	include	"objects/npc.asm"

; ------------------------------------------------------------------------------
; Data
; ------------------------------------------------------------------------------

	include	"data.asm"

; ------------------------------------------------------------------------------