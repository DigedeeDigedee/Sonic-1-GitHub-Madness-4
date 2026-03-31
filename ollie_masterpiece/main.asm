; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Main
; ------------------------------------------------------------------------------

GM_OllieMasterpiece:
	moveq	#bgm_Stop|(~$FF),d0				; Stop sound
	jsr	QueueSound2

	jsr	PaletteFadeOut					; Fade out palette
	move.w	#$8134,ol_VDP_CTRL				; Disable display

	move.w	#$2700,sr					; Disable interrupts
	move.w	#$4EF9,ol_vblank_jmp.w				; Set V-BLANK interrupt routine
	move.l	#ol_SoundVBlank,ol_vblank_addr.w
	move.w	#$4E73,ol_hblank_jmp.w				; Disable H-BLANK interrupt

	bsr.w	ol_InitVdp					; Initialize VDP

	lea	v_ram_start,a0					; Buffers and variables
	moveq	#0,d0						; Zero
	move.w	#(v_ngfx_buffer-v_ram_start_def)/4-1,d1		; Length to clear

.ClearRam:
	move.l	d0,(a0)+					; Clear buffers and variables
	dbf	d1,.ClearRam					; Loop until finished

	move.w	#-7*2,ol_palette_fade.w				; Set initial fade brightness

	;bra.w	ol_Overworld					; Run overworld
	bra.w	ol_Battle					; Run battle

; ------------------------------------------------------------------------------
; Includes
; ------------------------------------------------------------------------------

	include	"interrupt.asm"
	include	"vdp.asm"
	include	"hblank.asm"
	include	"palette.asm"
	include	"sprite.asm"
	include	"animation.asm"
	include	"object.asm"
	include	"map.asm"
	include	"script.asm"
	include	"overworld.asm"
	include	"battle.asm"

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