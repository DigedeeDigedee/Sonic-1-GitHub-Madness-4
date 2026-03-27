Kazotsky_Header:
	smpsHeaderStartSong 3
	smpsHeaderVoice		Kazotsky_Voices
	smpsHeaderChan		$06, $03
	smpsHeaderTempo		$01, $50
;	Given Tempo = 225.00 BPM
;	Approximated Tempo = 225.00 BPM

	smpsHeaderDAC	Kazotsky_DAC
	smpsHeaderFM	Kazotsky_FM1,	$00, $00
	smpsHeaderFM	Kazotsky_FM2,	$00, $00
	smpsHeaderFM	Kazotsky_FM3,	$00, $05
	smpsHeaderFM	Kazotsky_FM4,	$00, $06
	smpsHeaderFM	Kazotsky_FM5,	$00, $06
	smpsHeaderPSG	Kazotsky_PSG1,	$0C, $00, $00, $00
	smpsHeaderPSG	Kazotsky_PSG2,	$0C, $00, $00, $00
	smpsHeaderPSG	Kazotsky_PSG3,	$0C, $00, $00, $00

Kazotsky_Voices:
;	PSG Voice 00 -> TFTone_01
;	macros:
;		vol: 15 14 13 12 11 10 9 9 8 8 7 7 6 6 5 5 4 4 3 3 2 2 2 1 1 1 0 0 0 0 0 0

;	PSG Voice 01 -> TFTone_02
;	macros:
;		vol: 15 14 13 12 12 11 10 10 9 8 7 7 6 6 5 5 5 4 4 3 3 3 3 2 2 2 1 1 1 0 0 0

;	FM Voice 02 -> 00: 04_bubbles_and_bathtubs_17
	smpsVcAlgorithm		$04
	smpsVcFeedback		$01
	smpsVcDetune		$00, $05, $00, $01
	smpsVcCoarseFreq	$02, $0B, $02, $07
	smpsVcRateScale		$00, $00, $01, $01
	smpsVcAttackRate	$1F, $1F, $1D, $1D
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$13, $13, $12, $12
	smpsVcDecayRate2	$1F, $1F, $1F, $1F
	smpsVcDecayLevel	$0F, $06, $03, $03
	smpsVcReleaseRate	$0A, $0A, $0A, $0A
	smpsVcTotalLevel	$10, $1D, $11, $1B

;	FM Voice 03 -> 01: 10_stage_13_intro_0
	smpsVcAlgorithm		$04
	smpsVcFeedback		$06
	smpsVcDetune		$07, $07, $00, $03
	smpsVcCoarseFreq	$04, $0D, $04, $0D
	smpsVcRateScale		$00, $01, $02, $01
	smpsVcAttackRate	$1F, $1F, $1F, $1B
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$0B, $0A, $0A, $08
	smpsVcDecayRate2	$03, $02, $01, $00
	smpsVcDecayLevel	$0F, $0F, $0F, $0F
	smpsVcReleaseRate	$0F, $0F, $0F, $0F
	smpsVcTotalLevel	$06, $29, $14, $23

;	FM Voice 04 -> 02: 04_bubbles_and_bathtubs_19
	smpsVcAlgorithm		$04
	smpsVcFeedback		$01
	smpsVcDetune		$00, $05, $00, $00
	smpsVcCoarseFreq	$02, $0B, $02, $01
	smpsVcRateScale		$00, $00, $01, $01
	smpsVcAttackRate	$1F, $1F, $1D, $1C
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$12, $12, $10, $10
	smpsVcDecayRate2	$1F, $1F, $1F, $1F
	smpsVcDecayLevel	$0F, $06, $03, $03
	smpsVcReleaseRate	$0A, $0A, $0A, $0A
	smpsVcTotalLevel	$09, $1D, $0B, $1B

;	FM Voice 05 -> 03: 05_castle_castellations_0
	smpsVcAlgorithm		$04
	smpsVcFeedback		$07
	smpsVcDetune		$00, $05, $00, $01
	smpsVcCoarseFreq	$02, $0B, $02, $07
	smpsVcRateScale		$00, $00, $01, $01
	smpsVcAttackRate	$1F, $1F, $1D, $1A
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$12, $12, $10, $10
	smpsVcDecayRate2	$07, $06, $12, $00
	smpsVcDecayLevel	$0F, $06, $03, $03
	smpsVcReleaseRate	$0A, $0A, $04, $02
	smpsVcTotalLevel	$00, $14, $00, $1D

;	FM Voice 06 -> 04: 02_a_sport_to_catch_a_mackerel_15
	smpsVcAlgorithm		$03
	smpsVcFeedback		$07
	smpsVcDetune		$00, $00, $05, $05
	smpsVcCoarseFreq	$02, $07, $02, $0F
	smpsVcRateScale		$02, $00, $00, $00
	smpsVcAttackRate	$1F, $1F, $1F, $1F
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$1F, $15, $15, $15
	smpsVcDecayRate2	$10, $0D, $0C, $13
	smpsVcDecayLevel	$00, $03, $02, $02
	smpsVcReleaseRate	$09, $06, $06, $06
	smpsVcTotalLevel	$00, $1C, $28, $00

;	FM Voice 07 -> 05: 04_green_grove_zone_2_76
	smpsVcAlgorithm		$05
	smpsVcFeedback		$07
	smpsVcDetune		$00, $05, $02, $00
	smpsVcCoarseFreq	$02, $01, $01, $01
	smpsVcRateScale		$00, $00, $00, $00
	smpsVcAttackRate	$0F, $14, $14, $12
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$05, $05, $05, $0A
	smpsVcDecayRate2	$00, $00, $00, $00
	smpsVcDecayLevel	$01, $02, $02, $02
	smpsVcReleaseRate	$0B, $0B, $0B, $0B
	smpsVcTotalLevel	$0A, $16, $16, $19

;	FM Voice 08 -> 06: 02_versus_mode_0
	smpsVcAlgorithm		$00
	smpsVcFeedback		$00
	smpsVcDetune		$03, $03, $03, $03
	smpsVcCoarseFreq	$01, $00, $07, $07
	smpsVcRateScale		$02, $02, $03, $03
	smpsVcAttackRate	$1F, $1F, $1F, $1F
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$06, $09, $06, $07
	smpsVcDecayRate2	$08, $06, $06, $07
	smpsVcDecayLevel	$0F, $01, $01, $02
	smpsVcReleaseRate	$0F, $0F, $0F, $0F
	smpsVcTotalLevel	$0B, $13, $37, $19

;	FM Voice 09 -> 07: 07_Dr_13
	smpsVcAlgorithm		$02
	smpsVcFeedback		$06
	smpsVcDetune		$00, $03, $00, $07
	smpsVcCoarseFreq	$01, $02, $09, $01
	smpsVcRateScale		$02, $01, $02, $01
	smpsVcAttackRate	$14, $1F, $19, $1F
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$07, $05, $05, $05
	smpsVcDecayRate2	$02, $02, $02, $02
	smpsVcDecayLevel	$0A, $01, $01, $01
	smpsVcReleaseRate	$07, $01, $01, $01
	smpsVcTotalLevel	$08, $16, $20, $23

;	FM Voice 0A -> 08: 01_title_11
	smpsVcAlgorithm		$01
	smpsVcFeedback		$07
	smpsVcDetune		$00, $00, $00, $01
	smpsVcCoarseFreq	$00, $00, $0C, $01
	smpsVcRateScale		$03, $03, $01, $00
	smpsVcAttackRate	$13, $14, $1F, $1F
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$0A, $0B, $15, $07
	smpsVcDecayRate2	$01, $06, $10, $00
	smpsVcDecayLevel	$00, $00, $08, $01
	smpsVcReleaseRate	$06, $06, $0D, $07
	smpsVcTotalLevel	$0B, $0C, $24, $27

;	FM Voice 0B -> 09: 07_Vilily_1
	smpsVcAlgorithm		$04
	smpsVcFeedback		$07
	smpsVcDetune		$00, $01, $00, $05
	smpsVcCoarseFreq	$01, $01, $02, $01
	smpsVcRateScale		$00, $00, $00, $00
	smpsVcAttackRate	$12, $12, $13, $12
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$06, $09, $0E, $06
	smpsVcDecayRate2	$01, $01, $01, $01
	smpsVcDecayLevel	$02, $02, $02, $02
	smpsVcReleaseRate	$0B, $07, $0A, $07
	smpsVcTotalLevel	$08, $27, $07, $1B

;	FM Voice 0C -> 0A: 11__oil_ocean_zone_19
	smpsVcAlgorithm		$01
	smpsVcFeedback		$07
	smpsVcDetune		$00, $03, $06, $00
	smpsVcCoarseFreq	$01, $00, $00, $06
	smpsVcRateScale		$01, $01, $00, $00
	smpsVcAttackRate	$1F, $1F, $1F, $1F
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$09, $13, $0F, $11
	smpsVcDecayRate2	$03, $04, $04, $05
	smpsVcDecayLevel	$02, $02, $02, $02
	smpsVcReleaseRate	$01, $00, $0F, $0F
	smpsVcTotalLevel	$09, $17, $2C, $23

;	FM Voice 0D -> 0B: 11__oil_ocean_zone_20
	smpsVcAlgorithm		$02
	smpsVcFeedback		$07
	smpsVcDetune		$00, $00, $00, $00
	smpsVcCoarseFreq	$01, $01, $07, $01
	smpsVcRateScale		$01, $02, $02, $02
	smpsVcAttackRate	$16, $0F, $11, $12
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$03, $0E, $0E, $0E
	smpsVcDecayRate2	$00, $00, $00, $00
	smpsVcDecayLevel	$00, $01, $0F, $01
	smpsVcReleaseRate	$0F, $0F, $0F, $0F
	smpsVcTotalLevel	$02, $27, $28, $17

;	FM Voice 0E -> 0C: 01_title_theme_1
	smpsVcAlgorithm		$02
	smpsVcFeedback		$07
	smpsVcDetune		$00, $00, $00, $00
	smpsVcCoarseFreq	$01, $01, $07, $01
	smpsVcRateScale		$01, $02, $02, $02
	smpsVcAttackRate	$13, $0D, $0E, $0E
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$03, $0E, $0E, $0E
	smpsVcDecayRate2	$00, $00, $00, $00
	smpsVcDecayLevel	$00, $01, $0F, $01
	smpsVcReleaseRate	$0F, $0F, $0F, $0F
	smpsVcTotalLevel	$06, $27, $28, $18

;	FM Voice 0F -> 0D: 11_stage_2__1_4
	smpsVcAlgorithm		$04
	smpsVcFeedback		$07
	smpsVcDetune		$01, $00, $05, $00
	smpsVcCoarseFreq	$01, $01, $02, $02
	smpsVcRateScale		$02, $02, $02, $02
	smpsVcAttackRate	$15, $0F, $11, $0E
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$07, $09, $08, $0C
	smpsVcDecayRate2	$00, $00, $00, $00
	smpsVcDecayLevel	$03, $02, $03, $02
	smpsVcReleaseRate	$09, $08, $09, $08
	smpsVcTotalLevel	$07, $13, $07, $18

;	FM Voice 10 -> 0E: 02_menu_67
	smpsVcAlgorithm		$06
	smpsVcFeedback		$07
	smpsVcDetune		$03, $03, $07, $07
	smpsVcCoarseFreq	$01, $02, $01, $07
	smpsVcRateScale		$00, $00, $00, $00
	smpsVcAttackRate	$1F, $1F, $1F, $1F
	smpsVcAmpMod		$00, $00, $00, $00
	smpsVcDecayRate1	$00, $00, $06, $0D
	smpsVcDecayRate2	$00, $00, $06, $08
	smpsVcDecayLevel	$00, $00, $00, $01
	smpsVcReleaseRate	$0A, $0A, $0A, $05
	smpsVcTotalLevel	$0B, $17, $17, $1B

	; Loop Pattern :  01
	; End Pattern :  14
	; End Place :  3F


Kazotsky_FM1:
	smpsCall Kazotsky_FM1_00_0_16

Kazotsky_FM1_Jump:
	smpsCall Kazotsky_FM1_04_0_64
	smpsCall Kazotsky_FM1_05_0_64
	smpsCall Kazotsky_FM1_06_0_64
	smpsCall Kazotsky_FM1_07_0_64
	smpsCall Kazotsky_FM1_04_0_64
	smpsCall Kazotsky_FM1_08_0_64
	smpsCall Kazotsky_FM1_14_0_64
	smpsCall Kazotsky_FM1_15_0_64
	smpsCall Kazotsky_FM1_16_0_64
	smpsCall Kazotsky_FM1_17_0_64
	smpsCall Kazotsky_FM1_18_0_64
	smpsCall Kazotsky_FM1_19_0_64
	smpsCall Kazotsky_FM1_16_0_64
	smpsCall Kazotsky_FM1_17_0_64
	smpsCall Kazotsky_FM1_1A_0_64
	smpsCall Kazotsky_FM1_1B_0_64
	smpsCall Kazotsky_FM1_1C_0_64
	smpsCall Kazotsky_FM1_1D_0_64
	smpsCall Kazotsky_FM1_1E_0_64
	smpsCall Kazotsky_FM1_1F_0_64
	smpsJump Kazotsky_FM1_Jump

Kazotsky_FM1_00_0_16:
	smpsSetvoice	$05
	dc.b nC4, $04, nCs4, nD4, nE4
	smpsReturn

Kazotsky_FM1_04_0_64:
	smpsSetvoice	$05
	dc.b nF4, $04, nRst, nF4, nRst, nC4, nCs4, nD4, nE4, nF4, nRst, nF4, nRst, nAb4, nRst, $01
	dc.b nG4, $04, nRst, $02, nFs4, $04, nRst, $01
	smpsReturn

Kazotsky_FM1_05_0_64:
	dc.b nG4, $04, nRst, nG4, nRst, nBb4, nRst, $01, nAb4, $04, nRst, $02, nFs4, $04, nRst, $01
	dc.b nG4, $10, nRst, $0D
	smpsSetvoice	$05
	dc.b nA4, $03
	smpsReturn

Kazotsky_FM1_06_0_64:
	dc.b nBb4, $04, nRst, nBb4, nRst, nDs5, nRst, $01, nCs5, $04, nRst, $02, nBb4, $04, nRst, $01
	dc.b nC5, $04, nRst, nC5, nRst, nDs5, nRst, $01, nCs5, $04, nRst, $02, nBb4, $04, nRst, $01
	smpsReturn

Kazotsky_FM1_07_0_64:
	dc.b nAb4, $04, nRst, nAb4, nRst, nBb4, nC5, nBb4, nG4, nF4, $14, nRst, $04, $05, nE4, $03
	smpsReturn

Kazotsky_FM1_08_0_64:
	dc.b nG4, $04, nRst, nG4, nRst, nBb4, nRst, $01, nAb4, $04, nRst, $02, nFs4, $04, nRst, $01
	dc.b nG4, $14, nRst, $0C
	smpsReturn

Kazotsky_FM1_14_0_64:
	dc.b nCs5, $04, nRst, nCs5, nRst, nDs5, nE5, nD5, nCs5, nC5, nRst, nC5, nRst, nCs5, nRst, $01
	dc.b nC5, $04, nRst, $02, nBb4, $05
	smpsReturn

Kazotsky_FM1_15_0_64:
	dc.b nAb4, $04, nRst, nAb4, nRst, nBb4, nC5, nBb4, nG4, nF4, $14, nRst, $04, $08
	smpsReturn

Kazotsky_FM1_16_0_64:
	smpsSetvoice	$05
	dc.b nC5, $10, $10, nF4, nC5, $04, nRst, nC5, nRst
	smpsReturn

Kazotsky_FM1_17_0_64:
	smpsSetvoice	$05
	dc.b nDs5, $08, nCs5, nC5, nCs5, nBb4, $18, nRst, $06, $02
	smpsReturn

Kazotsky_FM1_18_0_64:
	smpsSetvoice	$05
	dc.b nCs5, $10, $10, nDs5, $08, nCs5, nC5, nCs5
	smpsReturn

Kazotsky_FM1_19_0_64:
	smpsSetvoice	$05
	dc.b nCs5, $08, nC5, nBb4, nAb4, nC5, nBb4, nAb4, nG4
	smpsReturn

Kazotsky_FM1_1A_0_64:
	smpsSetvoice	$05
	dc.b nC5, $10, $10, nBb4, $08, nAb4, nG4, nAb4
	smpsReturn

Kazotsky_FM1_1B_0_64:
	dc.b nF4, $38, nRst, $08
	smpsReturn

Kazotsky_FM1_1C_0_64:
	smpsSetvoice	$05
	dc.b nC5, $04, nCs5, nC5, nBb4, nC5, nBb4, nAb4, nG4, nF4, $08, nRst, $15, nFs4, $03
	smpsReturn

Kazotsky_FM1_1D_0_64:
	smpsSetvoice	$05
	dc.b nG4, $04, nRst, nAb4, nRst, nBb4, nRst, nC5, nRst, nCs5, nRst, nBb4, nRst, nC5, $08, nRst
	smpsReturn

Kazotsky_FM1_1E_0_64:
	smpsSetvoice	$05
	dc.b nC5, $04, nCs5, nC5, nBb4, nC5, nBb4, nAb4, nG4, nF4, $08, nRst, $15, nB4, $03
	smpsReturn

Kazotsky_FM1_1F_0_64:
	dc.b nC5, $04, nRst, nBb4, nRst, nAb4, nRst, nG4, nRst, nF4, nRst, $0C
	smpsSetvoice	$05
	dc.b nC4, $04, nCs4, nD4, nE4
	smpsReturn

Kazotsky_FM2:
	smpsCall Kazotsky_FM2_00_0_16

Kazotsky_FM2_Jump:
	smpsCall Kazotsky_FM2_04_0_64
	smpsCall Kazotsky_FM2_05_0_64
	smpsCall Kazotsky_FM2_06_0_64
	smpsCall Kazotsky_FM2_07_0_64
	smpsCall Kazotsky_FM2_04_0_64
	smpsCall Kazotsky_FM2_05_0_64
	smpsCall Kazotsky_FM2_12_0_64
	smpsCall Kazotsky_FM2_13_0_64
	smpsCall Kazotsky_FM2_04_0_64
	smpsCall Kazotsky_FM2_14_0_64
	smpsCall Kazotsky_FM2_14_0_64
	smpsCall Kazotsky_FM2_15_0_64
	smpsCall Kazotsky_FM2_04_0_64
	smpsCall Kazotsky_FM2_14_0_64
	smpsCall Kazotsky_FM2_16_0_64
	smpsCall Kazotsky_FM2_17_0_64
	smpsCall Kazotsky_FM2_18_0_64
	smpsCall Kazotsky_FM2_19_0_64
	smpsCall Kazotsky_FM2_1A_0_64
	smpsCall Kazotsky_FM2_1B_0_64
	smpsJump Kazotsky_FM2_Jump

Kazotsky_FM2_00_0_16:
	dc.b smpsNoAttack, $10
	smpsReturn

Kazotsky_FM2_04_0_64:
	smpsSetvoice	$06
	dc.b nF2, $08, nF3, nC2, nC3, nF2, nF3, nC2, nC3
	smpsReturn

Kazotsky_FM2_05_0_64:
	smpsSetvoice	$06
	dc.b nE2, $08, nE3, nC2, nC3, nE2, nE3, nC2, $10
	smpsReturn

Kazotsky_FM2_06_0_64:
	smpsSetvoice	$06
	dc.b nE2, $08, nE3, nC2, nC3, nE2, nE3, nC2, nC3
	smpsReturn

Kazotsky_FM2_07_0_64:
	smpsSetvoice	$06
	dc.b nF2, $08, nF3, nC2, nC3, nF2, nF3, nF2, $10
	smpsReturn

Kazotsky_FM2_12_0_64:
	smpsSetvoice	$06
	dc.b nE2, $08, nE3, nC2, nC3, nE2, nE3, nC2, nC3
	smpsReturn

Kazotsky_FM2_13_0_64:
	smpsSetvoice	$06
	dc.b nF2, $08, nF3, nC2, nC3, nF2, nF3, nF2, $10
	smpsReturn

Kazotsky_FM2_14_0_64:
	smpsSetvoice	$06
	dc.b nBb2, $08, nBb3, nF2, nF3, nBb2, nBb3, nF2, nF3
	smpsReturn

Kazotsky_FM2_15_0_64:
	smpsSetvoice	$06
	dc.b nC2, $08, nC3, nE2, nE3, nC2, nC3, nE2, nE3
	smpsReturn

Kazotsky_FM2_16_0_64:
	smpsSetvoice	$06
	dc.b nC2, $08, nC3, nE2, nE3, nC2, nC3, nE2, nE3
	smpsReturn

Kazotsky_FM2_17_0_64:
	smpsSetvoice	$06
	dc.b nF2, $08, nF3, nC2, nC3, nF2, nF3, nF2, $10
	smpsReturn

Kazotsky_FM2_18_0_64:
	smpsSetvoice	$06
	dc.b nC2, $04, nC3, nC2, $08, nE2, $04, nC3, nE2, nE3, nF2, $10, nF1
	smpsReturn

Kazotsky_FM2_19_0_64:
	smpsSetvoice	$06
	dc.b nE2, $08, nE3, nC2, nC3, nE2, nE3, nC2, nC3
	smpsReturn

Kazotsky_FM2_1A_0_64:
	smpsSetvoice	$06
	dc.b nC2, $04, nC3, nC2, $08, nE2, $04, nC3, nE2, nE3, nF2, $10, nF1
	smpsReturn

Kazotsky_FM2_1B_0_64:
	smpsSetvoice	$06
	dc.b nE2, $08, nE3, nC2, nC3, nF2, $20
	smpsReturn

Kazotsky_FM3:
	smpsCall Kazotsky_FM3_04_0_16

Kazotsky_FM3_Jump:
	smpsCall Kazotsky_FM3_05_0_64
	smpsCall Kazotsky_FM3_06_0_64
	smpsCall Kazotsky_FM3_07_0_64
	smpsCall Kazotsky_FM3_13_0_64
	smpsCall Kazotsky_FM3_05_0_64
	smpsCall Kazotsky_FM3_09_0_64
	smpsCall Kazotsky_FM3_14_0_64
	smpsCall Kazotsky_FM3_15_0_64
	smpsCall Kazotsky_FM3_16_0_64
	smpsCall Kazotsky_FM3_17_0_64
	smpsCall Kazotsky_FM3_18_0_64
	smpsCall Kazotsky_FM3_19_0_64
	smpsCall Kazotsky_FM3_16_0_64
	smpsCall Kazotsky_FM3_17_0_64
	smpsCall Kazotsky_FM3_1A_0_64
	smpsCall Kazotsky_FM3_1B_0_64
	smpsCall Kazotsky_FM3_1C_0_64
	smpsCall Kazotsky_FM3_1D_0_64
	smpsCall Kazotsky_FM3_1E_0_64
	smpsCall Kazotsky_FM3_1F_0_64
	smpsJump Kazotsky_FM3_Jump

Kazotsky_FM3_04_0_16:
	smpsSetvoice	$05
	dc.b nG3, $04, nBb3, nBb3, nC4
	smpsReturn

Kazotsky_FM3_05_0_64:
	smpsSetvoice	$05
	dc.b nC4, $04, nRst, nC4, nRst, nG3, nBb3, nBb3, nC4, nC4, nRst, nC4, nRst, nF4, nRst, $01
	dc.b nE4, $04, nRst, $02, nDs4, $04, nRst, $01
	smpsReturn

Kazotsky_FM3_06_0_64:
	smpsSetvoice	$05
	dc.b nE4, $04, nRst, nE4, nRst, nG4, nRst, $01, nF4, $04, nRst, $02, nDs4, $04, nRst, $01
	dc.b nE4, $10, nRst, $0D, nFs4, $03
	smpsReturn

Kazotsky_FM3_07_0_64:
	dc.b nG4, $04, nRst, nG4, nRst, nBb4, nRst, $01, nBb4, $04, nRst, $02, nG4, $04, nRst, $01
	dc.b nG4, $04, nRst, nG4, nRst, nC5, nRst, $01, nBb4, $04, nRst, $02, nG4, $04, nRst, $01
	smpsReturn

Kazotsky_FM3_13_0_64:
	smpsSetvoice	$05
	dc.b nF4, $04, nRst, nF4, nRst, nG4, nG4, nG4, nE4, nC4, $14, nRst, $04, $05, nB3, $03
	smpsReturn

Kazotsky_FM3_09_0_64:
	smpsSetvoice	$05
	dc.b nE4, $04, nRst, nE4, nRst, nG4, nRst, $01, nF4, $04, nRst, $02, nDs4, $04, nRst, $01
	dc.b nE4, $14, nRst, $0C
	smpsReturn

Kazotsky_FM3_14_0_64:
	dc.b nBb4, $04, nRst, nBb4, nRst, nC5, nC5, nBb4, nBb4, nG4, nRst, nG4, nRst, nBb4, nRst, $01
	dc.b nG4, $04, nRst, $02, nG4, $04, nRst, $01
	smpsReturn

Kazotsky_FM3_15_0_64:
	smpsSetvoice	$05
	dc.b nF4, $04, nRst, nF4, nRst, nG4, nG4, nG4, nE4, nC4, $14, nRst, $04, $08
	smpsReturn

Kazotsky_FM3_16_0_64:
	smpsSetvoice	$05
	dc.b nA4, $10, $10, nC4, nA4, $04, nRst, nA4, nRst
	smpsReturn

Kazotsky_FM3_17_0_64:
	dc.b nC5, $08, nBb4, nA4, nBb4, nG4, $18, nRst, $06, $02
	smpsReturn

Kazotsky_FM3_18_0_64:
	dc.b nBb4, $10, $10, nC5, $08, nBb4, nAb4, nBb4
	smpsReturn

Kazotsky_FM3_19_0_64:
	smpsSetvoice	$05
	dc.b nBb4, $08, nG4, nG4, nF4, nG4, nG4, nF4, nE4
	smpsReturn

Kazotsky_FM3_1A_0_64:
	dc.b nG4, $10, $10, $08, nF4, nE4, nF4
	smpsReturn

Kazotsky_FM3_1B_0_64:
	dc.b nC4, $38, nRst, $08
	smpsReturn

Kazotsky_FM3_1C_0_64:
	smpsSetvoice	$05
	dc.b nG4, $04, nBb4, nG4, nG4, nG4, nG4, nF4, nE4, nC4, $08, nRst, $15, nDs4, $03
	smpsReturn

Kazotsky_FM3_1D_0_64:
	dc.b nE4, $04, nRst, nF4, nRst, nG4, nRst, nG4, nRst, nBb4, nRst, nG4, nRst, nG4, $08, nRst
	smpsReturn

Kazotsky_FM3_1E_0_64:
	smpsSetvoice	$05
	dc.b nG4, $04, nBb4, nG4, nG4, nG4, nG4, nF4, nE4, nC4, $08, nRst, $15, nAb4, $03
	smpsReturn

Kazotsky_FM3_1F_0_64:
	dc.b nG4, $04, nRst, nG4, nRst, nF4, nRst, nE4, nRst, nC4, nRst, $0C
	smpsSetvoice	$05
	dc.b nG3, $04, nBb3, nBb3, nC4
	smpsReturn

Kazotsky_FM4:
	smpsCall Kazotsky_FM4_01_0_16

Kazotsky_FM4_Jump:
	smpsCall Kazotsky_FM4_04_0_64_79
	smpsCall Kazotsky_FM4_05_0_64
	smpsCall Kazotsky_FM4_05_0_64
	smpsCall Kazotsky_FM4_04_0_64
	smpsCall Kazotsky_FM4_04_0_64
	smpsCall Kazotsky_FM4_05_0_64
	smpsCall Kazotsky_FM4_10_0_64
	smpsCall Kazotsky_FM4_11_0_64
	smpsCall Kazotsky_FM4_12_0_64_60
	smpsCall Kazotsky_FM4_13_0_64
	smpsCall Kazotsky_FM4_14_0_64
	smpsCall Kazotsky_FM4_15_0_64
	smpsCall Kazotsky_FM4_12_0_64
	smpsCall Kazotsky_FM4_13_0_64
	smpsCall Kazotsky_FM4_16_0_64
	smpsCall Kazotsky_FM4_17_0_64
	smpsCall Kazotsky_FM4_18_0_64
	smpsCall Kazotsky_FM4_19_0_64
	smpsCall Kazotsky_FM4_1A_0_64
	smpsCall Kazotsky_FM4_1B_0_64
	smpsAlterVol	$FA
	smpsJump Kazotsky_FM4_Jump

Kazotsky_FM4_01_0_16:
	dc.b smpsNoAttack, $10
	smpsReturn

Kazotsky_FM4_04_0_64_79:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsPan		panRight, $00
	dc.b nA4, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM4_05_0_64:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsAlterVol	$E7
	dc.b nG4, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM4_04_0_64:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsAlterVol	$E7
	dc.b nA4, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM4_10_0_64:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsAlterVol	$E7
	dc.b nG4, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM4_11_0_64:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsAlterVol	$E7
	dc.b nA4, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM4_12_0_64_60:
	smpsSetvoice	$0B
	smpsAlterVol	$ED
	dc.b nA4, $10, nC5, nF5, nC5
	smpsReturn

Kazotsky_FM4_13_0_64:
	smpsSetvoice	$0B
	dc.b nBb4, $10, nCs5, nF5, nCs5
	smpsReturn

Kazotsky_FM4_14_0_64:
	dc.b nBb4, $10, nCs5, nG4, nAb4
	smpsReturn

Kazotsky_FM4_15_0_64:
	dc.b nG4, $10, nC5, nE5, nC5
	smpsReturn

Kazotsky_FM4_12_0_64:
	smpsSetvoice	$0B
	dc.b nA4, $10, nC5, nF5, nC5
	smpsReturn

Kazotsky_FM4_16_0_64:
	dc.b nG4, $10, nC5, nE5, nC5
	smpsReturn

Kazotsky_FM4_17_0_64:
	dc.b nA4, $10, nC5, nF5, $20
	smpsReturn

Kazotsky_FM4_18_0_64:
	dc.b nE5, $04, $04, nRst, nE5, nE5, nE5, nRst, nE5, nF5, nRst, $1C
	smpsReturn

Kazotsky_FM4_19_0_64:
	dc.b nE4, $10, nG4, nC5, nE5
	smpsReturn

Kazotsky_FM4_1A_0_64:
	dc.b nE5, $04, $04, nRst, nE5, nE5, nE5, nRst, nE5, nF5, nRst, $1C
	smpsReturn

Kazotsky_FM4_1B_0_64:
	dc.b nC5, $08, nE5, nG5, nE5, nF5, nRst, nF5, $10
	smpsReturn

Kazotsky_FM5:
	smpsCall Kazotsky_FM5_00_0_16

Kazotsky_FM5_Jump:
	smpsCall Kazotsky_FM5_04_0_64_79
	smpsCall Kazotsky_FM5_05_0_64
	smpsCall Kazotsky_FM5_05_0_64
	smpsCall Kazotsky_FM5_04_0_64
	smpsCall Kazotsky_FM5_04_0_64
	smpsCall Kazotsky_FM5_05_0_64
	smpsCall Kazotsky_FM5_10_0_64
	smpsCall Kazotsky_FM5_11_0_64
	smpsCall Kazotsky_FM5_12_0_64_60
	smpsCall Kazotsky_FM5_13_0_64
	smpsCall Kazotsky_FM5_14_0_64
	smpsCall Kazotsky_FM5_15_0_64
	smpsCall Kazotsky_FM5_12_0_64
	smpsCall Kazotsky_FM5_13_0_64
	smpsCall Kazotsky_FM5_16_0_64
	smpsCall Kazotsky_FM5_17_0_64
	smpsCall Kazotsky_FM5_18_0_64
	smpsCall Kazotsky_FM5_19_0_64
	smpsCall Kazotsky_FM5_1A_0_64
	smpsCall Kazotsky_FM5_1B_0_64
	smpsAlterVol	$FA
	smpsJump Kazotsky_FM5_Jump

Kazotsky_FM5_00_0_16:
	dc.b smpsNoAttack, $10
	smpsReturn

Kazotsky_FM5_04_0_64_79:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsPan		panLeft, $00
	dc.b nC5, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM5_05_0_64:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsAlterVol	$E7
	dc.b nC5, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM5_04_0_64:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsAlterVol	$E7
	dc.b nC5, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM5_10_0_64:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsAlterVol	$E7
	dc.b nC5, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM5_11_0_64:
	dc.b smpsNoAttack, $08
	smpsSetvoice	$0B
	smpsAlterVol	$E7
	dc.b nC5, $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $0C
	smpsAlterVol	$E7
	dc.b $04
	smpsAlterVol	$19
	dc.b $04
	smpsReturn

Kazotsky_FM5_12_0_64_60:
	smpsSetvoice	$0B
	smpsAlterVol	$ED
	dc.b nF4, $10, nA4, nC5, nA4
	smpsReturn

Kazotsky_FM5_13_0_64:
	smpsSetvoice	$0B
	dc.b nG4, $10, nBb4, nCs5, nBb4
	smpsReturn

Kazotsky_FM5_14_0_64:
	dc.b nG4, $10, nBb4, nE4, nF4
	smpsReturn

Kazotsky_FM5_15_0_64:
	dc.b nE4, $10, nG4, nC5, nG4
	smpsReturn

Kazotsky_FM5_12_0_64:
	smpsSetvoice	$0B
	dc.b nF4, $10, nA4, nC5, nA4
	smpsReturn

Kazotsky_FM5_16_0_64:
	dc.b nE4, $10, nG4, nC5, nG4
	smpsReturn

Kazotsky_FM5_17_0_64:
	dc.b nF4, $10, nA4, nC5, $20
	smpsReturn

Kazotsky_FM5_18_0_64:
	dc.b nC5, $04, $04, nRst, nC5, nC5, nC5, nRst, nC5, nC5, nRst, $1C
	smpsReturn

Kazotsky_FM5_19_0_64:
	dc.b nG4, $10, nC5, nE5, nG5
	smpsReturn

Kazotsky_FM5_1A_0_64:
	dc.b nC5, $04, $04, nRst, nC5, nC5, nC5, nRst, nC5, nC5, nRst, $1C
	smpsReturn

Kazotsky_FM5_1B_0_64:
	dc.b nG4, $08, nC5, nE5, nC5, nC5, nRst, nC5, $10
	smpsReturn

Kazotsky_DAC:
	smpsCall Kazotsky_DAC_04_0_16

Kazotsky_DAC_Jump:
	smpsCall Kazotsky_DAC_05_0_64
	smpsCall Kazotsky_DAC_0B_0_64
	smpsCall Kazotsky_DAC_05_0_64
	smpsCall Kazotsky_DAC_07_0_64
	smpsCall Kazotsky_DAC_05_0_64
	smpsCall Kazotsky_DAC_0B_0_64
	smpsCall Kazotsky_DAC_0F_0_64
	smpsCall Kazotsky_DAC_10_0_64
	smpsCall Kazotsky_DAC_09_0_64
	smpsCall Kazotsky_DAC_0B_0_64
	smpsCall Kazotsky_DAC_09_0_64
	smpsCall Kazotsky_DAC_07_0_64
	smpsCall Kazotsky_DAC_09_0_64
	smpsCall Kazotsky_DAC_0B_0_64
	smpsCall Kazotsky_DAC_11_0_64
	smpsCall Kazotsky_DAC_10_0_64
	smpsCall Kazotsky_DAC_12_0_64
	smpsCall Kazotsky_DAC_0D_0_64
	smpsCall Kazotsky_DAC_13_0_64
	smpsCall Kazotsky_DAC_14_0_64
	smpsJump Kazotsky_DAC_Jump

Kazotsky_DAC_04_0_16:
	dc.b smpsNoAttack, $10
	smpsReturn

Kazotsky_DAC_05_0_64:	; Effect not supported:
	dc.b dKick, $08, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare
	smpsReturn

Kazotsky_DAC_0B_0_64:
	dc.b dKick, $08, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare, $04, $04
	smpsReturn

Kazotsky_DAC_07_0_64:
	dc.b dKick, $08, dSnare, dKick, dSnare, dKick, dSnare, $04, dKick, dSnare, $08, $04, $04
	smpsReturn

Kazotsky_DAC_0F_0_64:	; Effect not supported:
	dc.b dKick, $08, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare
	smpsReturn

Kazotsky_DAC_10_0_64:
	dc.b dKick, $08, dSnare, dKick, dSnare, dKick, dSnare, $04, $08, $04, $08
	smpsReturn

Kazotsky_DAC_09_0_64:
	dc.b dKick, $08, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare
	smpsReturn

Kazotsky_DAC_11_0_64:
	dc.b dKick, $08, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare
	smpsReturn

Kazotsky_DAC_12_0_64:
	dc.b dSnare, $04, $04, $04, $04, $04, $04, $04, $04, $08, dKick, dSnare, $10
	smpsReturn

Kazotsky_DAC_0D_0_64:
	dc.b dKick, $08, dSnare, dKick, dSnare, dKick, dSnare, dKick, dSnare
	smpsReturn

Kazotsky_DAC_13_0_64:
	dc.b dSnare, $04, $04, $04, $04, $04, $04, $04, $04, $08, dKick, dSnare, $10
	smpsReturn

Kazotsky_DAC_14_0_64:
	dc.b dKick, $08, dSnare, dKick, dSnare, dKick, dSnare, dSnare, $04, $04, $04, $04
	smpsReturn

Kazotsky_PSG1:
	smpsCall Kazotsky_PSG1_03_0_16

Kazotsky_PSG1_Jump:
	smpsCall Kazotsky_PSG1_04_0_64
	smpsCall Kazotsky_PSG1_05_0_64
	smpsCall Kazotsky_PSG1_06_0_64
	smpsCall Kazotsky_PSG1_07_0_64
	smpsCall Kazotsky_PSG1_04_0_64
	smpsCall Kazotsky_PSG1_0B_0_64
	smpsCall Kazotsky_PSG1_14_0_64
	smpsCall Kazotsky_PSG1_15_0_64
	smpsCall Kazotsky_PSG1_16_0_64
	smpsCall Kazotsky_PSG1_17_0_64
	smpsCall Kazotsky_PSG1_18_0_64
	smpsCall Kazotsky_PSG1_19_0_64
	smpsCall Kazotsky_PSG1_16_0_64
	smpsCall Kazotsky_PSG1_17_0_64
	smpsCall Kazotsky_PSG1_1A_0_64
	smpsCall Kazotsky_PSG1_1B_0_64
	smpsCall Kazotsky_PSG1_1C_0_64
	smpsCall Kazotsky_PSG1_1D_0_64
	smpsCall Kazotsky_PSG1_1E_0_64
	smpsCall Kazotsky_PSG1_1F_0_64
	smpsJump Kazotsky_PSG1_Jump

Kazotsky_PSG1_03_0_16:
	smpsPSGvoice	TFTone_02
	dc.b nC2, $04, nCs2, nD2, nE2
	smpsReturn

Kazotsky_PSG1_04_0_64:
	smpsPSGvoice	TFTone_02
	dc.b nF2, $04, nRst, nF2, nRst, nC2, nCs2, nD2, nE2, nF2, nRst, nF2, nRst, nAb2, nRst, $01
	dc.b nG2, $04, nRst, $02, nFs2, $05
	smpsReturn

Kazotsky_PSG1_05_0_64:
	dc.b nG2, $04, nRst, nG2, nRst, nBb2, nRst, $01, nAb2, $04, nRst, $02, nFs2, $05, nG2, $1D
	dc.b nA2, $03
	smpsReturn

Kazotsky_PSG1_06_0_64:
	dc.b nBb2, $04, nRst, nBb2, nRst, nDs3, nRst, $01, nCs3, $04, nRst, $02, nBb2, $05, nC3, $04
	dc.b nRst, nC3, nRst, nDs3, nRst, $01, nCs3, $04, nRst, $02, nBb2, $05
	smpsReturn

Kazotsky_PSG1_07_0_64:
	dc.b nAb2, $04, nRst, nAb2, nRst, nBb2, nC3, nBb2, nG2, nF2, $14, nRst, $04, $05, nE2, $03
	smpsReturn

Kazotsky_PSG1_0B_0_64:
	dc.b nG2, $04, nRst, nG2, nRst, nBb2, nRst, $01, nAb2, $04, nRst, $02, nFs2, $05, nG2, $20
	smpsReturn

Kazotsky_PSG1_14_0_64:
	dc.b nCs3, $04, nRst, nCs3, nRst, nDs3, nE3, nD3, nCs3, nC3, nRst, nC3, nRst, nCs3, nRst, $01
	dc.b nC3, $04, nRst, $02, nBb2, $05
	smpsReturn

Kazotsky_PSG1_15_0_64:
	dc.b nAb2, $04, nRst, nAb2, nRst, nBb2, nC3, nBb2, nG2, nF2, $14, nRst, $04, $08
	smpsReturn

Kazotsky_PSG1_16_0_64:
	dc.b nC3, $10, $10, nF2, nC3, $04, nRst, nC3, nRst
	smpsReturn

Kazotsky_PSG1_17_0_64:
	dc.b nDs3, $08, nCs3, nC3, nCs3, nBb2, $1E, nRst, $02
	smpsReturn

Kazotsky_PSG1_18_0_64:
	dc.b nCs3, $10, $10, nDs3, $08, nCs3, nC3, nCs3
	smpsReturn

Kazotsky_PSG1_19_0_64:
	dc.b nCs3, $08, nC3, nBb2, nAb2, nC3, nBb2, nAb2, nG2
	smpsReturn

Kazotsky_PSG1_1A_0_64:
	dc.b nC3, $10, $10, nBb2, $08, nAb2, nG2, nAb2
	smpsReturn

Kazotsky_PSG1_1B_0_64:
	dc.b nF2, $38, nRst, $08
	smpsReturn

Kazotsky_PSG1_1C_0_64:
	dc.b nC3, $04, nCs3, nC3, nBb2, nC3, nBb2, nAb2, nG2, nF2, $08, nF3, nF2, $0D, nFs2, $03
	smpsReturn

Kazotsky_PSG1_1D_0_64:
	dc.b nG2, $04, nRst, nAb2, nRst, nBb2, nRst, nC3, nRst, nCs3, nRst, nBb2, nRst, nC3, $10
	smpsReturn

Kazotsky_PSG1_1E_0_64:
	dc.b nC3, $04, nCs3, nC3, nBb2, nC3, nBb2, nAb2, nG2, nF2, $08, nF3, nF2, $0D, nB2, $03
	smpsReturn

Kazotsky_PSG1_1F_0_64:
	dc.b nC3, $04, nRst, nBb2, nRst, nAb2, nRst, nG2, nRst, nF2, nRst, $0C
	smpsPSGvoice	TFTone_02
	dc.b nC2, $04, nCs2, nD2, nE2
	smpsReturn

Kazotsky_PSG2:
	smpsCall Kazotsky_PSG2_04_0_16

Kazotsky_PSG2_Jump:
	smpsCall Kazotsky_PSG2_05_0_64
	smpsCall Kazotsky_PSG2_06_0_64
	smpsCall Kazotsky_PSG2_07_0_64
	smpsCall Kazotsky_PSG2_13_0_64
	smpsCall Kazotsky_PSG2_05_0_64
	smpsCall Kazotsky_PSG2_06_0_64
	smpsCall Kazotsky_PSG2_14_0_64
	smpsCall Kazotsky_PSG2_15_0_64
	smpsCall Kazotsky_PSG2_16_0_64_0F
	smpsCall Kazotsky_PSG2_17_0_64
	smpsCall Kazotsky_PSG2_17_0_64
	smpsCall Kazotsky_PSG2_19_0_64
	smpsCall Kazotsky_PSG2_16_0_64
	smpsCall Kazotsky_PSG2_17_0_64
	smpsCall Kazotsky_PSG2_18_0_64
	smpsCall Kazotsky_PSG2_16_0_64
	smpsCall Kazotsky_PSG2_1A_0_64
	smpsCall Kazotsky_PSG2_1B_0_64_0C
	smpsCall Kazotsky_PSG2_1C_0_64
	smpsCall Kazotsky_PSG2_1D_0_64
	smpsPSGAlterVol	$FB
	smpsJump Kazotsky_PSG2_Jump

Kazotsky_PSG2_04_0_16:
	dc.b smpsNoAttack, $10
	smpsReturn

Kazotsky_PSG2_05_0_64:
	smpsPSGvoice	TFTone_02
	dc.b nF1, $10, $10, $10, $10
	smpsReturn

Kazotsky_PSG2_06_0_64:
	smpsPSGvoice	TFTone_02
	dc.b nG1, $10, $10, $10, $10
	smpsReturn

Kazotsky_PSG2_07_0_64:
	smpsPSGvoice	TFTone_02
	dc.b nBb1, $10, $10, $10, $10
	smpsReturn

Kazotsky_PSG2_13_0_64:
	smpsPSGvoice	TFTone_02
	dc.b nA1, $10, $10, $10, $10
	smpsReturn

Kazotsky_PSG2_14_0_64:
	smpsPSGvoice	TFTone_02
	dc.b nBb1, $10, $10, $10, $10
	smpsReturn

Kazotsky_PSG2_15_0_64:
	smpsPSGvoice	TFTone_02
	dc.b nA1, $10, $10, $10, $10
	smpsReturn

Kazotsky_PSG2_16_0_64_0F:
	smpsPSGvoice	TFTone_01
	dc.b nA1, $08
	smpsPSGAlterVol	$03
	dc.b nF1
	smpsPSGAlterVol	$FD
	dc.b nA1
	smpsPSGAlterVol	$03
	dc.b nF1, $04
	smpsPSGAlterVol	$FD
	dc.b nA1
	smpsPSGAlterVol	$03
	dc.b nF1
	smpsPSGAlterVol	$FD
	dc.b nA1, $08
	smpsPSGAlterVol	$03
	dc.b nF1, $04
	smpsPSGAlterVol	$FD
	dc.b nA1, $08
	smpsPSGAlterVol	$03
	dc.b nF1
	smpsReturn

Kazotsky_PSG2_17_0_64:
	smpsPSGvoice	TFTone_01
	smpsPSGAlterVol	$FD
	dc.b nBb1, $08
	smpsPSGAlterVol	$03
	dc.b nG1
	smpsPSGAlterVol	$FD
	dc.b nBb1
	smpsPSGAlterVol	$03
	dc.b nG1, $04
	smpsPSGAlterVol	$FD
	dc.b nBb1
	smpsPSGAlterVol	$03
	dc.b nG1
	smpsPSGAlterVol	$FD
	dc.b nBb1, $08
	smpsPSGAlterVol	$03
	dc.b nG1, $04
	smpsPSGAlterVol	$FD
	dc.b nBb1, $08
	smpsPSGAlterVol	$03
	dc.b nG1
	smpsReturn

Kazotsky_PSG2_19_0_64:
	smpsPSGAlterVol	$FD
	dc.b nG1, $08
	smpsPSGAlterVol	$03
	dc.b nE1
	smpsPSGAlterVol	$FD
	dc.b nG1
	smpsPSGAlterVol	$03
	dc.b nE1, $04
	smpsPSGAlterVol	$FD
	dc.b nG1
	smpsPSGAlterVol	$03
	dc.b nE1
	smpsPSGAlterVol	$FD
	dc.b nG1, $08
	smpsPSGAlterVol	$03
	dc.b nE1, $04
	smpsPSGAlterVol	$FD
	dc.b nG1, $08
	smpsPSGAlterVol	$03
	dc.b nE1
	smpsReturn

Kazotsky_PSG2_16_0_64:
	smpsPSGvoice	TFTone_01
	smpsPSGAlterVol	$FD
	dc.b nA1, $08
	smpsPSGAlterVol	$03
	dc.b nF1
	smpsPSGAlterVol	$FD
	dc.b nA1
	smpsPSGAlterVol	$03
	dc.b nF1, $04
	smpsPSGAlterVol	$FD
	dc.b nA1
	smpsPSGAlterVol	$03
	dc.b nF1
	smpsPSGAlterVol	$FD
	dc.b nA1, $08
	smpsPSGAlterVol	$03
	dc.b nF1, $04
	smpsPSGAlterVol	$FD
	dc.b nA1, $08
	smpsPSGAlterVol	$03
	dc.b nF1
	smpsReturn

Kazotsky_PSG2_18_0_64:
	smpsPSGvoice	TFTone_01
	smpsPSGAlterVol	$FD
	dc.b nC2, $08
	smpsPSGAlterVol	$03
	dc.b nG1
	smpsPSGAlterVol	$FD
	dc.b nC2
	smpsPSGAlterVol	$03
	dc.b nG1, $04
	smpsPSGAlterVol	$FD
	dc.b nC2
	smpsPSGAlterVol	$03
	dc.b nG1
	smpsPSGAlterVol	$FD
	dc.b nC2, $08
	smpsPSGAlterVol	$03
	dc.b nG1, $04
	smpsPSGAlterVol	$FD
	dc.b nC2, $08
	smpsPSGAlterVol	$03
	dc.b nG1
	smpsReturn

Kazotsky_PSG2_1A_0_64:
	smpsPSGvoice	TFTone_02
	dc.b nE2, $10, $10, nF4, $08, nMaxPSG, nF4, $10
	smpsReturn

Kazotsky_PSG2_1B_0_64_0C:
	smpsPSGvoice	TFTone_02
	smpsPSGAlterVol	$FD
	dc.b nC2, $02
	smpsPSGAlterVol	$05
	dc.b nG1
	smpsPSGAlterVol	$FB
	dc.b nE2
	smpsPSGAlterVol	$05
	dc.b nC2
	smpsPSGAlterVol	$FB
	dc.b nG2
	smpsPSGAlterVol	$05
	dc.b nE2
	smpsPSGAlterVol	$FB
	dc.b nC3
	smpsPSGAlterVol	$05
	dc.b nG2
	smpsPSGAlterVol	$FB
	dc.b nE3
	smpsPSGAlterVol	$05
	dc.b nC3
	smpsPSGAlterVol	$FB
	dc.b nG3
	smpsPSGAlterVol	$05
	dc.b nE3
	smpsPSGAlterVol	$FB
	dc.b nC4
	smpsPSGAlterVol	$05
	dc.b nG3
	smpsPSGAlterVol	$FB
	dc.b nG3
	smpsPSGAlterVol	$05
	dc.b nC4
	smpsPSGAlterVol	$FB
	dc.b nE3
	smpsPSGAlterVol	$05
	dc.b nG3
	smpsPSGAlterVol	$FB
	dc.b nC3
	smpsPSGAlterVol	$05
	dc.b nG3
	smpsPSGAlterVol	$FB
	dc.b nG2
	smpsPSGAlterVol	$05
	dc.b nC3
	smpsPSGAlterVol	$FB
	dc.b nE2
	smpsPSGAlterVol	$05
	dc.b nG2
	smpsPSGAlterVol	$FB
	dc.b nC2
	smpsPSGAlterVol	$05
	dc.b nC3
	smpsPSGAlterVol	$FB
	dc.b nG1
	smpsPSGAlterVol	$05
	dc.b nG2
	smpsPSGAlterVol	$FB
	dc.b nE1
	smpsPSGAlterVol	$05
	dc.b nG1
	smpsPSGAlterVol	$FB
	dc.b nC1
	smpsPSGAlterVol	$05
	dc.b nE1
	smpsReturn

Kazotsky_PSG2_1C_0_64:
	smpsPSGvoice	TFTone_02
	dc.b nE2, $10, $10, nF4, $08, nMaxPSG, nF4, $10
	smpsReturn

Kazotsky_PSG2_1D_0_64:
	smpsPSGvoice	TFTone_02
	smpsPSGAlterVol	$FB
	dc.b nC2, $02
	smpsPSGAlterVol	$05
	dc.b nG1
	smpsPSGAlterVol	$FB
	dc.b nE2
	smpsPSGAlterVol	$05
	dc.b nC2
	smpsPSGAlterVol	$FB
	dc.b nG2
	smpsPSGAlterVol	$05
	dc.b nE2
	smpsPSGAlterVol	$FB
	dc.b nC3
	smpsPSGAlterVol	$05
	dc.b nG2
	smpsPSGAlterVol	$FB
	dc.b nE3
	smpsPSGAlterVol	$05
	dc.b nC3
	smpsPSGAlterVol	$FB
	dc.b nG3
	smpsPSGAlterVol	$05
	dc.b nE3
	smpsPSGAlterVol	$FB
	dc.b nC4
	smpsPSGAlterVol	$05
	dc.b nG3
	smpsPSGAlterVol	$FB
	dc.b nG3
	smpsPSGAlterVol	$05
	dc.b nC4, nF2, $08, nF3, nRst, $10
	smpsReturn

Kazotsky_PSG3:
	smpsPSGform	$E7
	smpsCall Kazotsky_PSG3_01_0_16

Kazotsky_PSG3_Jump:
	smpsCall Kazotsky_PSG3_02_0_64_0F
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_0E_0_64
	smpsCall Kazotsky_PSG3_0F_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_02_0_64
	smpsCall Kazotsky_PSG3_10_0_64
	smpsCall Kazotsky_PSG3_0F_0_64
	smpsCall Kazotsky_PSG3_11_0_64_0A
	smpsCall Kazotsky_PSG3_0F_0_64_0F
	smpsCall Kazotsky_PSG3_12_0_64_0A
	smpsCall Kazotsky_PSG3_13_0_64
	smpsJump Kazotsky_PSG3_Jump

Kazotsky_PSG3_01_0_16:
	dc.b nRst, $10
	smpsReturn

Kazotsky_PSG3_02_0_64_0F:
	smpsPSGvoice	TFTone_01
	dc.b nMaxPSG, $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsReturn

Kazotsky_PSG3_02_0_64:
	smpsPSGvoice	TFTone_01
	smpsPSGAlterVol	$FB
	dc.b nMaxPSG, $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsReturn

Kazotsky_PSG3_0E_0_64:
	smpsPSGvoice	TFTone_01
	smpsPSGAlterVol	$FB
	dc.b nMaxPSG, $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsReturn

Kazotsky_PSG3_0F_0_64:
	smpsPSGvoice	TFTone_01
	smpsPSGAlterVol	$FB
	dc.b nMaxPSG, $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsReturn

Kazotsky_PSG3_10_0_64:
	smpsPSGvoice	TFTone_01
	smpsPSGAlterVol	$FB
	dc.b nMaxPSG, $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsReturn

Kazotsky_PSG3_11_0_64_0A:
	smpsPSGvoice	TFTone_01
	smpsPSGAlterVol	$FB
	dc.b nMaxPSG, $10, $10, $10, $10
	smpsReturn

Kazotsky_PSG3_0F_0_64_0F:
	smpsPSGvoice	TFTone_01
	dc.b nMaxPSG, $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsReturn

Kazotsky_PSG3_12_0_64_0A:
	smpsPSGvoice	TFTone_01
	smpsPSGAlterVol	$FB
	dc.b nMaxPSG, $10, $10, $10, $10
	smpsReturn

Kazotsky_PSG3_13_0_64:
	smpsPSGvoice	TFTone_01
	dc.b nMaxPSG, $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04
	smpsPSGAlterVol	$03
	dc.b $04
	smpsPSGAlterVol	$FD
	dc.b $04
	smpsPSGAlterVol	$05
	dc.b $04
	smpsPSGAlterVol	$FB
	dc.b $04, $04, $04, $04
	smpsReturn

	smpsFooterEndSong	"TG2000Tracks/TF2.asm"