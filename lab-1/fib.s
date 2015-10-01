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

	cmp r0, #1            @If R0 = 1
	beq .L1		      @Jump to L1

	subs r0, r0, #1       @R0 = R0 - 1
	cmp r0, #0            @If R0 = 0
	ble .L0		      @Jump to L0

	bl fibonacci
	@ sub r1, r0 ,#1      @no use
	add r2, r0, r1        @R2 = R0 + R1
	mov r0, r1	      @Move R1 to R0
	mov r1, r2	      @Then move R2 to R1
	 

	pop {pc}		@EPILOG

	@ END CODE MODIFICATION
.L0:
	mov r0, #0		@ R0 = 0
	pop {pc}		@ EPILOG

.L1:
	mov r1, #1		@ R1 = 1
	pop {pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end

