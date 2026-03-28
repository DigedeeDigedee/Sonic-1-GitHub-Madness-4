; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Object structure
; ------------------------------------------------------------------------------

	phase 0
ol_obj_update		ds.l 1					; Update function address
ol_obj_draw		ds.l 1					; Draw function address
ol_obj_layer		ds.b 1					; Layer
ol_obj_flags		ds.b 1					; Flags
ol_obj_x		ds.l 1					; X position
ol_obj_y		ds.l 1					; Y position
ol_obj_x_speed		ds.w 1					; X speed
ol_obj_y_speed		ds.w 1					; Y speed
ol_obj_free		ds.b object_size-*			; Free space
ol_obj_struct_size	ds.b 0					; Size of structure
	dephase

; ------------------------------------------------------------------------------
; Buffers
; ------------------------------------------------------------------------------

	phase v_ram_start_def
ol_map_row_1:		ds.w (512/8)+3				; Map row buffer 1
ol_map_row_2:		ds.w (512/8)				; Map row buffer 2
ol_map_column_1:	ds.w (256/8)+3				; Map column buffer 1
ol_map_column_2:	ds.w (256/8)				; Map column buffer 2

ol_palette:		equ v_palette				; Palette buffer
ol_palette_fade:	equ v_palette_fading			; Palette fade buffer
ol_sprites:		equ v_spritetablebuffer			; Sprite table buffer
ol_scroll_x:		equ v_hscrolltablebuffer		; Horizontal scroll buffer
ol_scroll_y:		equ v_scrposy_vdp			; Vertical scroll buffer
ol_objects:		equ v_objspace				; Object pool
ol_objects_end:		equ v_objspace_end			; End of object pool
ol_object_draw:		equ v_spritequeue			; Object draw queue
ol_object_draw_end:	equ v_spritequeue_end			; End of object draw queue

ol_OBJECT_COUNT:	equ (ol_objects_end-ol_objects)/ol_obj_struct_size

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
ol_camera_prev_x:	ds.w 1					; Previous camera X position
ol_camera_prev_y:	ds.w 1					; Previous camera Y position

ol_sprite_slot:		ds.w 1					; Sprite slot address
ol_sprites_left:	ds.w 1					; Sprite slots left

ol_p1_ctrl_hold:	equ v_jpadhold1				; Player 1 controller buttons (held)
ol_p1_ctrl_tap:		equ v_jpadpress1			; Player 1 controller buttons (tapped)
ol_p2_ctrl_hold:	equ v_jpadholdp2			; Player 2 controller buttons (held)
ol_p2_ctrl_tap:		equ v_jpadpressp2			; Player 2 controller buttons (tapped)
ol_frame_count:		equ v_vbla_count			; Frame count
ol_vsync_flag:		equ v_vbla_routine			; VSync flag
ol_vblank_jmp:		equ v_vintcode.jmp			; V-BLANK interrupt jump opcode
ol_vblank_addr:		equ v_vintcode.addr			; V-BLANK interrupt address
ol_hblank_jmp:		equ v_hintcode.jmp			; H-BLANK interrupt jump opcode
ol_hblank_addr:		equ v_hintcode.addr			; H-BLANK interrupt address

; ------------------------------------------------------------------------------

	if *>v_ngfx_buffer
		fatal "Ollie fucked up and used too much RAM for variables!!! ($\{*-v_ngfx_buffer} byte(s))"
	else
		;message "Ollie has $\{v_ngfx_buffer-*} bytes available in RAM for variables"
	endif
	dephase

; ------------------------------------------------------------------------------