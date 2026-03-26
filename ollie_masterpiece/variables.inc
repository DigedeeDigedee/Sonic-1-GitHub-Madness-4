; ------------------------------------------------------------------------------
; Ollie's Masterpiece RPG
; By Ollie_Ollie_TechDeck
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Buffers
; ------------------------------------------------------------------------------

	phase v_ram_start_def
ol_buffers:

ol_buffers_end:

; ------------------------------------------------------------------------------

	if *>v_ngfx_buffer
		fatal "Ollie fucked up and used too much RAM for buffers!!! ($\{*-v_ngfx_buffer} byte(s))"
	else
	;	message "Ollie has $\{v_ngfx_buffer-*} bytes available in RAM for buffers"
	endif
	dephase

; ------------------------------------------------------------------------------
; Variables
; ------------------------------------------------------------------------------

	phase v_levelvariables
ol_variables:

ol_variables_end:

; ------------------------------------------------------------------------------

	if *>v_levelvariables_end
		fatal "Ollie fucked up and used too much RAM for variables!!! ($\{*-v_levelvariables_end} byte(s))"
	else
	;	message "Ollie has $\{v_levelvariables_end-*} bytes available in RAM for variables"
	endif
	dephase

; ------------------------------------------------------------------------------