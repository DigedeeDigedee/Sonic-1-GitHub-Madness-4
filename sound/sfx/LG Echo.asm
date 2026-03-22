LG_Echo_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     LG_Echo_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cPSG1, LG_Echo_PSG1,	$00, $00

; PSG1 Data
LG_Echo_PSG1:
	dc.b	nD2, $0D, nE2, $07, nA2, $0D, nFs2, $0F
	smpsStop

; Song seems to not use any FM voices
LG_Echo_Voices:
	smpsFooterEndSong	"LG Echo.asm"