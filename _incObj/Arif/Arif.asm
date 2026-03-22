; ---------------------------------------------------------------------------
; Arif - Subtype 1: HIM
; ---------------------------------------------------------------------------
ArifBoss_Arif:
		moveq   #0, d0
		move.b	obRoutine(a0), d0
		move.w	.Routines(pc, d0.w), d1
		jsr	.Routines(pc, d1.w)

		jsr	SpeedToPos
		jmp     DisplaySprite

; ===========================================================================

; Variables
.ShootAngle:		equ $3A
.RoutineTimer:		equ $3C
.FlashTimer:		equ $3E
.FloatTimer:		equ $41

; Constants
.ShootTime:		equ $F	; time for him to shoot

.Routines:
		dc.w    .Setup-.Routines
		dc.w    .Intro1-.Routines
		dc.w    .Intro2-.Routines
		dc.w    .ShootPlayer-.Routines
		dc.w    .Idle-.Routines

; ===========================================================================

.Setup:
		move.l	#Map_Arif, obMap(a0)
		move.w	#$400, obGfx(a0)
		move.b	#4, obRender(a0)
		move.b  #$10, obWidth(a0)
		move.b  #$10, obHeight(a0)
		move.b	#$14, obActWid(a0)
		move.b	#2, obPriority(a0)

		move.b 	#-$5, obVelY(a0)

		move.b	#$F, obColType(a0)
		move.b	#12, obColProp(a0) 		; set number of hits

		add.b   #2, obRoutine(a0)

		rts

; ===========================================================================

.Intro1:
		jsr	ObjectFall

		tst.w	obVelY(a0)
		bmi.s	.Intro1_Return

		cmpi.w	#$155, obY(a0)				; fart ypos check
		blt.s	.Intro1_Return

		jsr	ObjFloorDist
		add.w	d1, obY(a0)				; ensure object position is grounded by adding floor distance
		
		move.w  #$25, v_screenshaketime.w
		move.w	#sfx_Thud, d0
		jsr	QueueSound2

		move.w	#-$500, obVelY(a0)			; fly away now, fly awaaaaay
		add.b	#2, obRoutine(a0)			; change routine

.Intro1_Return:
		rts

; ===========================================================================

.Intro2:
		jsr     ObjectFall

		tst.w   obVelY(a0)
		bmi.s   .Intro2_Return

		move.w 	#0, obVelY(a0)				; in the air now...
		move.w	#.ShootTime, .RoutineTimer(a0)
		add.b   #2, obRoutine(a0)       		; change routine

.Intro2_Return:
		rts

; ===========================================================================

.ShootPlayer:
		bsr.w 	.Chase

		tst.w	.RoutineTimer(a0)			; is timer zero?
		beq.s	.ShootPlayer_Exit			; if yes, branch

		sub.w	#$1, .RoutineTimer(a0) 

		move.w	#sfx_HitBoss, d0
		jsr	QueueSound2

		jsr 	FindFreeObj
		move.w 	#id_Arif, (a1)
		move.b  #4, obSubtype(a1)
		move.w  obX(a0), obX(a1)
		move.w  obY(a0), obY(a1)

		bra.s   .HandleHits

.ShootPlayer_Exit:
		move.w 	#30, .RoutineTimer(a0)
		add.b   #2, obRoutine(a0)
		rts

; ===========================================================================

.Idle:
		bsr.w 	.Chase

		tst.w	.RoutineTimer(a0)			; is timer zero?
		beq.s	.Idle_Exit				; if yes, branch

		sub.w	#$1, .RoutineTimer(a0) 
		bra.s   .HandleHits

.Idle_Exit:
		move.w	#.ShootTime, .RoutineTimer(a0)
		move.b  #6, obRoutine(a0)
		rts

; ===========================================================================
; Helper routines
; ===========================================================================

.HandleHits:
		tst.b	obColType(a0)
		bne.s	.HandleHits_Return
		tst.b	.FlashTimer(a0)
		bne.s	.HitFlash

		move.b	#$18, .FlashTimer(a0)	    		; set number of times to flash 
		
		move.w	#sfx_HitBoss, d0
		jsr	QueueSound2

.HitFlash:
		tst.b   obFrame(a0)
		bne.s	.HitFlash_Restore

		move.b  #1, obFrame(a0)
		subq.b	#1, .FlashTimer(a0)			; subtract 1 from flashes counter
		bne.s	.HandleHits_Return			; if flashes counter is not zero, branch

		move.b  #0, obFrame(a0)         		; restore frame
		move.b	#$F,obColType(a0)			; restore touch responsibility

		rts

.HitFlash_Restore:
		move.b  #0, obFrame(a0)
		rts

.HandleHits_Return:
		rts

; ===========================================================================

.Float:
		move.b	.FloatTimer(a0), d0
		addq.b	#2, .FloatTimer(a0)
		jsr	CalcSine

		asr.w	#3, d0
		neg.w 	d0
		move.w	d0, obVelY(a0)
		rts

; ===========================================================================

.Chase:
		lea     v_player, a1
		move.w  #$250, d0
		move.w  #$10, d1
		jsr     ChaseObject

		move.w	0, obVelY(a0)
		rts