## @file
#
# The makefile can be invoked with
# ARCH = x86_64 or x64 for EM64T build
# ARCH = ia32 or IA32 for IA32 build
# ARCH = ia64 or IA64 for IA64 build
#
# Copyright (c) 2007 - 2010, Intel Corporation
# All rights reserved. This program and the accompanying materials
# are licensed and made available under the terms and conditions of the BSD License
# which accompanies this distribution.    The full text of the license may be found at
# http://opensource.org/licenses/bsd-license.php
#
# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
# WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

ARCH ?= IA32

CYGWIN:=$(findstring CYGWIN, $(shell uname -s))
LINUX:=$(findstring Linux, $(shell uname -s))
DARWIN:=$(findstring Darwin, $(shell uname -s))

CC = gcc
CXX = g++
AS = gcc
AR = ar
LD = ld
LINKER ?= $(CC)
ifeq ($(ARCH), IA32)
ARCH_INCLUDE = -I $(MAKEROOT)/Include/Ia32/
endif

ifeq ($(ARCH), X64)
ARCH_INCLUDE = -I $(MAKEROOT)/Include/X64/
endif

ifeq ($(ARCH), MIPS64)
ARCH_INCLUDE = -I $(MAKEROOT)/Include/MIPS64/
endif

INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE) 
CPPFLAGS = $(INCLUDE)
CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -fno-merge-constants -nostdlib -Wall -c -g
LFLAGS =

#
# Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns -i386, but gcc defaults 
#  to x86_64. So make sure tools match uname -m
#
uname_s = $(shell uname -s)
ifeq ($(uname_s),Darwin)
  CFLAGS   += -arch i386
  CPPFLAGS += -arch i386
  LFLAGS   += -arch i386
endif
  
.PHONY: all
.PHONY: install
.PHONY: clean

all:

$(MAKEROOT)/libs:
	mkdir $(MAKEROOT)/libs 

$(MAKEROOT)/bin:
	mkdir $(MAKEROOT)/bin
