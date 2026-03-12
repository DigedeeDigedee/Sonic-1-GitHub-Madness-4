; ---------------------------------------------------------------------------
; Object 80 - Continue screen cursor
; ---------------------------------------------------------------------------

ContScrCur:
		moveq	#0,d0
	        move.w  #$400, obGfx(a0)
	        move.l  #.Cursor_SpriteMap, obMap(a0)
		move.w  #$F8, obX(a0)
		move.w  #$13A, obScreenY(a0)
		jmp	(DisplaySprite).l

; ===========================================================================

.Delete:
		jmp	(DeleteObject).l

.Cursor_SpriteMap: incbin "ContinueScreen/Graphics/Sprite/Cursor/Map.bin"
	even
