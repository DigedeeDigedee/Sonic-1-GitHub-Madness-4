; ===========================================================================
; Roaring Knight Boss Object
; For Sonic 1: Github Madness 4
; Code: giovanni.gen
; Graphics from DELTARUNE
; ===========================================================================

; ===========================================================================
;
; ===========================================================================

ArtTile_Roaring_Knight	=	ArtTile_Eggman
Knight_Previous_Frame	=	objoff_3B
Knight_X_Spawn		=	$540
Knight_Y_Spawn		=	$160

; ===========================================================================
; Start of object code
; ===========================================================================

Obj_Roaring_Knight:
	moveq	#0,d0
	move.b	obRoutine(a0),d0	; Get routine ID
	move.w	RKnight_Index(pc,d0.w),d1	; Get indexed routine
	jmp	RKnight_Index(pc,d1.w)		; Jump to code

; ===========================================================================
; 
; ===========================================================================

RKnight_Index:	
	dc.w RKnight_Init-RKnight_Index		; Initialization routine
	dc.w RKnight_Main-RKnight_Index		; Main logic
	dc.w RKnight_Defeat-RKnight_Index	; Defeat and cleanup logic
	
; ===========================================================================

RKnight_Init:
	addq.b	#2,obRoutine(a0)					; Advance to next routine
	move.l	#Map_RKnight,obMap(a0)					; Define sprite mappings
	move.w	#make_art_tile(ArtTile_Roaring_Knight,0,0),obGfx(a0)	; Define VRAM settings
	ori.b	#%00000100,obRender(a0)					; Define render settings
	move.b	#$48,obActWid(a0)					; Define render width
	move.b	#2,obPriority(a0)					; Define sprite render priority
	clr.b	Knight_Previous_Frame(a0)				; Set previous frame to 0
	move.b	#1,obFrame(a0)						; Set current frame to 1. This guarantees correct graphics initialization.
	
RKnight_Main:
	bsr.w	RKnight_LoadGfx
	jmp	(DisplaySprite).l	; Display object
	
RKnight_Defeat:
	jmp	(DeleteObject).l	; Delete instance from memory
	
; ===========================================================================
; Subroutines
; ===========================================================================

RKnight_LoadGfx:
		move.b	obFrame(a0),d0				; get object's current frame
		cmp.b	Knight_Previous_Frame(a0),d0		; has the frame changed?
		beq.s	.end					; if not, nothing to do
		move.b	d0,Knight_Previous_Frame(a0)		; update cached frame number
		move.l	#DPLC_RKnight,a2			; load DPLC table
		move.w	#ArtTile_Roaring_Knight*tile_size,d4	; starting VRAM tile
		move.l	#Unc_RoaringKnight,d6			; art pointer
		jmp	(LoadDynPLC).l				; load DPLC
.end:
		rts						; return


; ===========================================================================
; Additional data (no graphics here pretty please!)
; ===========================================================================

Map_RKnight:
	include	"dotgen/knight/[MAPPINGS] The Roaring Knight.asm"
	
DPLC_RKnight:
	include	"dotgen/knight/[DPLC] The Roaring Knight.asm"