# SPDX-License-Identifier: Apache-2.0

zephyr_library()

zephyr_library_sources_ifdef(CONFIG_EOS_S3_FPGA fpga_eos_s3.c)
zephyr_library_sources_ifdef(CONFIG_FPGA_SHELL  fpga_shell.c)
