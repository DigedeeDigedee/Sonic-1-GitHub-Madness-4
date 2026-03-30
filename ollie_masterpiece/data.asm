; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Textbox
; ------------------------------------------------------------------------------

ol_TextboxGfx:
	incbin	"gfx/textbox.nem"
	even
ol_TextboxMapNoIcon:
	incbin	"tilemaps/textbox_no_icon.bin"
	even
ol_TextboxMapIcon:
	incbin	"tilemaps/textbox_icon.bin"
	even

; ------------------------------------------------------------------------------
; Player object
; ------------------------------------------------------------------------------

ol_PlayerGfx:
	incbin	"gfx/player_gfx.nem"
	even
ol_PlayerSprites:
	include	"sprites/player_sprites.asm"
	even
ol_PlayerAnims:
	include	"anims/player_anims.asm"
	even

ol_PlayerIcon:
	dc.l	ol_PlayerIconGfx
	dc.l	ol_PlayerIconGfxScript
	dc.l	ol_PlayerIconSprites
	dc.l	ol_PlayerIconAnims

ol_PlayerIconGfx:
	incbin	"gfx/player_icon_gfx.bin"
	even
ol_PlayerIconGfxScript:
	include	"gfx/player_icon_gfx_script.asm"
	even
ol_PlayerIconSprites:
	include	"sprites/player_icon_sprites.asm"
	even
ol_PlayerIconAnims:
	include	"anims/player_icon_anims.asm"
	even

; ------------------------------------------------------------------------------
; NPC object
; ------------------------------------------------------------------------------

ol_NpcGfx:
	incbin	"gfx/npc_gfx.nem"
	even
ol_NpcSprites:
	include	"sprites/npc_sprites.asm"
	even
ol_NpcAnims:
	include	"anims/npc_anims.asm"
	even

; ------------------------------------------------------------------------------
; Maps
; ------------------------------------------------------------------------------

ol_MapIndex:
	dc.l	ol_TestMap					; Test map

; ------------------------------------------------------------------------------
; Test map
; ------------------------------------------------------------------------------

ol_TestMap:
	dc.l	.Gfx						; Graphics
	dc.l	.Palette					; Palette
	dc.l	.Blocks						; Blocks
	dc.l	.Chunks						; Chunks
	dc.l	.Foreground					; Foreground
	dc.l	.Collision					; Collision
	dc.l	0						; Objects
	dc.w	0, $280, 0, $200				; Boundaries

.Gfx:
	incbin	"maps/test/gfx.nem"
	even
.Palette:
	incbin	"maps/test/palette.bin"
	even
.Blocks:
	incbin	"maps/test/blocks.bin"
	even
.Chunks:
	incbin	"maps/test/chunks.bin"
	even
.Foreground:
	incbin	"maps/test/foreground.bin"
	even
.Collision:
	incbin	"maps/test/collision.bin"
	even

; ------------------------------------------------------------------------------