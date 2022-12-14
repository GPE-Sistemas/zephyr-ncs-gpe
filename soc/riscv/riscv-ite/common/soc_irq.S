/*
 * Copyright (c) 2020 ITE Corporation. All Rights Reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/*
 * common interrupt management code for riscv SOCs supporting the riscv
 * privileged architecture specification
 */
#include <kernel_structs.h>
#include <offsets.h>
#include <toolchain.h>
#include <linker/sections.h>
#include <soc.h>

/* exports */
GTEXT(__soc_handle_irq)

/*
 * SOC-specific function to handle pending IRQ number generating the interrupt.
 * Exception number is given as parameter via register a0.
 */
SECTION_FUNC(exception.other, __soc_handle_irq)
	/* store ra */
	addi sp, sp, -4
	sw ra, 0(sp)
	/* get interrupt number and clear interrupt status of soc */
	call get_irq
	/* restore ra */
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

/*
 * __soc_is_irq is defined as .weak to allow re-implementation by
 * SOCs that does not truely follow the riscv privilege specification.
 */
WTEXT(__soc_is_irq)

/*
 * SOC-specific function to determine if the exception is the result of a
 * an interrupt or an exception
 * return 1 (interrupt) or 0 (exception)
 *
 */
SECTION_FUNC(exception.other, __soc_is_irq)
	/* Read mcause and check if interrupt bit is set */
	csrr t0, mcause
	li t1, SOC_MCAUSE_IRQ_MASK
	and t0, t0, t1

	/* If interrupt bit is not set, return with 0 */
	addi a0, x0, 0
	beqz t0, not_interrupt
	addi a0, a0, 1

not_interrupt:
	/* return */
	ret
