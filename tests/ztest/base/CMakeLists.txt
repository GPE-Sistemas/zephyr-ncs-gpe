# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)
if(BOARD STREQUAL unit_testing)
  list(APPEND SOURCES src/main_deprecated.c)

  find_package(ZephyrUnittest REQUIRED HINTS $ENV{ZEPHYR_BASE})
  project(base)
else()
  find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
  project(base)

  target_sources(app PRIVATE src/main.c)
endif()
