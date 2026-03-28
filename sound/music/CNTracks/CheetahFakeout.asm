CheetahFakeout_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     CheetahFakeout_Voices
	smpsHeaderChan      $07, $00
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       CheetahFakeout_DAC
	smpsHeaderFM        CheetahFakeout_FM1,	$00, $0A
	smpsHeaderFM        CheetahFakeout_FM2,	$E8, $0A
	smpsHeaderFM        CheetahFakeout_FM3,	$00, $0A
	smpsHeaderFM        CheetahFakeout_FM4,	$00, $06
	smpsHeaderFM        CheetahFakeout_FM5,	$00, $0C
	smpsHeaderFM        CheetahFakeout_FM6,	$00, $06

; FM1 Data
CheetahFakeout_FM1:
	smpsSetvoice        $00
	smpsPan             panCenter, $00

CheetahFakeout_Loop58:
	dc.b	nFs3, $0C, nAb3, $06, $06, $06, nCs4, $0C, nB3, $06
	smpsLoop            $00, $03, CheetahFakeout_Loop58
	dc.b	nE4, nEb4, nCs4, nEb4, nCs4, nB3, nCs4, nB3

CheetahFakeout_Loop59:
	dc.b	nFs3, $0C, nAb3, $06, $06, $06, nCs4, $0C, nB3, $06
	smpsLoop            $00, $03, CheetahFakeout_Loop59
	dc.b	nEb4, nEb4, nRst, $0C, nEb4, $06, $06, nRst, $0C

CheetahFakeout_Jump03:
	dc.b	nC4, $06, nC5, nBb4, nA4, nG4, nA4, nBb4, nBb3, nC4, nC5, nBb4
	dc.b	nA4, nG4, nA4, nBb4, nE4, nF4, nF5, nRst, nF5, nF4, nF5, nRst
	dc.b	nF5, nEb5, nD5, nC5, nBb4, nAb4, nBb4, nC5

CheetahFakeout_Loop5A:
	dc.b	nBb3, nC4, nC5, nBb4, nA4, nG4, nA4, nBb4
	smpsLoop            $00, $02, CheetahFakeout_Loop5A
	dc.b	nE4, nF4, nF5, nRst, nF5, nF4, nF5, nRst, nF5
	smpsSetvoice        $02

CheetahFakeout_Loop5B:
	dc.b	nF4, $04, nB3, nC4
	smpsLoop            $00, $04, CheetahFakeout_Loop5B
	smpsSetvoice        $00
	smpsPan             panCenter, $00
	dc.b	$06, nC5, nBb4, nA4, nG4, nA4, nBb4, nBb3, nC4, nC5, nBb4, nA4
	dc.b	nG4, nA4, nBb4, nE4, nF4, nF5, nRst, nF5, nF4, nF5, nRst, nF5
	dc.b	nEb5, nD5, nC5, nBb4, nAb4, nBb4, nC5

CheetahFakeout_Loop5C:
	dc.b	nBb3, nC4, nC5, nBb4, nA4, nG4, nA4, nBb4
	smpsLoop            $00, $02, CheetahFakeout_Loop5C
	dc.b	nE4, nF4, nF5, nRst, nF5, nF4, nF5, nRst, nF5, nF5, nF5, nRst
	dc.b	$0C, nF5, $06, $06, nRst, $0C
	smpsJump            CheetahFakeout_Jump03

; FM2 Data
CheetahFakeout_FM2:
	smpsSetvoice        $01
	smpsPan             panCenter, $00
	dc.b	nRst, $7F, $7F, $52, nEb3, $06, $06, nRst, $0C, nEb3, $06, $06
	dc.b	nRst, $0C

CheetahFakeout_Loop50:
	dc.b	nC3, $06, nC4
	smpsLoop            $00, $08, CheetahFakeout_Loop50

CheetahFakeout_Loop51:
	dc.b	nF3, nF4
	smpsLoop            $00, $08, CheetahFakeout_Loop51

CheetahFakeout_Loop52:
	dc.b	nC3, nC4
	smpsLoop            $00, $08, CheetahFakeout_Loop52

CheetahFakeout_Loop53:
	dc.b	nF3, nF4
	smpsLoop            $00, $04, CheetahFakeout_Loop53
	dc.b	nRst, $30

CheetahFakeout_Loop54:
	dc.b	nC3, $06, nC4
	smpsLoop            $00, $08, CheetahFakeout_Loop54

CheetahFakeout_Loop55:
	dc.b	nF3, nF4
	smpsLoop            $00, $08, CheetahFakeout_Loop55

CheetahFakeout_Loop56:
	dc.b	nC3, nC4
	smpsLoop            $00, $08, CheetahFakeout_Loop56

CheetahFakeout_Loop57:
	dc.b	nF3, nF4
	smpsLoop            $00, $04, CheetahFakeout_Loop57
	dc.b	nF4, nF4, nRst, $0C, nF4, $06, $06, nRst, $0C
	smpsJump            CheetahFakeout_Loop50

; FM3 Data
CheetahFakeout_FM3:
	smpsSetvoice        $00
	smpsPan             panCenter, $00

CheetahFakeout_Loop4B:
	dc.b	nCs3, $0C, nEb3, $06, $06, $06, nAb3, $0C, nFs3, $06
	smpsLoop            $00, $03, CheetahFakeout_Loop4B
	dc.b	nB3, nBb3, nAb3, nBb3, nAb3, nFs3, nAb3, nFs3

CheetahFakeout_Loop4C:
	dc.b	nCs3, $0C, nEb3, $06, $06, $06, nAb3, $0C, nFs3, $06
	smpsLoop            $00, $03, CheetahFakeout_Loop4C
	dc.b	nBb3, nBb3, nRst, $0C, nBb3, $06, $06, nRst, $0C

CheetahFakeout_Jump02:
	dc.b	nE3, $06, nE4, nD4, nC4, nBb3, nC4, nD4, nD3, nE3, nE4, nD4
	dc.b	nC4, nBb3, nC4, nD4, nAb3, nA3, nA4, nRst, nA4, nA3, nA4, nRst
	dc.b	nA4, nG4, nF4, nEb4, nD4, nC4, nD4, nEb4

CheetahFakeout_Loop4D:
	dc.b	nD3, nE3, nE4, nD4, nC4, nBb3, nC4, nD4
	smpsLoop            $00, $02, CheetahFakeout_Loop4D
	dc.b	nAb3, nA3, nA4, nRst, nA4, nA3, nA4, nRst, nA4
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nRst, $04

CheetahFakeout_Loop4E:
	dc.b	nF4, nB3, nC4
	smpsLoop            $00, $03, CheetahFakeout_Loop4E
	dc.b	nF4, nB3
	smpsAlterVol        $FC
	smpsSetvoice        $00
	smpsPan             panCenter, $00
	dc.b	nE3, $06, nE4, nD4, nC4, nBb3, nC4, nD4, nD3, nE3, nE4, nD4
	dc.b	nC4, nBb3, nC4, nD4, nAb3, nA3, nA4, nRst, nA4, nA3, nA4, nRst
	dc.b	nA4, nG4, nF4, nEb4, nD4, nC4, nD4, nEb4

CheetahFakeout_Loop4F:
	dc.b	nD3, nE3, nE4, nD4, nC4, nBb3, nC4, nD4
	smpsLoop            $00, $02, CheetahFakeout_Loop4F
	dc.b	nAb3, nA3, nA4, nRst, nA4, nA3, nA4, nRst, nA4, nA4, nA4, nRst
	dc.b	$0C, nA4, $06, $06, nRst, $0C
	smpsJump            CheetahFakeout_Jump02

; FM4 Data
CheetahFakeout_FM4:
; FM5 Data
CheetahFakeout_FM5:
	smpsSetvoice        $03
	dc.b	nRst, $7F, $10, nB3, $06, nRst, $0C, nB3, $06, nRst, $0C, nB3
	dc.b	nB3, $18, nB3, nB3, nB3, nB3, nB3, nB3, $30

CheetahFakeout_Jump01:
	dc.b	nB3

CheetahFakeout_Loop47:
	dc.b	$0C
	smpsLoop            $00, $0C, CheetahFakeout_Loop47
	dc.b	nB3, $06, nRst, $0C, nB3, $06, nRst, $0C

CheetahFakeout_Loop48:
	dc.b	nB3
	smpsLoop            $00, $0D, CheetahFakeout_Loop48
	dc.b	nB3, $06, nRst, $2A, nB3

CheetahFakeout_Loop49:
	dc.b	$0C
	smpsLoop            $00, $0C, CheetahFakeout_Loop49
	dc.b	nB3, $06, nRst, $0C, nB3, $06, nRst, $0C

CheetahFakeout_Loop4A:
	dc.b	nB3
	smpsLoop            $00, $0D, CheetahFakeout_Loop4A
	dc.b	nB3, $30
	smpsJump            CheetahFakeout_Jump01

; FM6 Data
CheetahFakeout_FM6:
	dc.b	nRst, $7F, $10
	smpsSetvoice        $05
	smpsAlterVol        $FB

CheetahFakeout_Loop00:
	smpsAlterNote       $05
	dc.b	nCs2, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2
	smpsSetvoice        $06
	smpsAlterVol        $04
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC
	smpsLoop            $00, $02, CheetahFakeout_Loop00

CheetahFakeout_Loop01:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop01
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop02:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $04, CheetahFakeout_Loop02
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0

CheetahFakeout_Loop03:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsLoop            $00, $04, CheetahFakeout_Loop03

CheetahFakeout_Loop04:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0
	smpsLoop            $00, $02, CheetahFakeout_Loop04

CheetahFakeout_Loop05:
	dc.b	smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0
	smpsLoop            $00, $04, CheetahFakeout_Loop05

CheetahFakeout_Loop06:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsLoop            $00, $04, CheetahFakeout_Loop06

CheetahFakeout_Loop07:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0
	smpsLoop            $00, $02, CheetahFakeout_Loop07

CheetahFakeout_Loop08:
	dc.b	smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0
	smpsLoop            $00, $04, CheetahFakeout_Loop08

CheetahFakeout_Loop09:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsLoop            $00, $04, CheetahFakeout_Loop09

CheetahFakeout_Loop0A:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0
	smpsLoop            $00, $02, CheetahFakeout_Loop0A
	dc.b	smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2
	smpsSetvoice        $06
	smpsAlterVol        $04
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC
	smpsAlterNote       $05

CheetahFakeout_Loop0B:
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop0B

CheetahFakeout_Loop0C:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop0C
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3

CheetahFakeout_Jump00:
	smpsSetvoice        $08
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop0D:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop0D
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05

CheetahFakeout_Loop0E:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop0E
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop0F:
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	smpsLoop            $00, $02, CheetahFakeout_Loop0F
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop10:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop10
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop11:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop11
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $0A
	dc.b	nRst
	smpsSetvoice        $05
	smpsAlterVol        $FC
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop12:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop12

CheetahFakeout_Loop13:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsLoop            $00, $02, CheetahFakeout_Loop13
	dc.b	smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop14:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop14
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop15:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop15
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05

CheetahFakeout_Loop16:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop16
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop17:
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	smpsLoop            $00, $02, CheetahFakeout_Loop17
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop18:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop18

CheetahFakeout_Loop19:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsLoop            $00, $02, CheetahFakeout_Loop19

CheetahFakeout_Loop1A:
	dc.b	smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2
	smpsSetvoice        $06
	smpsAlterVol        $04
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsLoop            $00, $02, CheetahFakeout_Loop1A

CheetahFakeout_Loop1B:
	dc.b	smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsLoop            $00, $02, CheetahFakeout_Loop1B
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop1C:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop1C
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05

CheetahFakeout_Loop1D:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop1D
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop1E:
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	smpsLoop            $00, $02, CheetahFakeout_Loop1E
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop1F:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop1F
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop20:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop20
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop21:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop21

CheetahFakeout_Loop22:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsLoop            $00, $02, CheetahFakeout_Loop22
	dc.b	smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop23:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop23
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop24:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop24
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05

CheetahFakeout_Loop25:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop25
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop26:
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	smpsLoop            $00, $02, CheetahFakeout_Loop26
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop27:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop27
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $0C
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop28:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $04, CheetahFakeout_Loop28
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, nRst, $06
	smpsAlterNote       $00
	dc.b	nFs1, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop29:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop29
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $0D
	dc.b	nRst
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop2A:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop2A
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05

CheetahFakeout_Loop2B:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop2B
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop2C:
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	smpsLoop            $00, $02, CheetahFakeout_Loop2C
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop2D:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop2D
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop2E:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop2E
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop2F:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop2F

CheetahFakeout_Loop30:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsLoop            $00, $02, CheetahFakeout_Loop30
	dc.b	smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop31:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop31
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop32:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop32
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05

CheetahFakeout_Loop33:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop33
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop34:
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	smpsLoop            $00, $02, CheetahFakeout_Loop34
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop35:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop35

CheetahFakeout_Loop36:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsLoop            $00, $02, CheetahFakeout_Loop36

CheetahFakeout_Loop37:
	dc.b	smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2
	smpsSetvoice        $06
	smpsAlterVol        $04
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsLoop            $00, $02, CheetahFakeout_Loop37

CheetahFakeout_Loop38:
	dc.b	smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsLoop            $00, $02, CheetahFakeout_Loop38
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop39:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop39
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05

CheetahFakeout_Loop3A:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop3A
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop3B:
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	smpsLoop            $00, $02, CheetahFakeout_Loop3B
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop3C:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop3C
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop3D:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop3D
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop3E:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop3E

CheetahFakeout_Loop3F:
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsLoop            $00, $02, CheetahFakeout_Loop3F
	dc.b	smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop40:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop40
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $07
	smpsAlterVol        $04
	dc.b	nRst
	smpsSetvoice        $06

CheetahFakeout_Loop41:
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop41
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nRst
	smpsSetvoice        $05

CheetahFakeout_Loop42:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop42
	smpsAlterNote       $00
	dc.b	nF2
	smpsSetvoice        $06
	smpsAlterVol        $04

CheetahFakeout_Loop43:
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	smpsLoop            $00, $02, CheetahFakeout_Loop43
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1
	smpsSetvoice        $05
	smpsAlterVol        $FC

CheetahFakeout_Loop44:
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop44
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $07
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nA0, smpsNoAttack
	smpsAlterNote       $07
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $07
	dc.b	nG0
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2
	smpsSetvoice        $06
	smpsAlterVol        $04
	smpsAlterNote       $00
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nB0, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs1
	smpsSetvoice        $05
	smpsAlterVol        $FC
	smpsAlterNote       $05

CheetahFakeout_Loop45:
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop45

CheetahFakeout_Loop46:
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nCs2, smpsNoAttack
	smpsLoop            $00, $02, CheetahFakeout_Loop46
	smpsAlterNote       $00
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	nD3
	smpsPan             panCenter, $00
	smpsAlterNote       $05
	smpsJump            CheetahFakeout_Jump00

; DAC Data
CheetahFakeout_DAC:
	smpsStop

CheetahFakeout_Voices:
;	Voice $00
;	$09
;	$04, $03, $60, $64, 	$1F, $1F, $1F, $1F, 	$09, $01, $00, $00
;	$00, $11, $00, $0E, 	$8F, $4F, $0F, $FF, 	$0D, $11, $1A, $80
	smpsVcAlgorithm     $01
	smpsVcFeedback      $01
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $06, $00, $00
	smpsVcCoarseFreq    $04, $00, $03, $04
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $01, $09
	smpsVcDecayRate2    $0E, $00, $11, $00
	smpsVcDecayLevel    $0F, $00, $04, $08
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $1A, $11, $0D

;	Voice $01
;	$35
;	$72, $72, $72, $76, 	$9E, $D8, $DC, $DF, 	$06, $0A, $04, $09
;	$08, $08, $08, $01, 	$B6, $B6, $B6, $FF, 	$20, $BB, $87, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $07, $07
	smpsVcCoarseFreq    $06, $02, $02, $02
	smpsVcRateScale     $03, $03, $03, $02
	smpsVcAttackRate    $1F, $1C, $18, $1E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $09, $04, $0A, $06
	smpsVcDecayRate2    $01, $08, $08, $08
	smpsVcDecayLevel    $0F, $0B, $0B, $0B
	smpsVcReleaseRate   $0F, $06, $06, $06
	smpsVcTotalLevel    $00, $07, $3B, $20

;	Voice $02
;	$3B
;	$7E, $7C, $06, $32, 	$9F, $DF, $DF, $9F, 	$08, $07, $04, $14
;	$04, $04, $1F, $06, 	$FF, $7F, $FF, $0F, 	$0F, $1D, $24, $80
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $00, $07, $07
	smpsVcCoarseFreq    $02, $06, $0C, $0E
	smpsVcRateScale     $02, $03, $03, $02
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $14, $04, $07, $08
	smpsVcDecayRate2    $06, $1F, $04, $04
	smpsVcDecayLevel    $00, $0F, $07, $0F
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $24, $1D, $0F

;	Voice $03
;	$32
;	$0F, $0A, $69, $6F, 	$1F, $17, $1F, $1F, 	$00, $10, $18, $0D
;	$00, $11, $06, $0A, 	$08, $2C, $B8, $FF, 	$08, $11, $13, $80
	smpsVcAlgorithm     $02
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $06, $00, $00
	smpsVcCoarseFreq    $0F, $09, $0A, $0F
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $17, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0D, $18, $10, $00
	smpsVcDecayRate2    $0A, $06, $11, $00
	smpsVcDecayLevel    $0F, $0B, $02, $00
	smpsVcReleaseRate   $0F, $08, $0C, $08
	smpsVcTotalLevel    $00, $13, $11, $08

;	Voice $04
;	$35
;	$72, $72, $72, $76, 	$9E, $D8, $DC, $DF, 	$06, $0A, $04, $09
;	$08, $08, $08, $01, 	$B6, $B6, $B6, $FF, 	$20, $BB, $87, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $07, $07
	smpsVcCoarseFreq    $06, $02, $02, $02
	smpsVcRateScale     $03, $03, $03, $02
	smpsVcAttackRate    $1F, $1C, $18, $1E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $09, $04, $0A, $06
	smpsVcDecayRate2    $01, $08, $08, $08
	smpsVcDecayLevel    $0F, $0B, $0B, $0B
	smpsVcReleaseRate   $0F, $06, $06, $06
	smpsVcTotalLevel    $00, $07, $3B, $20

;	Voice $05
;	$39
;	$00, $05, $20, $61, 	$1F, $1F, $1F, $1F, 	$00, $1F, $0F, $11
;	$00, $11, $05, $1F, 	$F8, $AC, $38, $FF, 	$07, $05, $10, $80
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $02, $00, $00
	smpsVcCoarseFreq    $01, $00, $05, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $0F, $1F, $00
	smpsVcDecayRate2    $1F, $05, $11, $00
	smpsVcDecayLevel    $0F, $03, $0A, $0F
	smpsVcReleaseRate   $0F, $08, $0C, $08
	smpsVcTotalLevel    $00, $10, $05, $07

;	Voice $06
;	$3C
;	$70, $31, $00, $40, 	$DD, $DD, $1F, $1F, 	$0F, $06, $0F, $11
;	$0A, $06, $06, $0C, 	$F4, $04, $20, $FF, 	$0F, $97, $09, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $00, $03, $07
	smpsVcCoarseFreq    $00, $00, $01, $00
	smpsVcRateScale     $00, $00, $03, $03
	smpsVcAttackRate    $1F, $1F, $1D, $1D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $0F, $06, $0F
	smpsVcDecayRate2    $0C, $06, $06, $0A
	smpsVcDecayLevel    $0F, $02, $00, $0F
	smpsVcReleaseRate   $0F, $00, $04, $04
	smpsVcTotalLevel    $00, $09, $17, $0F

;	Voice $07
;	$39
;	$70, $31, $00, $40, 	$DD, $DD, $1F, $1F, 	$00, $1F, $0F, $11
;	$00, $11, $05, $1F, 	$F8, $AC, $38, $FF, 	$0F, $1B, $09, $80
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $00, $03, $07
	smpsVcCoarseFreq    $00, $00, $01, $00
	smpsVcRateScale     $00, $00, $03, $03
	smpsVcAttackRate    $1F, $1F, $1D, $1D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $0F, $1F, $00
	smpsVcDecayRate2    $1F, $05, $11, $00
	smpsVcDecayLevel    $0F, $03, $0A, $0F
	smpsVcReleaseRate   $0F, $08, $0C, $08
	smpsVcTotalLevel    $00, $09, $1B, $0F

;	Voice $08
;	$39
;	$70, $31, $00, $40, 	$DD, $1F, $1F, $1F, 	$00, $1F, $0F, $11
;	$00, $11, $05, $1F, 	$F8, $AC, $38, $FF, 	$0F, $1B, $09, $80
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $00, $03, $07
	smpsVcCoarseFreq    $00, $00, $01, $00
	smpsVcRateScale     $00, $00, $00, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $0F, $1F, $00
	smpsVcDecayRate2    $1F, $05, $11, $00
	smpsVcDecayLevel    $0F, $03, $0A, $0F
	smpsVcReleaseRate   $0F, $08, $0C, $08
	smpsVcTotalLevel    $00, $09, $1B, $0F

;	Voice $09
;	$3C
;	$00, $05, $20, $61, 	$1F, $1F, $1F, $1F, 	$00, $06, $0F, $11
;	$0A, $06, $06, $0C, 	$F4, $04, $20, $FF, 	$07, $85, $10, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $02, $00, $00
	smpsVcCoarseFreq    $01, $00, $05, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $0F, $06, $00
	smpsVcDecayRate2    $0C, $06, $06, $0A
	smpsVcDecayLevel    $0F, $02, $00, $0F
	smpsVcReleaseRate   $0F, $00, $04, $04
	smpsVcTotalLevel    $00, $10, $05, $07

;	Voice $0A
;	$3C
;	$00, $05, $20, $61, 	$DD, $DD, $1F, $1F, 	$0F, $06, $0F, $11
;	$0A, $06, $06, $0C, 	$F4, $04, $20, $FF, 	$07, $97, $09, $80
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $02, $00, $00
	smpsVcCoarseFreq    $01, $00, $05, $00
	smpsVcRateScale     $00, $00, $03, $03
	smpsVcAttackRate    $1F, $1F, $1D, $1D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $0F, $06, $0F
	smpsVcDecayRate2    $0C, $06, $06, $0A
	smpsVcDecayLevel    $0F, $02, $00, $0F
	smpsVcReleaseRate   $0F, $00, $04, $04
	smpsVcTotalLevel    $00, $09, $17, $07

;	Voice $0B
;	$3B
;	$7E, $7C, $06, $32, 	$9F, $DF, $DF, $9F, 	$08, $07, $04, $14
;	$04, $04, $1F, $06, 	$FF, $7F, $FF, $0F, 	$0F, $1D, $24, $80
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $00, $07, $07
	smpsVcCoarseFreq    $02, $06, $0C, $0E
	smpsVcRateScale     $02, $03, $03, $02
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $14, $04, $07, $08
	smpsVcDecayRate2    $06, $1F, $04, $04
	smpsVcDecayLevel    $00, $0F, $07, $0F
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $24, $1D, $0F

;	Voice $0C
;	$39
;	$70, $31, $00, $40, 	$DD, $DD, $1F, $1F, 	$0F, $1F, $0F, $11
;	$00, $11, $05, $1F, 	$F8, $AC, $38, $FF, 	$0F, $1B, $09, $80
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $00, $03, $07
	smpsVcCoarseFreq    $00, $00, $01, $00
	smpsVcRateScale     $00, $00, $03, $03
	smpsVcAttackRate    $1F, $1F, $1D, $1D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $0F, $1F, $0F
	smpsVcDecayRate2    $1F, $05, $11, $00
	smpsVcDecayLevel    $0F, $03, $0A, $0F
	smpsVcReleaseRate   $0F, $08, $0C, $08
	smpsVcTotalLevel    $00, $09, $1B, $0F

;	Voice $0D
;	$39
;	$70, $31, $00, $40, 	$1F, $1F, $1F, $1F, 	$00, $1F, $0F, $11
;	$00, $11, $05, $1F, 	$F8, $AC, $38, $FF, 	$0F, $1B, $09, $80
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $00, $03, $07
	smpsVcCoarseFreq    $00, $00, $01, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $11, $0F, $1F, $00
	smpsVcDecayRate2    $1F, $05, $11, $00
	smpsVcDecayLevel    $0F, $03, $0A, $0F
	smpsVcReleaseRate   $0F, $08, $0C, $08
	smpsVcTotalLevel    $00, $09, $1B, $0F

	smpsFooterEndSong	"CNTracks/CheetahFakeout.asm"