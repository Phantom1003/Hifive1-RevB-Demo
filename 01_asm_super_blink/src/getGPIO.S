.section .text
.align 2
.global setupGPIO

.include "mem_map.inc"

setupGPIO:
	addi sp, sp, -16
	sw ra, 12(sp)

	li t0, GPIO_BASE_ADDR
	li t1, GPIO_LED_RGB
	sw t1, GPIO_OUTPUT_EN(t0)
	sw t1, GPIO_OUTPUT_XOR(t0)

	li t1, GPIO_LED_R
	sw t1, GPIO_OUTPUT_VAL(t0)

	sw x0, GPIO_OUTPUT_VAL(t0)

	lw ra, 12(sp)
	addi sp, sp, 16
	ret
