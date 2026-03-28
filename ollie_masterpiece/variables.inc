; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Buffers
; ------------------------------------------------------------------------------

	phase v_ram_start_def
ol_map_row_1:		ds.w (512/8)+3				; Map row buffer 1
ol_map_row_2:		ds.w (512/8)				; Map row buffer 2
ol_map_column_1:	ds.w (256/8)+3				; Map column buffer 1
ol_map_column_2:	ds.w (256/8)				; Map column buffer 2

ol_palette:		equ v_palette				; Palette buffer
ol_sprites:		equ v_spritetablebuffer			; Sprite table buffer
ol_scroll_x:		equ v_hscrolltablebuffer		; Horizontal scroll buffer
ol_scroll_y:		equ v_scrposy_vdp			; Vertical scroll buffer

; ------------------------------------------------------------------------------

	if *>(v_ram_start_def+$8000)
		fatal "Ollie fucked up and used too much RAM for buffers!!! ($\{*-(v_ram_start_def+$8000)} byte(s))"
	else
		;message "Ollie has $\{(v_ram_start_def+$8000)-*} bytes available in RAM for buffers"
	endif
	dephase

; ------------------------------------------------------------------------------
; Variables
; ------------------------------------------------------------------------------

	phase v_ram_start_def+$8000
ol_map_id:		ds.b 1					; Map ID
			ds.b 1
ol_map_blocks:		ds.l 1					; Map blocks address
ol_map_chunks:		ds.l 1					; Map chunks address
ol_map_foreground:	ds.l 1					; Map foreground address
ol_map_collision:	ds.l 1					; Map collision address
ol_map_objects:		ds.l 1					; Map objects address
ol_map_left:		ds.w 1					; Map left boundary
ol_map_right:		ds.w 1					; Map right boundary
ol_map_top:		ds.w 1					; Map top boundary
ol_map_bottom:		ds.w 1					; Map bottom boundary

ol_camera_x:		ds.w 1					; Camera X position
ol_camera_y:		ds.w 1					; Camera Y position

; ------------------------------------------------------------------------------

	if *>v_ngfx_buffer
		fatal "Ollie fucked up and used too much RAM for variables!!! ($\{*-v_ngfx_buffer} byte(s))"
	else
		;message "Ollie has $\{v_ngfx_buffer-*} bytes available in RAM for variables"
	endif
	dephase

; ------------------------------------------------------------------------------