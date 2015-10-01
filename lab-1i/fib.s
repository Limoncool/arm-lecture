	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {lr}

	subs r0, r0, #0       @R0 = R0 - 0
	cmp r0, #0            @If R0 = 0
	ble .L0		      @Jump to L0

	cmp r0, #1            @If R0 = 1
	beq .L1		      @Jump to L1

	mov r1, #0            @R1 = 0
	mov r2, #1            @R2 = 1
			      @test

.Lloop:
	mov r3, r2            @R3(TEMP) = R2
	add r2, r1, r2	      @R2 = R1 + R2
	mov r1, r3	      @R1 = R3(TEMP)
	sub r0, r0, #1        @R0 = R0 - 1 (Count)
	cmp r0, #1            @If R1 > 1, loop continue
	bgt .Lloop  
	
	mov r0, r2

	pop {pc}		@EPILOG

	@ END CODE MODIFICATION
.L0:
	mov r0, #0		@ R0 = 0
	pop {pc}		@ EPILOG

.L1:
	mov r0, #1		@ R1 = 1
	pop {pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
