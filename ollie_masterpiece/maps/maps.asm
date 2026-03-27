; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Maps
; ------------------------------------------------------------------------------

ol_MapIndex:
	dc.l	.Test						; Test map

; ------------------------------------------------------------------------------
; Test map
; ------------------------------------------------------------------------------

.Test:
	dc.l	.TestGfx					; Graphics
	dc.l	.TestPalette					; Palette
	dc.l	.TestBlocks					; Blocks
	dc.l	.TestChunks					; Chunks
	dc.l	.TestForeground					; Foreground
	dc.l	.TestCollision					; Collision
	dc.l	0						; Objects
	dc.w	0, $300, 0, $300				; Boundaries

.TestGfx:
	incbin	"test/gfx.nem"
	even
.TestPalette:
	incbin	"test/palette.bin"
	even
.TestBlocks:
	incbin	"test/blocks.bin"
	even
.TestChunks:
	incbin	"test/chunks.bin"
	even
.TestForeground:
	incbin	"test/foreground.bin"
	even
.TestCollision:
	incbin	"test/collision.bin"
	even

; ------------------------------------------------------------------------------
; Common data
; ------------------------------------------------------------------------------

ol_CollisionHeights:	
	incbin	"collision_heights.bin"
	even
ol_CollisionWidths:	
	incbin	"collision_widths.bin"
	even
ol_CollisionAngles:	
	incbin	"collision_angles.bin"
	even

; ------------------------------------------------------------------------------