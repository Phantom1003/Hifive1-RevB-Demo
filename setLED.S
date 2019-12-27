.section .text
.align 2
.global setLED

.include "mem_map.inc"

.equ NORMAL, 0
.equ ERROR,  1

setLED:
	addi sp, sp, -16
	sw ra, 12(sp)

	li t0, GPIO_BASE_ADDR
	lw t1, GPIO_OUTPUT_VAL(t0)

	bnez a1, ledOn
ledOff:
	bne a0, t1, errorExit
	xor t1, a0, t1
	and t1, t1, a0
	sw t1, GPIO_OUTPUT_VAL(t0)
	li a0, NORMAL
	j exit

ledOn:
	bne t1, x0, errorExit
	xor t1, t1, a0
	sw t1, GPIO_OUTPUT_VAL(t0)
	li a0, NORMAL
	j exit

errorExit:
	add a0, x0, x0

exit:
	lw ra, 12(sp)
	addi sp, sp, 16
	ret
