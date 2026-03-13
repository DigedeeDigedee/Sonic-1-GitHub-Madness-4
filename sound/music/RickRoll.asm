RickRoll_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     RickRoll_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $02

	smpsHeaderDAC       RickRoll_DAC
	smpsHeaderFM        RickRoll_FM1,	$0C, $0A
	smpsHeaderFM        RickRoll_FM2,	$00, $08
	smpsHeaderFM        RickRoll_FM3,	$E8, $14
	smpsHeaderFM        RickRoll_FM4,	$E8, $15
	smpsHeaderFM        RickRoll_FM5,	$E8, $15
	smpsHeaderPSG       RickRoll_PSG1,	$DC, $05, $00, $00
	smpsHeaderPSG       RickRoll_PSG2,	$D0, $02, $00, $00
	smpsHeaderPSG       RickRoll_PSG3,	$23, $02, $00, $00

; FM1 Data
RickRoll_FM1:
	dc.b	nRst, $18
	smpsSetvoice        $00
	dc.b	nBb1, $06, nRst, $02, nFs1, $04, nRst

RickRoll_Jump05:
	smpsSetvoice        $00
	dc.b	nEb1, $04, nRst, nEb1, nEb1, $01, nRst, $07, nC2, $04, nBb1, nRst
	dc.b	nAb1, nRst, nAb1, nRst, $0C, nEb1, $04, nAb1, nF1, nRst, nF1, nC2
	dc.b	nRst, nC2, nBb1, nRst, $0C, nBb1, $04, $01, nRst, $07, nC2, $04
	dc.b	nBb1, nRst, nEb1, nRst, nEb1, nC2, nRst, nC2, nBb1, nRst, nAb1, nRst
	dc.b	nAb1, nRst, $0C, nEb1, $04, $01, nRst, $03, nF1, $04, nRst, nF1
	dc.b	nF1, $01, nRst, $07, nC2, $04, nBb1, nRst, $0C, nAb1, $04, nRst
	dc.b	nCs2, nBb1, nRst, nCs2, nEb1, nRst, nEb1, nEb1, $01, nRst, $07, nC2
	dc.b	$04, nBb1, nRst, nAb1, nRst, nAb1, nRst, $0C, nEb1, $04, nAb1, nF1
	dc.b	nRst, nF1, nC2, nRst, nC2, nBb1, nRst, $0C, nBb1, $04, $01, nRst
	dc.b	$07, nC2, $04, nBb1, nRst, nEb1, nRst, nEb1, nC2, nRst, nC2, nBb1
	dc.b	nRst, nAb1, nRst, nAb1, nRst, $0C, nEb1, $04, $01, nRst, $03, nF1
	dc.b	$04, nRst, nF1, nF1, $01, nRst, $07, nC2, $04, nBb1, nRst, $0C
	dc.b	nAb1, $04, nRst, nCs2, nBb1, nRst, nCs2, nBb1, $03, nRst, $05, nBb1
	dc.b	$03, nRst, $01, nBb1, $04, nRst, nCs2, nC2, nRst, nAb1, $05, nRst
	dc.b	$03, nBb1, $04, nRst, $0C, nF1, $04, nBb1, $03, nRst, $09, nAb1
	dc.b	$03, nRst, $01, nBb1, $04, nRst, nCs2, nC2, $03, nRst, $0D, nBb1
	dc.b	$04, nRst, $0C, nAb1, $03, nRst, $01, nAb1, $03, nRst, $01, nBb1
	dc.b	$04, nRst, nBb1, $03, nRst, $01, nBb1, $04, nRst, nCs2, nC2, $03
	dc.b	nRst, $05, nAb1, nRst, $03, nBb1, $04, nRst, $0C, nAb1, $03, nRst
	dc.b	$01, nAb1, $03, nRst, $01, nEb1, $05, nRst, $03, nEb1, nRst, $01
	dc.b	nAb1, $05, nRst, $03, nAb1, $02, nRst, nAb1, $04, nRst, $0C, nAb1
	dc.b	$03, nRst, $01, nAb1, $04, nRst, nAb1, $03, nRst, $01, nBb1, $02
	dc.b	nRst, nBb1, $03, nRst, $01, nBb1, $03, nRst, $05, nBb1, $03, nRst
	dc.b	$01, nBb1, $04, nRst, nCs2, nC2, nRst, nAb1, $05, nRst, $03, nBb1
	dc.b	$04, nRst, $0C, nF1, $04, nBb1, $03, nRst, $09, nAb1, $03, nRst
	dc.b	$01, nBb1, $04, nRst, nCs2, nC2, $03, nRst, $0D, nBb1, $04, nRst
	dc.b	$0C, nAb1, $03, nRst, $01, nAb1, $03, nRst, $01, nBb1, $04, nRst
	dc.b	nBb1, $03, nRst, $01, nBb1, $04, nRst, nCs2, nC2, $03, nRst, $05
	dc.b	nAb1, nRst, $03, nBb1, $04, nRst, $0C, nAb1, $03, nRst, $01, nAb1
	dc.b	$03, nRst, $01, nEb1, $05, nRst, $03, nEb1, nRst, $01, nAb1, $05
	dc.b	nRst, $03, nAb1, $02, nRst, nAb1, $04, nRst, $0C, nAb1, $03, nRst
	dc.b	$01, nAb1, $04, nRst, nAb1, $03, nRst, $01, nBb1, $02, nRst, nBb1
	dc.b	$03, nRst, $01, nBb1, $03, nRst, $05, nBb1, $03, nRst, $01, nCs2
	dc.b	$04, nRst, nCs2, nC2, nRst, nAb1, $05, nRst, $03, nBb1, $04, nRst
	dc.b	$10, nAb1, $03, nRst, $01, nBb1, $03, nRst, $05, nBb1, $03, nRst
	dc.b	$01, nCs2, $04, nRst, nCs2, nC2, $03, nRst, $05, nAb1, $04, nRst
	dc.b	nBb1, nRst, $0C, nAb1, $03, nRst, $01, nAb1, $03, nRst, $01, nBb1
	dc.b	$04, nRst, nBb1, $03, nRst, $01, nCs2, $04, nRst, nCs2, nC2, $03
	dc.b	nRst, $05, nAb1, nRst, $03, nBb1, $04, nRst, $10, nAb1, $03, nRst
	dc.b	$01, nBb1, $04, nRst, nBb1, $03, nRst, $01, nCs2, $04, nRst, nCs2
	dc.b	nC2, nRst, nAb1, nRst, nBb1, nRst, nF1, $05, nRst, $03, nAb1, $04
	dc.b	nF1, $03, nRst, $01, nEb1, $04, nRst, nEb1, nEb1, $01, nRst, $07
	dc.b	nC2, $04, nBb1, nRst, nAb1, nRst, nAb1, nRst, $0C, nEb1, $04, nAb1
	dc.b	nF1, nRst, nF1, nC2, nRst, nC2, nBb1, nRst, $0C, nBb1, $04, $01
	dc.b	nRst, $07, nC2, $04, nBb1, nRst, nEb1, nRst, nEb1, nC2, nRst, nC2
	dc.b	nBb1, nRst, nAb1, nRst, nAb1, nRst, $0C, nEb1, $04, $01, nRst, $03
	dc.b	nF1, $04, nRst, nF1, nF1, $01, nRst, $07, nC2, $04, nBb1, nRst
	dc.b	$0C, nAb1, $04, nRst, nCs2, nBb1, nRst, nCs2, nEb1, nRst, nEb1, nEb1
	dc.b	$01, nRst, $07, nC2, $04, nBb1, nRst, nAb1, nRst, nAb1, nRst, $0C
	dc.b	nEb1, $04, nAb1, nF1, nRst, nF1, nC2, nRst, nC2, nBb1, nRst, $0C
	dc.b	nBb1, $04, $01, nRst, $07, nC2, $04, nBb1, nRst, nEb1, nRst, nEb1
	dc.b	nC2, nRst, nC2, nBb1, nRst, nAb1, nRst, nAb1, nRst, $0C, nEb1, $04
	dc.b	$01, nRst, $03, nF1, $04, nRst, nF1, nF1, $01, nRst, $07, nC2
	dc.b	$04, nBb1, nRst, $0C, nAb1, $04, nRst, nCs2, nBb1, nRst, nCs2
	smpsJump            RickRoll_Jump05

; FM2 Data
RickRoll_FM2:
	smpsSetvoice        $00
	dc.b	nRst, $1C, nAb2, $05, nRst, $03, nF2, $05

RickRoll_Jump04:
	dc.b	nRst, $7F, $7F, $7F, $7F, $12
	smpsSetvoice        $01
	dc.b	nBb3, $06, nRst, $02, nC4, $01, nRst, $07, nCs4, $06, nRst, $02
	dc.b	nCs4, $04, nRst, nEb4, $03, nRst, $05, nC4, $09, nRst, $03, nBb3
	dc.b	$01, nRst, $03, nAb3, $16, nRst, $2A, nBb3, $05, nRst, $03, nBb3
	dc.b	$06, nRst, $02, nC4, $06, nRst, $02, nCs4, $06, nRst, $02, nBb3
	dc.b	nRst, $0E, nAb3, $03, nRst, $05, nAb4, $08, nRst, nAb4, $05, nRst
	dc.b	$03, nEb4, $17, nRst, $19, nBb3, $02, nRst, $06, nBb3, nRst, $02
	dc.b	nC4, $01, nRst, $07, nCs4, $06, nRst, $02, nBb3, nRst, $06, nCs4
	dc.b	nRst, $02, nEb4, nRst, $0E, nC4, $06, nRst, $02, nBb3, $05, nRst
	dc.b	$03, nC4, $01, nRst, $03, nBb3, $01, nRst, $03, nAb3, $10, nRst
	dc.b	$18, nBb3, $05, nRst, $03, nBb3, $06, nRst, $02, nC4, $03, nRst
	dc.b	$05, nCs4, $06, nRst, $02, nBb3, nRst, $06, nAb3, $0A, nRst, $06
	dc.b	nEb4, nRst, $02, nEb4, $05, nRst, $03, nEb4, $05, nRst, $03, nF4
	dc.b	$05, nRst, $03, nEb4, $10, nRst, nCs4, $22, nRst, $06, nEb4, $02
	dc.b	nRst, $06, nF4, nRst, $02, nEb4, $0D, nRst, $03, nEb4, $02, nRst
	dc.b	$06, nEb4, nRst, $02, nF4, $05, nRst, $03, nEb4, $06, nRst, $02
	dc.b	nAb3, $05, nRst, $03, nAb3, $0C, nRst, $1C, nAb3, $03, nRst, $05
	dc.b	nBb3, $06, nRst, $02, nC4, $03, nRst, $05, nCs4, $06, nRst, $02
	dc.b	nBb3, $03, nRst, $0D, nEb4, $06, nRst, $02, nF4, $05, nRst, $03
	dc.b	nEb4, $10, nRst, $08, nAb3, $02, nRst, nBb3, $01, nRst, $03, nCs4
	dc.b	$02, nRst, nBb3, $01, nRst, $03, nF4, $08, nRst, $04, nF4, $08
	dc.b	nRst, $04, nEb4, $0D, nRst, $0B, nAb3, $02, nRst, nBb3, $01, nRst
	dc.b	$03, nCs4, $02, nRst, nBb3, $01, nRst, $03, nEb4, $09, nRst, $03
	dc.b	nEb4, $08, nRst, $04, nCs4, $08, nRst, $04, nC4, $02, nRst, nBb3
	dc.b	$06, nRst, $02, nAb3, $01, nRst, $03, nBb3, $01, nRst, $03, nCs4
	dc.b	$02, nRst, nBb3, $01, nRst, $03, nCs4, $0C, nRst, $04, nEb4, $03
	dc.b	nRst, $05, nC4, $0A, nRst, $02, nBb3, $01, nRst, $03, nAb3, $0C
	dc.b	nRst, $04, nAb3, $03, nRst, $05, nEb4, $07, nRst, $01, nCs4, $05
	dc.b	nRst, $03, nCs4, $0E, nRst, $12, nAb3, $01, nRst, $03, nBb3, $01
	dc.b	nRst, $03, nCs4, $02, nRst, nBb3, $01, nRst, $03, nF4, $0D, nRst
	dc.b	$03, nF4, $05, nRst, $03, nEb4, $0E, nRst, $0A, nAb3, $01, nRst
	dc.b	$03, nBb3, $01, nRst, $03, nCs4, $02, nRst, nBb3, $01, nRst, $03
	dc.b	nAb4, $0D, nRst, $03, nCs4, $02, nRst, $06, nCs4, $0B, nRst, $01
	dc.b	nC4, nRst, $03, nBb3, $06, nRst, $02, nAb3, $01, nRst, $03, nBb3
	dc.b	$01, nRst, $03, nCs4, $02, nRst, nBb3, $01, nRst, $03, nCs4, $0D
	dc.b	nRst, $03, nEb4, $02, nRst, $06, nC4, $0A, nRst, $02, nBb3, $01
	dc.b	nRst, $03, nAb3, $0C, nRst, $04, nAb3, $03, nRst, $05, nEb4, $0D
	dc.b	nRst, $03, nCs4, $11, nRst, $21
	smpsJump            RickRoll_Jump04

; FM3 Data
RickRoll_FM3:
	dc.b	nRst, $28

RickRoll_Jump03:
	smpsSetvoice        $02
	dc.b	nF4, $18, nEb4, $28, $18, nF4, $28, $18, nEb4, $28, $18, nF4
	dc.b	$28, $18, nEb4, $28, $18, nF4, $28, nCs4, $18, nAb3, $28, nEb4
	dc.b	$10, nF4, $30, $40, nEb4, $40, nF4, nF4, $18, nEb4, $28, nF4
	dc.b	$40, nEb4, nF4, nF4, $18, nEb4, $28, nCs4, $38, nEb4, $48, nCs4
	dc.b	$40, nF4, $18, nEb4, $28, nF4, $18, nEb4, $28, $18, nF4, $28
	dc.b	$18, nEb4, $28, $18, nF4, $28, $18, nEb4, $28, $18, nF4, $28
	dc.b	nCs4, $18, nAb3, $28, nEb4, $10, nF4, $30
	smpsJump            RickRoll_Jump03

; FM4 Data
RickRoll_FM4:
	smpsPan             panRight, $00
	dc.b	nRst, $28

RickRoll_Jump02:
	smpsSetvoice        $02
	dc.b	nCs4, $18, nC4, $28, $18, nCs4, $28, $18, nC4, $28, $18, nCs4
	dc.b	$28, $18, nC4, $28, $18, nCs4, $28, nBb3, $18, nEb4, $28, nC4
	dc.b	$10, nCs4, $30, $40, nC4, $40, nCs4, nCs4, $18, nC4, $28, nCs4
	dc.b	$40, nC4, nCs4, nCs4, $18, nC4, $28, nBb3, $38, nC4, $48, nBb3
	dc.b	$40, nCs4, $18, nC4, $28, nCs4, $18, nC4, $28, $18, nCs4, $28
	dc.b	$18, nC4, $28, $18, nCs4, $28, $18, nC4, $28, $18, nCs4, $28
	dc.b	nBb3, $18, nEb4, $28, nC4, $10, nCs4, $30
	smpsJump            RickRoll_Jump02

; FM5 Data
RickRoll_FM5:
	smpsPan             panLeft, $00
	dc.b	nRst, $28

RickRoll_Jump01:
	smpsSetvoice        $02
	dc.b	nBb3, $18, nAb3, $28, $18, nBb3, $28, $18, nAb3, $28, $18, nBb3
	dc.b	$28, $18, nAb3, $28, $18, nBb3, $28, nFs3, $18, nC4, $28, nAb3
	dc.b	$10, $30, nBb3, $40, $40, $40, $18, $28, $40, $40, $40, $18
	dc.b	$28, nFs3, $38, nAb3, $48, nFs3, $40, nBb3, $18, nAb3, $28, nBb3
	dc.b	$18, nAb3, $28, $18, nBb3, $28, $18, nAb3, $28, $18, nBb3, $28
	dc.b	$18, nAb3, $28, $18, nBb3, $28, nFs3, $18, nC4, $28, nAb3, $10
	dc.b	$30
	smpsJump            RickRoll_Jump01

; PSG2 Data
RickRoll_PSG2:
	dc.b	nRst, $28

RickRoll_Jump07:
	smpsPSGvoice        $00
	dc.b	nCs6, $18, nEb6, $20, nAb5, $08, nEb6, $18, nF6, nAb6, $04, nFs6
	dc.b	nF6, nCs6, $1C, nEb6, $18, nAb5, $30, nCs6, $01, nRst, $03, nCs6
	dc.b	$01, nRst, $07, nCs6, $01, nRst, $03, nCs6, $01, nRst, $03, nCs6
	dc.b	$01, nRst, $03, nCs6, $01, nRst, $03, nCs6, $02, nRst, nCs6, $18
	dc.b	nEb6, $20, nAb5, $08, nEb6, $18, nF6, nAb6, $04, nFs6, nF6, nCs6
	dc.b	$1C, nEb6, $18, nAb5, $30, nCs6, $01, nRst, $03, nCs6, $01, nRst
	dc.b	$07, nCs6, $01, nRst, $03, nCs6, $01, nRst, $03, nCs6, $01, nRst
	dc.b	$03, nCs6, $01, nRst, $03, nCs6, $02, nRst, $7F, $3B, nAb4, $08
	dc.b	nAb5, $10, $08, nEb5, $10, nF5, $08, nEb5, nCs5, $03, nRst, $7F
	dc.b	$06, nAb5, $48, nF5, $04, nRst, $0C, nEb5, $10, nCs5, $05, nRst
	dc.b	$0B, nBb4, $32, nRst, $7F, $2F, nAb4, $10, nAb5, $01, nRst, $03
	dc.b	nAb5, $01, nRst, $03, nAb5, $01, nRst, $03, nBb5, $02, nRst, nCs6
	dc.b	$01, nRst, $03, nBb5, $01, nRst, $03, nCs6, $18, nEb6, $20, nAb5
	dc.b	$08, nEb6, $18, nF6, nAb6, $04, nFs6, nF6, nCs6, $1C, nEb6, $18
	dc.b	nAb5, $30, $02, nRst, $02, nAb5, nRst, $06, nAb5, $01, nRst, $03
	dc.b	nAb5, $01, nRst, $03, nBb5, $01, nRst, $03, nCs6, $01, nRst, $03
	dc.b	nCs6, $02, nRst, nCs6, $18, nEb6, $20, nAb5, $08, nEb6, $18, nF6
	dc.b	nAb6, $04, nFs6, nF6, nCs6, $1C, nEb6, $18, nAb5, $30, nCs6, $01
	dc.b	nRst, $03, nCs6, $01, nRst, $07, nCs6, $01, nRst, $03, nCs6, $01
	dc.b	nRst, $03, nCs6, $01, nRst, $03, nCs6, $01, nRst, $03, nCs6, $02
	dc.b	nRst
	smpsJump            RickRoll_Jump07

; PSG3 Data
RickRoll_PSG3:
	smpsPSGform         $E7
	dc.b	nRst, $28
	smpsPSGform         $E7

RickRoll_Jump06:
	smpsPSGvoice        fTone_02
	dc.b	nAb6, $04, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05
	dc.b	nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03
	dc.b	nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6
	dc.b	$03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05
	dc.b	nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03
	dc.b	nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $08
	smpsPSGvoice        fTone_02
	dc.b	$04, nRst, $04, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst, nAb6, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03
	dc.b	nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6
	dc.b	$03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05
	dc.b	nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03
	dc.b	nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6
	dc.b	$03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $01, nAb6
	dc.b	$04, nRst, $08, nAb6, $04, nRst, nAb6, nAb6, $03, nRst, $01, nAb6
	dc.b	$03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6
	dc.b	$04, $03, nRst, $01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst
	dc.b	$01, nAb6, $03, nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03
	dc.b	nRst, $05, nAb6, $04, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $04, nRst
	smpsPSGvoice        fTone_02
	dc.b	nAb6, nRst, nAb6, nAb6, $03, nRst, $01, nAb6, $03, nRst, $05
	smpsPSGvoice        fTone_01
	dc.b	nAb6, $08
	smpsJump            RickRoll_Jump06

; DAC Data
RickRoll_DAC:
	dc.b	$8C, $04, $04, nRst, $04, $8C, $8C, $8C, $8E, $8E, $8F, $8F

RickRoll_Jump00:
	dc.b	dKick, $10, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick
	dc.b	dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick
	dc.b	dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick
	dc.b	dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick
	dc.b	dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick
	dc.b	dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick
	dc.b	dSnare, dKick, dSnare, dKick, dSnare, dKick, $08, dSnare, dKick, dKick, dSnare, $0C
	dc.b	$04, $04, $04, $04, $04, dKick, $10, dSnare, dKick, dSnare, dKick, dSnare
	dc.b	dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare
	dc.b	dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare
	dc.b	dKick, dSnare
	smpsJump            RickRoll_Jump00

RickRoll_Voices:
;	Voice $00
;	$3C
;	$01, $00, $00, $00, 	$1F, $1F, $15, $1F, 	$11, $0D, $12, $05
;	$07, $04, $09, $02, 	$55, $3A, $25, $1A, 	$1A, $80, $07, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $15, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $12, $0D, $11
	smpsVcDecayRate2    $02, $09, $04, $07
	smpsVcDecayLevel    $01, $02, $03, $05
	smpsVcReleaseRate   $0A, $05, $0A, $05
	smpsVcTotalLevel    $00, $07, $00, $1A

;	Voice $01
;	$3A
;	$01, $07, $01, $01, 	$8E, $8E, $8D, $53, 	$0E, $0E, $0E, $00
;	$00, $00, $00, $04, 	$1F, $FF, $1F, $0F, 	$18, $28, $27, $00
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $07, $01
	smpsVcRateScale     $01, $02, $02, $02
	smpsVcAttackRate    $13, $0D, $0E, $0E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $0E, $0E, $0E
	smpsVcDecayRate2    $04, $00, $00, $00
	smpsVcDecayLevel    $00, $01, $0F, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $27, $28, $18

;	Voice $02
;	$2C
;	$74, $74, $34, $34, 	$1F, $12, $1F, $1F, 	$00, $00, $00, $00
;	$00, $01, $00, $01, 	$0F, $3F, $0F, $3F, 	$16, $80, $17, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $07, $07
	smpsVcCoarseFreq    $04, $04, $04, $04
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $12, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $01, $00, $01, $00
	smpsVcDecayLevel    $03, $00, $03, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $17, $00, $16


; PSG1 Data
RickRoll_PSG1:
	dc.b	$16, nRst, $17, nRst
	smpsStop
