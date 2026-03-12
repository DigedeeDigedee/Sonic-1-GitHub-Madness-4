GenesisCan1_Header:
    smpsHeaderStartSong 1
    smpsHeaderVoice     GenesisCan1_Voices
    smpsHeaderChan      $01, $00
    smpsHeaderTempo     $01, $03

    smpsHeaderDAC       GenesisCan1_DAC

GenesisCan1_DAC:
    dc.b    dGenesisCan1         ; play BGM sample
    smpsStop

GenesisCan1_Voices:
	smpsFooterEndSong	"GenesisDoes/GenesisCan1.asm"