SM64_MM_Header:
    smpsHeaderStartSong 1
    smpsHeaderVoice     SM64_MM_Voices
    smpsHeaderChan      $01, $00
    smpsHeaderTempo     $01, $03

    smpsHeaderDAC       SM64_MM_DAC

SM64_MM_DAC:
    dc.b    dSM64_MM         ; play BGM sample
    smpsStop

SM64_MM_Voices:
	smpsFooterEndSong	"GenesisDoes/SM64_MM.asm"