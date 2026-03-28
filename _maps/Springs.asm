; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 1 format
; --------------------------------------------------------------------------------

SME_bosrB:	
		dc.w SME_bosrB_C-SME_bosrB, SME_bosrB_17-SME_bosrB	
		dc.w SME_bosrB_27-SME_bosrB, SME_bosrB_3C-SME_bosrB	
		dc.w SME_bosrB_47-SME_bosrB, SME_bosrB_57-SME_bosrB	
SME_bosrB_C:	dc.b 2	
		dc.b 0, 4, 0, 0, $F0	
		dc.b 0, 4, 8, 0, 0	
SME_bosrB_17:	dc.b 3	
		dc.b 0, 4, 0, 2, $F0	
		dc.b 0, 4, 8, 2, 0	
		dc.b $F8, 8, 0, 4, $F1	
SME_bosrB_27:	dc.b 4	
		dc.b 0, 4, 0, 2, $F0	
		dc.b 0, 4, 8, 2, 0	
		dc.b $F0, 1, 0, 7, $FC	
		dc.b $E8, 8, 0, 4, $F1	
SME_bosrB_3C:	dc.b 2	
		dc.b $F0, 1, 0, 9, $F8	
		dc.b 0, 1, $10, 9, $F8	
SME_bosrB_47:	dc.b 3	
		dc.b $F0, 1, 0, $B, $F8	
		dc.b 0, 1, $10, $B, $F8	
		dc.b $F0, 2, 0, $F, 0	
SME_bosrB_57:	dc.b 4	
		dc.b $F0, 1, 0, $B, $F8	
		dc.b 0, 1, $10, $B, $F8	
		dc.b $F0, 2, 0, $F, $10	
		dc.b $FC, 4, 0, $D, 0	
		even