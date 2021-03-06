#/*++
#
#Copyright (c) 2006, Intel Corporation                                                         
#All rights reserved. This program and the accompanying materials                          
#are licensed and made available under the terms and conditions of the BSD License         
#which accompanies this distribution.  The full text of the license may be found at        
#http://opensource.org/licenses/bsd-license.php                                            
#                                                                                          
#THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,                     
#WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.             
#
#Module Name:
#
#  LShiftU64.c
#
#Abstract:
#
#  64-bit left shift function for IA-32
#
#--*/
#
#include "EfiBind.h"
#---------------------------------------------------------------------------
    .686: 
    #.MODEL flat,C
    .code: 

#---------------------------------------------------------------------------
.globl ASM_PFX(LShiftU64)
#
#UINT64
#LShiftU64 (
#  IN UINT64   Operand,
#  IN UINTN    Count
#  )
#/*++
#
#Routine Description:
# 
#  This routine allows a 64 bit value to be left shifted by 32 bits and 
#  returns the shifted value.
#  Count is valid up 63. (Only Bits 0-5 is valid for Count)
#
#Arguments:
#
#  Operand - Value to be shifted
#  Count   - Number of times to shift left.
#  
#Returns:
#
#  Value shifted left identified by the Count.
#
#--*/
ASM_PFX(LShiftU64):

    movl   4(%esp), %eax # dword ptr Operand[0]
    movl   8(%esp), %edx # dword ptr Operand[4]

    #
    # CL is valid from 0 - 31. shld will move EDX:EAX by CL times but EAX is not touched
    # For CL of 32 - 63, it will be shifted 0 - 31 so we will move eax to edx later. 
    #
    movl   0xC(%esp), %ecx # Count
    andl   $63, %ecx
    shld   %cl, %eax, %edx
    shlb   %cl, %eax

    #
    # Since Count is 32 - 63, eax will have been shifted  by 0 - 31                                                     
    # If shifted by 32 or more, set lower 32 bits to zero.
    #
    cmpl   $32, %ecx
    jc     _LShiftU64_Done

    movl   %eax, %edx
    xorl   %eax, %eax

_LShiftU64_Done: 

    ret
#LShiftU64 ENDP

