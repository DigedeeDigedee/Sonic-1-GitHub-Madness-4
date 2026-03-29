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
; Test object
; ------------------------------------------------------------------------------

ol_TestSprites:
	include	"sprites/test_sprites.asm"
	even

ol_TestIcon:
	dc.l	ol_TestIconGfx
	dc.l	ol_TestIconGfxScript
	dc.l	ol_TestIconSprites
	dc.l	ol_TestIconAnims

ol_TestIconGfx:
	incbin	"gfx/test_icon_gfx.bin"
	even
ol_TestIconGfxScript:
	include	"gfx/test_icon_gfx_script.asm"
	even
ol_TestIconSprites:
	include	"sprites/test_icon_sprites.asm"
	even
ol_TestIconAnims:
	include	"anims/test_icon_anims.asm"
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