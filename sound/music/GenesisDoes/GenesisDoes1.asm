GenesisDoes1_Header:
    smpsHeaderStartSong 1
    smpsHeaderVoice     GenesisDoes1_Voices
    smpsHeaderChan      $01, $00
    smpsHeaderTempo     $01, $03

    smpsHeaderDAC       GenesisDoes1_DAC

GenesisDoes1_DAC:
    dc.b    dGenesisDoes1         ; play BGM sample
    smpsStop

GenesisDoes1_Voices:
	smpsFooterEndSong	"GenesisDoes/GenesisDoes1.asm"