ChaosFarm_Header:
	smpsHeaderStartSong 3
	smpsHeaderVoice		ChaosFarm_Voices
	smpsHeaderChan		$06, $02
	smpsHeaderTempo		$02, $45
;	Given Tempo = 150.00 BPM
;	Approximated Tempo = 150.29 BPM

	smpsHeaderDAC	ChaosFarm_DAC
	smpsHeaderFM	ChaosFarm_FM1,	$00, $00
	smpsHeaderFM	ChaosFarm_FM2,	$00, $00
	smpsHeaderFM	ChaosFarm_FM3,	$00, $00
	smpsHeaderFM	ChaosFarm_FM4,	$00, $00
	smpsHeaderFM	ChaosFarm_FM5,	$00, $00
	smpsHeaderPSG	ChaosFarm_PSG1,	$0C, $00, $00, $00
	smpsHeaderPSG	ChaosFarm_PSG2,	$0C, $00, $00, $00

ChaosFarm_Voices:
;	FM Voice 00 -> 00: 16_chaos_emerald_41
	smpsVcAlgorithm		$04
	smpsVcFeedback		$00
	smpsVcDetune		$00, $05, $07, $03
	smpsVcCoarseFreq	$06, $04, $02, $05
	smpsVcRateScale		$00, $00, $00, $00
	smpsVcAttackRate	$1F, $1F, $1F, $1F
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$0D, $07, $0A, $07
	smpsVcDecayRate2	$0B, $00, $0B, $00
	smpsVcDecayLevel	$00, $01, $00, $01
	smpsVcReleaseRate	$0F, $0F, $0F, $0F
	smpsVcTotalLevel	$07, $1D, $1B, $23

;	FM Voice 01 -> 01: 04_spring_yard_zone_42
	smpsVcAlgorithm		$04
	smpsVcFeedback		$07
	smpsVcDetune		$03, $05, $05, $03
	smpsVcCoarseFreq	$00, $00, $02, $01
	smpsVcRateScale		$01, $01, $01, $01
	smpsVcAttackRate	$13, $12, $13, $12
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$00, $08, $00, $08
	smpsVcDecayRate2	$00, $04, $00, $04
	smpsVcDecayLevel	$00, $01, $00, $01
	smpsVcReleaseRate	$07, $00, $07, $00
	smpsVcTotalLevel	$11, $16, $11, $1A

;	PSG Voice 02 -> uptone_01
;	macros:
;		vol: 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15

;	PSG Voice 03 -> uptone_02
;	macros:
;		vol: 15 12 11 10 9 8 7 6 6 5 4 4 3 3 2 2 2 2 1 1 1 1 1 1 0 0 0 0 0 0 0 0

	; Loop Pattern :  00
	; End Pattern :  02
	; End Place :  40


ChaosFarm_FM1:

ChaosFarm_FM1_Jump:
	smpsCall ChaosFarm_FM1_00_0_64
	smpsCall ChaosFarm_FM1_01_0_64
	smpsJump ChaosFarm_FM1_Jump

ChaosFarm_FM1_00_0_64:
	smpsSetvoice	$00
	dc.b nA3, $06, nCs4, nE4, $04, nAb4, $08, nA4, nD5, $06, nCs5, nB4, $04, nCs5, $10
	smpsStop

ChaosFarm_FM1_01_0_64:
	dc.b nRst, $08, $38
	smpsStop

ChaosFarm_FM2:

ChaosFarm_FM2_Jump:
	smpsCall ChaosFarm_FM2_00_0_64
	smpsCall ChaosFarm_FM2_01_0_64
	smpsJump ChaosFarm_FM2_Jump

ChaosFarm_FM2_00_0_64:
	smpsSetvoice	$01
	smpsPan		panRight, $00
	dc.b nCs5, $06, $06, $04, nE5, $08, nCs5, nB4, $06, $06, $04, nA4, $08, nRst
	smpsStop

ChaosFarm_FM2_01_0_64:
	dc.b smpsNoAttack, $08, nRst, $38
	smpsStop

ChaosFarm_FM3:

ChaosFarm_FM3_Jump:
	smpsCall ChaosFarm_FM3_00_0_64
	smpsCall ChaosFarm_FM3_01_0_64
	smpsJump ChaosFarm_FM3_Jump

ChaosFarm_FM3_00_0_64:
	smpsSetvoice	$00
	dc.b nE3, $06, nAb3, nB3, $04, nDs4, $08, nE4, nA4, $06, nAb4, nFs4, $04, nA4, $10
	smpsStop

ChaosFarm_FM3_01_0_64:
	dc.b nRst, $40
	smpsStop

ChaosFarm_FM4:

ChaosFarm_FM4_Jump:
	smpsCall ChaosFarm_FM4_00_0_64
	smpsCall ChaosFarm_FM4_01_0_64
	smpsJump ChaosFarm_FM4_Jump

ChaosFarm_FM4_00_0_64:
	smpsSetvoice	$00
	dc.b nCs3, $06, nE3, nAb3, $04, nB3, $08, nCs4, nFs4, $06, nE4, nDs4, $04, nE4, $10
	smpsStop

ChaosFarm_FM4_01_0_64:
	dc.b nRst, $40
	smpsStop

ChaosFarm_FM5:

ChaosFarm_FM5_Jump:
	smpsCall ChaosFarm_FM5_00_0_64
	smpsCall ChaosFarm_FM5_01_0_64
	smpsJump ChaosFarm_FM5_Jump

ChaosFarm_FM5_00_0_64:
	smpsSetvoice	$01
	dc.b nE5, $06, $06, $04, nAb5, $08, nE5, nD5, $06, $06, $04, nCs5, $08, nRst
	smpsStop

ChaosFarm_FM5_01_0_64:
	dc.b smpsNoAttack, $40
	smpsStop

ChaosFarm_DAC:

ChaosFarm_DAC_Jump:
	smpsCall ChaosFarm_DAC_00_0_64
	smpsCall ChaosFarm_DAC_01_0_64
	smpsJump ChaosFarm_DAC_Jump

ChaosFarm_DAC_00_0_64:
	smpsSetvoice	$01
	smpsPan		panLeft, $00
	dc.b nA4, $06, $06, $04, nCs5, $08, nA4, nAb4, $06, $06, $04, nE4, $08, nRst
	smpsStop

ChaosFarm_DAC_01_0_64:
	dc.b nRst, $40
	smpsStop

ChaosFarm_PSG1:

ChaosFarm_PSG1_Jump:
	smpsCall ChaosFarm_PSG1_00_0_64_0F
	smpsCall ChaosFarm_PSG1_01_0_64_0A
	smpsJump ChaosFarm_PSG1_Jump

ChaosFarm_PSG1_00_0_64_0F:
	dc.b smpsNoAttack, $30
	smpsPSGvoice	uptone_01
	dc.b nMaxPSG, $03, nE4, nCs4, nA3
	smpsPSGAlterVol	$05
	dc.b nMaxPSG, nE4, $01
	smpsStop

ChaosFarm_PSG1_01_0_64_0A:
	dc.b smpsNoAttack, $02
	smpsPSGvoice	uptone_01
	dc.b nCs4, $03, nA3
	smpsPSGAlterVol	$04
	dc.b nMaxPSG, nE4, nCs4, nA3
	smpsPSGAlterVol	$03
	dc.b nMaxPSG, nE4, nCs4, nA3, $02, nRst, $21
	smpsStop

ChaosFarm_PSG2:

ChaosFarm_PSG2_Jump:
	smpsCall ChaosFarm_PSG2_00_0_64_0F
	smpsCall ChaosFarm_PSG2_01_0_64_0A
	smpsJump ChaosFarm_PSG2_Jump

ChaosFarm_PSG2_00_0_64_0F:
	dc.b smpsNoAttack, $31
	smpsPSGvoice	uptone_02
	dc.b nMaxPSG, $03, nE4, nCs4, nA3
	smpsPSGAlterVol	$05
	dc.b nMaxPSG
	smpsStop

ChaosFarm_PSG2_01_0_64_0A:
	dc.b nE4, $03
	smpsPSGvoice	uptone_02
	dc.b nCs4, nA3
	smpsPSGAlterVol	$04
	dc.b nMaxPSG, nE4, nCs4, nA3
	smpsPSGAlterVol	$03
	dc.b nMaxPSG, nE4, nCs4, nA3, $02, nRst, $20
	smpsStop
