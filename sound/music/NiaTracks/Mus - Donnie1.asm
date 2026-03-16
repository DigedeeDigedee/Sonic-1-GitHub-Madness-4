BGM_Donnie1_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     BGM_Donnie1_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $02, $07

	smpsHeaderDAC       BGM_Donnie1_DAC
	smpsHeaderFM        BGM_Donnie1_FM1,	$00, $13
	smpsHeaderFM        BGM_Donnie1_FM2,	$00, $13
	smpsHeaderFM        BGM_Donnie1_FM3,	$00, $13
	smpsHeaderFM        BGM_Donnie1_FM4,	$00, $13
	smpsHeaderFM        BGM_Donnie1_FM5,	$00, $13
	smpsHeaderPSG       BGM_Donnie1_PSG1,	$00, $04, $00, $00
	smpsHeaderPSG       BGM_Donnie1_PSG2,	$00, $00, $00, $00
	smpsHeaderPSG       BGM_Donnie1_PSG3,	$00, $04, $00, fTone_02

; DAC Data
BGM_Donnie1_DAC:
	smpsPan             panCenter, $00
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18, dKick, $18
	dc.b	dKick, $18, dKick, $18
	smpsPan             panCenter, $00
	smpsStop

; FM1 Data
BGM_Donnie1_FM1:
	smpsPan             panCenter, $00
	smpsSetvoice        $00
	dc.b	nC3, $30, nE3, $30, nD3, $30, nG3, $30, nC3, $30, nE3, $30
	dc.b	nD3, $30, nG3, $30, nC3, $30, nE3, $30, nD3, $30, nG3, $30
	dc.b	nC3, $30, nE3, $30, nD3, $30, nG3, $30, nC3, $30, nE3, $30
	dc.b	nD3, $30, nG3, $30, nC3, $30, nE3, $30, nD3, $30, nG3, $30
	dc.b	nC3, $30, nE3, $30, nD3, $30, nG3, $30, nC3, $30, nE3, $30
	dc.b	nD3, $30, nG3, $30, nC3, $30, nE3, $30, nD3, $30, nG3, $30
	dc.b	nC3, $30, nE3, $30, nD3, $30, nG3, $30, nC3, $30, nE3, $30
	dc.b	nD3, $30, nG3, $30, nC3, $30, nE3, $30, nD3, $30, nG3, $30
	dc.b	nC3, $30, nE3, $30, nD3, $30, nG3, $30, nC3, $30, nE3, $30
	dc.b	nD3, $30, nG3, $30, nC3, $30, nE3, $30, nD3, $30, nG3, $30
	dc.b	nC3, $30, nE3, $30, nD3, $30, nG3, $30
	smpsPan             panCenter, $00
	smpsSetvoice        $00
	smpsStop

; FM2 Data
BGM_Donnie1_FM2:
	smpsPan             panCenter, $00
	smpsSetvoice        $02
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06
	dc.b	nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06
	dc.b	nE4, $06, nG4, $06, nE4, $06, nG4, $06, nF4, $06, nD4, $06
	dc.b	nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06
	dc.b	nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06
	dc.b	nD4, $06, nG4, $06
	smpsPan             panCenter, $00
	smpsSetvoice        $02
	smpsStop

; FM3 Data
BGM_Donnie1_FM3:
	smpsPan             panCenter, $00
	smpsSetvoice        $01
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nC4, $06, nE4, $06, nC4, $06, nE4, $06, nC4, $06, nE4, $06
	dc.b	nC4, $06, nE4, $06, nG4, $06, nE4, $06, nG4, $06, nE4, $06
	dc.b	nG4, $06, nE4, $06, nG4, $06, nE4, $06, nD4, $06, nF4, $06
	dc.b	nD4, $06, nF4, $06, nD4, $06, nF4, $06, nD4, $06, nF4, $06
	dc.b	nG4, $06, nD4, $06, nG4, $06, nD4, $06, nG4, $06, nD4, $06
	dc.b	nG4, $06, nD4, $06
	smpsPan             panCenter, $00
	smpsSetvoice        $01
	smpsStop

; FM4 Data
BGM_Donnie1_FM4:
	smpsPan             panCenter, $00
	smpsSetvoice        $03
	dc.b	nC4, $30, nE4, $30, nD4, $30, nG4, $30, nC4, $30, nE4, $30
	dc.b	nD4, $30, nG4, $30, nC4, $30, nE4, $30, nD4, $30, nG4, $30
	dc.b	nC4, $30, nE4, $30, nD4, $30, nG4, $30, nC4, $30, nE4, $30
	dc.b	nD4, $30, nG4, $30, nC4, $30, nE4, $30, nD4, $30, nG4, $30
	dc.b	nC4, $30, nE4, $30, nD4, $30, nG4, $30, nC4, $30, nE4, $30
	dc.b	nD4, $30, nG4, $30, nC4, $30, nE4, $30, nD4, $30, nG4, $30
	dc.b	nC4, $30, nE4, $30, nD4, $30, nG4, $30, nC4, $30, nE4, $30
	dc.b	nD4, $30, nG4, $30, nC4, $30, nE4, $30, nD4, $30, nG4, $30
	dc.b	nC4, $30, nE4, $30, nD4, $30, nG4, $30, nC4, $30, nE4, $30
	dc.b	nD4, $30, nG4, $30, nC4, $30, nE4, $30, nD4, $30, nG4, $30
	dc.b	nC4, $30, nE4, $30, nD4, $30, nG4, $30
	smpsPan             panCenter, $00
	smpsSetvoice        $03
	smpsStop

; FM5 Data
BGM_Donnie1_FM5:
	smpsPan             panCenter, $00
	smpsSetvoice        $03
	dc.b	nG4, $30, nB4, $30, nA4, $30, nB4, $30, nG4, $30, nB4, $30
	dc.b	nA4, $30, nB4, $30, nG4, $30, nB4, $30, nA4, $30, nB4, $30
	dc.b	nG4, $30, nB4, $30, nA4, $30, nB4, $30, nG4, $30, nB4, $30
	dc.b	nA4, $30, nB4, $30, nG4, $30, nB4, $30, nA4, $30, nB4, $30
	dc.b	nG4, $30, nB4, $30, nA4, $30, nB4, $30, nG4, $30, nB4, $30
	dc.b	nA4, $30, nB4, $30, nG4, $30, nB4, $30, nA4, $30, nB4, $30
	dc.b	nG4, $30, nB4, $30, nA4, $30, nB4, $30, nG4, $30, nB4, $30
	dc.b	nA4, $30, nB4, $30, nG4, $30, nB4, $30, nA4, $30, nB4, $30
	dc.b	nG4, $30, nB4, $30, nA4, $30, nB4, $30, nG4, $30, nB4, $30
	dc.b	nA4, $30, nB4, $30, nG4, $30, nB4, $30, nA4, $30, nB4, $30
	dc.b	nG4, $30, nB4, $30, nA4, $30, nB4, $30
	smpsPan             panCenter, $00
	smpsSetvoice        $03
	smpsStop

; PSG1 Data
BGM_Donnie1_PSG1:
	dc.b	nF2, $06, nE2, $06, nC2, $0C, nD2, $06, nE2, $06, nF2, $0C
	dc.b	nG2, $06, nE2, $06, nF2, $0C, nD2, $06, nF2, $06, nE2, $0C
	dc.b	nF2, $06, nE2, $06, nC2, $06, nF2, $06, nE2, $06, nC2, $06
	dc.b	nD2, $0C, nG2, $06, nF2, $06, nD2, $0C, nE2, $06, nF2, $06
	dc.b	nG2, $0C, nF2, $06, nE2, $06, nC2, $0C, nD2, $06, nE2, $06
	dc.b	nF2, $0C, nG2, $06, nE2, $06, nF2, $0C, nD2, $06, nF2, $06
	dc.b	nE2, $0C, nF2, $06, nE2, $06, nC2, $06, nF2, $06, nE2, $06
	dc.b	nC2, $06, nD2, $0C, nG2, $06, nF2, $06, nD2, $0C, nE2, $06
	dc.b	nF2, $06, nG2, $0C, nF2, $06, nE2, $06, nC2, $0C, nD2, $06
	dc.b	nE2, $06, nF2, $0C, nG2, $06, nE2, $06, nF2, $0C, nD2, $06
	dc.b	nF2, $06, nE2, $0C, nF2, $06, nE2, $06, nC2, $06, nF2, $06
	dc.b	nE2, $06, nC2, $06, nD2, $0C, nG2, $06, nF2, $06, nD2, $0C
	dc.b	nE2, $06, nF2, $06, nG2, $0C, nF2, $06, nE2, $06, nC2, $0C
	dc.b	nD2, $06, nE2, $06, nF2, $0C, nG2, $06, nE2, $06, nF2, $0C
	dc.b	nD2, $06, nF2, $06, nE2, $0C, nF2, $06, nE2, $06, nC2, $06
	dc.b	nF2, $06, nE2, $06, nC2, $06, nD2, $0C, nG2, $06, nF2, $06
	dc.b	nD2, $0C, nE2, $06, nF2, $06, nG2, $0C, nF2, $06, nE2, $06
	dc.b	nG2, $0C, nD2, $06, nE2, $06, nF2, $0C, nG2, $06, nE2, $06
	dc.b	nF2, $0C, nD2, $06, nF2, $06, nE2, $0C, nF2, $06, nE2, $06
	dc.b	nC2, $06, nF2, $06, nE2, $06, nC2, $06, nD2, $0C, nG2, $06
	dc.b	nF2, $06, nD2, $06, nG2, $06, nF2, $06, nD2, $06, nE2, $0C
	dc.b	nF2, $06, nE2, $06, nG2, $0C, nD2, $06, nE2, $06, nF2, $0C
	dc.b	nG2, $06, nE2, $06, nF2, $0C, nD2, $06, nF2, $06, nE2, $0C
	dc.b	nF2, $06, nE2, $06, nC2, $06, nF2, $06, nE2, $06, nC2, $06
	dc.b	nD2, $0C, nG2, $06, nF2, $06, nD2, $06, nG2, $06, nF2, $06
	dc.b	nD2, $06, nE2, $0C, nF2, $06, nE2, $06, nG2, $0C, nD2, $06
	dc.b	nE2, $06, nF2, $0C, nG2, $06, nE2, $06, nF2, $0C, nD2, $06
	dc.b	nF2, $06, nE2, $0C, nF2, $06, nE2, $06, nC2, $06, nF2, $06
	dc.b	nE2, $06, nC2, $06, nD2, $0C, nG2, $06, nF2, $06, nD2, $06
	dc.b	nG2, $06, nF2, $06, nD2, $06, nE2, $0C, nF2, $06, nE2, $06
	dc.b	nG2, $0C, nD2, $06, nE2, $06, nF2, $0C, nG2, $06, nE2, $06
	dc.b	nF2, $0C, nD2, $06, nF2, $06, nE2, $0C, nF2, $06, nE2, $06
	dc.b	nC2, $06, nF2, $06, nE2, $06, nC2, $06, nD2, $0C, nG2, $06
	dc.b	nF2, $06, nD2, $06, nG2, $06, nF2, $06, nD2, $06, nE2, $0C
	dc.b	nF2, $06, nE2, $06, nC2, $0C, nD2, $06, nE2, $06, nF2, $0C
	dc.b	nG2, $06, nE2, $06, nF2, $0C, nD2, $06, nF2, $06, nE2, $0C
	dc.b	nF2, $06, nE2, $06, nC2, $06, nF2, $06, nE2, $06, nC2, $06
	dc.b	nD2, $0C, nG2, $06, nF2, $06, nD2, $0C, nE2, $06, nF2, $06
	dc.b	nG2, $0C, nF2, $06, nE2, $06, nC2, $0C, nD2, $06, nE2, $06
	dc.b	nF2, $0C, nG2, $06, nE2, $06, nF2, $0C, nD2, $06, nF2, $06
	dc.b	nE2, $0C, nF2, $06, nE2, $06, nC2, $06, nF2, $06, nE2, $06
	dc.b	nC2, $06, nD2, $0C, nG2, $06, nF2, $06, nD2, $0C, nE2, $06
	dc.b	nF2, $06, nG2, $0C, nF2, $06, nE2, $06, nC2, $0C, nD2, $06
	dc.b	nE2, $06, nF2, $0C, nG2, $06, nE2, $06, nF2, $0C, nD2, $06
	dc.b	nF2, $06, nE2, $0C, nF2, $06, nE2, $06, nC2, $06, nF2, $06
	dc.b	nE2, $06, nC2, $06, nD2, $0C, nG2, $06, nF2, $06, nD2, $0C
	dc.b	nE2, $06, nF2, $06, nG2, $0C, nF2, $06, nE2, $06, nC2, $0C
	dc.b	nD2, $06, nE2, $06, nF2, $0C, nG2, $06, nE2, $06, nF2, $0C
	dc.b	nD2, $06, nF2, $06, nE2, $0C, nF2, $06, nE2, $06, nC2, $06
	dc.b	nF2, $06, nE2, $06, nC2, $06, nD2, $0C, nG2, $06, nF2, $06
	dc.b	nD2, $0C, nE2, $06, nF2, $06, nG2, $0C, nF2, $06, nE2, $06
	dc.b	nG2, $0C, nD2, $06, nE2, $06, nF2, $0C, nG2, $06, nE2, $06
	dc.b	nF2, $0C, nD2, $06, nF2, $06, nE2, $0C, nF2, $06, nE2, $06
	dc.b	nC2, $06, nF2, $06, nE2, $06, nC2, $06, nD2, $0C, nG2, $06
	dc.b	nF2, $06, nD2, $06, nG2, $06, nF2, $06, nD2, $06, nE2, $0C
	dc.b	nF2, $06, nE2, $06, nG2, $0C, nD2, $06, nE2, $06, nF2, $0C
	dc.b	nG2, $06, nE2, $06, nF2, $0C, nD2, $06, nF2, $06, nE2, $0C
	dc.b	nF2, $06, nE2, $06, nC2, $06, nF2, $06, nE2, $06, nC2, $06
	dc.b	nD2, $0C, nG2, $06, nF2, $06, nD2, $06, nG2, $06, nF2, $06
	dc.b	nD2, $06, nE2, $0C, nF2, $06, nE2, $06, nG2, $0C, nD2, $06
	dc.b	nE2, $06, nF2, $0C, nG2, $06, nE2, $06, nF2, $0C, nD2, $06
	dc.b	nF2, $06, nE2, $0C, nF2, $06, nE2, $06, nC2, $06, nF2, $06
	dc.b	nE2, $06, nC2, $06, nD2, $0C, nG2, $06, nF2, $06, nD2, $06
	dc.b	nG2, $06, nF2, $06, nD2, $06, nE2, $0C, nF2, $06, nE2, $06
	dc.b	nG2, $0C, nD2, $06, nE2, $06, nF2, $0C, nG2, $06, nE2, $06
	dc.b	nF2, $0C, nD2, $06, nF2, $06, nE2, $0C, nF2, $06, nE2, $06
	dc.b	nC2, $06, nF2, $06, nE2, $06, nC2, $06, nD2, $0C, nG2, $06
	dc.b	nF2, $06, nD2, $06, nG2, $06, nF2, $06, nD2, $06, nE2, $0C
	smpsPSGvoice        $00
	smpsStop

; PSG3 Data
BGM_Donnie1_PSG3:
	smpsPSGform         $E7
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsPSGvoice        fTone_02
	dc.b	nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $06, nMaxPSG, $03
	smpsPSGvoice        fTone_01
	dc.b	nMaxPSG, $03
	smpsStop

; PSG2 Data
BGM_Donnie1_PSG2:
	smpsStop

BGM_Donnie1_Voices:
;	Voice $00
;	$20
;	$36, $35, $30, $31, 	$DF, $DF, $9F, $9F, 	$07, $06, $09, $06
;	$07, $06, $06, $08, 	$20, $10, $10, $F8, 	$19, $37, $13, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $03, $03
	smpsVcCoarseFreq    $01, $00, $05, $06
	smpsVcRateScale     $02, $02, $03, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $06, $09, $06, $07
	smpsVcDecayRate2    $08, $06, $06, $07
	smpsVcDecayLevel    $0F, $01, $01, $02
	smpsVcReleaseRate   $08, $00, $00, $00
	smpsVcTotalLevel    $00, $13, $37, $19

;	Voice $01
;	$3B
;	$51, $71, $61, $41, 	$51, $16, $18, $1A, 	$05, $01, $01, $00
;	$09, $01, $01, $01, 	$17, $97, $27, $47, 	$1C, $22, $15, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $06, $07, $05
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $01
	smpsVcAttackRate    $1A, $18, $16, $11
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $01, $01, $05
	smpsVcDecayRate2    $01, $01, $01, $09
	smpsVcDecayLevel    $04, $02, $09, $01
	smpsVcReleaseRate   $07, $07, $07, $07
	smpsVcTotalLevel    $00, $15, $22, $1C

;	Voice $02
;	$38
;	$72, $13, $71, $11, 	$D1, $52, $14, $14, 	$01, $07, $01, $01
;	$00, $00, $00, $00, 	$FF, $FF, $FF, $FF, 	$1E, $1E, $1E, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $07, $01, $07
	smpsVcCoarseFreq    $01, $01, $03, $02
	smpsVcRateScale     $00, $00, $01, $03
	smpsVcAttackRate    $14, $14, $12, $11
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $01, $01, $07, $01
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $0F, $0F, $0F, $0F
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $1E, $1E, $1E

;	Voice $03
;	$3B
;	$51, $71, $61, $41, 	$51, $16, $18, $1A, 	$05, $01, $01, $00
;	$09, $01, $01, $01, 	$17, $97, $27, $47, 	$1C, $22, $15, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $06, $07, $05
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $01
	smpsVcAttackRate    $1A, $18, $16, $11
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $01, $01, $05
	smpsVcDecayRate2    $01, $01, $01, $09
	smpsVcDecayLevel    $04, $02, $09, $01
	smpsVcReleaseRate   $07, $07, $07, $07
	smpsVcTotalLevel    $00, $15, $22, $1C

	smpsFooterEndSong	"NiaTracks/Mus - Donnie1.asm"