; ---------------------------------------------------------------------------
; Animation script - "TM" and "PRESS START BUTTON" on the title screen
; ---------------------------------------------------------------------------
Ani_PSBTM:	dc.w .flash-Ani_PSBTM
.flash:		dc.b $5, 0, 1, 1, 1, 1, 1, 1, 1,	afEnd
		even
