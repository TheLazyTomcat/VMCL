unit VMCL_Matrices_SSE;

{$INCLUDE 'VMCL_defs.inc'}

interface

uses
  VMCL_Matrices;

{$IFNDEF PurePascal}

procedure PrecisionConversion_2RMs_SSEu(const InMat: TVMCLMatrix2RMd; out OutMat: TVMCLMatrix2RMs); register; assembler; // slow in d32
procedure PrecisionConversion_2RMs_SSEa(const InMat: TVMCLMatrix2RMd; out OutMat: TVMCLMatrix2RMs); register; assembler; // slow in d32
procedure PrecisionConversion_2CMs_SSEu(const InMat: TVMCLMatrix2CMd; out OutMat: TVMCLMatrix2CMs); register; assembler; // slow in d32
procedure PrecisionConversion_2CMs_SSEa(const InMat: TVMCLMatrix2CMd; out OutMat: TVMCLMatrix2CMs); register; assembler; // slow in d32

procedure PrecisionConversion_3RMs_SSEu(const InMat: TVMCLMatrix3RMd; out OutMat: TVMCLMatrix3RMs); register; assembler;
procedure PrecisionConversion_3RMs_SSEa(const InMat: TVMCLMatrix3RMd; out OutMat: TVMCLMatrix3RMs); register; assembler;
procedure PrecisionConversion_3CMs_SSEu(const InMat: TVMCLMatrix3CMd; out OutMat: TVMCLMatrix3CMs); register; assembler;
procedure PrecisionConversion_3CMs_SSEa(const InMat: TVMCLMatrix3CMd; out OutMat: TVMCLMatrix3CMs); register; assembler;

procedure PrecisionConversion_4RMs_SSEu(const InMat: TVMCLMatrix4RMd; out OutMat: TVMCLMatrix4RMs); register; assembler;
procedure PrecisionConversion_4RMs_SSEa(const InMat: TVMCLMatrix4RMd; out OutMat: TVMCLMatrix4RMs); register; assembler;
procedure PrecisionConversion_4CMs_SSEu(const InMat: TVMCLMatrix4CMd; out OutMat: TVMCLMatrix4CMs); register; assembler;
procedure PrecisionConversion_4CMs_SSEa(const InMat: TVMCLMatrix4CMd; out OutMat: TVMCLMatrix4CMs); register; assembler;

procedure PrecisionConversion_2RMd_SSEu(const InMat: TVMCLMatrix2RMs; out OutMat: TVMCLMatrix2RMd); register; assembler;
procedure PrecisionConversion_2RMd_SSEa(const InMat: TVMCLMatrix2RMs; out OutMat: TVMCLMatrix2RMd); register; assembler;
procedure PrecisionConversion_2CMd_SSEu(const InMat: TVMCLMatrix2CMs; out OutMat: TVMCLMatrix2CMd); register; assembler;
procedure PrecisionConversion_2CMd_SSEa(const InMat: TVMCLMatrix2CMs; out OutMat: TVMCLMatrix2CMd); register; assembler;

procedure PrecisionConversion_3RMd_SSEu(const InMat: TVMCLMatrix3RMs; out OutMat: TVMCLMatrix3RMd); register; assembler;
procedure PrecisionConversion_3RMd_SSEa(const InMat: TVMCLMatrix3RMs; out OutMat: TVMCLMatrix3RMd); register; assembler;
procedure PrecisionConversion_3CMd_SSEu(const InMat: TVMCLMatrix3CMs; out OutMat: TVMCLMatrix3CMd); register; assembler;
procedure PrecisionConversion_3CMd_SSEa(const InMat: TVMCLMatrix3CMs; out OutMat: TVMCLMatrix3CMd); register; assembler;

procedure PrecisionConversion_4RMd_SSEu(const InMat: TVMCLMatrix4RMs; out OutMat: TVMCLMatrix4RMd); register; assembler;
procedure PrecisionConversion_4RMd_SSEa(const InMat: TVMCLMatrix4RMs; out OutMat: TVMCLMatrix4RMd); register; assembler;
procedure PrecisionConversion_4CMd_SSEu(const InMat: TVMCLMatrix4CMs; out OutMat: TVMCLMatrix4CMd); register; assembler;
procedure PrecisionConversion_4CMd_SSEa(const InMat: TVMCLMatrix4CMs; out OutMat: TVMCLMatrix4CMd); register; assembler;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix2RMd; out OutMat: TVMCLMatrix2RMs); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix2CMd; out OutMat: TVMCLMatrix2CMs); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix3RMd; out OutMat: TVMCLMatrix3RMs); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix3CMd; out OutMat: TVMCLMatrix3CMs); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix4RMd; out OutMat: TVMCLMatrix4RMs); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix4CMd; out OutMat: TVMCLMatrix4CMs); register; assembler; overload;

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix2RMs; out OutMat: TVMCLMatrix2RMd); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix2CMs; out OutMat: TVMCLMatrix2CMd); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix3RMs; out OutMat: TVMCLMatrix3RMd); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix3CMs; out OutMat: TVMCLMatrix3CMd); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix4RMs; out OutMat: TVMCLMatrix4RMd); register; assembler; overload;
procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix4CMs; out OutMat: TVMCLMatrix4CMd); register; assembler; overload;

{$ENDIF}

implementation

{$IFNDEF PurePascal}

{$IFDEF ASMSuppressSizeWarnings}
  {$WARN 2087 OFF}  //  Supresses warnings on following two $WARN (FPC 2.X)
  {$WARN 7121 OFF}  //  Warning: Check size of memory operand "op: memory-operand-size is X bits, but expected [Y bits]"
  {$WARN 7122 OFF}  //  Warning: Check size of memory operand "op: memory-operand-size is X bits, but expected [Y bits + Z byte offset]"
  {$WARN 2087 ON}
{$ENDIF}

//==============================================================================

procedure PrecisionConversion_2RMs_SSEu(const InMat: TVMCLMatrix2RMd; out OutMat: TVMCLMatrix2RMs);
asm
    MOVUPD    XMM0, dqword ptr [InMat]          //  XMM0: d01   d00
    MOVUPD    XMM1, dqword ptr [InMat + 16]     //  XMM1: d11   d10

    CVTPD2PS  XMM0, XMM0                        //  XMM0: **    **    s01   s00
    CVTPD2PS  XMM1, XMM1                        //  XMM1: **    **    s11   s10

    MOVLHPS   XMM0, XMM1                        //  XMM0: s11   s10   s01   s00

    MOVUPS    dqword ptr [OutMat], XMM0         //  [OutMat]: s00   s01   s10   s11
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_2RMs_SSEa(const InMat: TVMCLMatrix2RMd; out OutMat: TVMCLMatrix2RMs);
asm
    CVTPD2PS  XMM0, dqword ptr [InMat]          //  XMM0: **    **    s01   s00
    CVTPD2PS  XMM1, dqword ptr [InMat + 16]     //  XMM1: **    **    s11   s10

    MOVLHPS   XMM0, XMM1                        //  XMM0: s11   s10   s01   s00

    MOVAPS    dqword ptr [OutMat], XMM0         //  [OutMat]: s00   s01   s10   s11
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_2CMs_SSEu(const InMat: TVMCLMatrix2CMd; out OutMat: TVMCLMatrix2CMs);
asm
    MOVUPD    XMM0, dqword ptr [InMat]          //  XMM0: d10   d00
    MOVUPD    XMM1, dqword ptr [InMat + 16]     //  XMM1: d11   d01

    CVTPD2PS  XMM0, XMM0                        //  XMM0: **    **    s10   s00
    CVTPD2PS  XMM1, XMM1                        //  XMM1: **    **    s11   s01

    MOVLHPS   XMM0, XMM1                        //  XMM0: s11   s01   s10   s00

    MOVUPS    dqword ptr [OutMat], XMM0         //  [OutMat]: s00   s10   s01   s11
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_2CMs_SSEa(const InMat: TVMCLMatrix2CMd; out OutMat: TVMCLMatrix2CMs);
asm
    CVTPD2PS  XMM0, dqword ptr [InMat]          //  XMM0: **    **    s10   s00
    CVTPD2PS  XMM1, dqword ptr [InMat + 16]     //  XMM1: **    **    s11   s01

    MOVLHPS   XMM0, XMM1                        //  XMM0: s11   s01   s10   s00

    MOVAPS    dqword ptr [OutMat], XMM0         //  [OutMat]: s00   s10   s01   s11
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_3RMs_SSEu(const InMat: TVMCLMatrix3RMd; out OutMat: TVMCLMatrix3RMs);
asm
    MOVUPD    XMM0, dqword ptr [InMat]          //  XMM0: d01   d00
    MOVUPD    XMM1, dqword ptr [InMat + 16]     //  XMM1: d10   d02
    MOVUPD    XMM2, dqword ptr [InMat + 32]     //  XMM2: d12   d11
    MOVUPD    XMM3, dqword ptr [InMat + 48]     //  XMM3: d21   d20
    MOVSD     XMM4, qword ptr [InMat + 64]      //  XMM4: 00    d22

    CVTPD2PS  XMM0, XMM0                        //  XMM0: 00    00    s01   s00
    CVTPD2PS  XMM1, XMM1                        //  XMM1: 00    00    s10   s02
    CVTPD2PS  XMM2, XMM2                        //  XMM2: 00    00    s12   s11
    CVTPD2PS  XMM3, XMM3                        //  XMM3: 00    00    s21   s20
    CVTSD2SS  XMM4, XMM4                        //  XMM4: **    **    00    s22

    MOVLHPS   XMM0, XMM1                        //  XMM0: s10   s02   s01   s00
    MOVLHPS   XMM2, XMM3                        //  XMM2: s21   s20   s12   s11

    MOVUPS    dqword ptr [OutMat], XMM0         //  [OutMat]:       s00   s01   s02   s10
    MOVUPS    dqword ptr [OutMat + 16], XMM2    //  [OutMat + 16]:  s21   s20   s12   s11
    MOVSS     dword ptr [OutMat + 32], XMM4     //  [OutMat + 32]:  s22
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_3RMs_SSEa(const InMat: TVMCLMatrix3RMd; out OutMat: TVMCLMatrix3RMs);
asm
    CVTPD2PS  XMM0, dqword ptr [InMat]          //  XMM0: 00    00    s01   s00
    CVTPD2PS  XMM1, dqword ptr [InMat + 16]     //  XMM1: 00    00    s10   s02
    CVTPD2PS  XMM2, dqword ptr [InMat + 32]     //  XMM2: 00    00    s12   s11
    CVTPD2PS  XMM3, dqword ptr [InMat + 48]     //  XMM3: 00    00    s21   s20
  {$IFDEF FPC}
    CVTSD2SS  XMM4, [InMat + 64]                //  XMM4: **    **    00    s22
  {$ELSE}
    CVTSD2SS  XMM4, qword ptr [InMat + 64]      //  XMM4: **    **    00    s22
  {$ENDIF}

    MOVLHPS   XMM0, XMM1                        //  XMM0: s10   s02   s01   s00
    MOVLHPS   XMM2, XMM3                        //  XMM2: s21   s20   s12   s11

    MOVAPS    dqword ptr [OutMat], XMM0         //  [OutMat]:       s00   s01   s02   s10
    MOVAPS    dqword ptr [OutMat + 16], XMM2    //  [OutMat + 16]:  s21   s20   s12   s11
    MOVSS     dword ptr [OutMat + 32], XMM4     //  [OutMat + 32]:  s22
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_3CMs_SSEu(const InMat: TVMCLMatrix3CMd; out OutMat: TVMCLMatrix3CMs);
asm
    MOVUPD    XMM0, dqword ptr [InMat]          //  XMM0: d10   d00
    MOVUPD    XMM1, dqword ptr [InMat + 16]     //  XMM1: d01   d20
    MOVUPD    XMM2, dqword ptr [InMat + 32]     //  XMM2: d21   d11
    MOVUPD    XMM3, dqword ptr [InMat + 48]     //  XMM3: d12   d02
    MOVSD     XMM4, qword ptr [InMat + 64]      //  XMM4: 00    d22

    CVTPD2PS  XMM0, XMM0                        //  XMM0: 00    00    s10   s00
    CVTPD2PS  XMM1, XMM1                        //  XMM1: 00    00    s01   s20
    CVTPD2PS  XMM2, XMM2                        //  XMM2: 00    00    s21   s11
    CVTPD2PS  XMM3, XMM3                        //  XMM3: 00    00    s12   s02
    CVTSD2SS  XMM4, XMM4                        //  XMM4: **    **    00    s22

    MOVLHPS   XMM0, XMM1                        //  XMM0: s01   s20   s10   s00
    MOVLHPS   XMM2, XMM3                        //  XMM2: s12   s02   s21   s11

    MOVUPS    dqword ptr [OutMat], XMM0         //  [OutMat]:       s00   s10   s20   s01
    MOVUPS    dqword ptr [OutMat + 16], XMM2    //  [OutMat + 16]:  s12   s02   s21   s11
    MOVSS     dword ptr [OutMat + 32], XMM4     //  [OutMat + 32]:  s22
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_3CMs_SSEa(const InMat: TVMCLMatrix3CMd; out OutMat: TVMCLMatrix3CMs);
asm
    CVTPD2PS  XMM0, dqword ptr [InMat]          //  XMM0: 00    00    s10   s00
    CVTPD2PS  XMM1, dqword ptr [InMat + 16]     //  XMM1: 00    00    s01   s20
    CVTPD2PS  XMM2, dqword ptr [InMat + 32]     //  XMM2: 00    00    s21   s11
    CVTPD2PS  XMM3, dqword ptr [InMat + 48]     //  XMM3: 00    00    s12   s02
  {$IFDEF FPC}
    CVTSD2SS  XMM4, [InMat + 64]                //  XMM4: **    **    00    s22
  {$ELSE}
    CVTSD2SS  XMM4, qword ptr [InMat + 64]      //  XMM4: **    **    00    s22
  {$ENDIF}

    MOVLHPS   XMM0, XMM1                        //  XMM0: s01   s20   s10   s00
    MOVLHPS   XMM2, XMM3                        //  XMM2: s12   s02   s21   s11

    MOVAPS    dqword ptr [OutMat], XMM0         //  [OutMat]:       s00   s10   s20   s01
    MOVAPS    dqword ptr [OutMat + 16], XMM2    //  [OutMat + 16]:  s21   s02   s21   s11
    MOVSS     dword ptr [OutMat + 32], XMM4     //  [OutMat + 32]:  s22
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_4RMs_SSEu(const InMat: TVMCLMatrix4RMd; out OutMat: TVMCLMatrix4RMs);
asm
    MOVUPD    XMM0, dqword ptr [InMat]          //  XMM0: d01   d00
    MOVUPD    XMM1, dqword ptr [InMat + 16]     //  XMM1: d03   d02
    MOVUPD    XMM2, dqword ptr [InMat + 32]     //  XMM2: d11   d10
    MOVUPD    XMM3, dqword ptr [InMat + 48]     //  XMM3: d13   d12

    CVTPD2PS  XMM0, XMM0                        //  XMM0: 00    00    s01   s00
    CVTPD2PS  XMM1, XMM1                        //  XMM1: 00    00    s03   s02
    CVTPD2PS  XMM2, XMM2                        //  XMM2: 00    00    s11   s10
    CVTPD2PS  XMM3, XMM3                        //  XMM3: 00    00    s13   s12

    MOVLHPS   XMM0, XMM1                        //  XMM0: s03   s02   s01   s00
    MOVLHPS   XMM2, XMM3                        //  XMM2: s13   s12   s11   s10

    MOVUPS    dqword ptr [OutMat], XMM0         //  [OutMatrix]:      s00   s01   s02   s03
    MOVUPS    dqword ptr [OutMat + 16], XMM2    //  [OutMatrix + 16]: s10   s11   s12   s13

    MOVUPD    XMM0, dqword ptr [InMat + 64]     //  XMM0: d21   d20
    MOVUPD    XMM1, dqword ptr [InMat + 80]     //  XMM1: d23   d22
    MOVUPD    XMM2, dqword ptr [InMat + 96]     //  XMM2: d31   d30
    MOVUPD    XMM3, dqword ptr [InMat + 112]    //  XMM3: d33   d32

    CVTPD2PS  XMM0, XMM0                        //  XMM0: 00    00    s21   s20
    CVTPD2PS  XMM1, XMM1                        //  XMM1: 00    00    s23   s22
    CVTPD2PS  XMM2, XMM2                        //  XMM2: 00    00    s31   s30
    CVTPD2PS  XMM3, XMM3                        //  XMM3: 00    00    s33   s32

    MOVLHPS   XMM0, XMM1                        //  XMM0: s23   s22   s21   s20
    MOVLHPS   XMM2, XMM3                        //  XMM2: s33   s32   s31   s30

    MOVUPS    dqword ptr [OutMat + 32], XMM0    //  [OutMatrix + 32]: s20   s21   s22   s23
    MOVUPS    dqword ptr [OutMat + 48], XMM2    //  [OutMatrix + 48]: s30   s31   s32   s33
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_4RMs_SSEa(const InMat: TVMCLMatrix4RMd; out OutMat: TVMCLMatrix4RMs);
asm
    CVTPD2PS  XMM0, dqword ptr [InMat]          //  XMM0: 00    00    s01   s00
    CVTPD2PS  XMM1, dqword ptr [InMat + 16]     //  XMM1: 00    00    s03   s02
    CVTPD2PS  XMM2, dqword ptr [InMat + 32]     //  XMM2: 00    00    s11   s10
    CVTPD2PS  XMM3, dqword ptr [InMat + 48]     //  XMM3: 00    00    s13   s12

    MOVLHPS   XMM0, XMM1                        //  XMM0: s03   s02   s01   s00
    MOVLHPS   XMM2, XMM3                        //  XMM2: s13   s12   s11   s10

    MOVAPS    dqword ptr [OutMat], XMM0         //  [OutMatrix]:      s00   s01   s02   s03
    MOVAPS    dqword ptr [OutMat + 16], XMM2    //  [OutMatrix + 16]: s10   s11   s12   s13

    CVTPD2PS  XMM0, dqword ptr [InMat + 64]     //  XMM0: 00    00    s21   s20
    CVTPD2PS  XMM1, dqword ptr [InMat + 80]     //  XMM1: 00    00    s23   s22
    CVTPD2PS  XMM2, dqword ptr [InMat + 96]     //  XMM2: 00    00    s31   s30
    CVTPD2PS  XMM3, dqword ptr [InMat + 112]    //  XMM3: 00    00    s33   s32

    MOVLHPS   XMM0, XMM1                        //  XMM0: s23   s22   s21   s20
    MOVLHPS   XMM2, XMM3                        //  XMM2: s33   s32   s31   s30

    MOVUPS    dqword ptr [OutMat + 32], XMM0    //  [OutMatrix + 32]: s20   s21   s22   s23
    MOVUPS    dqword ptr [OutMat + 48], XMM2    //  [OutMatrix + 48]: s30   s31   s32   s33
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_4CMs_SSEu(const InMat: TVMCLMatrix4CMd; out OutMat: TVMCLMatrix4CMs);
asm
    MOVUPD    XMM0, dqword ptr [InMat]          //  XMM0: d10   d00
    MOVUPD    XMM1, dqword ptr [InMat + 16]     //  XMM1: d30   d20
    MOVUPD    XMM2, dqword ptr [InMat + 32]     //  XMM2: d11   d01
    MOVUPD    XMM3, dqword ptr [InMat + 48]     //  XMM3: d31   d21

    CVTPD2PS  XMM0, XMM0                        //  XMM0: 00    00    s10   s00
    CVTPD2PS  XMM1, XMM1                        //  XMM1: 00    00    s30   s20
    CVTPD2PS  XMM2, XMM2                        //  XMM2: 00    00    s11   s01
    CVTPD2PS  XMM3, XMM3                        //  XMM3: 00    00    s31   s21

    MOVLHPS   XMM0, XMM1                        //  XMM0: s30   s20   s10   s00
    MOVLHPS   XMM2, XMM3                        //  XMM2: s31   s21   s11   s01

    MOVUPS    dqword ptr [OutMat], XMM0         //  [OutMatrix]:      s00   s10   s20   s30
    MOVUPS    dqword ptr [OutMat + 16], XMM2    //  [OutMatrix + 16]: s01   s11   s21   s31

    MOVUPD    XMM0, dqword ptr [InMat + 64]     //  XMM0: d12   d02
    MOVUPD    XMM1, dqword ptr [InMat + 80]     //  XMM1: d32   d22
    MOVUPD    XMM2, dqword ptr [InMat + 96]     //  XMM2: d13   d03
    MOVUPD    XMM3, dqword ptr [InMat + 112]    //  XMM3: d33   d23

    CVTPD2PS  XMM0, XMM0                        //  XMM0: 00    00    s12   s02
    CVTPD2PS  XMM1, XMM1                        //  XMM1: 00    00    s32   s22
    CVTPD2PS  XMM2, XMM2                        //  XMM2: 00    00    s13   s03
    CVTPD2PS  XMM3, XMM3                        //  XMM3: 00    00    s33   s23

    MOVLHPS   XMM0, XMM1                        //  XMM0: s32   s22   s12   s02
    MOVLHPS   XMM2, XMM3                        //  XMM2: s33   s23   s13   s03

    MOVUPS    dqword ptr [OutMat + 32], XMM0    //  [OutMatrix + 32]: s02   s12   s22   s32
    MOVUPS    dqword ptr [OutMat + 48], XMM2    //  [OutMatrix + 48]: s03   s13   s23   s33
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_4CMs_SSEa(const InMat: TVMCLMatrix4CMd; out OutMat: TVMCLMatrix4CMs);
asm
    CVTPD2PS  XMM0, dqword ptr [InMat]          //  XMM0: 00    00    s10   s00
    CVTPD2PS  XMM1, dqword ptr [InMat + 16]     //  XMM1: 00    00    s30   s20
    CVTPD2PS  XMM2, dqword ptr [InMat + 32]     //  XMM2: 00    00    s11   s01
    CVTPD2PS  XMM3, dqword ptr [InMat + 48]     //  XMM3: 00    00    s31   s21

    MOVLHPS   XMM0, XMM1                        //  XMM0: s30   s20   s10   s00
    MOVLHPS   XMM2, XMM3                        //  XMM2: s31   s21   s11   s01

    MOVUPS    dqword ptr [OutMat], XMM0         //  [OutMatrix]:      s00   s10   s20   s30
    MOVUPS    dqword ptr [OutMat + 16], XMM2    //  [OutMatrix + 16]: s01   s11   s21   s31

    CVTPD2PS  XMM0, dqword ptr [InMat + 64]     //  XMM0: 00    00    s12   s02
    CVTPD2PS  XMM1, dqword ptr [InMat + 80]     //  XMM1: 00    00    s32   s22
    CVTPD2PS  XMM2, dqword ptr [InMat + 96]     //  XMM2: 00    00    s13   s03
    CVTPD2PS  XMM3, dqword ptr [InMat + 112]    //  XMM3: 00    00    s33   s23

    MOVLHPS   XMM0, XMM1                        //  XMM0: s32   s22   s12   s02
    MOVLHPS   XMM2, XMM3                        //  XMM2: s33   s23   s13   s03

    MOVUPS    dqword ptr [OutMat + 32], XMM0    //  [OutMatrix + 32]: s02   s12   s22   s32
    MOVUPS    dqword ptr [OutMat + 48], XMM2    //  [OutMatrix + 48]: s03   s13   s23   s33
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_2RMd_SSEu(const InMat: TVMCLMatrix2RMs; out OutMat: TVMCLMatrix2RMd);
asm
    MOVUPS    XMM0, dqword ptr [InMat]          //  XMM0: s11   s10   s01   s00

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s11   s10

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d01   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d11   d10

    MOVUPD    dqword ptr [OutMat], XMM0         //  [OutMat]:       d00   d01
    MOVUPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d01   d11
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_2RMd_SSEa(const InMat: TVMCLMatrix2RMs; out OutMat: TVMCLMatrix2RMd);
asm
    MOVAPS    XMM0, dqword ptr [InMat]          //  XMM0: s11   s10   s01   s00

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s11   s10

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d01   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d11   d10

    MOVAPD    dqword ptr [OutMat], XMM0         //  [OutMat]:       d00   d01
    MOVAPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d01   d11
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_2CMd_SSEu(const InMat: TVMCLMatrix2CMs; out OutMat: TVMCLMatrix2CMd);
asm
    MOVUPS    XMM0, dqword ptr [InMat]          //  XMM0: s11   s01   s10   s00

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s11   s01

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d10   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d11   d01

    MOVUPD    dqword ptr [OutMat], XMM0         //  [OutMat]:       d00   d10
    MOVUPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d01   d11
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_2CMd_SSEa(const InMat: TVMCLMatrix2CMs; out OutMat: TVMCLMatrix2CMd);
asm
    MOVAPS    XMM0, dqword ptr [InMat]          //  XMM0: s11   s01   s10   s00

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s11   s01

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d10   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d11   d01

    MOVAPD    dqword ptr [OutMat], XMM0         //  [OutMat]:       d00   d10
    MOVAPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d01   d11
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_3RMd_SSEu(const InMat: TVMCLMatrix3RMs; out OutMat: TVMCLMatrix3RMd);
asm
    MOVUPS    XMM0, dqword ptr [InMat]          //  XMM0: s10   s02   s01   s00
    MOVUPS    XMM2, dqword ptr [InMat + 16]     //  XMM2: s21   s20   s12   s11
    MOVSS     XMM4, dword ptr [InMat + 32]      //  XMM4: 00    00    00    s22

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s10   s02
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s21   s20

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d01   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d10   d02
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d12   d11
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d21   d20
    CVTSS2SD  XMM4, XMM4                        //  XMM4: **    d22

    MOVUPD    dqword ptr [OutMat], XMM0         //  [OutMat ]:      d00   d01
    MOVUPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d02   d10
    MOVUPD    dqword ptr [OutMat + 32], XMM2    //  [OutMat + 32]:  d11   d12
    MOVUPD    dqword ptr [OutMat + 48], XMM3    //  [OutMat + 48]:  d20   d21
    MOVSD     qword ptr [OutMat + 64], XMM4     //  [OutMat + 64]:  d22
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_3RMd_SSEa(const InMat: TVMCLMatrix3RMs; out OutMat: TVMCLMatrix3RMd);
asm
    MOVAPS    XMM0, dqword ptr [InMat]          //  XMM0: s10   s02   s01   s00
    MOVAPS    XMM2, dqword ptr [InMat + 16]     //  XMM2: s21   s20   s12   s11
    MOVSS     XMM4, dword ptr [InMat + 32]      //  XMM4: 00    00    00    s22

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s10   s02
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s21   s20

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d01   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d10   d02
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d12   d11
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d21   d20
    CVTSS2SD  XMM4, XMM4                        //  XMM4: **    d22

    MOVAPD    dqword ptr [OutMat], XMM0         //  [OutMat ]:      d00   d01
    MOVAPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d02   d10
    MOVAPD    dqword ptr [OutMat + 32], XMM2    //  [OutMat + 32]:  d11   d12
    MOVAPD    dqword ptr [OutMat + 48], XMM3    //  [OutMat + 48]:  d20   d21
    MOVSD     qword ptr [OutMat + 64], XMM4     //  [OutMat + 64]:  d22
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_3CMd_SSEu(const InMat: TVMCLMatrix3CMs; out OutMat: TVMCLMatrix3CMd);
asm
    MOVUPS    XMM0, dqword ptr [InMat]          //  XMM0: s01   s20   s10   s00
    MOVUPS    XMM2, dqword ptr [InMat + 16]     //  XMM2: s12   s02   s21   s11
    MOVSS     XMM4, dword ptr [InMat + 32]      //  XMM4: 00    00    00    s22

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s01   s20
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s12   s02

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d10   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d01   d20
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d21   d11
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d12   d02
    CVTSS2SD  XMM4, XMM4                        //  XMM4: **    d22

    MOVUPD    dqword ptr [OutMat], XMM0         //  [OutMat ]:      d00   d10
    MOVUPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d20   d01
    MOVUPD    dqword ptr [OutMat + 32], XMM2    //  [OutMat + 32]:  d11   d21
    MOVUPD    dqword ptr [OutMat + 48], XMM3    //  [OutMat + 48]:  d02   d12
    MOVSD     qword ptr [OutMat + 64], XMM4     //  [OutMat + 64]:  d22
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_3CMd_SSEa(const InMat: TVMCLMatrix3CMs; out OutMat: TVMCLMatrix3CMd);
asm
    MOVAPS    XMM0, dqword ptr [InMat]          //  XMM0: s01   s20   s10   s00
    MOVAPS    XMM2, dqword ptr [InMat + 16]     //  XMM2: s12   s02   s21   s11
    MOVSS     XMM4, dword ptr [InMat + 32]      //  XMM4: 00    00    00    s22

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s01   s20
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s12   s02

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d10   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d01   d20
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d21   d11
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d12   d02
    CVTSS2SD  XMM4, XMM4                        //  XMM4: **    d22

    MOVAPD    dqword ptr [OutMat], XMM0         //  [OutMat ]:      d00   d10
    MOVAPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d20   d01
    MOVAPD    dqword ptr [OutMat + 32], XMM2    //  [OutMat + 32]:  d11   d21
    MOVAPD    dqword ptr [OutMat + 48], XMM3    //  [OutMat + 48]:  d02   d12
    MOVSD     qword ptr [OutMat + 64], XMM4     //  [OutMat + 64]:  d22
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_4RMd_SSEu(const InMat: TVMCLMatrix4RMs; out OutMat: TVMCLMatrix4RMd);
asm
    MOVUPS    XMM0, dqword ptr [InMat]          //  XMM0: s03   s02   s01   s00
    MOVUPS    XMM2, dqword ptr [InMat + 16]     //  XMM2: s13   s12   s11   s10

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s03   s02
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s13   s12

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d01   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d03   d02
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d11   d10
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d13   d12

    MOVUPD    dqword ptr [OutMat], XMM0         //  [OutMat]:       d00   d01
    MOVUPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d02   d03
    MOVUPD    dqword ptr [OutMat + 32], XMM2    //  [OutMat + 32]:  d10   d11
    MOVUPD    dqword ptr [OutMat + 48], XMM3    //  [OutMat + 48]:  d12   d13

    MOVUPS    XMM0, dqword ptr [InMat + 32]     //  XMM0: s23   s22   s21   s20
    MOVUPS    XMM2, dqword ptr [InMat + 48]     //  XMM2: s33   s32   s31   s30

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s23   s22
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s33   s32

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d21   d20
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d23   d22
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d31   d30
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d33   d32

    MOVUPD    dqword ptr [OutMat + 64], XMM0    //  [OutMat + 64]:  d20   d21
    MOVUPD    dqword ptr [OutMat + 80], XMM1    //  [OutMat + 80]:  d22   d23
    MOVUPD    dqword ptr [OutMat + 96], XMM2    //  [OutMat + 96]:  d30   d31
    MOVUPD    dqword ptr [OutMat + 112], XMM3   //  [OutMat + 112]: d32   d33
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_4RMd_SSEa(const InMat: TVMCLMatrix4RMs; out OutMat: TVMCLMatrix4RMd);
asm
    MOVAPS    XMM0, dqword ptr [InMat]          //  XMM0: s03   s02   s01   s00
    MOVAPS    XMM2, dqword ptr [InMat + 16]     //  XMM2: s13   s12   s11   s10

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s03   s02
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s13   s12

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d01   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d03   d02
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d11   d10
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d13   d12

    MOVAPD    dqword ptr [OutMat], XMM0         //  [OutMat]:       d00   d01
    MOVAPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d02   d03
    MOVAPD    dqword ptr [OutMat + 32], XMM2    //  [OutMat + 32]:  d10   d11
    MOVAPD    dqword ptr [OutMat + 48], XMM3    //  [OutMat + 48]:  d12   d13

    MOVAPS    XMM0, dqword ptr [InMat + 32]     //  XMM0: s23   s22   s21   s20
    MOVAPS    XMM2, dqword ptr [InMat + 48]     //  XMM2: s33   s32   s31   s30

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s23   s22
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s33   s32

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d21   d20
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d23   d22
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d31   d30
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d33   d32

    MOVAPD    dqword ptr [OutMat + 64], XMM0    //  [OutMat + 64]:  d20   d21
    MOVAPD    dqword ptr [OutMat + 80], XMM1    //  [OutMat + 80]:  d22   d23
    MOVAPD    dqword ptr [OutMat + 96], XMM2    //  [OutMat + 96]:  d30   d31
    MOVAPD    dqword ptr [OutMat + 112], XMM3   //  [OutMat + 112]: d32   d33
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_4CMd_SSEu(const InMat: TVMCLMatrix4CMs; out OutMat: TVMCLMatrix4CMd);
asm
    MOVUPS    XMM0, dqword ptr [InMat]          //  XMM0: s30   s20   s10   s00
    MOVUPS    XMM2, dqword ptr [InMat + 16]     //  XMM2: s31   s21   s11   s01

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s30   s20
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s31   s21

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d10   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d30   d20
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d11   d01
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d31   d21

    MOVUPD    dqword ptr [OutMat], XMM0         //  [OutMat]:       d00   d10
    MOVUPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d20   d30
    MOVUPD    dqword ptr [OutMat + 32], XMM2    //  [OutMat + 32]:  d01   d11
    MOVUPD    dqword ptr [OutMat + 48], XMM3    //  [OutMat + 48]:  d21   d31

    MOVUPS    XMM0, dqword ptr [InMat + 32]     //  XMM0: s32   s22   s12   s02
    MOVUPS    XMM2, dqword ptr [InMat + 48]     //  XMM2: s33   s23   s31   s03

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s32   s22
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s33   s23

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d12   d02
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d32   d22
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d13   d03
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d33   d23

    MOVUPD    dqword ptr [OutMat + 64], XMM0    //  [OutMat + 64]:  d02   d12
    MOVUPD    dqword ptr [OutMat + 80], XMM1    //  [OutMat + 80]:  d22   d32
    MOVUPD    dqword ptr [OutMat + 96], XMM2    //  [OutMat + 96]:  d03   d13
    MOVUPD    dqword ptr [OutMat + 112], XMM3   //  [OutMat + 112]: d23   d33
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_4CMd_SSEa(const InMat: TVMCLMatrix4CMs; out OutMat: TVMCLMatrix4CMd);
asm
    MOVAPS    XMM0, dqword ptr [InMat]          //  XMM0: s30   s20   s10   s00
    MOVAPS    XMM2, dqword ptr [InMat + 16]     //  XMM2: s31   s21   s11   s01

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s30   s20
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s31   s21

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d10   d00
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d30   d20
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d11   d01
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d31   d21

    MOVAPD    dqword ptr [OutMat], XMM0         //  [OutMat]:       d00   d10
    MOVAPD    dqword ptr [OutMat + 16], XMM1    //  [OutMat + 16]:  d20   d30
    MOVAPD    dqword ptr [OutMat + 32], XMM2    //  [OutMat + 32]:  d01   d11
    MOVAPD    dqword ptr [OutMat + 48], XMM3    //  [OutMat + 48]:  d21   d31

    MOVAPS    XMM0, dqword ptr [InMat + 32]     //  XMM0: s32   s22   s12   s02
    MOVAPS    XMM2, dqword ptr [InMat + 48]     //  XMM2: s33   s23   s31   s03

    MOVHLPS   XMM1, XMM0                        //  XMM1: **    **    s32   s22
    MOVHLPS   XMM3, XMM2                        //  XMM3: **    **    s33   s23

    CVTPS2PD  XMM0, XMM0                        //  XMM0: d12   d02
    CVTPS2PD  XMM1, XMM1                        //  XMM1: d32   d22
    CVTPS2PD  XMM2, XMM2                        //  XMM2: d13   d03
    CVTPS2PD  XMM3, XMM3                        //  XMM3: d33   d23

    MOVAPD    dqword ptr [OutMat + 64], XMM0    //  [OutMat + 64]:  d02   d12
    MOVAPD    dqword ptr [OutMat + 80], XMM1    //  [OutMat + 80]:  d22   d32
    MOVAPD    dqword ptr [OutMat + 96], XMM2    //  [OutMat + 96]:  d03   d13
    MOVAPD    dqword ptr [OutMat + 112], XMM3   //  [OutMat + 112]: d23   d33
end;

//==============================================================================

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix2RMd; out OutMat: TVMCLMatrix2RMs);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_2RMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_2RMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix2CMd; out OutMat: TVMCLMatrix2CMs);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_2CMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_2CMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix3RMd; out OutMat: TVMCLMatrix3RMs);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_3RMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_3RMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix3CMd; out OutMat: TVMCLMatrix3CMs);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_3CMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_3CMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix4RMd; out OutMat: TVMCLMatrix4RMs);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_4RMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_4RMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix4CMd; out OutMat: TVMCLMatrix4CMs);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_4CMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_4CMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix2RMs; out OutMat: TVMCLMatrix2RMd);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_2RMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_2RMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix2CMs; out OutMat: TVMCLMatrix2CMd);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_2CMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_2CMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix3RMs; out OutMat: TVMCLMatrix3RMd);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_3RMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_3RMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix3CMs; out OutMat: TVMCLMatrix3CMd);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_3CMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_3CMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix4RMs; out OutMat: TVMCLMatrix4RMd);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_4RMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_4RMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure PrecisionConversion_SSE(const InMat: TVMCLMatrix4CMs; out OutMat: TVMCLMatrix4CMd);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  PrecisionConversion_4CMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  PrecisionConversion_4CMd_SSEu

  @RoutineEnd:
end;

//==============================================================================

{$IFDEF ASMSuppressSizeWarnings}
  {$WARN 2087 OFF}
  {$WARN 7121 ON}
  {$WARN 7122 ON}
  {$WARN 2087 ON}
{$ENDIF}

{$ENDIF}

end.
