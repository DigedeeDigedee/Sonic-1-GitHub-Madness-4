; ---------------------------------------------------------------------------
; What is "cchhhet"?
; ---------------------------------------------------------------------------

; FUN FACT: AS doesn't allow you to use macros defined later. this assembler is so poopy
	include "ContinueScreen/Macros.asm"

GM_Continue:
	jsr	PaletteFadeOut
	
	disable_display
	disable_ints

	lea	(vdp_control_port).l,a6
	move.w	#$8004,(a6)			; 8 colour mode
	move.w	#$8700,(a6)			; background colour

	jsr	ClearScreen
	jsr	ClearPLC

	clearRAM v_objspace

	; Decompress + DMA cursor art
	locVRAM $8000
	lea	(.Cursor_Art).l, a0
	jsr	NemDec

	; Draw
	bsr.w 	.DrawContinue
	
	; Joel's PTSD Music
	move.b	#bgm_Continue, d0
	jsr	QueueSound2

	; Add cursor object
	move.b 	#id_ContScrCur, (v_objspace)

	; Interrupt/display enable
	enable_display
	enable_ints

	; Routine calls
	bsr.w 	ContinueText_Init
	jsr	PaletteFadeIn

.Loop:
	move.b	#$4, (v_vbla_routine).w
	jsr	WaitForVBla

	jsr	ExecuteObjects
	jsr 	BuildSprites
	
	bra.s 	.Loop

.Exit:
	rts

; ---------------------------------------------------------------------------
; Tilemap Draw Routines
; ---------------------------------------------------------------------------
.DrawContinue:
	; Palette
	moveq	#palid_FelixDecision, d0
	jsr	PalLoad1

	; Tiles
	locVRAM $0
	lea	(.Decision_Art).l, a0
	jsr	NemDec

	; Tilemap
	Continue_DrawMap	.Decision_Map

	; Text
	lea	(.Text_DecisionContinues).l, a1
	move.w 	#$1, d6
	move.w 	#$8, d5
	jsr	ContinueText_Draw

	lea	(.Text_DecisionContinue).l, a1
	move.w 	#$3, d6
	move.w 	#$8, d5
	jsr	ContinueText_Draw

	lea	(.Text_YesNo).l, a1
	move.w 	#$1A, d6
	move.w 	#$20, d5
	jsr	ContinueText_Draw

	rts

.DrawGameOver:
	; Palette
	moveq	#palid_FelixDecision, d0
	jsr	PalLoad1
	
	; Tiles
	locVRAM $0
	lea	(.GameOver_Art).l, a0
	jsr	NemDec

	; Tilemap
	Continue_DrawMap	.GameOver_Map
	
	rts

; ---------------------------------------------------------------------------
; Graphics Data except for palette because sonic 1 is fucking retarded
; ---------------------------------------------------------------------------
.Decision_Map: incbin "ContinueScreen/Graphics/Tile/Decision/Map.bin"
	even
.Decision_Art: incbin "ContinueScreen/Graphics/Tile/Decision/Tiles.bin"
	even

.GameOver_Map: incbin "ContinueScreen/Graphics/Tile/GameOver/Map.bin"
	even
.GameOver_Art: incbin "ContinueScreen/Graphics/Tile/GameOver/Tiles.bin"
	even

.Cursor_Art: incbin "ContinueScreen/Graphics/Sprite/Cursor/Tiles.bin"
	even

; ---------------------------------------------------------------------------
; Text data
;
; first byte in text format is length
; every other byte is a character tile offset from the start of the font 
; ---------------------------------------------------------------------------

; Continues:
.Text_DecisionContinues:
	dc.b	$07
	dc.b	$11, $10, $11, $1D, $14, $10, $0C, $2D

; Continue?
.Text_DecisionContinue:
	dc.b	$0A
	dc.b	$11, $12, $10, $05, $10, $0D, $08, $0A, $14, $1D, $2E
	even

; Yes/No
.Text_YesNo:
	dc.b	$08
	dc.b	$05, $01, $00, $00, $00, $00, $0F, $06, $14

; ---------------------------------------------------------------------------
; Includes
; ---------------------------------------------------------------------------
	include "ContinueScreen/Text.asm"