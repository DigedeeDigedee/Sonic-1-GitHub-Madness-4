; ------------------------------------------------------------------------------

.Anims:
	dc.w	.IdleDown-.Anims
	dc.w	.IdleUp-.Anims
	dc.w	.IdleRight-.Anims
	dc.w	.IdleLeft-.Anims
	dc.w	.MoveDown-.Anims
	dc.w	.MoveUp-.Anims
	dc.w	.MoveRight-.Anims
	dc.w	.MoveLeft-.Anims

; ------------------------------------------------------------------------------

.IdleDown:
	dc.w	0
	dc.b	.IdleDownEnd-.IdleDownStart, -1

.IdleDownStart:
	dc.b	0
.IdleDownEnd:
	even

; ------------------------------------------------------------------------------

.IdleUp:
	dc.w	0
	dc.b	.IdleUpEnd-.IdleUpStart, -1

.IdleUpStart:
	dc.b	3
.IdleUpEnd:
	even

; ------------------------------------------------------------------------------

.IdleRight:
	dc.w	0
	dc.b	.IdleRightEnd-.IdleRightStart, -1

.IdleRightStart:
	dc.b	6
.IdleRightEnd:
	even

; ------------------------------------------------------------------------------

.IdleLeft:
	dc.w	0
	dc.b	.IdleLeftEnd-.IdleLeftStart, -1

.IdleLeftStart:
	dc.b	8
.IdleLeftEnd:
	even

; ------------------------------------------------------------------------------

.MoveDown:
	dc.w	$20
	dc.b	.MoveDownEnd-.MoveDownStart, 0

.MoveDownStart:
	dc.b	1, 0, 2, 0
.MoveDownEnd:
	even

; ------------------------------------------------------------------------------

.MoveUp:
	dc.w	$20
	dc.b	.MoveUpEnd-.MoveUpStart, 0

.MoveUpStart:
	dc.b	4, 3, 5, 3
.MoveUpEnd:
	even

; ------------------------------------------------------------------------------

.MoveRight:
	dc.w	$20
	dc.b	.MoveRightEnd-.MoveRightStart, 0

.MoveRightStart:
	dc.b	7, 6
.MoveRightEnd:
	even

; ------------------------------------------------------------------------------

.MoveLeft:
	dc.w	$20
	dc.b	.MoveLeftEnd-.MoveLeftStart, 0

.MoveLeftStart:
	dc.b	9, 8
.MoveLeftEnd:
	even

; ------------------------------------------------------------------------------