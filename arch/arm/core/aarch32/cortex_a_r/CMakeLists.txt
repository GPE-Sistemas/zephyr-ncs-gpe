# SPDX-License-Identifier: Apache-2.0

zephyr_library()

zephyr_library_sources(
  exc.S
  exc_exit.S
  fault.c
  irq_init.c
  reboot.c
  reset.S
  stacks.c
  tcm.c
  vector_table.S
  )

zephyr_library_sources_ifdef(CONFIG_USERSPACE thread.c)
