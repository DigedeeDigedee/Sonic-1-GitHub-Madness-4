GenesisCan2_Header:
    smpsHeaderStartSong 1
    smpsHeaderVoice     GenesisCan2_Voices
    smpsHeaderChan      $01, $00
    smpsHeaderTempo     $01, $03

    smpsHeaderDAC       GenesisCan2_DAC

GenesisCan2_DAC:
    dc.b    dGenesisCan2         ; play BGM sample
    smpsStop

GenesisCan2_Voices:
	smpsFooterEndSong	"GenesisDoes/GenesisCan2.asm"