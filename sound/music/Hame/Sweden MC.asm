SwedenMC_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     SwedenMC_Voices
	smpsHeaderChan      $07, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       SwedenMC_DAC,	$00, $F2
	smpsHeaderFM        SwedenMC_FM1,	$00, $00
	smpsHeaderFM        SwedenMC_FM2,	$00, $00
	smpsHeaderFM        SwedenMC_FM3,	$00, $00
	smpsHeaderFM        SwedenMC_FM4,	$00, $00
	smpsHeaderFM        SwedenMC_FM5,	$00, $00
	smpsHeaderFM        SwedenMC_FM6,	$00, $00
	smpsHeaderPSG       SwedenMC_PSG1,	$00, $00, $00, $00
	smpsHeaderPSG       SwedenMC_PSG2,	$00, $00, $00, $00
	smpsHeaderPSG       SwedenMC_PSG3,	$00, $00, $00, $00

; DAC Data
SwedenMC_DAC:
; PSG3 Data
SwedenMC_PSG3:
	smpsStop

; FM1 Data
SwedenMC_FM1:
	smpsSetvoice        $00
	smpsAlterVol        $0A
	smpsPan             panCenter, $00

SwedenMC_Loop0A:
	dc.b	nE2, $78
	smpsPan             panLeft, $00
	dc.b	smpsNoAttack, $28
	smpsPan             panCenter, $00
	dc.b	nG2, $78
	smpsPan             panLeft, $00
	dc.b	smpsNoAttack, $28
	smpsPan             panCenter, $00
	dc.b	nA2, $78
	smpsPan             panLeft, $00
	dc.b	smpsNoAttack, $28
	smpsPan             panCenter, $00
	dc.b	nD2, $7F, smpsNoAttack, $21
	smpsLoop            $00, $07, SwedenMC_Loop0A
	smpsPan             panRight, $00
	dc.b	nB1, $7F, smpsNoAttack, $21, nE2, $7F, smpsNoAttack, $21, nA2, $7F, smpsNoAttack, $21
	dc.b	nG1, $7F, smpsNoAttack, $21, nB1, $7F, smpsNoAttack, $21, nE2, $7F, smpsNoAttack, $21
	dc.b	nA2, $7F, smpsNoAttack, $21, nG1

SwedenMC_Loop0B:
	dc.b	$7F, smpsNoAttack
	smpsLoop            $00, $06, SwedenMC_Loop0B
	dc.b	$26
	smpsAlterVol        $F6
	smpsPan             panCenter, $00
	smpsJump            SwedenMC_FM1

; FM2 Data
SwedenMC_FM2:
	smpsPan             panCenter, $00
	dc.b	nRst, $50
	smpsSetvoice        $00
	smpsAlterVol        $0A

SwedenMC_Loop08:
	dc.b	nFs2, $78
	smpsPan             panRight, $00
	dc.b	smpsNoAttack, $28
	smpsPan             panCenter, $00
	dc.b	nB2, $78
	smpsPan             panRight, $00
	dc.b	smpsNoAttack, $28
	smpsPan             panCenter, $00
	dc.b	nG2, $7F, smpsNoAttack, $21
	smpsPan             panRight, $00
	dc.b	smpsNoAttack, $50
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, nG2
	smpsLoop            $00, $06, SwedenMC_Loop08
	dc.b	nFs2, $78
	smpsPan             panRight, $00
	dc.b	smpsNoAttack, $28
	smpsPan             panCenter, $00
	dc.b	nB2, $78
	smpsPan             panRight, $00
	dc.b	smpsNoAttack, $28
	smpsPan             panCenter, $00
	dc.b	nG2, $7F, smpsNoAttack, $21
	smpsPan             panRight, $00
	dc.b	smpsNoAttack, $50
	smpsPan             panLeft, $00
	dc.b	nB2, $7F, smpsNoAttack, $21, nE3, $7F, smpsNoAttack, $21, nA1, $7F, smpsNoAttack, $21
	dc.b	nFs2, $7F, smpsNoAttack, $21, nB2, $7F, smpsNoAttack, $21, nE3, $7F, smpsNoAttack, $21
	dc.b	nA1, $7F, smpsNoAttack, $21, nG2

SwedenMC_Loop09:
	dc.b	$7F, smpsNoAttack
	smpsLoop            $00, $06, SwedenMC_Loop09
	dc.b	$26
	smpsAlterVol        $F6
	smpsPan             panCenter, $00
	smpsJump            SwedenMC_FM2

; FM3 Data
SwedenMC_FM3:
	smpsSetvoice        $00
	smpsAlterVol        $0C
	smpsPan             panCenter, $00

SwedenMC_Loop06:
	dc.b	nE3, $7F, smpsNoAttack, $21, nA3, $7F, smpsNoAttack, $21, nFs3, $7F, smpsNoAttack, $21
	dc.b	nCs4, $7F, smpsNoAttack, $21
	smpsLoop            $00, $07, SwedenMC_Loop06
	dc.b	nA3, $7F, smpsNoAttack, $21, nB3, $7F, smpsNoAttack, $21, nE3, $7F, smpsNoAttack, $21
	dc.b	nD3, $7F, smpsNoAttack, $21, nD4, $7F, smpsNoAttack, $21, nB3, $7F, smpsNoAttack, $21
	dc.b	nE3, $7F, smpsNoAttack, $21, nB3

SwedenMC_Loop07:
	dc.b	$7F, smpsNoAttack
	smpsLoop            $00, $06, SwedenMC_Loop07
	dc.b	$26
	smpsAlterVol        $F4
	smpsPan             panCenter, $00
	smpsJump            SwedenMC_FM3

; FM4 Data
SwedenMC_FM4:
	smpsSetvoice        $00
	smpsAlterVol        $0C
	smpsPan             panCenter, $00

SwedenMC_Loop04:
	dc.b	nG3, $7F, smpsNoAttack, $21, nD4, $7F, smpsNoAttack, $21, nA3, $7F, smpsNoAttack, $21
	dc.b	nE4, $7F, smpsNoAttack, $21
	smpsLoop            $00, $07, SwedenMC_Loop04
	dc.b	nD4, $7F, smpsNoAttack, $21, nE4, $7F, smpsNoAttack, $21, nA3, $7F, smpsNoAttack, $21
	dc.b	nG3, $7F, smpsNoAttack, $21, nFs4, $7F, smpsNoAttack, $21, nE4, $7F, smpsNoAttack, $21
	dc.b	nA3, $7F, smpsNoAttack, $21, nD4

SwedenMC_Loop05:
	dc.b	$7F, smpsNoAttack
	smpsLoop            $00, $06, SwedenMC_Loop05
	dc.b	$26
	smpsAlterVol        $F4
	smpsPan             panCenter, $00
	smpsJump            SwedenMC_FM4

; FM5 Data
SwedenMC_FM5:
	smpsPan             panCenter, $00
	dc.b	nRst, $7F, $7F, $7F, $7F, $7F, $05
	smpsSetvoice        $00
	smpsAlterVol        $0A

SwedenMC_Loop02:
	dc.b	nB3, $7F, smpsNoAttack, $21, nFs4, $7F, smpsNoAttack, $21, nCs4, $7F, smpsNoAttack, $21
	dc.b	nA3, $7F, smpsNoAttack, $21
	smpsLoop            $00, $06, SwedenMC_Loop02
	dc.b	nFs4, $7F, smpsNoAttack, $21, nAb4, $7F, smpsNoAttack, $21, nCs4, $7F, smpsNoAttack, $21
	dc.b	nB3, $7F, smpsNoAttack, $21, nA4, $7F, smpsNoAttack, $21, nAb4, $7F, smpsNoAttack, $21
	dc.b	nCs4, $7F, smpsNoAttack, $21, nG4

SwedenMC_Loop03:
	dc.b	$7F, smpsNoAttack
	smpsLoop            $00, $06, SwedenMC_Loop03
	dc.b	$26
	smpsAlterVol        $F6
	smpsPan             panCenter, $00
	smpsJump            SwedenMC_FM5

; FM6 Data
SwedenMC_FM6:
	smpsPan             panCenter, $00
	dc.b	nRst

SwedenMC_Loop00:
	dc.b	$7F
	smpsLoop            $00, $2C, SwedenMC_Loop00
	dc.b	$0C
	smpsSetvoice        $00
	smpsAlterVol        $0A
	dc.b	nB4

SwedenMC_Loop01:
	dc.b	$7F, smpsNoAttack
	smpsLoop            $00, $06, SwedenMC_Loop01
	dc.b	$26
	smpsAlterVol        $F6
	smpsPan             panCenter, $00
	smpsJump            SwedenMC_FM6

; PSG1 Data
SwedenMC_PSG1:
	dc.b	nRst

SwedenMC_Loop0D:
	dc.b	$7F
	smpsLoop            $00, $0F, SwedenMC_Loop0D
	dc.b	$5F
	smpsPSGAlterVol     $05
	dc.b	nA2, $01
	smpsPSGAlterVol     $FF
	dc.b	nA2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nB2, $01
	smpsPSGAlterVol     $FF
	dc.b	nB2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nB2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nFs2, $01
	smpsPSGAlterVol     $FF
	dc.b	nFs2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nFs2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$44
	smpsPSGAlterVol     $F9
	dc.b	nD2, $01
	smpsPSGAlterVol     $FF
	dc.b	nD2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nD2
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nCs2
	smpsPSGAlterVol     $FF
	dc.b	nCs2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nCs2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$44
	smpsPSGAlterVol     $F9
	smpsAlterNote       $00
	dc.b	nFs2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nFs2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nFs2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $FF
	dc.b	nA2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$6C, nRst, $28
	smpsPSGAlterVol     $F9
	smpsAlterNote       $00
	dc.b	nD3, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nD3
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nD3
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nB2, $01
	smpsPSGAlterVol     $FF
	dc.b	nB2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nB2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nA2, $01
	smpsPSGAlterVol     $FF
	dc.b	nA2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nFs2, $01
	smpsPSGAlterVol     $FF
	dc.b	nFs2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nFs2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$44
	smpsPSGAlterVol     $F9
	dc.b	nD2, $01
	smpsPSGAlterVol     $FF
	dc.b	nD2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nD2
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nCs2
	smpsPSGAlterVol     $FF
	dc.b	nCs2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nCs2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$44
	smpsPSGAlterVol     $F9
	smpsAlterNote       $00
	dc.b	nA2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nA2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nA2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nFs2
	smpsPSGAlterVol     $FF
	dc.b	nFs2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nFs2
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$6C, nRst, $50
	smpsPSGAlterVol     $F9
	smpsAlterNote       $00
	dc.b	nA2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nA2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nA2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nB2, $01
	smpsPSGAlterVol     $FF
	dc.b	nB2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nB2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nD3, $01
	smpsPSGAlterVol     $FF
	dc.b	nD3
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nD3
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$44
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	nFs3, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nFs3
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nFs3
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nE3
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nE3
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nE3
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nCs3
	smpsPSGAlterVol     $FF
	dc.b	nCs3
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nCs3
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$44
	smpsPSGAlterVol     $F9
	dc.b	nD3, $01
	smpsPSGAlterVol     $FF
	dc.b	nD3
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nD3
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nCs3
	smpsPSGAlterVol     $FF
	dc.b	nCs3
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nCs3
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $FF
	dc.b	nA2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$6C, nRst, $50
	smpsPSGAlterVol     $F9
	dc.b	nA2, $01
	smpsPSGAlterVol     $FF
	dc.b	nA2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nB2, $01
	smpsPSGAlterVol     $FF
	dc.b	nB2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nB2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nD3, $01
	smpsPSGAlterVol     $FF
	dc.b	nD3
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nD3
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$44
	smpsPSGAlterVol     $F9
	dc.b	$01
	smpsPSGAlterVol     $FF
	dc.b	nD3
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nD3
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nE3
	smpsPSGAlterVol     $FF
	dc.b	nE3
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nE3
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nCs3
	smpsPSGAlterVol     $FF
	dc.b	nCs3
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nCs3
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$1C
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	nFs3, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nFs3
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nFs3
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nFs2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nFs2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nFs2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $FF
	dc.b	nA2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$6C, nRst, $78
	smpsPSGAlterVol     $F9
	smpsAlterNote       $00
	dc.b	nB2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nB2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nB2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $FF
	dc.b	nA2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nAb2
	smpsPSGAlterVol     $FF
	dc.b	nAb2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nAb2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$1C
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	nE2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nD2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nD2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$06
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nCs2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nCs2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nCs2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$1C
	smpsPSGAlterVol     $F9
	smpsAlterNote       $00
	dc.b	nD2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nD2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nD2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$06
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nE2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nB1, $01
	smpsPSGAlterVol     $FF
	dc.b	nB1
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nB1
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$6C
	smpsPSGAlterVol     $F9
	smpsAlterNote       $00
	dc.b	nD3, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nD3
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nD3
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$44
	smpsPSGAlterVol     $F9
	dc.b	nB2, $01
	smpsPSGAlterVol     $FF
	dc.b	nB2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nB2
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $FF
	dc.b	nA2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nA2
	smpsPSGAlterVol     $01
	dc.b	$01
	smpsPSGAlterVol     $01
	dc.b	nAb2
	smpsPSGAlterVol     $FF
	dc.b	nAb2
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nAb2
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$1C
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	nE2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nD2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nD2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$06
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nCs2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nCs2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nCs2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$1C
	smpsPSGAlterVol     $F9
	smpsAlterNote       $00
	dc.b	nD2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nD2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nD2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$06
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nE2, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nE2
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$06
	smpsPSGAlterVol     $FD
	dc.b	nB1, $01
	smpsPSGAlterVol     $FF
	dc.b	nB1
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nB1
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$7F, $65
	smpsPSGAlterVol     $01
	dc.b	$28
	smpsPSGAlterVol     $01
	dc.b	nB1, nRst, $7F, $7F, $7F, $3B
	smpsPSGAlterVol     $F2
	smpsJump            SwedenMC_PSG1

; PSG2 Data
SwedenMC_PSG2:
	dc.b	nRst

SwedenMC_Loop0C:
	dc.b	$7F
	smpsLoop            $00, $2A, SwedenMC_Loop0C
	dc.b	$42
	smpsPSGAlterVol     $05
	dc.b	nE3, $01
	smpsPSGAlterVol     $FF
	dc.b	nE3
	smpsPSGAlterVol     $FE
	dc.b	$02
	smpsPSGAlterVol     $FF
	dc.b	$07
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	nE3
	smpsPSGAlterVol     $01
	dc.b	$05
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$04
	smpsPSGAlterVol     $01
	dc.b	$03
	smpsPSGAlterVol     $01
	dc.b	$06, nRst, $78
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nCs1, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	nCs1
	smpsPSGAlterVol     $FE
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $01
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nCs1
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nD1
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	nD1
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FF
	smpsAlterNote       $00
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nD1
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$7F, $79
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$28
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nD1, nRst, $7F, $7F, $7F, $3B
	smpsPSGAlterVol     $F2
	smpsJump            SwedenMC_PSG2

SwedenMC_Voices:
;	Voice $00
;	$3C
;	$21, $01, $53, $11, 	$DF, $99, $DF, $99, 	$00, $07, $00, $08
;	$08, $07, $08, $06, 	$40, $37, $40, $37, 	$20, $00, $1C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $05, $00, $02
	smpsVcCoarseFreq    $01, $03, $01, $01
	smpsVcRateScale     $02, $03, $02, $03
	smpsVcAttackRate    $19, $1F, $19, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $08, $00, $07, $00
	smpsVcDecayRate2    $06, $08, $07, $08
	smpsVcDecayLevel    $03, $04, $03, $04
	smpsVcReleaseRate   $07, $00, $07, $00
	smpsVcTotalLevel    $00, $1C, $00, $20

	smpsFooterEndSong	"Hame/Sweden MC.asm"