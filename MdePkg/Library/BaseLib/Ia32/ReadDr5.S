#------------------------------------------------------------------------------
#
# Copyright (c) 2006 - 2008, Intel Corporation
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
#   ReadDr5.S
#
# Abstract:
#
#   AsmReadDr5 function
#
# Notes:
#
#------------------------------------------------------------------------------

ASM_GLOBAL ASM_PFX(AsmReadDr5)

#------------------------------------------------------------------------------
# UINTN
# EFIAPI
# AsmReadDr5 (
#   VOID
#   );
#------------------------------------------------------------------------------
ASM_PFX(AsmReadDr5):
    movl    %dr5, %eax
    ret
