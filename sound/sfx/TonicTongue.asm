GoGoTonicTongueDash_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     GoGoTonicTongueDash_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cFM4, GoGoTonicTongueDash_FM4,	$00, $08

; FM4 Data
GoGoTonicTongueDash_FM4:
	smpsSetvoice        $00
	smpsModSet          $01, $01, $7F, $FF
	dc.b	nB2, $07, nB2
	smpsSetvoice        $01

GoGoTonicTongueDash_Loop00:
	dc.b	nB5
	smpsAlterVol        $08
	smpsLoop            $00, $03, GoGoTonicTongueDash_Loop00
	smpsStop

GoGoTonicTongueDash_Voices:
;	Voice $00
;	$38
;	$07, $04, $00, $01, 	$DF, $1F, $1F, $DF, 	$04, $18, $04, $00
;	$06, $09, $04, $1B, 	$05, $05, $15, $AC, 	$22, $22, $0E, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $04, $07
	smpsVcRateScale     $03, $00, $00, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $04, $18, $04
	smpsVcDecayRate2    $1B, $04, $09, $06
	smpsVcDecayLevel    $0A, $01, $00, $00
	smpsVcReleaseRate   $0C, $05, $05, $05
	smpsVcTotalLevel    $00, $0E, $22, $22

;	Voice $01
;	$3D
;	$01, $01, $02, $00, 	$1D, $1F, $1F, $1F, 	$0A, $00, $00, $00
;	$05, $00, $00, $00, 	$35, $07, $07, $07, 	$14, $00, $00, $00
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $02, $01, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $0A
	smpsVcDecayRate2    $00, $00, $00, $05
	smpsVcDecayLevel    $00, $00, $00, $03
	smpsVcReleaseRate   $07, $07, $07, $05
	smpsVcTotalLevel    $00, $00, $00, $14
	
	smpsFooterEndSong	"TonicTongue.asm"