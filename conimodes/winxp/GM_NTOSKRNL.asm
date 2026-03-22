; ===========================================================================
; ---------------------------------------------------------------------------
; Windows NOT XP Boot Screen
; ---------------------------------------------------------------------------
GM_NTOSKRNL:
		move.b	#bgm_Stop,d0
		jsr		(PlaySound_Special).l  ; fade out music
		move.w	(v_vdp_buffer1).w,d0
		ori.b	#$BF,d0
		move.w	d0,(vdp_control_port).l
		jsr		(ClearScreen).l
		bsr.w	WinXP_CLearPal
		jsr		(ClearPLC).l
		lea	(vdp_control_port).l,a6
		move.w	#$8004,(a6)	; use 8-colour mode
		move.w	#$8200+(vram_fg>>10),(a6) ; set foreground nametable address
		move.w	#$8400+(vram_bg>>13),(a6) ; set background nametable address
		move.w	#$9001,(a6)	; 64-cell hscroll size
		move.w	#$9200,(a6)	; window vertical position
		move.w	#$8B03,(a6)	; line scroll mode
		move.w	#$8700,(a6)	; set background colour (line 0; colour 0)
;		ResetDMAQueue
		move.w	(v_vdp_buffer1).w,d0
		ori.b	#$40,d0
		move.w	d0,(vdp_control_port).l
		clr.l	(v_screenposx).w	; prevent yucky misalignment
		clr.b	(v_foxyframe).w
;		clr.w	(v_pcyc_num).w ; fix palette cycling
;		move.w	#$C,(v_pcyc_time).w ; enable palette cycling
;		move.w	#$40,(v_bgscrposy_vdp).w

		lea	(v_objspace).w,a1
		moveq	#0,d0
		move.w	#$7FF,d1
GM_WinXP_ClrObjRam:
		move.l	d0,(a1)+
		dbf	d1,GM_WinXP_ClrObjRam ; clear object RAM

		locVRAM	0
		lea	(Nem_WinXP).l,a0 ;	; load art
		jsr		(NemDec).l
		lea	($FF0000).l,a1
		lea	(Eni_WinXP).l,a0 ; load map
		move.w	#0,d0
		jsr		(EniDec).l
		lea	($FF0000).l,a1
		locVRAM	$C000,d0
		moveq	#$3F,d1
		moveq	#$1F,d2
		jsr		(TilemapToVRAM).l

		lea     (Pal_WinXP).l,a0
		lea     (v_palette).w,a1
		move.w	#$7,d7	; 16 colors ($20 bytes)
	.loop:
		move.l  (a0)+,(a1)+
		dbf.w	d7,.loop

		lea	($FF0000).l,a1
		lea	(Eni_NTOSBars).l,a0 ; load map
		move.w	#$8000,d0
		jsr		(EniDec).l

		move.w	#2*60,(v_generictimer).w 

GM_WinXP_MainLoop:
		move.b	#2,(v_vbla_routine).w
		jsr		(WaitForVBla).l

		cmpi.b	#20,(v_foxyframe).w
		beq.s	GM_WinXP_ChangeMode
		tst.w	(v_demolength).w
		bne.s	WinXP_ContScrollBar
		move.w	#2*60,(v_demolength).w

		move.b	(v_foxyframe).w,d0
		lsl.w	#2,d0
		lea 	NTOSBARMAPloc(pc),a0
		move.l	(a0,d0.w),a1		
;		lea	(v_ram_start).l,a1
		locVRAM	$EC1C,d0
		moveq	#20,d1
		moveq	#1,d2
		jsr		(TilemapToVRAM).l
		add.b	#1,(v_foxyframe).w
WinXP_ContScrollBar:
				subq.w	#1,(v_screenposx).w
WinXP_ScrollBar_Noreset:
		lea	(v_hscrolltablebuffer).w,a1	; copy bg positions to hscroll
		move.w	#183,d1
		move.l	#0,d0
		add.l	#0,d0
.WinXP_ScrollBar_update:		
		move.l	d0,(a1)+
		dbf	d1,.WinXP_ScrollBar_update
		move.w	#7,d1
		add.l	#0,d0
		move.l	(v_screenposx).w,d0
.WinXP_ScrollBar_updateBAR:		
		move.l	d0,(a1)+
		dbf	d1,.WinXP_ScrollBar_updateBAR
		move.w	#31,d1
		move.l	#0,d0
		add.l	#0,d0
.WinXP_ScrollBar_updaterest:		
		move.l	d0,(a1)+
		dbf	d1,.WinXP_ScrollBar_updaterest
		bra.w	GM_WinXP_MainLoop

GM_WinXP_ChangeMode:
		bsr.w	WinXP_CLearPal
		cmpi.b	#id_Level+$80,(v_gamemode).w
		beq.s	.noset	; if mode is $C (level), branch
		move.b	#id_Title,(v_gamemode).w	; go to Title Screen
.noset:
		rts

WinXP_CLearPal:
		moveq	#0,d0
		lea	(v_pal_dry).w,a1
NTOS_FILLPal:
		move.w	#$1F,d1
	WinXP_ClrPal:
		move.l	d0,(a1)+
		dbf	d1,WinXP_ClrPal ; fill palette with black
		rts

NTOSBARMAPloc:
		dc.l	v_ram_start
		dc.l	v_ram_start+$54
		dc.l	v_ram_start+$54*2
		dc.l	v_ram_start+$54*3
		dc.l	v_ram_start+$54*4
		dc.l	v_ram_start+$54*5
		dc.l	v_ram_start+$54*6
		dc.l	v_ram_start+$54*7
		dc.l	v_ram_start+$54*8
		dc.l	v_ram_start+$54*9
		dc.l	v_ram_start+$54*10
		dc.l	v_ram_start+$54*11
		dc.l	v_ram_start+$54*12
		dc.l	v_ram_start+$54*13
		dc.l	v_ram_start+$54*14
		dc.l	v_ram_start+$54*15
		dc.l	v_ram_start+$54*16
		dc.l	v_ram_start+$54*17
		dc.l	v_ram_start+$54*18
		dc.l	v_ram_start+$54*18

Nem_WinXP:	incbin	"conimodes/winxp/Art.bin"
		even
Eni_WinXP:	incbin	"conimodes/winxp/Map.bin"
		even
Eni_NTOSBars:	incbin	"conimodes/winxp/barmap.bin"
		even
Pal_WinXP:	incbin	"conimodes/winxp/Palette.bin"
		even
