CometSTG2_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     CometSTG2_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $02, $0D

	smpsHeaderDAC       CometSTG2_DAC
	smpsHeaderFM        CometSTG2_FM1,	$00, $00
	smpsHeaderFM        CometSTG2_FM2,	$00, $00
	smpsHeaderFM        CometSTG2_FM3,	$00, $00
	smpsHeaderFM        CometSTG2_FM4,	$00, $08
	smpsHeaderFM        CometSTG2_FM5,	$00, $08
	smpsHeaderPSG       CometSTG2_PSG1,	$00, $00, $00, $00
	smpsHeaderPSG       CometSTG2_PSG2,	$00, $00, $00, $00
	smpsHeaderPSG       CometSTG2_PSG3,	$00, $04, $00, $00

; DAC Data
CometSTG2_DAC:
	dc.b	dKick, $03, dSnare, dSnare, dSnare, $06, $06, $1B
CometSTG2_DACJ:
	dc.b	dKick
CometSTG2_Loop00:
	dc.b	$03, $03, $03, $03, dSnare, dKick, dKick, dKick, dKick, dKick, dKick, $06
	dc.b	dSnare, dKick, $03, $03
	smpsLoop            $00, $07, CometSTG2_Loop00
	dc.b	$03, $03, $03, $03, dSnare, dKick, dKick, dKick, dKick, dKick, dKick, $06
	dc.b	dSnare, $03, $03, $03

CometSTG2_Loop01:
	dc.b	$03, dKick, dKick, dKick, dKick, dSnare, dKick, dKick, dKick, dKick, dKick, dKick
	dc.b	$06, dSnare, dKick, $03
	smpsLoop            $00, $07, CometSTG2_Loop01
	dc.b	$03, $03, $03, $03, $03, dSnare, dKick, dKick, dSnare, dSnare, dSnare, dSnare
	dc.b	$06, $03, $03, $03

CometSTG2_Loop02:
	dc.b	$03, dKick, dKick, dKick, dKick, dSnare, dKick, dKick, dKick, dKick, dKick, dKick
	dc.b	$06, dSnare, dKick, $03
	smpsLoop            $00, $03, CometSTG2_Loop02
	dc.b	$03, $03, $03, $03, $03, dSnare, dKick, dKick, dKick, dKick, dKick, dKick
	dc.b	$06, dSnare, $03, $03, $03

CometSTG2_Loop03:
	dc.b	$03, dKick, dKick, dKick, dKick, dSnare, dKick, dKick, dKick, dKick, dKick, dKick
	dc.b	$06, dSnare, dKick, $03
	smpsLoop            $00, $03, CometSTG2_Loop03
	dc.b	$03, $03, $03, $03, $03, dSnare, dKick, dKick

CometSTG2_Loop04:
	dc.b	dSnare
	smpsLoop            $00, $08, CometSTG2_Loop04
	dc.b	dSnare, $06
	smpsJump				CometSTG2_DACJ

; FM1 Data
CometSTG2_FM1:
	smpsSetvoice        $00
CometSTG2_Loop0F:
	dc.b	nD6, $02, nRst, $01
	smpsLoop            $00, $03, CometSTG2_Loop0F
	dc.b	nD6, $02, nRst, $04, nD6, $02, nRst, $04, nD6, $03, nRst, $18
CometSTG2_FM1J:
	dc.b	nA4, $03, nB4, nCs5, nE5, nFs5, $24, nRst, $0F, nF5, $03, nFs5
	dc.b	nAb5, nA5, $06, nB5, $02, nRst, $04, nAb5, $03, nRst, nFs5, nE5
	dc.b	$33, nRst, $0F, nE5, $03, nD5, nA4, nB4, $06, nCs5, $02, nRst
	dc.b	$04, nD5, $03, nE5, nF5, nFs5, $21, nE5, $02, nRst, $01, nE5
	dc.b	$02, nRst, $01, nD5, $03, nE5, nRst, nFs5, $06
	smpsAlterNote       $E7
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E6
	dc.b	nRst
	smpsAlterNote       $00
	dc.b	$19, nAb5, $03, nA5, nB5, nA5, nAb5, nFs5, nFs5, nG5, $01, nAb5
	dc.b	$03, nRst, $02, nE5, $21, nRst, $05, nA4, $01, nBb4, $02, nB4
	dc.b	$01, nCs5, $03, nFs5, nE5, nRst, $24, nA4, $03, nB4, nCs5, nD5
	dc.b	nFs5, $24, nRst, $0F, nF5, $03, nFs5, nAb5, nA5, $06, nB5, $02
	dc.b	nRst, $04, nAb5, $03, nRst, nFs5, nE5, $33, nRst, $0F, nE5, $03
	dc.b	nD5, nA4, nB4, $06, nCs5, $02, nRst, $04, nA5, $02, nRst, $04
	dc.b	nAb5, $03, nFs5, $21, nE5, $02, nRst, $01, nE5, $02, nRst, $01
	dc.b	nD5, $03, nE5, nRst, nFs5, $06
	smpsAlterNote       $E7
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $EB
	dc.b	nRst
	smpsAlterNote       $00
	dc.b	$0A, nF5, $03, nFs5, nAb5, nA5, $06, nB5, $02, nRst, $04, nCs6
	dc.b	$03, nD6, nRst, nE6, $33, nRst, $0F, nE6, $03, nF6, nFs6, nE6
	dc.b	$02, smpsNoAttack, nF6, smpsNoAttack, nE6, nD6, $03, nRst, nCs6, nRst, nB5, nRst
	dc.b	$09, nD4, $03, nE4, nFs4, $02, nRst, $01, nB4, $03, nCs5, nD5
	dc.b	nFs5, $09, nE5, nD5, $02, nRst, $04, nD5, $12, nCs5, $1E, nRst
	dc.b	$06
	smpsAlterVol        $04
	dc.b	nCs4, $03, nD4, nE4, $02, nRst, $01, nA4, $03, nB4, nCs5, nE5
	dc.b	$09, nD5, nCs5, $02, nRst, $04, nAb4, $12, nFs4, $1E, nRst, $03
	dc.b	nAb4, nA4, nCs5, $02, nRst, $01, nFs5, $24, nE4, $03, nFs4, nAb4
	dc.b	nA4, $02, nRst, $01, nE5, $24, nD4, $03, nE4, nFs4, nAb4, $02
	dc.b	nRst, $01, nD5, $24
	smpsAlterVol        $FC
	dc.b	nA3, $03, nB3, nCs4, nD4, nFs4, nE4, nFs4, nAb4, nB4, $02, nCs5
	dc.b	nA4, nB4, $03, nCs5, nE5, nFs5, nAb5, nB5
	smpsJump				CometSTG2_FM1J

; FM2 Data
CometSTG2_FM2:
	smpsSetvoice        $00
CometSTG2_Loop0C:
	dc.b	nA1, $02, nRst, $01
	smpsLoop            $00, $03, CometSTG2_Loop0C
	dc.b	nA1, $02, nRst, $04, nA1, $02, nRst, $04, nA1, $03, nRst, $0C
	smpsAlterNote       $FE
	dc.b	nE2, $06
	smpsAlterNote       $F3
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $15
	dc.b	smpsNoAttack, nEb2
	smpsAlterNote       $FF
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $14
	dc.b	smpsNoAttack, nD2
	smpsAlterNote       $00
	dc.b	smpsNoAttack, $01
CometSTG2_FM2J:
	dc.b	$09, $02, nRst, $07, nA1, $03, nB1, $02, nRst, $07
	dc.b	nD2, $02, nRst, $04, nA1, $03, nB1, $09, nD2, $07, nRst, $02
	dc.b	nD2, nRst, $07, nA1, $03, nB1, $02, nRst, $07, nD2, $02, nRst
	dc.b	$04, nA1, $03, nB1, $09, nCs2, nCs2, $02, nRst, $07, nAb1, $03
	dc.b	nB1, $02, nRst, $07, nCs2, $02, nRst, $04, nAb1, $03, nB1, $09
	dc.b	nA1, $02, nRst, $04, nA1, $02, nRst, $04, nE1, $03, nFs1, $02
	dc.b	nRst, $04, nA1, $06, $02, nRst, $04, nE1, $03, nFs1, $06, nE2
	dc.b	nD2, $09, $02, nRst, $04, nA1, $03, nB1, $02, nRst, $0A, nA1
	dc.b	$02, nRst, $04, nD2, $03, nCs2, $09, nB1, nB1, $02, nRst, $04
	dc.b	nFs1, $03, nA1, $02, nRst, $0A, nB1, $02, nRst, $04, nFs1, $03
	dc.b	nA1, nB1, $06, nE1, $09, $02, nRst, $04, nB1, $03, nE1, $02
	dc.b	nRst, $0A, nE1, $02, nRst, $04, nB1, $03, nE1, $09, $09, $02
	dc.b	nRst, $04, nB1, $03, nE1, $02, nRst, $0A, nE1, $02, nRst, $04
	dc.b	nE2, $03, nEb2, $09, nD2, nD2, $02, nRst, $07, nA1, $03, nB1
	dc.b	$02, nRst, $07, nD2, $02, nRst, $04, nA1, $03, nB1, $09, nD2
	dc.b	$07, nRst, $02, nD2, nRst, $07, nA1, $03, nB1, $02, nRst, $07
	dc.b	nD2, $02, nRst, $04, nA1, $03, nB1, $09, nCs2, nCs2, $02, nRst
	dc.b	$07, nAb1, $03, nB1, $02, nRst, $07, nCs2, $02, nRst, $04, nAb1
	dc.b	$03, nB1, $09, nA1, $02, nRst, $04, nA1, $02, nRst, $04, nE1
	dc.b	$03, nFs1, $02, nRst, $04, nA1, $06, $02, nRst, $04, nE1, $03
	dc.b	nFs1, $06, nE2, nD2, $09, $02, nRst, $04, nA1, $03, nB1, $02
	dc.b	nRst, $0A, nA1, $02, nRst, $04, nD2, $03, nCs2, $09, nB1, nB1
	dc.b	$02, nRst, $04, nFs1, $03, nA1, $02, nRst, $0A, nB1, $02, nRst
	dc.b	$04, nFs1, $03, nA1, nB1, $06, nE1, $09, $02, nRst, $04, nB1
	dc.b	$03, nE1, $02, nRst, $0A, nE1, $02, nRst, $04, nB1, $03, nE1
	dc.b	$09, $09, $02, nRst, $04, nB1, $03

CometSTG2_Loop0D:
	dc.b	nE1, $02, nRst, $04
	smpsLoop            $00, $03, CometSTG2_Loop0D
	dc.b	nE1, $03, nFs1, $09

CometSTG2_Loop0E:
	dc.b	nG1, $08, nRst, $01, nG1, $02, nRst, $07, nD1, $02, nRst, $0A
	dc.b	nD1, $02, nRst, $04, nG1, $06, nD1
	smpsLoop            $00, $02, CometSTG2_Loop0E
	dc.b	nFs1, $08, nRst, $01, nFs1, $02, nRst, $07, nCs2, $02, nRst, $0A
	dc.b	nCs2, $02, nRst, $04
	smpsAlterNote       $0E
	dc.b	nE2, $01, smpsNoAttack, nF2
	smpsAlterNote       $00
	dc.b	smpsNoAttack, nFs2, $04, nE2, $06, nEb2, $08, nRst, $01, nEb2, $02, nRst
	dc.b	$07, nEb2, $02, nRst, $16, nEb2, $06, nD2, $08, nRst, $01, nD2
	dc.b	$02, nRst, $07, nA1, $02, nRst, $0A, nA1, $02, nRst, $04, nD2
	dc.b	$06, nCs2, nB1, $08, nRst, $01, nB1, $02, nRst, $07, nFs1, $02
	dc.b	nRst, $0A, nFs1, $02, nRst, $04, nB1, $06, nA1, nAb1, $08, nRst
	dc.b	$01, nAb1, $02, nRst, $07, nAb1, $02, nRst, $0A, nA1, $02, nRst
	dc.b	$04, nB1, $06, nCs2, nE2, $08, nRst, $01, nE2, $02, nRst, $07
	dc.b	nE2, $02, nRst, $16, nE2, $06
	smpsJump				CometSTG2_FM2J

; FM3 Data
CometSTG2_FM3:
	smpsSetvoice        $00
CometSTG2_Loop09:
	dc.b	nB5, $02, nRst, $01
	smpsLoop            $00, $03, CometSTG2_Loop09
	dc.b	nB5, $02, nRst, $04, nB5, $02, nRst, $04, nB5, $02, nRst, $19
CometSTG2_FM3J:
CometSTG2_Loop0A:
	dc.b	nCs5, $08, nRst, $01, nCs5, $02, nRst, $07, nCs5, $1E, nRst, $06
	dc.b	nCs5, $02, nRst, $07, nCs5, $02, nRst, $07, nCs5, $0C, nB4, nRst
	dc.b	$09, nB4, $02, nRst, $07, nB4, $1E, nRst, $06, nB4, $02, nRst
	dc.b	$07, nB4, $02, nRst, $07, nD5, $0B, nRst, $01, nD5, $0B, nRst
	dc.b	$01, nCs5, $08, nRst, $01, nCs5, $02, nRst, $07, nCs5, $1E, nRst
	dc.b	$06, nCs5, $02, nRst, $07, nCs5, $02, nRst, $07, nCs5, $0C, nD5
	dc.b	nE5, $08, nRst, $01, nE5, $02, nRst, $07, nE5, $1E, nRst, $06
	dc.b	nE5, $02, nRst, $07, nE5, $02, nRst, $07, nD5, $0B, nRst, $01
	dc.b	nD5, $0B, nRst, $01
	smpsLoop            $00, $02, CometSTG2_Loop0A
	dc.b	nCs5, $30, nD5, $0F, nRst, $03, nCs5, $1E

CometSTG2_Loop0B:
	dc.b	nB4, $0F, nRst, $03, nA4, $1E
	smpsLoop            $00, $02, CometSTG2_Loop0B
	dc.b	nRst, $24, nB4, $0C, nCs5, $02, smpsNoAttack, nD5, $01, smpsNoAttack, nCs5, $21
	dc.b	nE5, $0C, nD5, $30, nRst, $12, nE5, $1E
	smpsJump				CometSTG2_FM3J

; FM4 Data
CometSTG2_FM4:
CometSTG2_Loop07:
	dc.b	nG5, $02, nRst, $01
	smpsLoop            $00, $03, CometSTG2_Loop07
	dc.b	nG5, $02, nRst, $04, nG5, $02, nRst, $04, nG5, $02, nRst, $19
CometSTG2_FM4J:
CometSTG2_Loop08:
	dc.b	nA4, $08, nRst, $01, nA4, $02, nRst, $07, nA4, $1E, nRst, $06
	dc.b	nAb4, $02, nRst, $07, nAb4, $02, nRst, $07, nAb4, $18, nRst, $09
	dc.b	nAb4, $02, nRst, $07, nAb4, $1E, nRst, $06, nAb4, $02, nRst, $07
	dc.b	nAb4, $02, nRst, $07, nB4, $0B, nRst, $01, nB4, $0B, nRst, $01
	dc.b	nA4, $08, nRst, $01, nA4, $02, nRst, $07, nA4, $1E, nRst, $06
	dc.b	nA4, $02, nRst, $07, nA4, $02, nRst, $07, nA4, $18, nCs5, $08
	dc.b	nRst, $01, nCs5, $02, nRst, $07, nCs5, $1E, nRst, $06, nCs5, $02
	dc.b	nRst, $07, nCs5, $02, nRst, $07, nA4, $0B, nRst, $01, nA4, $0B
	dc.b	nRst, $01
	smpsLoop            $00, $02, CometSTG2_Loop08
	dc.b	nA4, $30, nBb4, $0F, nRst, $03, nBb4, $1E, nAb4, $0F, nRst, $03
	dc.b	nE4, $1E, nFs4, $0F, nRst, $03, nFs4, $1E, nRst, $30, nA4, nB4
	dc.b	nRst, $12, nD5, $1E
	smpsJump				CometSTG2_FM4J

; FM5 Data
CometSTG2_FM5:
CometSTG2_Loop05:
	dc.b	nE5, $02, nRst, $01
	smpsLoop            $00, $03, CometSTG2_Loop05
	dc.b	nE5, $02, nRst, $04, nE5, $02, nRst, $05, nE5, $02, nRst, $18
CometSTG2_FM5J:
CometSTG2_Loop06:
	dc.b	nFs4, $08, nRst, $01, nFs4, $02, nRst, $07, nFs4, $1E, nRst, $06
	dc.b	nF4, $02, nRst, $07, nF4, $02, nRst, $07, nF4, $18, nE4, $08
	dc.b	nRst, $01, nE4, $02, nRst, $07, nE4, $1E, nRst, $06, nE4, $02
	dc.b	nRst, $07, nE4, $02, nRst, $07, nG4, $0B, nRst, $01, nG4, $0B
	dc.b	nRst, $01, nFs4, $08, nRst, $01, nFs4, $02, nRst, $07, nFs4, $1E
	dc.b	nRst, $06, nFs4, $02, nRst, $07, nFs4, $02, nRst, $07, nFs4, $18
	dc.b	nA4, $08, nRst, $01, nA4, $02, nRst, $07, nA4, $1E, nRst, $06
	dc.b	nA4, $02, nRst, $07, nA4, $02, nRst, $07, nFs4, $0B, nRst, $01
	dc.b	nFs4, $0B, nRst, $01
	smpsLoop            $00, $02, CometSTG2_Loop06
	dc.b	nFs4, $2E, nRst, $02, nG4, $0F, nRst, $03, nG4, $1E, nE4, $0F
	dc.b	nRst, $03, nCs4, $1E, nEb4, $0F, nRst, $03, nEb4, $1E, nD4, $30
	dc.b	nE4, nFs4, nA4, $0F, nRst, $03, nB4, $1E
	smpsJump				CometSTG2_FM5J

; PSG1 Data
CometSTG2_PSG1:
	dc.b	nRst, $30
CometSTG2_PSG1J:
CometSTG2_Loop21:
	dc.b	$60
	smpsLoop            $00, $08, CometSTG2_Loop21
	dc.b	nCs3, $2E, nRst, $01
	smpsPSGAlterVol     $03
	dc.b	nE2
	smpsPSGAlterVol     $FF
	dc.b	nFs2
	smpsPSGAlterVol     $FF
	dc.b	nA2
	smpsPSGAlterVol     $FF
	dc.b	nB2, nCs3, $12, nB2, nA2, $0C, nAb2, $12, nFs2, $0B, nG2, $01
	dc.b	nAb2, $0C, nA2, $02, nRst, $04, nAb2, $01, $02, nRst, $03, nG2
	dc.b	$01, nAb2, $0B, nFs2, $1E, nRst, $12, nFs2, $01, $05, nE2, $06
	dc.b	nD2, $02, nRst, $04, nCs2, $02, nRst, $04, nB1, $06, nCs2, $12
	dc.b	nB1, $0C, nA1, nFs1, $06, nB1, $1D, nC2, $01, nCs2, $06, nD2
	dc.b	$02, nRst, $04, nE2, $06, nCs2, $12, nB1, $1E
	smpsJump				CometSTG2_PSG1J

; PSG2 Data
CometSTG2_PSG2:
	dc.b	nRst, $30
CometSTG2_PSG2J:
	dc.b	nD1, $03, nFs1, nA1
CometSTG2_Loop12:
	dc.b	nCs2, nA1, nFs1
	smpsLoop            $00, $04, CometSTG2_Loop12
	dc.b	nCs2, nD1, nF1, nAb1

CometSTG2_Loop13:
	dc.b	nB1, nAb1, nF1
	smpsLoop            $00, $04, CometSTG2_Loop13
	dc.b	nB1, nCs1, nE1, nAb1

CometSTG2_Loop14:
	dc.b	nB1, nAb1, nE1
	smpsLoop            $00, $04, CometSTG2_Loop14
	dc.b	nB1, nCs1, nE1, nA1

CometSTG2_Loop15:
	dc.b	nCs2, nA1, nE1
	smpsLoop            $00, $04, CometSTG2_Loop15
	dc.b	nCs2, nD1, nFs1, nA1

CometSTG2_Loop16:
	dc.b	nCs2, nA1, nFs1
	smpsLoop            $00, $04, CometSTG2_Loop16
	dc.b	nCs2, nB0, nD1, nFs1

CometSTG2_Loop17:
	dc.b	nA1, nFs1, nD1
	smpsLoop            $00, $04, CometSTG2_Loop17
	dc.b	nA1, nE1, nA1, nD2

CometSTG2_Loop18:
	dc.b	nFs2, nD2, nA1
	smpsLoop            $00, $04, CometSTG2_Loop18
	dc.b	nFs2, nE1, nA1, nCs2

CometSTG2_Loop19:
	dc.b	nE2, nCs2, nA1
	smpsLoop            $00, $04, CometSTG2_Loop19
	dc.b	nE2, nD1, nFs1, nA1

CometSTG2_Loop1A:
	dc.b	nCs2, nA1, nFs1
	smpsLoop            $00, $04, CometSTG2_Loop1A
	dc.b	nCs2, nCs1, nE1, nAb1

CometSTG2_Loop1B:
	dc.b	nB1, nAb1, nE1
	smpsLoop            $00, $04, CometSTG2_Loop1B
	dc.b	nB1, nCs1, nE1, nA1

CometSTG2_Loop1C:
	dc.b	nCs2, nA1, nE1
	smpsLoop            $00, $04, CometSTG2_Loop1C
	dc.b	nCs2, nD1, nFs1, nA1

CometSTG2_Loop1D:
	dc.b	nCs2, nA1, nFs1
	smpsLoop            $00, $04, CometSTG2_Loop1D
	dc.b	nCs2, nB0, nD1, nFs1

CometSTG2_Loop1E:
	dc.b	nA1, nFs1, nD1
	smpsLoop            $00, $04, CometSTG2_Loop1E
	dc.b	nA1, nE1, nA1, nD2

CometSTG2_Loop1F:
	dc.b	nFs2, nD2, nA1
	smpsLoop            $00, $04, CometSTG2_Loop1F
	dc.b	nFs2, nE1, nA1, nCs2

CometSTG2_Loop20:
	dc.b	nE2, nCs2, nA1
	smpsLoop            $00, $04, CometSTG2_Loop20
	dc.b	nE2, nE1, nA1, nCs2, nE2, nCs2, nA1, nE2, nCs2, nE0, $01, nFs0
	dc.b	nAb0, nA0, nB0, nCs1, nD1, nE1, nFs1, nAb1, nA1, nB1, nCs2, nD2
	dc.b	nE2, nFs2, nAb2, nA2, nB2, nCs3, nD3, nE3, nFs3, nAb3, nRst, $06
	smpsPSGAlterVol     $02
	dc.b	nB0, $03, nCs1, nD1, $02, nRst, $01, nG1, $03, nA1, nB1, nD2
	dc.b	$09, nCs2, nB1, $02, nRst, $04, nBb1, $30, nRst, $06
	smpsPSGAlterVol     $03
	dc.b	nA0, $03, nB0, nCs1, $02, nRst, $01, nE1, $03, nFs1, nA1, nCs2
	dc.b	$09, nB1, nA1, $02, nRst, $04, nEb1, $30, nD1, $03, nE1, nFs1
	dc.b	nA1, $02, nRst, $01, nD2, $24, nCs1, $03, nD1, nE1, nFs1, $02
	dc.b	nRst, $01, nCs2, $24, nB0, $03, nCs1, nD1, nE1, $02, nRst, $01
	dc.b	nB1, $24
	smpsPSGAlterVol     $FD
	dc.b	nFs0, $03, nAb0, nA0, nB0, nD1, nCs1, nD1, nE1, nAb1, $02, nA1
	dc.b	nFs1, nAb1, $03, nA1, nB1, nD2, nE2, nAb2
	smpsJump				CometSTG2_PSG2J

; PSG3 Data
CometSTG2_PSG3:
	smpsPSGform         $E7
	dc.b	nRst, $30

CometSTG2_Loop10:
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $03, $03
	smpsPSGvoice        fTone_01
	dc.b	$06
	smpsLoop            $00, $0F, CometSTG2_Loop10
	smpsPSGvoice        fTone_02
	dc.b	$06, $03
	smpsPSGvoice        fTone_01
	dc.b	$03

CometSTG2_Loop11:
	smpsPSGvoice        fTone_02
	dc.b	$03, $03
	smpsPSGvoice        fTone_01
	dc.b	$06
	smpsLoop            $00, $4F, CometSTG2_Loop11
	smpsPSGvoice        fTone_02
	dc.b	$03, $03
	smpsPSGvoice        fTone_01
	dc.b	$09
	smpsJump				CometSTG2_Loop10

CometSTG2_Voices:
;	Voice $00
;	$3A
;	$01, $07, $01, $01, 	$8E, $8E, $8D, $53, 	$0E, $0E, $0E, $03
;	$00, $00, $00, $00, 	$1F, $FF, $1F, $0F, 	$18, $28, $27, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $07, $01
	smpsVcRateScale     $01, $02, $02, $02
	smpsVcAttackRate    $13, $0D, $0E, $0E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $0E, $0E, $0E
	smpsVcDecayRate2    $08, $00, $00, $00
	smpsVcDecayLevel    $00, $01, $0F, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $27, $28, $18

;	Voice $1D
;	$08
;	$0A, $70, $30, $00, 	$1F, $1F, $5F, $5F, 	$12, $0E, $0A, $0A
;	$00, $04, $04, $03, 	$2F, $2F, $2F, $2F, 	$24, $2D, $13, $80
	smpsVcAlgorithm     $00
	smpsVcFeedback      $01
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $07, $00
	smpsVcCoarseFreq    $00, $00, $00, $0A
	smpsVcRateScale     $01, $01, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0A, $0A, $0E, $12
	smpsVcDecayRate2    $03, $04, $04, $00
	smpsVcDecayLevel    $02, $02, $02, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $13, $2D, $24