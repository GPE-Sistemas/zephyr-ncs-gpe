#
# Copyright (c) 2022 metraTec
#
# SPDX-License-Identifier: Apache-2.0
#

if(CONFIG_PINMUX_MCUX_LPC)
  zephyr_library()
  zephyr_library_sources(pinmux.c)
endif()
