RobiWanKenobi_Splash:
	move.b	#bgm_Stop,d0
	jsr	(PlaySound_Special).w		; fade out music
	jsr	(ClearPLC).w
	jsr	(PaletteFadeOut).w
	disable_ints
	disable_display
	jsr	(ClearScreen).w
	fillVRAM	0, $0000, $10000
	lea	(vdp_control_port).l,a6
	move.w	#$8004,(a6)			; 8-colour mode
	move.w	#$8200+(vram_fg>>10),(a6)	; set foreground nametable address
	move.w	#$8400+(vram_bg>>13),(a6)	; set background nametable address
	move.w	#$9001,(a6)			; 64-cell hscroll size
	move.w	#$8B03,(a6)
	clearRAM	v_ram_start, (v_ram_start+$2000)			; clear foreground buffers
	clearRAM	v_objspace, v_snddriver_ram				; clear the object RAM
	clearRAM	v_levelvariables, v_levelvariables_end				; clear the camera RAM

	; clear
	moveq	#0,d0
	move.b	d0,(f_wtr_state).w
	move.b	d0,(f_water).w
	move.b	d0,(v_d_anim_done).w

	locVRAM	0
	lea	(ArtNem_BG).l,a0
	jsr	NemDec

	locVRAM	$591*$20
	lea	(ArtNem_RWK).l,a0
	jsr	NemDec

	lea	(v_ram_start).l,a1
	lea	(MapEni_BG).l,a0
	move.w	#0,d0				; Send d0 to 0
	jsr	EniDec

	copyTilemap	v_ram_start,vram_fg,40,28

	enable_display

	; load palette
	moveq	#64/2-1,d0
	lea	(Pal_RobiWK).l,a1
	lea	(v_palette_fading).w,a2
.loadpal:
	move.l	(a1)+,(a2)+
	dbf	d0,.loadpal

	move.b	#Bgm_GooglePlayStock,d0
	jsr	(PlaySound_Special).w ; stop music

	move.b	#id_RobiWK_Logo,(v_splash_logo).w
	move.b	#id_RobiWK_Logo,(v_splash_logo_b).w
	move.b	#1,(v_splash_logo_b+$28).w
	jsr	(ExecuteObjects).l
	jsr	(BuildSprites).l

	jsr	(PaletteFadeIn).w
	move.w	#6*60,(v_generictimer).w			; Time

.loop:
	move.b	#2,(v_vbla_routine).w
	jsr	(WaitForVBla).w
	jsr	(ExecuteObjects).l
	jsr	(BuildSprites).l
	andi.b	#btnStart,(v_jpadpress1).w	; check if Start is pressed
	bmi.s	.title
	tst.w	(v_generictimer).w
	bne.s	.loop
.title:
	jsr	(PaletteFadeOut).w
	move.b	#id_Title,(v_gamemode).w	; set the screen mode to Title Screen
	rts

; ============================================================================================
OBJ_RobiWK_Logo:
	moveq	#0,d0
	move.b	obRoutine(a0),d0
	move.w	OBJ_RobiWK_Logo_Index(pc,d0.w),d1
	jsr	OBJ_RobiWK_Logo_Index(pc,d1.w)
	jmp	(DisplaySprite).l
; ===========================================================================
; off_390B0:
OBJ_RobiWK_Logo_Index:
	dc.w .Logo_Init-OBJ_RobiWK_Logo_Index
	dc.w .Logo_Main-OBJ_RobiWK_Logo_Index
	dc.w .Logo_FinishedFall-OBJ_RobiWK_Logo_Index
; ===========================================================================
; BranchTo4_LoadSubObject
.Logo_Init:
	addq.b	#2,obRoutine(a0)
	move.l	#Map_RWK,obMap(a0)
	move.w	#$591,obGfx(a0)
	move.w	#0,obScreenY(a0)
	move.B	#1,obPriority(a0)
	move.B	#0,obRender(a0)
	tst.b	obSubtype(a0)
	bne.s	.LoadKenobiText
	move.w	#$DA,obX(a0)
	move.B	#0,obFrame(a0)
	bra.s	.Logo_Main

.LoadKenobiText:
	move.w	#$CA+174,obX(a0)
	move.B	#1,obFrame(a0)

; ===========================================================================
; BranchTo10_JmpTo39_MarkObjGone
.Logo_Main:
	jsr	(ScreenObjectFall).l
	cmpi.w	#$D0,obScreenY(a0)
	bls.s	.return

	addq.b	#2,obRoutine(a0)
	move.w	#sfx_HitBoss,d0
	jsr	(PlaySound).l
	move.w	obScreenY(a0),$3E(a0)
	clr.B	$3D(a0)

.Logo_FinishedFall:
	move.b	$3D(a0),d0
	jsr	(CalcSine).l
	asr.w	#4,d0
	add.w	$3E(a0),d0			; add the original pos
	move.w	d0,obScreenY(a0)		; set y and x positions
	addq.b	#2,$3D(a0)

.return:
	rts
; ===========================================================================
; END OF OBJECT AB
Map_RWK:	include "LiquidSplashes/RobiWK/RobiWK_Logo_Map.asm"

ArtNem_RWK:	binclude "LiquidSplashes/RobiWK/RobiWK_Logo_Art.bin"
	even


