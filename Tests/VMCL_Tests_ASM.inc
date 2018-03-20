{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  VMCL - Vectors & Matrices calculation library

  Test suite inclusion ASM code fragments

    This file contains assembly code fragments that are inserted directly into
    ASM functions used in test suite (instead of calling then as a routines).
    This generates larger, but faster, code by avoiding call overhead.

  ©František Milt 2018-**-**

  Version 1.0 dev

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    BitVector   - github.com/ncs-sniper/Lib.BitVector
    BitOps      - github.com/ncs-sniper/Lib.BitOps
    StrRect     - github.com/ncs-sniper/Lib.StrRect
    SimpleCPUID - github.com/ncs-sniper/Lib.SimpleCPUID

===============================================================================}

{.$DEFINE SpeedTestCaller}

{-------------------------------------------------------------------------------

  SpeedTestCaller

  Obtains timestamps before and after call to a provided function using TSC
  register. When symbol EmptyCall is defined, no function call is done.

  Input:

    Function pointer has to be stored in variable PrecisionTest of type
    TVMCLPrecisionTests (field FunctionAddr). Possible parameters for the
    called function must be prepared outside of this code.

  Output:

    Timestamps before and after the call are stored in variable PrecisionTest.

-------------------------------------------------------------------------------}
{$IFDEF SpeedTestCaller}
  {$IFDEF x64}
    PUSH  RAX
    PUSH  RDX
  {$ELSE}
    PUSH  EAX
    PUSH  EDX
  {$ENDIF}

    MFENCE
    LFENCE
    RDTSC
    MFENCE
    LFENCE

  {$IFDEF x64}
    MOV   [RIP + PrecisionTest.Counters.StartLo], EAX
    MOV   [RIP + PrecisionTest.Counters.StartHi], EDX

    POP   RDX
    POP   RAX

    {$IFNDEF EmptyCall}
    CALL [RIP + PrecisionTest.FunctionAddr]
    {$ENDIF}
  {$ELSE}
    MOV   PrecisionTest.Counters.StartLo, EAX
    MOV   PrecisionTest.Counters.StartHi, EDX

    POP   EDX
    POP   EAX

    {$IFNDEF EmptyCall}
    CALL PrecisionTest.FunctionAddr
    {$ENDIF}
  {$ENDIF}

    MFENCE
    LFENCE
    RDTSC
    MFENCE
    LFENCE

  {$IFDEF x64}
    MOV   [RIP + PrecisionTest.Counters.StopLo], EAX
    MOV   [RIP + PrecisionTest.Counters.StopHi], EDX
  {$ELSE}
    MOV   PrecisionTest.Counters.StopLo, EAX
    MOV   PrecisionTest.Counters.StopHi, EDX
  {$ENDIF}
{$ENDIF}  
