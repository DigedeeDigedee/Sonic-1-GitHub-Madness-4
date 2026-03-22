; ---------------------------------------------------------------------------
; Arif - Subtype 2: Bullet
; ---------------------------------------------------------------------------
ArifBoss_Bullet:
		moveq   #0, d0
		move.b	obRoutine(a0), d0
		move.w	.Routines(pc, d0.w), d1
		jsr	.Routines(pc, d1.w)

		jsr	SpeedToPos  
		jmp     DisplaySprite

; ===========================================================================

.TimeToLive:    equ $2A

.MaxTime:       equ 120

.Routines:
		dc.w    .Setup-.Routines
		dc.w    .Run-.Routines

; ===========================================================================

.Setup:        
		move.w	#$428, obGfx(a0)
		move.l	#Map_Missile, obMap(a0)
		move.b	#4, obRender(a0)
		move.b  #$4, obWidth(a0)
		move.b  #$4, obHeight(a0)
		move.b	#$4, obActWid(a0)
		add.b   #6, obPriority(a0)
		move.b  #.MaxTime, .TimeToLive(a0)

		add.b   #2, obRoutine(a0)

		bsr.w   .GetVelocity

; ===========================================================================

.Run:
		; switch vram loc every other frame
		move.b  v_framebyte, d0
		and.b   #1, d0
		move.b  d0, obFrame(a0)

		; collide shit
		move.b	#$87, obColType(a0)

		sub.b   #1, .TimeToLive(a0)
		beq.s	.Destroy

		rts

; ===========================================================================

.GetVelocity:
		lea	v_player, a3
		move.w	obX(a3), d1
		sub.w	obX(a0), d1
		move.w	obY(a3), d2
		sub.w	obY(a0), d2
		jsr	CalcAngle
		jsr	CalcSine
		muls.w	#$800, d0
		muls.w	#$800, d1
		asr.l	#8, d0
		asr.l	#8, d1
		move.w	d1, obVelX(a0)
		move.w	d0, obVelY(a0)
        	rts

; ===========================================================================

.Destroy:
        	jmp     DeleteObject