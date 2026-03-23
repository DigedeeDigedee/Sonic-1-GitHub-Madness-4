BGM_LimitEgg_Header:
	smpsHeaderStartSong 2
	smpsHeaderVoice     BGM_LimitEgg_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $60

	smpsHeaderDAC       BGM_LimitEgg_DAC
	smpsHeaderFM        BGM_LimitEgg_FM1,	$00, $16
	smpsHeaderFM        BGM_LimitEgg_FM2,	$00, $08
	smpsHeaderFM        BGM_LimitEgg_FM3,	$00, $10
	smpsHeaderFM        BGM_LimitEgg_FM4,	$00, $10
	smpsHeaderFM        BGM_LimitEgg_FM5,	$00, $12
	smpsHeaderPSG       BGM_LimitEgg_PSG1,	$E8, $06, $00, $00
	smpsHeaderPSG       BGM_LimitEgg_PSG2,	$E8, $06, $00, $00
	smpsHeaderPSG       BGM_LimitEgg_PSG3,	$00, $02, $00, fTone_01

; FM1 Data
BGM_LimitEgg_FM1:
	smpsSetvoice        $00

BGM_LimitEgg_Jump01:
	dc.b	nA5, $04, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA6
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA6, nA5, nA6, nA5, nA6, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA6, nA5, nA6, nA5, nA6, nA5, nA6, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA6
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA6, nA5, nA6, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA6, nA5, nA6, nA5, nA6, nA5, nA6, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA6, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA6, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA6, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA6, nA5, nA6, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA6, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA6, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA6
	dc.b	nA5, nA6, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA6, nA5, nA5, nA5, nA5
	dc.b	nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5, nA5
	dc.b	nA5
	smpsJump            BGM_LimitEgg_Jump01

; FM3 Data
BGM_LimitEgg_FM3:
	smpsSetvoice        $02
	smpsModSet          $08, $01, $05, $04

BGM_LimitEgg_Loop06:
	dc.b	nRst, $30

BGM_LimitEgg_Loop05:
	dc.b	nRst, $08, nEb6, $02, nEb6, nEb5, nRst, nEb6, nEb6, nEb5, nRst
	smpsLoop            $01, $02, BGM_LimitEgg_Loop05
	smpsLoop            $00, $02, BGM_LimitEgg_Loop06
	smpsCall            BGM_LimitEgg_Call00
	dc.b	nEb4, $10, nEb4, $08, nEb5, $10, nEb4, $08, nEb5, $0C, nEb5, $04
	dc.b	nEb5, $08, nEb5, $10, nEb4, $08, nEb5, $10, nEb5, $04, nEb5, nEb5
	dc.b	$10, nEb5, $04, nEb5, nEb5, $18, nEb5, $10, nEb5, $08, nEb4, $10
	dc.b	nEb4, $08, nEb5, $10, nEb4, $08, nEb5, $0C, nEb5, $04, nEb5, $08
	dc.b	nEb5, $10, nEb4, $08, nEb5, $60

BGM_LimitEgg_Loop07:
	dc.b	nEb6, $04, nEb6, nEb6, $10
	smpsLoop            $00, $03, BGM_LimitEgg_Loop07
	dc.b	nEb6, $04, nEb6, nEb6, $08, nEb5, nEb6, $30, nRst
	smpsJump            BGM_LimitEgg_FM3

BGM_LimitEgg_Call00:
	dc.b	nEb4, $10, nEb4, $08, nEb5, $10, nEb4, $08, nEb5, $0C, nEb5, $04
	dc.b	nEb5, $08, nEb5, $10, nEb4, $08, nEb5, $18, nEb5, nEb5, nEb5, nEb4
	dc.b	$10, nEb4, $08, nEb5, $10, nEb4, $08, nEb5, $0C, nEb5, $04, nEb5
	dc.b	$08, nEb5, $10, nEb4, $08, nEb5, $20, nEb5, $08, nEb5, nEb5, $30
	smpsReturn

; FM4 Data
BGM_LimitEgg_FM4:
	smpsSetvoice        $02
	smpsModSet          $08, $01, $05, $04

BGM_LimitEgg_Loop03:
	smpsAlterNote       $02
	dc.b	nRst, $30

BGM_LimitEgg_Loop02:
	dc.b	nRst, $08, nEb6, $02, nEb6, nEb5, nRst, nEb6, nEb6, nEb5, nRst
	smpsLoop            $01, $02, BGM_LimitEgg_Loop02
	smpsLoop            $00, $02, BGM_LimitEgg_Loop03
	smpsCall            BGM_LimitEgg_Call00
	dc.b	nEb5, $10, nEb5, $08, nEb5, $10, nEb5, $08, nEb5, $0C, nEb5, $04
	dc.b	nEb5, $08, nEb5, $10, nEb5, $08, nEb6, $10, nEb5, $04, nEb6, nEb5
	dc.b	$10, nEb5, $04, nEb5, nEb5, $18, nEb5, $10, nEb5, $08, nEb5, $10
	dc.b	nEb5, $08, nEb5, $10, nEb5, $08, nEb5, $0C, nEb5, $04, nEb5, $08
	dc.b	nEb5, $10, nEb5, $08, nEb6, $60

BGM_LimitEgg_Loop04:
	dc.b	nEb6, $04, nEb5, nEb5, $10
	smpsLoop            $00, $03, BGM_LimitEgg_Loop04
	dc.b	nEb6, $04, nEb5, nEb5, $08, nEb5, nEb5, $30, nRst
	smpsJump            BGM_LimitEgg_FM4

; FM5 Data
BGM_LimitEgg_FM5:
	smpsSetvoice        $05
	smpsNoteFill        $00
	dc.b	nA2, $68
	dc.b	nA3, $58
	smpsNoteFill        $09

BGM_LimitEgg_Loop00:
	dc.b	nA2, $04, nRst, $28, nA2, $04, nA2, nA2, $02, nRst, $2A, nA2
	dc.b	$04, nRst, $28, nA2, $04, nA2, nA2, nRst, $18, nA4, $04, nA4
	dc.b	nA5, nA5
	smpsLoop            $00, $04, BGM_LimitEgg_Loop00

BGM_LimitEgg_Loop01:
	dc.b	nA2, $04, nRst, nA4, nA4, nA4, nA4
	smpsLoop            $00, $04, BGM_LimitEgg_Loop01
	dc.b	nA2, $04, nRst, $28, nA2, $04, nA2, nA2, nA4, nA4, nA5, nA5
	dc.b	nRst, $08, nA4, $04, nA4, nA5, nA5
	smpsJump            BGM_LimitEgg_FM5

; FM2 Data
BGM_LimitEgg_FM2:
	smpsSetvoice        $01
	smpsNoteFill        $0A

BGM_LimitEgg_Jump00:
	dc.b	nA1, $04, nA2, nA2, nA1, nA2, nA1, nA2, nA1, nA2, nA2, nA1
	dc.b	nA2, nA1, $02, nRst, $2E, nA1, $04, nA2, nA2, nA1, nA2, nA1
	dc.b	nA2, nA1, nA3, nA3, nA1, nA3, nA1, $02, nRst, $2E
	smpsJump            BGM_LimitEgg_Jump00

; PSG2 Data
BGM_LimitEgg_PSG2:
	smpsAlterNote       $FE

; PSG1 Data
BGM_LimitEgg_PSG1:
	dc.b	nRst, $18
	smpsLoop            $00, $18, BGM_LimitEgg_PSG1

BGM_LimitEgg_Loop09:
	dc.b	nG2, $18
	dc.b	nG2, $48
	dc.b	nG2, $08
	dc.b	nG3, $58
	smpsLoop            $00, $02, BGM_LimitEgg_Loop09

BGM_LimitEgg_Loop0A:
	dc.b	nG2, $08
	dc.b	nG2, $10
	dc.b	$08
	dc.b	nG3, $10
	smpsLoop            $00, $02, BGM_LimitEgg_Loop0A
	dc.b	nG2, $08
	dc.b	nG2, $58
	smpsJump            BGM_LimitEgg_PSG1

; DAC Data
BGM_LimitEgg_DAC:
	dc.b	nRst, $30, dSnare, $04, dSnare, dSnare, $10, dSnare, $04, dSnare, dSnare, $10
	dc.b	nRst, $30, dSnare, $04, dSnare, nRst, dSnare, nRst, dSnare, dSnare, dSnare, dSnare
	dc.b	$08, dSnare, dSnare, $08, dSnare, $04, $04, $08, dSnare, dSnare, dSnare, dSnare
	dc.b	dSnare, $0C, $04, dSnare, $08, dSnare, dSnare, dSnare, dSnare, $04, $08, $04
	dc.b	dSnare, $08, dSnare, dSnare, dSnare, dSnare, $04, $08, $04, dSnare, $08, dSnare
	dc.b	$04, $04, $08, dSnare, dSnare, dSnare, dSnare, dSnare, $04, $08, $04, dSnare
	dc.b	$08, dSnare, dSnare, dSnare, $08, dSnare, $04, $04, $08, dSnare, dSnare, dSnare
	dc.b	dSnare, dSnare, $04, $08, $04, dSnare, $08, dSnare, dSnare, dSnare, dSnare, $04
	dc.b	dSnare, dSnare, dSnare, dSnare, $08, dSnare, dSnare, dSnare, dSnare, $04, $08, $04
	dc.b	dSnare, $08, dSnare, dSnare, dSnare, $08, dSnare, $04, $04, $08, dSnare, dSnare
	dc.b	dSnare, dSnare, dSnare, $04, $08, $04, dSnare, $08, dSnare, dSnare, dSnare, $04
	dc.b	dSnare, dSnare, dSnare, dSnare, dSnare, dSnare, $08, dSnare, dSnare, dSnare, dSnare, $04
	dc.b	$08, $04, dSnare, $08, dSnare, dSnare, dSnare, dSnare, $04, $04, $08, dSnare
	dc.b	dSnare, dSnare, dSnare, dSnare, $04, $08, $04, dSnare, $08, dSnare, dSnare, dSnare
	dc.b	$04, dSnare, $08, $04, dSnare, dSnare, dSnare, $08, dSnare, dSnare, dSnare, $08
	dc.b	dSnare, $04, dSnare, dSnare, dSnare, dSnare, $08, dSnare, dSnare, dSnare, $08, dSnare
	dc.b	$04, dSnare, dSnare, dSnare, dSnare, $08, dSnare, dSnare, dSnare, $08, dSnare, $04
	dc.b	$08, $04, dSnare, $04, dSnare, $08, $04, dSnare, dSnare, dSnare, $04, dSnare
	dc.b	$08, $04, dSnare, dSnare
	smpsJump            BGM_LimitEgg_DAC

; PSG3 Data
BGM_LimitEgg_PSG3:
	smpsPSGform         $E7

BGM_LimitEgg_Jump02:
	dc.b	nRst, $08, nMaxPSG, nMaxPSG, nRst, $08, nMaxPSG, nMaxPSG, nRst, $30, nRst, $08
	dc.b	nMaxPSG, nMaxPSG, nRst, $08, nMaxPSG, nMaxPSG, nRst, $30

BGM_LimitEgg_Loop08:
	dc.b	nRst, $18
	smpsLoop            $00, $28, BGM_LimitEgg_Loop08
	smpsJump            BGM_LimitEgg_Jump02

BGM_LimitEgg_Voices:
;	Voice $00
;	$30
;	$75, $75, $71, $31, 	$D8, $58, $96, $94, 	$01, $1B, $03, $08
;	$01, $04, $01, $01, 	$FF, $2F, $3F, $3F, 	$34, $29, $10, $80
	smpsVcAlgorithm     $00
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $07, $07, $07
	smpsVcCoarseFreq    $01, $01, $05, $05
	smpsVcRateScale     $02, $02, $01, $03
	smpsVcAttackRate    $14, $16, $18, $18
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $08, $03, $1B, $01
	smpsVcDecayRate2    $01, $01, $04, $01
	smpsVcDecayLevel    $03, $03, $02, $0F
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $10, $29, $34

;	Voice $01
;	$3A
;	$32, $11, $72, $11, 	$1F, $1F, $9F, $1F, 	$03, $0A, $03, $0A
;	$02, $02, $02, $02, 	$AF, $7F, $AF, $7F, 	$1E, $00, $28, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $07, $01, $03
	smpsVcCoarseFreq    $01, $02, $01, $02
	smpsVcRateScale     $00, $02, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0A, $03, $0A, $03
	smpsVcDecayRate2    $02, $02, $02, $02
	smpsVcDecayLevel    $07, $0A, $07, $0A
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $28, $00, $1E

;	Voice $02
;	$3A
;	$11, $15, $01, $11, 	$59, $59, $5C, $4E, 	$0A, $0B, $0D, $04
;	$00, $00, $00, $00, 	$1F, $5F, $2F, $0F, 	$1A, $0E, $2E, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $00, $01, $01
	smpsVcCoarseFreq    $01, $01, $05, $01
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $0E, $1C, $19, $19
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $0D, $0B, $0A
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $02, $05, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $2E, $0E, $1A

;	Voice $03
;	$06
;	$01, $33, $72, $31, 	$0A, $8C, $4C, $52, 	$00, $00, $00, $00
;	$01, $00, $01, $00, 	$0F, $0F, $2F, $0F, 	$4D, $87, $80, $91
	smpsVcAlgorithm     $06
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $07, $03, $00
	smpsVcCoarseFreq    $01, $02, $03, $01
	smpsVcRateScale     $01, $01, $02, $00
	smpsVcAttackRate    $12, $0C, $0C, $0A
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $00, $01, $00, $01
	smpsVcDecayLevel    $00, $02, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $11, $00, $07, $4D

;	Voice $04
;	$3A
;	$01, $02, $01, $01, 	$10, $0E, $14, $10, 	$0C, $0E, $0E, $0E
;	$00, $00, $00, $00, 	$0F, $FF, $7F, $1F, 	$1C, $28, $31, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $02, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $10, $14, $0E, $10
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0E, $0E, $0E, $0C
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $01, $07, $0F, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $31, $28, $1C

;	Voice $05
;	$39
;	$02, $01, $02, $01, 	$1F, $1F, $1F, $1F, 	$00, $00, $00, $00
;	$00, $00, $00, $00, 	$0F, $0F, $0F, $0F, 	$1B, $32, $28, $80
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $02, $01, $02
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $28, $32, $1B

	smpsFooterEndSong	"DaxKatter/Mus - Limited Egg.asm"