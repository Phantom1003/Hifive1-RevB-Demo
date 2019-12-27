.section .text
.align 2
.global delay

.include "mem_map.inc"

delay:
	addi sp, sp, -16
	sw ra, 12(sp)

	li t0, MTIME
	lw t1, 0(t0)

	li t2, MTIME_FREQUENCY
	mul t2, t2, a0
	add t2, t1, t2

1:
	lw t1, 0(t0)
	blt t1, t2, 1b

	lw ra, 12(sp)
	addi sp, sp, 16
	ret
