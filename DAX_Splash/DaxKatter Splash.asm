; ---------------------------------------------------------------------------
; DaxKatter Splash Screen
; ---------------------------------------------------------------------------

DaxKatter_VRAM = 0

; =============== S U B R O U T I N E =======================================
v_splash_logo = v_objspace

DaxKatterSplash_VDP:

DaxKatter_SplashScreen:
		move.b	#bgm_Stop,d0
		jsr	(PlaySound_Special).l		; fade out music
		jsr	(ClearPLC).w			; clear KosPlusM PLCs
		jsr	(PaletteFadeOut).w
		lea	(vdp_control_port).l,a6
		jsr	(Load_VDP).w
		move.w $8004,(a6)				; disable HInt, HV counter, 8-colour mode
		move.w $8200+(vram_fg>>10),(a6)			; set foreground nametable address
		move.w $8400+(vram_bg>>13),(a6)			; set background nametable address
		move.w $8700,(a6)				; set background colour (line 3; colour 0)
		move.w $8B03,(a6)				; line scroll mode
		move.w $8C81,(a6)				; set 40cell screen size, no interlacing, no s/h
		move.w $9003,(a6)				; 64x32 cell nametable area
		move.w $9100,(a6)				; set window H position at default
		move.w $9200,(a6)				; set window V position at default

		clr.b	(f_wtr_state).w
		jsr		(ClearScreen).l
		move.w	(v_vdp_buffer1).w,d0
		ori.b	#$40,d0
		move.w	d0,(vdp_control_port).l
		lea	(v_objspace).w,a1
		moveq	#0,d0
		move.b	d0,(v_d_anim_done).w
		move.w	#$7FF,d1

GM_CNB_ClrObjRam:
		move.l	d0,(a1)+
		dbf	d1,GM_CNB_ClrObjRam ; clear object RAM

		; load art
		locVRAM	$01
		lea	(ArtNem_DaxKatter_D).l,a0
		jsr	(NemDec).l

		; load art
		locVRAM	$80
		lea	(ArtNem_DaxKatter_Text).l,a0
		jsr	(NemDec).l

		lea	(EniMap_DaxKatterText).l,a0
		lea	(RAM_Start).l,a1
		move.w	$80, d0
		jsr 	EniDec

		copyTilemap	RAM_Start,vram_fg+$A52,31-1,4-1	; Send plane mappings to VRAM

		lea	(EniMap_BringsYou).l,a0
		lea	(RAM_Start).l,a1
		move.w	$2080, d0
		jsr 	EniDec

		copyTilemap	RAM_Start,vram_fg+$E5A,18-1,3-1	; Send plane mappings to VRAM

		; load palette
		lea	(Pal_DaxKatterOff).l,a1
		lea	(v_palette_fading).w,a2
		moveq	#16/2-1,d0
.palinit:	move.l	(a0)+,(a1)+
		dbf	d0,.palinit

.waitplc
		move.b	#$12,(v_vbla_routine).w
		jsr	(WaitForVBla).w
		move.l	#Obj_DaxKatterD,(v_splash_logo+address).w
		move.b	#$12,(V_int_routine).w
		jsr	(WaitForVBla).w
		jsr	(ExecuteObjects).l		; RunObjects
		jsr	(BuildSprites).l
		jsr	(PaletteFadeIn).l
;		move.w	#90,(Demo_timer).w

.main
		move.b	#$14,(v_vbla_routine).w
		jsr	(WaitForVBla).w
		jsr	(ExecuteObjects).l		; RunObjects
		jsr	(BuildSprites).l
		andi.b	#btnStart,(v_jpadpress1).w	; check if Start is pressed
		bne.s	.done
		tst.w	(v_d_anim_done).w
		beq.s	.main				; if not, branch

.scroll
; movement
		move.b	#$14,(v_vbla_routine).w
		jsr	(WaitForVBla).w
		jsr	(ExecuteObjects).l		; RunObjects
		jsr	(BuildSprites).l
		cmp.w	#-272,(v_screenposx).w
		ble.s	.flash				; NOTE: unsigned
		andi.b	#btnStart,(v_jpadpress1).w	; check if Start is pressed
		bne.s	.done				; if not, branch
		sub.l	#$AE128,(v_screenposx).w	; move .75 pixels per frame
		bsr.w	DKSS_Scroll
		bne.s	.scroll

.flash
		move.b	#sfx_Dash,d0
		jsr	(PlaySound_Special).l
		jsr	(PaletteWhiteOut).w

.loadpal
		lea	(Pal_DaxKatterOn).l,a1
		lea	(v_palette_fading_line_1).w,a2
		moveq	#16/2-1,d0
.palinit2:	move.l	(a0)+,(a1)+
		dbf	d0,.palinit2
		jsr	(PaletteWhiteIn).w

.loadBringsYou
		lea	(Pal_DaxKatterBringsYou).l,a1
		lea	(v_palette_fading_line_2).w,a2
		moveq	#16/2-1,d0
.palinit3:	move.l	(a0)+,(a1)+
		dbf	d0,.palinit3

		move.b	sfx_MenuConfirm,d0
		jsr	(PlaySound_Special).l
		bsr.w	Pal_FadeBringsYou
		move.w	#5*30,(v_generictimer).w

.mainloop2
		move.b	#VintID_Menu,(v_vbla_routine).w
		jsr	(WaitForVBla).w
		jsr	(ExecuteObjects).l		; RunObjects
		jsr	(BuildSprites).l
		andi.b	#btnStart,(v_jpadpress1).w	; check if Start is pressed
		bne.s	.done				; if not, branch
		tst.w	(v_generictimer).w
		bne.s	.mainloop2

.done
		rts

; ---------------------------------------------------------------------------
; Object Data
; ---------------------------------------------------------------------------

Obj_DaxKatterD:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	DaxKatterD_Index(pc,d0.w),d1
		jsr	DaxKatterD_Index(pc,d1.w)
		jmp	(DisplaySprite).l
; ---------------------------------------------------------------------------
DaxKatterD_Index:
		dc.w	.init-DaxKatterD_Index
		dc.w	.move-DaxKatterD_Index
		dc.w	.testanim-DaxKatterD_Index
		dc.w	.display-DaxKatterD_Index
; ---------------------------------------------------------------------------

.init
		addq.b	#2,obRoutine(a0)
		move.l	#Map_DaxKatterD,obMap(a0)
		move.w	#make_art_tile($1,0,1),obGfx(a0)	; Start at $A000
		move.w	#$80+360,obX(a0)
		move.w	#$80+94,obY(a0)
		move.w	#$80,obPriority(a0)
		move.b	#0,obAnim(a0)
		move.b	#0,obFrame(a0)

.move
		subi.w	#14,obX(a0)
		cmpi.w	#$80+40,obX(a0)
		bhi.s	.display

.setxpos
		addq.b	#2,obRoutine(a0)
		move.w	#$80+40,obX(a0)
		move.b	sfx_Thud,d0
		jsr	(PlaySound_Special).l
		move.b	#1,obAnim(a0)

.testanim
		tst.b	obAnim(a0)
		bne.s	.display
		addq.b	#2,obRoutine(a0)
		move.b	#1,(v_d_anim_done).w

.display
		lea	Ani_DaxKatterD(pc),a1
		jmp	(AnimateSprite).l

Ani_DaxKatterD:
		dc.w .Ani00-Ani_DaxKatterD
		dc.w .Ani01-Ani_DaxKatterD

.Ani00:		dc.b	30, 0, afEnd

.Ani01:		dc.b	1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 7, 6, 5, 4, 3, 2
		dc.b	1, 0, afChange, 0
		even

; ---------------------------------------------------------------------------

DKSS_Scroll:
; render
	lea	H_scroll_buffer,a0
	move.w	(v_screenposx).w,d0		; Plane A uses this
	swap	d0
	clr.w	d0			; Plane B uses this
	move.w	#224-1,d1
.loop:
	move.l	d0,(a0)+
	dbf	d1,.loop
	rts

Pal_FadeBringsYou:
		move.w	#bytes_to_word((palette_line_1>>8),48-1),(Palette_fade_info).w	; set fade info and fade count
		jsr	(Pal_FillBlack).l
		move.b	#$E,(Palette_fade_max_color_check).w	; MJ: prepare maximum colour check
		clr.b	(Palette_fade_delay_count).w		; MJ: clear Palette_fade_delay_count (changed to RAM for compatability

.fadein:
		move.b	#VintID_Fade,(V_int_routine).w
		jsr	(Wait_VSync).w
		jsr	(ExecuteObjects).l
		jsr	(BuildSprites).l
		bchg	#0,(Palette_fade_delay_count).w		; MJ: change delay counter
		beq.s	.fadein					; MJ: if null, delay a frame
		jsr	(Pal_FromBlack).w
		subq.b	#2,(Palette_fade_max_color_check).w	; MJ: decrease colour check
		bne.s	.fadein					; MJ: if it has not reached null, branch
		rts

; ---------------------------------------------------------------------------

Map_DaxKatterD:
	include		"DAX_Splash/Maps/Map - DaxKatter Splash.asm"
	even

EniMap_DaxKatterText:
	binclude	"DAX_Splash/Maps/Map - DaxKatter Mappings.eni"
	even

EniMap_BringsYou:
	binclude	"DAX_Splash/Maps/Map - Brings You Mappings.eni"
	even

; ---------------------------------------------------------------------------

Pal_DaxKatterOff:
	binclude	"DAX_Splash/Pal/Pal - Init.bin"
	even

Pal_DaxKatterOn:
	binclude	"DAX_Splash/Pal/Pal - After Flash.bin"
	even

Pal_DaxKatterBringsYou:
	binclude	"DAX_Splash/Pal/Pal - Brings You.bin"
	even

; ---------------------------------------------------------------------------

ArtNem_DaxKatter_D:
	binclude	"DAX_Splash/Art/DaxKatter Splash - D.nem"
	even

ArtNem_DaxKatter_Text:
	binclude	"DAX_Splash/Art/DaxKatter Splash - Text.nem"
	even

; ---------------------------------------------------------------------------
