#------------------------------------------------------------------------------
#
# Copyright (c) 2006, Intel Corporation
# All rights reserved. This program and the accompanying materials
# are licensed and made available under the terms and conditions of the BSD License
# which accompanies this distribution.  The full text of the license may be found at
# http://opensource.org/licenses/bsd-license.php
#
# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
# WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
# Module Name:
#
#   MultU64x32.asm
#
# Abstract:
#
#   Calculate the product of a 64-bit integer and a 32-bit integer
#
#------------------------------------------------------------------------------

#include <EdkIIGlueBase.h>

    .386:
    .code:

.globl ASM_PFX(InternalMathMultU64x32)

#------------------------------------------------------------------------------
# UINT64
# EFIAPI
# InternalMathMultU64x32 (
#   IN      UINT64                    Multiplicand,
#   IN      UINT32                    Multiplier
#   );
#------------------------------------------------------------------------------
ASM_PFX(InternalMathMultU64x32):
    movl    12(%esp), %ecx
    movl    %ecx, %eax
    imull   8(%esp), %ecx
    mull    0x4(%esp)
    addl    %ecx, %edx
    ret
