; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 1 format
; --------------------------------------------------------------------------------

SME_SvnnK:	
		dc.w SME_SvnnK_8-SME_SvnnK, SME_SvnnK_22-SME_SvnnK	
		dc.w SME_SvnnK_2D-SME_SvnnK, SME_SvnnK_47-SME_SvnnK	
SME_SvnnK_8:	dc.b 5	
		dc.b $CC, $F, 0, 0, $EC	
		dc.b $EC, $E, 0, $10, $EC	
		dc.b $CC, 7, 0, $1C, $C	
		dc.b $EC, $B, 0, $24, $C	
		dc.b 4, 0, 0, $30, $24	
SME_SvnnK_22:	dc.b 2	
		dc.b $CC, $F, 0, $31, $FC	
		dc.b $EC, $F, 0, $41, $FC	
SME_SvnnK_2D:	dc.b 5	
		dc.b $CC, $F, 0, $51, $EC	
		dc.b $EC, $F, 0, $61, $EC	
		dc.b $CC, $B, 0, $71, $C	
		dc.b $EC, $B, 0, $7D, $C	
		dc.b $EC, 1, 0, $89, $24	
SME_SvnnK_47:	dc.b 0	
		even