
; ===========================================================================
; ---------------------------------------------------------------------------
; VAR AND MACS
; ---------------------------------------------------------------------------
; ===========================================================================		

; Are the same from title code lol

; ===========================================================================
; ---------------------------------------------------------------------------
; GITHUB MADNESS 4: Atolly screens
; ---------------------------------------------------------------------------
; ===========================================================================

MultiSplash_Init:
		bsr.w	PaletteFadeOut		
		move    #$2700,sr           ; Goodbye inters!
		lea     (VDPCtrl).l,a6
		move.w  #$8004,(a6)          
		move.w  #$8230,(a6)          
		move.w  #$8407,(a6)          
		move.w  #$8B03,(a6)          
		move.w  #$8720,(a6)
		move.w  (VDP_buff).w,d0
		andi.b  #$BF,d0
		move.w  d0,(VDPCtrl).l

MarioTeam_Screen:
		bsr.w   ClearScreen
		move.l  #$40000000,($C00004).l      ; Art
		lea     (Nem_MarioTeam).l,a0  
		bsr.w   NemDec
		
		lea     (Chunk).l,a1
		lea     (Eni_MarioTeam).l,a0  
		bsr.w   VDP_Location
		bsr.w   TilemapToVRAM
		
		moveq   #palid_Sonic,d0      
		bsr.w   PalLoad2
		
		move.w  #$100,(Timer).w          ; Time     
		move.w  (VDP_buff).w,d0
		ori.b   #$40,d0
		move.w  d0,(VDPCtrl).l
		bsr.w	PaletteFadeIn
		

MarioTeam_Wait:
		bsr.w	PaletteFadeOut		
		bsr.w   LoopDelay
		bne.s   MarioTeam_Wait

; ---------------------------------------------------------------------------

RickTeamheads_Screen:		
		bsr.w   ClearScreen
		move.l  #$40000000,($C00004).l      ; Art
		lea     (Nem_RickTeam).l,a0   
		bsr.w   NemDec
		
		lea     (Chunk).l,a1
		lea     (Eni_RickTeam).l,a0   
		bsr.w   VDP_Location
		bsr.w   TilemapToVRAM
		
		moveq   #palid_Savethemoonsonic,d0      
		bsr.w   PalLoad2
		
		move.w  #$100,(Timer).w          ; Time
		move.w  (VDP_buff).w,d0
		ori.b   #$40,d0
		move.w  d0,(VDPCtrl).l
		bsr.w	PaletteFadeIn

RickTeam_Wait:
		bsr.w	PaletteFadeOut
		bsr.w   LoopDelay
		bne.s   RickTeam_Wait

; ---------------------------------------------------------------------------

TeamTesticle_Screen:		
		bsr.w   ClearScreen
		move.l  #$40000000,($C00004).l      ; Art
		lea     (Nem_Testicle).l,a0  
		bsr.w   NemDec
		
		lea     (Chunk).l,a1
		lea     (Eni_Testicle).l,a0  
		bsr.w   VDP_Location
		bsr.w   TilemapToVRAM
		
		moveq   #palid_S2,d0      
		bsr.w   PalLoad2		
		move.w  #$100,(Timer).w          ; Time
		move.w  (VDP_buff).w,d0
		ori.b   #$40,d0
		move.w  d0,(VDPCtrl).l
		bsr.w	PaletteFadeIn

Testicle_Wait:
		bsr.w	PaletteFadeOut		
		bsr.w   LoopDelay
		bne.s   Testicle_Wait

Exit_Splashes:
		; Next slash 

; ===========================================================================
; ---------------------------------------------------------------------------
; ART, MAPS AND PALETTE
; ---------------------------------------------------------------------------
; ===========================================================================
		
Nem_MarioTeam:  incbin  "Art/marioteam.nem"
Eni_MarioTeam:  incbin  "Eni/marioteam.eni"
Nem_RickTeam:   incbin  "Art/rick teamheads.nem"
Eni_RickTeam:   incbin  "Eni/rick teamheads.eni"
Nem_Testicle:   incbin  "Art/TEAM TESTICLE.nem"
Eni_Testicle:   incbin  "Eni/TEAM TESTICLE.eni"		
Pal_S2:   incbin  "sonic2main.bin"	  
Pal_STMsonic:   incbin  "STMsonic.bin"	  