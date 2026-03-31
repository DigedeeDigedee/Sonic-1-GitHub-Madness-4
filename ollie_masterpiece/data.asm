; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Common
; ------------------------------------------------------------------------------

ol_MainPalette:
	incbin	"palettes/main.bin"
	even
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
; Map objects
; ------------------------------------------------------------------------------

ol_MapObjectIndex:
	dc.l	ol_WarpObject					; Warp
	dc.l	ol_NpcObject					; NPC

; ------------------------------------------------------------------------------
; Player object
; ------------------------------------------------------------------------------

ol_PlayerGfx:
	incbin	"gfx/player.nem"
	even
ol_PlayerSprites:
	include	"sprites/player.asm"
	even
ol_PlayerAnims:
	include	"anims/player.asm"
	even

ol_PlayerIcon:
	dc.l	ol_PlayerIconGfx
	dc.l	ol_PlayerIconGfxScript
	dc.l	ol_PlayerIconSprites
	dc.l	ol_PlayerIconAnims

ol_PlayerIconGfx:
	incbin	"gfx/player_icon.bin"
	even
ol_PlayerIconGfxScript:
	include	"gfx/player_icon_script.asm"
	even
ol_PlayerIconSprites:
	include	"sprites/player_icon.asm"
	even
ol_PlayerIconAnims:
	include	"anims/player_icon.asm"
	even

; ------------------------------------------------------------------------------
; NPC object
; ------------------------------------------------------------------------------

ol_NpcGfx:
	incbin	"gfx/npc.nem"
	even
ol_NpcSprites:
	include	"sprites/npc.asm"
	even
ol_NpcAnims:
	include	"anims/npc.asm"
	even

; ------------------------------------------------------------------------------
; Maps
; ------------------------------------------------------------------------------

ol_MapIndex:
	dc.l	ol_TestMap					; Test map
	dc.l	ol_TestMap2					; Test map 2

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
	dc.l	.Objects					; Objects
	
.Boundaries:
	dc.w	0, $280, 0, $200				; Boundaries

.Entries:
	incbin	"maps/test/entry_1.bin"
	incbin	"maps/test/entry_2.bin"
	incbin	"maps/test/entry_3.bin"

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
.Objects:
	incbin	"maps/test/objects.bin"
	even

; ------------------------------------------------------------------------------
; Test map 2
; ------------------------------------------------------------------------------

ol_TestMap2:
	dc.l	.Gfx						; Graphics
	dc.l	.Palette					; Palette
	dc.l	.Blocks						; Blocks
	dc.l	.Chunks						; Chunks
	dc.l	.Foreground					; Foreground
	dc.l	.Collision					; Collision
	dc.l	.Objects					; Objects

.Boundaries:
	dc.w	0, $280, 0, $200				; Boundaries
	
.Entries:
	incbin	"maps/test_2/entry_1.bin"			; Entry 1
	incbin	"maps/test_2/entry_2.bin"			; Entry 2

.Gfx:
	incbin	"maps/test_2/gfx.nem"
	even
.Palette:
	incbin	"maps/test_2/palette.bin"
	even
.Blocks:
	incbin	"maps/test_2/blocks.bin"
	even
.Chunks:
	incbin	"maps/test_2/chunks.bin"
	even
.Foreground:
	incbin	"maps/test_2/foreground.bin"
	even
.Collision:
	incbin	"maps/test_2/collision.bin"
	even
.Objects:
	incbin	"maps/test_2/objects.bin"
	even

; ------------------------------------------------------------------------------
; Battle
; ------------------------------------------------------------------------------

ol_TestBgGfx:
	incbin	"gfx/test_bg.nem"
	even
ol_TestBgPalette:
	incbin	"palettes/test_bg.bin"
	even
ol_TestBgMap:
	incbin	"tilemaps/test_bg.bin"
	even

; ------------------------------------------------------------------------------