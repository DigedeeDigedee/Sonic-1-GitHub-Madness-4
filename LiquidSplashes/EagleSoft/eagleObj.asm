; ---------------------------------------------------------------------------
; Object 10 - blank
;
; !@ GenesisDoes objects - EagleSoft
; ---------------------------------------------------------------------------

_ArtTile_EagleSoft_Spr:		equ	$001+$460+$05B								;EagleSoft sprite tile INDEX

eagleObj:
		;Handle each subtype
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		move.w	eagleObj_Subtypes(pc,d0.w),d0
		jmp	eagleObj_Subtypes(pc,d0.w)
		
; ===========================================================================
eagleObj_Subtypes:	
				dc.w eableObj_Birb-eagleObj_Subtypes								;$00 - EagleSoft eagle for Intro
; ===========================================================================

; EagleSoft Eagle
		
eableObj_Birb:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	eableObj_Birb_index(pc,d0.w),d0
		jmp	eableObj_Birb_index(pc,d0.w)
; ===========================================================================
eableObj_Birb_index:
						dc.w eableObj_Birb_Init-eableObj_Birb_index				;$00 - Init
						dc.w eableObj_Birb_Move-eableObj_Birb_index				;$02 - Move
						dc.w eableObj_Birb_Display-eableObj_Birb_index			;$04 - Display
; ===========================================================================

;Init
eableObj_Birb_Init:															; Routine 0		
		move.w	#tilePosX_to_sprPosX(0)-24,obX(a0)							;xpos
		move.w	#tilePosY_to_sprPosYScrn($0B),obScreenY(a0) 				;ypos=midPnt (fixed to screen)
		move.l	#Map_Eagle,obMap(a0)										;Load Eagle mapping
		move.w	#make_art_tile(_ArtTile_EagleSoft_Spr,0,0),obGfx(a0)		;Load setting (Eagled tile offset, pal0 (auto-assigns pal2 from mapping), priority
		addq.b	#2,obRoutine(a0)											;Goto next routine

;Move
eableObj_Birb_Move:															; Routine 2
		addq.w	#1,obX(a0) 													; move Eagle right
		cmpi.w	#tilePosX_to_sprPosX(40)+24,obX(a0) 						; has Eagle reached final position?
		bne.s	.skip														; if not, branch
		addq.b	#2,obRoutine(a0)											; Goto next routine
.skip:
		jsr		(DisplaySprite).l											;Display sprite
		rts
		
;Display/End
eableObj_Birb_Display:														;Routine 4
		rts
