{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  VMCL - Vectors & Matrices calculation library

  Common inclusion ASM code fragments

    This file contains common assembly code fragments that are inserted directly
    into ASM functions (instead of calling then as a routines). This generates
    larger, but faster, code by avoiding call overhead.

  ©František Milt 2018-**-**

  Version 1.0 dev

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    BitVector   - github.com/ncs-sniper/Lib.BitVector
    BitOps      - github.com/ncs-sniper/Lib.BitOps
    StrRect     - github.com/ncs-sniper/Lib.StrRect
    SimpleCPUID - github.com/ncs-sniper/Lib.SimpleCPUID

===============================================================================}

{.$DEFINE CheckMemAlign16_1}
{.$DEFINE CheckMemAlign16_2}
{.$DEFINE CheckMemAlign16_3}

{.$DEFINE Load_XMM0_to_ST0_1s}
{.$DEFINE Load_XMM0_to_ST0_1d}

{.$DEFINE Save_XMM6_SSE}
{.$DEFINE Save_XMM6_to_XMM9_SSE}
{.$DEFINE Save_XMM6_to_XMM13_SSE}
{.$DEFINE Restore_XMM6_SSE}
{.$DEFINE Restore_XMM6_to_XMM9_SSE}
{.$DEFINE Restore_XMM6_to_XMM13_SSE}

{.$DEFINE AlignStack_16B_Entry}
{.$DEFINE AlignStack_16B_Leave}

{===============================================================================
                          Checks for memory alignment
===============================================================================}

{-------------------------------------------------------------------------------

  CheckMemAlign16_1_x86

  Checks one memory address for 16-byte alignment.

  Input:

    Win32   Win64   Lin32   Lin64
     EAX     RCX     EAX     RDI    - address to be checked

  Output:

    Result is indicated in ZF (Zero flag). When set, the address is aligned,
    when not set, the address is not aligned.

-------------------------------------------------------------------------------}

{$IFDEF CheckMemAlign16_1}
{$IFDEF x64}
  {$IFDEF Windows}
    TEST    RCX,  $F
  {$ELSE}
    TEST    RDI,  $F
  {$ENDIF}
{$ELSE}
    TEST    EAX,  $F
{$ENDIF}
{$ENDIF}

{-------------------------------------------------------------------------------

  CheckMemAlign16_2_x86

  Checks two memory addresses for 16-byte alignment. All addresses must be
  properly aligned for this code to return true.

  Input:

    Win32   Win64   Lin32   Lin64
     EAX     RCX     EAX     RDI    - first address to be checked
     EDX     RDX     EDX     RSI    - second address to be checked

  Output:

    Result is indicated in ZF (Zero flag). When set, all addresses are aligned,
    when not set, at least one address is not aligned.

  Scratch registers:

    R10 (Win64 and Lin64 only)

-------------------------------------------------------------------------------}

{$IFDEF CheckMemAlign16_2}
{$IFDEF x64}
  {$IFDEF Windows}
    MOV     R10,  RCX
    OR      R10,  RDX
    TEST    R10,  $F
  {$ELSE}
    MOV     R10,  RDI
    OR      R10,  RSI
    TEST    R10,  $F
  {$ENDIF}
{$ELSE}
    PUSH    EAX
    OR      EAX,  EDX
    TEST    EAX,  $F
    POP     EAX
{$ENDIF}
{$ENDIF}

{-------------------------------------------------------------------------------

  CheckMemAlign16_3_x86

  Checks three memory addresses for 16-byte alignment. All addresses must be
  properly aligned for this code to return true.

  Input:

    Win32   Win64   Lin32   Lin64
     EAX     RCX     EAX     RDI    - first address to be checked
     EDX     RDX     EDX     RSI    - second address to be checked
     ECX     R8      ECX     RDX    - third address to be checked

  Output:

    Result is indicated in ZF (Zero flag). When set, all addresses are aligned,
    when not set, at least one address is not aligned.

  Scratch registers:

    R10 (Win64 and Lin64 only)

-------------------------------------------------------------------------------}

{$IFDEF CheckMemAlign16_3}
{$IFDEF x64}
  {$IFDEF Windows}
    MOV     R10,  RCX
    OR      R10,  RDX
    OR      R10,  R8
    TEST    R10,  $F
  {$ELSE}
    MOV     R10,  RDI
    OR      R10,  RSI
    OR      R10,  RDX
    TEST    R10,  $F
  {$ENDIF}
{$ELSE}
    PUSH    EAX
    OR      EAX,  EDX
    OR      EAX,  ECX
    TEST    EAX,  $F
    POP     EAX
{$ENDIF}
{$ENDIF}

{===============================================================================
                        Loading of data between registers
===============================================================================}

{-------------------------------------------------------------------------------

  Load_XMM0_to_ST0_1s

  Loads a value from lowest single of XMM0 register into ST0 register via stack.

  Input:

    XMM0: **  **  **  val

  Output:

     ST0: val

-------------------------------------------------------------------------------}

{$IFDEF Load_XMM0_to_ST0_1s}
  {$IFDEF x64}
    // 8 is there to maintain stack word alignment 
    SUB       RSP, 8
    MOVSS     dword ptr [RSP], XMM0   // [RSP]: p0
    FLD       dword ptr [RSP]         //   ST0: p0
    ADD       RSP, 8
  {$ELSE}
    SUB       ESP, 4
    MOVSS     dword ptr [ESP], XMM0   // [ESP]: p0
    FLD       dword ptr [ESP]         //   ST0: p0
    ADD       ESP, 4
  {$ENDIF}
{$ENDIF}

{-------------------------------------------------------------------------------

  Load_XMM0_to_ST0_1d

  Loads a value from low double of XMM0 register into ST0 register via stack.

  Input:

    XMM0: **  val

  Output:

     ST0: val

-------------------------------------------------------------------------------}

{$IFDEF Load_XMM0_to_ST0_1d}
  {$IFDEF x64}
    SUB       RSP, 8
    MOVSD     qword ptr [RSP], XMM0   // [RSP]: p0
    FLD       qword ptr [RSP]         //   ST0: p0
    ADD       RSP, 8
  {$ELSE}
    SUB       ESP, 8
    MOVSD     qword ptr [ESP], XMM0   // [ESP]: p0
    FLD       qword ptr [ESP]         //   ST0: p0
    ADD       ESP, 8
  {$ENDIF}
{$ENDIF}

{===============================================================================
                           SSE registers save/restore                                                       
===============================================================================}
{*******************************************************************************
  XMM registers does not need to be saved in any system except Windows 64bit.
*******************************************************************************}

{-------------------------------------------------------------------------------

  Save_XMM6_SSE

  Saves register XMM6 to top of the stack.

  Note:
  
    RSP/ESP regiter is decreased by 16.

-------------------------------------------------------------------------------}

{$IFDEF Save_XMM6_SSE}
  {$IFDEF Win64}
    SUB     RSP,  16
    MOVAPS  dqword ptr [RSP + 16], XMM6
  {$ENDIF}
{$ENDIF}

{-------------------------------------------------------------------------------

  Save_XMM6_to_XMM9_SSE

  Saves registers XMM6, XMM7, XMM8 and XMM9 to top of the stack.

  Note:

    RSP/ESP regiter is decreased by 64.

-------------------------------------------------------------------------------}

{$IFDEF Save_XMM6_to_XMM9_SSE}
  {$IFDEF Win64}
    SUB     RSP,  64
    MOVAPS  dqword ptr [RSP], XMM6
    MOVAPS  dqword ptr [RSP + 16], XMM7
    MOVAPS  dqword ptr [RSP + 32], XMM8
    MOVAPS  dqword ptr [RSP + 48], XMM9
  {$ENDIF}
{$ENDIF}

{-------------------------------------------------------------------------------

  Save_XMM6_to_XMM13_SSE

  Saves registers XMM6 trough XMM13 (8 registers) to top of the stack.

  Note:

    RSP/ESP regiter is decreased by 128.

-------------------------------------------------------------------------------}

{$IFDEF Save_XMM6_to_XMM13_SSE}
  {$IFDEF Win64}
    SUB     RSP,  128
    MOVAPS  dqword ptr [RSP], XMM6
    MOVAPS  dqword ptr [RSP + 16], XMM7
    MOVAPS  dqword ptr [RSP + 32], XMM8
    MOVAPS  dqword ptr [RSP + 48], XMM9
    MOVAPS  dqword ptr [RSP + 64], XMM10
    MOVAPS  dqword ptr [RSP + 80], XMM11
    MOVAPS  dqword ptr [RSP + 96], XMM12
    MOVAPS  dqword ptr [RSP + 112], XMM13
  {$ENDIF}
{$ENDIF}

{-------------------------------------------------------------------------------

  Restore_XMM6_SSE

  Restores register XMM6 from current stack.

  Note:

    RSP/ESP regiter is increased by 16.

-------------------------------------------------------------------------------}

{$IFDEF Restore_XMM6_SSE}
  {$IFDEF Win64}
    MOVAPS  XMM6, dqword ptr [RSP]
    ADD     RSP,  16
  {$ENDIF}
{$ENDIF}

{-------------------------------------------------------------------------------

  Restore_XMM6_to_XMM9_SSE

  Restores registers XMM6, XMM7, XMM8 and XMM9 from current stack.

  Note:

    RSP/ESP regiter is increased by 64.

-------------------------------------------------------------------------------}

{$IFDEF Restore_XMM6_to_XMM9_SSE}
  {$IFDEF Win64}
    MOVAPS  XMM6, dqword ptr [RSP]
    MOVAPS  XMM7, dqword ptr [RSP + 16]
    MOVAPS  XMM8, dqword ptr [RSP + 32]
    MOVAPS  XMM9, dqword ptr [RSP + 48]
    ADD     RSP,  64
  {$ENDIF}
{$ENDIF}

{-------------------------------------------------------------------------------

  Restore_XMM6_to_XMM9_SSE

  Restores registers XMM6 trough XMM13 (8 registers) from current stack.

  Note:

    RSP/ESP regiter is increased by 128.

-------------------------------------------------------------------------------}

{$IFDEF Restore_XMM6_to_XMM13_SSE}
  {$IFDEF Win64}
    MOVAPS  XMM6, dqword ptr [RSP]
    MOVAPS  XMM7, dqword ptr [RSP + 16]
    MOVAPS  XMM8, dqword ptr [RSP + 32]
    MOVAPS  XMM9, dqword ptr [RSP + 48]
    MOVAPS  XMM10, dqword ptr [RSP + 64]
    MOVAPS  XMM11, dqword ptr [RSP + 80]
    MOVAPS  XMM12, dqword ptr [RSP + 96]
    MOVAPS  XMM13, dqword ptr [RSP + 112]
    ADD     RSP,  128
  {$ENDIF}
{$ENDIF}

{===============================================================================
                                 Stack alignment
===============================================================================}

{*******************************************************************************
  Stack in 64bit builds should be already aligned on 128bit boundary in all
  systems.
*******************************************************************************}

{-------------------------------------------------------------------------------

  AlignStack_16B_Entry

  Aligns stack pointer (top of the stack) to 128bit boundary.

  Note:

    RSP/ESP regiter is decreased (amount depends on current value, but is
    always at least 8).

-------------------------------------------------------------------------------}

{$IFDEF AlignStack_16B_Entry}
  {$IFDEF x86}
    PUSH  EAX
    MOV   EAX,    ESP
    SUB   ESP,    4
    ADD   EAX,    4
    AND   ESP,    $FFFFFFF0
    MOV   [ESP],  EAX
    MOV   EAX,    [EAX - 4]
  {$ENDIF}
{$ENDIF}

{-------------------------------------------------------------------------------

  AlignStack_16B_Leave

  Removes stack pointer alignment done by AlignStack_16B_Entry.

  Note:

    RSP/ESP regiter is restored to a value it had before AlignStack_16B_Entry.

-------------------------------------------------------------------------------}

{$IFDEF AlignStack_16B_Leave}
  {$IFDEF x86}
    POP   ESP
  {$ENDIF}
{$ENDIF}
