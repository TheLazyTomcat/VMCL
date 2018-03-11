{.$DEFINE CheckMemAlign16_1}
{.$DEFINE CheckMemAlign16_2}
{.$DEFINE CheckMemAlign16_3}

{.$DEFINE Load_XMM0_to_ST0_1s}
{.$DEFINE Load_XMM0_to_ST0_1d}

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
    MOVSS     dword ptr [RSP], XMM0   // [ESP]: p0
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
    MOVSD     qword ptr [RSP], XMM0   // [ESP]: p0
    FLD       qword ptr [RSP]         //   ST0: p0
    ADD       RSP, 8
  {$ELSE}
    SUB       ESP, 8
    MOVSD     qword ptr [ESP], XMM0   // [ESP]: p0
    FLD       qword ptr [ESP]         //   ST0: p0
    ADD       ESP, 8
  {$ENDIF}
{$ENDIF}