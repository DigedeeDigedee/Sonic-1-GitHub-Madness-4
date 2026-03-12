
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
		bsr.w	Set_Fadeout		
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
		bsr.w   Set_ClearScreen
		move.l  #$40000000,($C00004).l      ; Art
		lea     (Nem_MarioTeam).l,a0  
		bsr.w   Set_NemDec
		
		lea     (Chunk).l,a1
		lea     (Eni_MarioTeam).l,a0  
		bsr.w   Set_VDPLoc
		bsr.w   Set_TilemapToVRAM
		
		moveq   #palid_Sonic,d0      
		bsr.w   Set_PalLoad2
		
		move.w  #$100,(Timer).w          ; Time     
		move.w  (VDP_buff).w,d0
		ori.b   #$40,d0
		move.w  d0,(VDPCtrl).l
		bsr.w	Set_Fadein
		

MarioTeam_Wait:
		bsr.w	Set_Fadeout		
		bsr.w   LoopDelay
		bne.s   MarioTeam_Wait

; ---------------------------------------------------------------------------

RickTeamheads_Screen:		
		bsr.w   Set_ClearScreen
		move.l  #$40000000,($C00004).l      ; Art
		lea     (Nem_RickTeam).l,a0   
		bsr.w   Set_NemDec
		
		lea     (Chunk).l,a1
		lea     (Eni_RickTeam).l,a0   
		bsr.w   Set_VDPLoc
		bsr.w   Set_TilemapToVRAM
		
		moveq   #palid_Savethemoonsonic,d0      
		bsr.w   Set_PalLoad2
		
		move.w  #$100,(Timer).w          ; Time
		move.w  (VDP_buff).w,d0
		ori.b   #$40,d0
		move.w  d0,(VDPCtrl).l
		bsr.w	Set_Fadein

RickTeam_Wait:
		bsr.w	Set_Fadeout
		bsr.w   LoopDelay
		bne.s   RickTeam_Wait

; ---------------------------------------------------------------------------

TeamTesticle_Screen:		
		bsr.w   Set_ClearScreen
		move.l  #$40000000,($C00004).l      ; Art
		lea     (Nem_Testicle).l,a0  
		bsr.w   Set_NemDec
		
		lea     (Chunk).l,a1
		lea     (Eni_Testicle).l,a0  
		bsr.w   Set_VDPLoc
		bsr.w   Set_TilemapToVRAM
		
		moveq   #palid_S2,d0      
		bsr.w   Set_PalLoad2		
		move.w  #$100,(Timer).w          ; Time
		move.w  (VDP_buff).w,d0
		ori.b   #$40,d0
		move.w  d0,(VDPCtrl).l
		bsr.w	Set_Fadein

Testicle_Wait:
		bsr.w	Set_Fadeout		
		bsr.w   LoopDelay
		bne.s   Testicle_Wait

Exit_Splashes:
		jmp	RunSplashes	
; ===========================================================================
; ---------------------------------------------------------------------------
; MISC
; ---------------------------------------------------------------------------
; ===========================================================================

Set_VDPLoc:
		jmp   VDP_Location
		rts
Set_TilemapToVRAM:		
		jmp  TilemapToVRAM
		rts
Set_Fadein:		
		jmp PaletteFadeIn		
        rts
Set_Fadeout:		
		jmp PaletteFadeOut		
        rts	
Set_ClearScreen:
        jmp ClearScreen
        rts	
Set_NemDec:
        jmp NemDec
        rts		
Set_PalLoad2:
        jmp  PalLoad2
        rts			
; ===========================================================================
; ---------------------------------------------------------------------------
; ART, MAPS AND PALETTE
; ---------------------------------------------------------------------------
; ===========================================================================
		
Nem_MarioTeam:  incbin  "Art/marioteam.nem"
                even
Eni_MarioTeam:  incbin  "Eni/marioteam.eni"
                even
Nem_RickTeam:   incbin  "Art/rick teamheads.nem"
                even
Eni_RickTeam:   incbin  "Eni/rick teamheads.eni"
                even
Nem_Testicle:   incbin  "Art/TEAM TESTICLE.nem"
                even
Eni_Testicle:   incbin  "Eni/TEAM TESTICLE.eni"	
                even	
Pal_S2:         incbin  "sonic2main.bin"	 
                even 
Pal_STMsonic:   incbin  "STMsonic.bin"	  
                even