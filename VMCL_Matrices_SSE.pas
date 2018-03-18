unit VMCL_Matrices_SSE;

{$INCLUDE 'VMCL_defs.inc'}

interface

uses
  VMCL_Vectors, VMCL_Matrices;

{$IFNDEF PurePascal}
//try: det, inv, orthonorm

procedure MatricesMultiply_2RMs_SSEu(const aMatrix, bMatrix: TVMCLMatrix2RMs; out Product: TVMCLMatrix2RMs); register; assembler;
procedure MatricesMultiply_2RMs_SSEa(const aMatrix, bMatrix: TVMCLMatrix2RMs; out Product: TVMCLMatrix2RMs); register; assembler;
procedure MatricesMultiply_2CMs_SSEu(const aMatrix, bMatrix: TVMCLMatrix2CMs; out Product: TVMCLMatrix2CMs); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_2CMs_SSEa(const aMatrix, bMatrix: TVMCLMatrix2CMs; out Product: TVMCLMatrix2CMs); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_3RMs_SSEua(const aMatrix, bMatrix: TVMCLMatrix3RMs; out Product: TVMCLMatrix3RMs); register; assembler;
procedure MatricesMultiply_3CMs_SSEua(const aMatrix, bMatrix: TVMCLMatrix3CMs; out Product: TVMCLMatrix3CMs); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_4RMs_SSEu(const aMatrix, bMatrix: TVMCLMatrix4RMs; out Product: TVMCLMatrix4RMs); register; assembler;
procedure MatricesMultiply_4RMs_SSEa(const aMatrix, bMatrix: TVMCLMatrix4RMs; out Product: TVMCLMatrix4RMs); register; assembler;
procedure MatricesMultiply_4CMs_SSEu(const aMatrix, bMatrix: TVMCLMatrix4CMs; out Product: TVMCLMatrix4CMs); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_4CMs_SSEa(const aMatrix, bMatrix: TVMCLMatrix4CMs; out Product: TVMCLMatrix4CMs); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_2RMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix2RMd; out Product: TVMCLMatrix2RMd); register; assembler;
procedure MatricesMultiply_2RMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix2RMd; out Product: TVMCLMatrix2RMd); register; assembler;
procedure MatricesMultiply_2CMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix2CMd; out Product: TVMCLMatrix2CMd); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_2CMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix2CMd; out Product: TVMCLMatrix2CMd); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_3RMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix3RMd; out Product: TVMCLMatrix3RMd); register; assembler;
procedure MatricesMultiply_3RMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix3RMd; out Product: TVMCLMatrix3RMd); register; assembler;
procedure MatricesMultiply_3CMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix3CMd; out Product: TVMCLMatrix3CMd); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_3CMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix3CMd; out Product: TVMCLMatrix3CMd); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_4RMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix4RMd; out Product: TVMCLMatrix4RMd); register; assembler;
procedure MatricesMultiply_4RMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix4RMd; out Product: TVMCLMatrix4RMd); register; assembler;
procedure MatricesMultiply_4CMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix4CMd; out Product: TVMCLMatrix4CMd); {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_4CMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix4CMd; out Product: TVMCLMatrix4CMd); {$IFDEF CanInline} inline;{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix2RMs; out Product: TVMCLMatrix2RMs); register; assembler; overload;
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix2CMs; out Product: TVMCLMatrix2CMs); register; assembler; overload;
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix3RMs; out Product: TVMCLMatrix3RMs); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix3CMs; out Product: TVMCLMatrix3CMs); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix4RMs; out Product: TVMCLMatrix4RMs); register; assembler; overload;
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix4CMs; out Product: TVMCLMatrix4CMs); register; assembler; overload; 
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix2RMd; out Product: TVMCLMatrix2RMd); register; assembler; overload;
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix2CMd; out Product: TVMCLMatrix2CMd); register; assembler; overload;
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix3RMd; out Product: TVMCLMatrix3RMd); register; assembler; overload;
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix3CMd; out Product: TVMCLMatrix3CMd); register; assembler; overload;
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix4RMd; out Product: TVMCLMatrix4RMd); register; assembler; overload;
procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix4CMd; out Product: TVMCLMatrix4CMd); register; assembler; overload;

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

procedure MatricesMultiply_2RMs_SSEu(const aMatrix, bMatrix: TVMCLMatrix2RMs; out Product: TVMCLMatrix2RMs);
asm
    MOVUPS    XMM0, dqword ptr [aMatrix]        //  XMM0: a11   a10   a01   a00
    MOVUPS    XMM1, dqword ptr [bMatrix]        //  XMM1: b11   b10   b01   b00

  {$DEFINE MatricesMultiply_2s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_2s_Round_SSE}

    MOVUPS    dqword ptr [Product], XMM0        //  [Product]:  p00   p01   p10   p11 
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_2RMs_SSEa(const aMatrix, bMatrix: TVMCLMatrix2RMs; out Product: TVMCLMatrix2RMs);
asm
    MOVAPS    XMM0, dqword ptr [aMatrix]        //  XMM0: a11   a10   a01   a00
    MOVAPS    XMM1, dqword ptr [bMatrix]        //  XMM1: b11   b10   b01   b00

  {$DEFINE MatricesMultiply_2s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_2s_Round_SSE}

    MOVAPS    dqword ptr [Product], XMM0        //  [Product]:  p00   p01   p10   p11 
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_2CMs_SSEu(const aMatrix, bMatrix: TVMCLMatrix2CMs; out Product: TVMCLMatrix2CMs);
begin
MatricesMultiply_2RMs_SSEu(TVMCLMatrix2RMs(bMatrix),TVMCLMatrix2RMs(aMatrix),TVMCLMatrix2RMs(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_2CMs_SSEa(const aMatrix, bMatrix: TVMCLMatrix2CMs; out Product: TVMCLMatrix2CMs);
begin
MatricesMultiply_2RMs_SSEa(TVMCLMatrix2RMs(bMatrix),TVMCLMatrix2RMs(aMatrix),TVMCLMatrix2RMs(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_3RMs_SSEua(const aMatrix, bMatrix: TVMCLMatrix3RMs; out Product: TVMCLMatrix3RMs);
asm
    // align stack
  {$DEFINE AlignStack_16B_Entry}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Entry}

    // save non-volatile registers
  {$DEFINE Save_XMM6_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Save_XMM6_SSE}

    // first round                              //  XMM0: r02   r01   00    r00
                                                //  XMM1: r12   r11   00    r10
                                                //  XMM2: r22   r21   00    r20
  {$DEFINE FirstRound}
  {$DEFINE MatricesMultiply_3s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_3s_Round_SSE}
  {$UNDEF FirstRound}

    // second round                             //  XMM0: (r02 + s02) (r01 + s01) 00  (r00 + s00)
                                                //  XMM1: (r12 + s12) (r11 + s11) 00  (r10 + s10)
                                                //  XMM2: (r22 + s22) (r21 + s21) 00  (r20 + s20)
  {$DEFINE MatricesMultiply_3s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_3s_Round_SSE}

    // third, last round                        //  XMM0: (r02 + s02 + t02)(p02) (r01 + s01 + t01)(p01) 00  (r00 + s00 + t00)(p00)
                                                //  XMM1: (r12 + s12 + t12)(p12) (r11 + s11 + t11)(p11) 00  (r10 + s10 + t10)(p10)
                                                //  XMM2: (r22 + s22 + t22)(p22) (r21 + s21 + t21)(p21) 00  (r20 + s20 + t20)(p20)
  {$DEFINE MatricesMultiply_3s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_3s_Round_SSE}

    MOVSS     dword ptr [Product], XMM0         //  [Product]:        p00
    MOVHPS    qword ptr [Product + 4], XMM0     //  [Product]:        p00   p01   p02
    MOVSS     dword ptr [Product + 12], XMM1    //  [Product + 12]:   p10
    MOVHPS    qword ptr [Product + 16], XMM1    //  [Product + 12]:   p10   p11   p12
    MOVSS     dword ptr [Product + 24], XMM2    //  [Product + 24]:   p20
    MOVHPS    qword ptr [Product + 28], XMM2    //  [Product + 24]:   p20   p21   p22

    // restore non-volatile registers
  {$DEFINE Restore_XMM6_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Restore_XMM6_SSE}

    // remove stack alignment
  {$DEFINE AlignStack_16B_Leave}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Leave}
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_3CMs_SSEua(const aMatrix, bMatrix: TVMCLMatrix3CMs; out Product: TVMCLMatrix3CMs);
begin
MatricesMultiply_3RMs_SSEua(TVMCLMatrix3RMs(bMatrix),TVMCLMatrix3RMs(aMatrix),TVMCLMatrix3RMs(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_4RMs_SSEu(const aMatrix, bMatrix: TVMCLMatrix4RMs; out Product: TVMCLMatrix4RMs);
asm
    // align stack
  {$DEFINE AlignStack_16B_Entry}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Entry}

    // save non-volatile registers
  {$DEFINE Save_XMM6_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Save_XMM6_SSE}

    // first round                              //  XMM0: r03   r02   r01   r00
                                                //  XMM1: r13   r12   r11   r10
                                                //  XMM2: r23   r22   r21   r20
                                                //  XMM3: r33   r32   r31   r30
  {$DEFINE FirstRound}
  {$DEFINE MatricesMultiply_4s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4s_Round_SSE}
  {$UNDEF FirstRound}

    // second round                             //  XMM0: (r03 + s03) (r02 + s02) (r01 + s01) (r00 + s00)
                                                //  XMM1: (r13 + s13) (r12 + s12) (r11 + s12) (r10 + s10)
                                                //  XMM2: (r23 + s23) (r22 + s22) (r21 + s21) (r20 + s20)
                                                //  XMM3: (r33 + s33) (r32 + s32) (r31 + s31) (r30 + s30)
  {$DEFINE MatricesMultiply_4s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4s_Round_SSE}

    // third round                              //  XMM0: (r03 + s03 + t03) (r02 + s02 + t02) (r01 + s01 + t01) (r00 + s00 + t00)
                                                //  XMM1: (r13 + s13 + t13) (r12 + s12 + t12) (r11 + s11 + t11) (r10 + s10 + t10)
                                                //  XMM2: (r23 + s23 + t23) (r22 + s22 + t22) (r21 + s21 + t21) (r20 + s20 + t20)
                                                //  XMM3: (r33 + s33 + t33) (r32 + s32 + t32) (r31 + s31 + t31) (r30 + s30 + t30)
  {$DEFINE MatricesMultiply_4s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4s_Round_SSE}

    // fourth, last round                       //  XMM0: (r03 + s03 + t03 + u03)(p03) (r02 + s02 + t02 + u02)(p02) (r01 + s01 + t01 + u01)(p01) (r00 + s00 + t00 + u00)(p00)
                                                //  XMM1: (r13 + s13 + t13 + u13)(p13) (r12 + s12 + t12 + u12)(p12) (r11 + s11 + t11 + u11)(p11) (r10 + s10 + t10 + u10)(p10)
                                                //  XMM2: (r23 + s23 + t23 + u23)(p23) (r22 + s22 + t22 + u22)(p22) (r21 + s21 + t21 + u21)(p21) (r20 + s20 + t20 + u20)(p20)
                                                //  XMM3: (r33 + s33 + t33 + u33)(p33) (r32 + s32 + t32 + u32)(p32) (r31 + s31 + t31 + u31)(p31) (r30 + s30 + t30 + u30)(p30)
  {$DEFINE MatricesMultiply_4s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4s_Round_SSE}

    MOVUPS    dqword ptr [Product], XMM0        //  [Product + 00]: p00   p01   p02   p03
    MOVUPS    dqword ptr [Product + 16], XMM1   //  [Product + 16]: p10   p11   p12   p13
    MOVUPS    dqword ptr [Product + 32], XMM2   //  [Product + 32]: p20   p21   p22   p23
    MOVUPS    dqword ptr [Product + 48], XMM3   //  [Product + 48]: p30   p31   p32   p33

    // restore non-volatile registers
  {$DEFINE Restore_XMM6_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Restore_XMM6_SSE}

    // remove stack alignment
  {$DEFINE AlignStack_16B_Leave}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Leave}
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_4RMs_SSEa(const aMatrix, bMatrix: TVMCLMatrix4RMs; out Product: TVMCLMatrix4RMs);
asm
{$DEFINE AlignedMemoryAccess}

    // align stack
  {$DEFINE AlignStack_16B_Entry}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Entry}
  
    // save non-volatile registers
  {$DEFINE Save_XMM6_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Save_XMM6_SSE}

    // first round                              //  XMM0: r03   r02   r01   r00
                                                //  XMM1: r13   r12   r11   r10
                                                //  XMM2: r23   r22   r21   r20
                                                //  XMM3: r33   r32   r31   r30
  {$DEFINE FirstRound}
  {$DEFINE MatricesMultiply_4s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4s_Round_SSE}
  {$UNDEF FirstRound}

    // second round                             //  XMM0: (r03 + s03) (r02 + s02) (r01 + s01) (r00 + s00)
                                                //  XMM1: (r13 + s13) (r12 + s12) (r11 + s12) (r10 + s10)
                                                //  XMM2: (r23 + s23) (r22 + s22) (r21 + s21) (r20 + s20)
                                                //  XMM3: (r33 + s33) (r32 + s32) (r31 + s31) (r30 + s30)
  {$DEFINE MatricesMultiply_4s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4s_Round_SSE}

    // third round                              //  XMM0: (r03 + s03 + t03) (r02 + s02 + t02) (r01 + s01 + t01) (r00 + s00 + t00)
                                                //  XMM1: (r13 + s13 + t13) (r12 + s12 + t12) (r11 + s11 + t11) (r10 + s10 + t10)
                                                //  XMM2: (r23 + s23 + t23) (r22 + s22 + t22) (r21 + s21 + t21) (r20 + s20 + t20)
                                                //  XMM3: (r33 + s33 + t33) (r32 + s32 + t32) (r31 + s31 + t31) (r30 + s30 + t30)
  {$DEFINE MatricesMultiply_4s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4s_Round_SSE}

    // fourth, last round                       //  XMM0: (r03 + s03 + t03 + u03)(p03) (r02 + s02 + t02 + u02)(p02) (r01 + s01 + t01 + u01)(p01) (r00 + s00 + t00 + u00)(p00)
                                                //  XMM1: (r13 + s13 + t13 + u13)(p13) (r12 + s12 + t12 + u12)(p12) (r11 + s11 + t11 + u11)(p11) (r10 + s10 + t10 + u10)(p10)
                                                //  XMM2: (r23 + s23 + t23 + u23)(p23) (r22 + s22 + t22 + u22)(p22) (r21 + s21 + t21 + u21)(p21) (r20 + s20 + t20 + u20)(p20)
                                                //  XMM3: (r33 + s33 + t33 + u33)(p33) (r32 + s32 + t32 + u32)(p32) (r31 + s31 + t31 + u31)(p31) (r30 + s30 + t30 + u30)(p30)
  {$DEFINE MatricesMultiply_4s_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4s_Round_SSE}

    MOVAPS    dqword ptr [Product], XMM0        //  [Product + 00]: p00   p01   p02   p03
    MOVAPS    dqword ptr [Product + 16], XMM1   //  [Product + 16]: p10   p11   p12   p13
    MOVAPS    dqword ptr [Product + 32], XMM2   //  [Product + 32]: p20   p21   p22   p23
    MOVAPS    dqword ptr [Product + 48], XMM3   //  [Product + 48]: p30   p31   p32   p33

    // restore non-volatile registers
  {$DEFINE Restore_XMM6_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Restore_XMM6_SSE}

    // remove stack alignment
  {$DEFINE AlignStack_16B_Leave}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Leave}

{$UNDEF AlignedMemoryAccess}
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_4CMs_SSEu(const aMatrix, bMatrix: TVMCLMatrix4CMs; out Product: TVMCLMatrix4CMs);
begin
MatricesMultiply_4RMs_SSEu(TVMCLMatrix4RMs(bMatrix),TVMCLMatrix4RMs(aMatrix),TVMCLMatrix4RMs(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_4CMs_SSEa(const aMatrix, bMatrix: TVMCLMatrix4CMs; out Product: TVMCLMatrix4CMs);
begin
MatricesMultiply_4RMs_SSEa(TVMCLMatrix4RMs(bMatrix),TVMCLMatrix4RMs(aMatrix),TVMCLMatrix4RMs(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_2RMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix2RMd; out Product: TVMCLMatrix2RMd);
asm
    // first round                              //  XMM0: r01   r00
                                                //  XMM1: r11   r10
  {$DEFINE FirstRound}
  {$DEFINE MatricesMultiply_2d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_2d_Round_SSE}
  {$UNDEF FirstRound}

    // second, last round                       //  XMM0: (r01 + s01)(p01) (r00 + s00)(p00)
                                                //  XMM1: (r11 + s11)(p11) (r10 + s10)(p10)
  {$DEFINE MatricesMultiply_2d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_2d_Round_SSE}

    MOVUPD    dqword ptr [Product], XMM0        //  [Product]:      p00   p01
    MOVUPD    dqword ptr [Product + 16], XMM1   //  [Product + 16]: p10   p11
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_2RMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix2RMd; out Product: TVMCLMatrix2RMd);
asm
{$DEFINE AlignedMemoryAccess}

    // first round                              //  XMM0: r01   r00
                                                //  XMM1: r11   r10
  {$DEFINE FirstRound}
  {$DEFINE MatricesMultiply_2d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_2d_Round_SSE}
  {$UNDEF FirstRound}

    // second, last round                       //  XMM0: (r01 + s01)(p01) (r00 + s00)(p00)
                                                //  XMM1: (r11 + s11)(p11) (r10 + s10)(p10)
  {$DEFINE MatricesMultiply_2d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_2d_Round_SSE}

    MOVAPD    dqword ptr [Product], XMM0        //  [Product]:      p00   p01
    MOVAPD    dqword ptr [Product + 16], XMM1   //  [Product + 16]: p10   p11

{$UNDEF AlignedMemoryAccess}
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_2CMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix2CMd; out Product: TVMCLMatrix2CMd);
begin
MatricesMultiply_2RMd_SSEu(TVMCLMatrix2RMd(bMatrix),TVMCLMatrix2RMd(aMatrix),TVMCLMatrix2RMd(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_2CMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix2CMd; out Product: TVMCLMatrix2CMd);
begin
MatricesMultiply_2RMd_SSEa(TVMCLMatrix2RMd(bMatrix),TVMCLMatrix2RMd(aMatrix),TVMCLMatrix2RMd(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_3RMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix3RMd; out Product: TVMCLMatrix3RMd);
asm
    // align stack
  {$DEFINE AlignStack_16B_Entry}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Entry}

    // save non-volatile registers
  {$DEFINE Save_XMM6_to_XMM9_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Save_XMM6_to_XMM9_SSE}

  {$IFDEF x86}
    SUB       ESP, 32   // allocate temporary storage on stack
  {$ENDIF}  

    // calculation rounds
  {$DEFINE FirstRound}
  {$DEFINE MatricesMultiply_3d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_3d_Round_SSE}
  {$UNDEF FirstRound}

  {$DEFINE MatricesMultiply_3d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_3d_Round_SSE}

  {$DEFINE LastRound}
  {$DEFINE MatricesMultiply_3d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_3d_Round_SSE}
  {$UNDEF LastRound}

    MOVUPD    dqword ptr [Product], XMM4        //  [Product]:      p00   p01
    MOVSD     qword ptr [Product + 16], XMM5    //  [Product]:      p00   p01   p02
    MOVUPD    dqword ptr [Product + 24], XMM6   //  [Product + 24]: p10   p11
    MOVSD     qword ptr [Product + 40], XMM7    //  [Product + 24]: p10   p11   p12
  {$IFDEF x64}
    MOVUPD    dqword ptr [Product + 48], XMM8   //  [Product + 48]: p20   p21
    MOVSD     qword ptr [Product + 64], XMM9    //  [Product + 48]: p20   p21   p22
  {$ELSE}
    MOVUPD    dqword ptr [Product + 48], XMM2   //  [Product + 48]: p20   p21
    MOVSD     qword ptr [Product + 64], XMM3    //  [Product + 48]: p20   p21   p22

    ADD       ESP, 32   // free temporary storage on stack
  {$ENDIF}

    // restore non-volatile registers
  {$DEFINE Restore_XMM6_to_XMM9_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Restore_XMM6_to_XMM9_SSE}

    // remove stack alignment
  {$DEFINE AlignStack_16B_Leave}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Leave}
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_3RMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix3RMd; out Product: TVMCLMatrix3RMd);
asm
{$DEFINE AlignedMemoryAccess}

    // align stack
  {$DEFINE AlignStack_16B_Entry}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Entry}

    // save non-volatile registers
  {$DEFINE Save_XMM6_to_XMM9_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Save_XMM6_to_XMM9_SSE}

  {$IFDEF x86}
    SUB       ESP, 32   // allocate temporary storage on stack
  {$ENDIF}

    // calculation rounds
  {$DEFINE FirstRound}
  {$DEFINE MatricesMultiply_3d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_3d_Round_SSE}
  {$UNDEF FirstRound}

  {$UNDEF AlignedMemoryAccess}
  {$DEFINE MatricesMultiply_3d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_3d_Round_SSE}
  {$DEFINE AlignedMemoryAccess}

  {$DEFINE LastRound}
  {$DEFINE MatricesMultiply_3d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_3d_Round_SSE}
  {$UNDEF LastRound}

    MOVAPD    dqword ptr [Product], XMM4        //  [Product]:      p00   p01
    MOVSD     qword ptr [Product + 16], XMM5    //  [Product]:      p00   p01   p02
    MOVUPD    dqword ptr [Product + 24], XMM6   //  [Product + 24]: p10   p11
    MOVSD     qword ptr [Product + 40], XMM7    //  [Product + 24]: p10   p11   p12
  {$IFDEF x64}
    MOVAPD    dqword ptr [Product + 48], XMM8   //  [Product + 48]: p20   p21
    MOVSD     qword ptr [Product + 64], XMM9    //  [Product + 48]: p20   p21   p22
  {$ELSE}
    MOVAPD    dqword ptr [Product + 48], XMM2   //  [Product + 48]: p20   p21
    MOVSD     qword ptr [Product + 64], XMM3    //  [Product + 48]: p20   p21   p22

    ADD       ESP, 32   // free temporary storage on stack
  {$ENDIF}

    // restore non-volatile registers
  {$DEFINE Restore_XMM6_to_XMM9_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Restore_XMM6_to_XMM9_SSE}

    // remove stack alignment
  {$DEFINE AlignStack_16B_Leave}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Leave}

{$UNDEF AlignedMemoryAccess}
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_3CMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix3CMd; out Product: TVMCLMatrix3CMd);
begin
MatricesMultiply_3RMd_SSEu(TVMCLMatrix3RMd(bMatrix),TVMCLMatrix3RMd(aMatrix),TVMCLMatrix3RMd(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_3CMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix3CMd; out Product: TVMCLMatrix3CMd);
begin
MatricesMultiply_3RMd_SSEa(TVMCLMatrix3RMd(bMatrix),TVMCLMatrix3RMd(aMatrix),TVMCLMatrix3RMd(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_4RMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix4RMd; out Product: TVMCLMatrix4RMd);
asm
    // align stack
  {$DEFINE AlignStack_16B_Entry}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Entry}

    // save non-volatile registers
  {$DEFINE Save_XMM6_to_XMM13_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Save_XMM6_to_XMM13_SSE}

  {$IFDEF x86}
    MOVUPD    XMM7, dqword ptr [bMatrix + 96]   //  XMM7: b31   b30
    MOVUPD    XMM6, dqword ptr [bMatrix + 64]   //  XMM6: b21   b20
    MOVUPD    XMM4, dqword ptr [bMatrix]        //  XMM4: b01   b00
    MOVUPD    XMM5, dqword ptr [bMatrix + 32]   //  XMM5: b11   b10
  {$ENDIF}

    // calculation rounds
  {$DEFINE FirstRound}{$DEFINE OddRound}
  {$DEFINE MatricesMultiply_4d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4d_Round_SSE}
  {$UNDEF OddRound}{$UNDEF FirstRound}

  {$DEFINE MatricesMultiply_4d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4d_Round_SSE}

  {$DEFINE OddRound}
  {$DEFINE MatricesMultiply_4d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4d_Round_SSE}
  {$UNDEF OddRound}

  {$DEFINE LastRound}
  {$DEFINE MatricesMultiply_4d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4d_Round_SSE}
  {$UNDEF LastRound}

  {$IFDEF x64}
    MOVUPD    dqword ptr [Product], XMM6
    MOVUPD    dqword ptr [Product + 16], XMM7
    MOVUPD    dqword ptr [Product + 32], XMM8
    MOVUPD    dqword ptr [Product + 48], XMM9
    MOVUPD    dqword ptr [Product + 64], XMM10
    MOVUPD    dqword ptr [Product + 80], XMM11
    MOVUPD    dqword ptr [Product + 96], XMM12
    MOVUPD    dqword ptr [Product + 112], XMM13
  {$ENDIF}

    // restore non-volatile registers
  {$DEFINE Restore_XMM6_to_XMM13_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Restore_XMM6_to_XMM13_SSE}

    // remove stack alignment
  {$DEFINE AlignStack_16B_Leave}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Leave}
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_4RMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix4RMd; out Product: TVMCLMatrix4RMd);
asm
{$DEFINE AlignedMemoryAccess}

    // align stack
  {$DEFINE AlignStack_16B_Entry}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Entry}

    // save non-volatile registers
  {$DEFINE Save_XMM6_to_XMM13_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Save_XMM6_to_XMM13_SSE}

  {$IFDEF x86}
    MOVAPD    XMM7, dqword ptr [bMatrix + 96]   //  XMM7: b31   b30
    MOVAPD    XMM6, dqword ptr [bMatrix + 64]   //  XMM6: b21   b20
    MOVAPD    XMM4, dqword ptr [bMatrix]        //  XMM4: b01   b00
    MOVAPD    XMM5, dqword ptr [bMatrix + 32]   //  XMM5: b11   b10
  {$ENDIF}

    // calculation rounds
  {$DEFINE FirstRound}{$DEFINE OddRound}
  {$DEFINE MatricesMultiply_4d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4d_Round_SSE}
  {$UNDEF OddRound}{$UNDEF FirstRound}

  {$DEFINE MatricesMultiply_4d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4d_Round_SSE}

  {$DEFINE OddRound}
  {$DEFINE MatricesMultiply_4d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4d_Round_SSE}
  {$UNDEF OddRound}

  {$DEFINE LastRound}
  {$DEFINE MatricesMultiply_4d_Round_SSE}{$INCLUDE 'VMCL_Matrices_ASM.inc'}{$UNDEF MatricesMultiply_4d_Round_SSE}
  {$UNDEF LastRound}

  {$IFDEF x64}
    MOVAPD    dqword ptr [Product], XMM6
    MOVAPD    dqword ptr [Product + 16], XMM7
    MOVAPD    dqword ptr [Product + 32], XMM8
    MOVAPD    dqword ptr [Product + 48], XMM9
    MOVAPD    dqword ptr [Product + 64], XMM10
    MOVAPD    dqword ptr [Product + 80], XMM11
    MOVAPD    dqword ptr [Product + 96], XMM12
    MOVAPD    dqword ptr [Product + 112], XMM13
  {$ENDIF}

    // restore non-volatile registers
  {$DEFINE Restore_XMM6_to_XMM13_SSE}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF Restore_XMM6_to_XMM13_SSE}

    // remove stack alignment
  {$DEFINE AlignStack_16B_Leave}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF AlignStack_16B_Leave}

{$UNDEF AlignedMemoryAccess}
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_4CMd_SSEu(const aMatrix, bMatrix: TVMCLMatrix4CMd; out Product: TVMCLMatrix4CMd);
begin
MatricesMultiply_4RMd_SSEu(TVMCLMatrix4RMd(bMatrix),TVMCLMatrix4RMd(aMatrix),TVMCLMatrix4RMd(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_4CMd_SSEa(const aMatrix, bMatrix: TVMCLMatrix4CMd; out Product: TVMCLMatrix4CMd);
begin
MatricesMultiply_4RMd_SSEa(TVMCLMatrix4RMd(bMatrix),TVMCLMatrix4RMd(aMatrix),TVMCLMatrix4RMd(Product));
end;

//==============================================================================

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix2RMs; out Product: TVMCLMatrix2RMs);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_2RMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_2RMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix2CMs; out Product: TVMCLMatrix2CMs);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

  {
    When the input matrices are switched, then the calculations can be exactly
    the same as for row-major matrices.
  }
    XCHG  aMatrix, bMatrix

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_2RMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_2RMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix3RMs; out Product: TVMCLMatrix3RMs);
begin
// aligned and unaligned code is the same
MatricesMultiply_3RMs_SSEua(aMatrix,bMatrix,Product);
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix3CMs; out Product: TVMCLMatrix3CMs);
begin
// aligned and unaligned code is the same
MatricesMultiply_3RMs_SSEua(TVMCLMatrix3RMs(bMatrix),TVMCLMatrix3RMs(aMatrix),TVMCLMatrix3RMs(Product));
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix4RMs; out Product: TVMCLMatrix4RMs);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_4RMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_4RMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix4CMs; out Product: TVMCLMatrix4CMs);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

    XCHG  aMatrix, bMatrix

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_4RMs_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_4RMs_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix2RMd; out Product: TVMCLMatrix2RMd);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_2RMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_2RMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix2CMd; out Product: TVMCLMatrix2CMd);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

    XCHG  aMatrix, bMatrix

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_2RMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_2RMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix3RMd; out Product: TVMCLMatrix3RMd);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_3RMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_3RMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix3CMd; out Product: TVMCLMatrix3CMd);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

    XCHG  aMatrix, bMatrix

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_3RMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_3RMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix4RMd; out Product: TVMCLMatrix4RMd);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_4RMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_4RMd_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure MatricesMultiply_SSE(const aMatrix, bMatrix: TVMCLMatrix4CMd; out Product: TVMCLMatrix4CMd);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_ASM.inc'}{$UNDEF CheckMemAlign16_3}

    XCHG  aMatrix, bMatrix

    JNZ   @Unaligned

  @Aligned:
    CALL  MatricesMultiply_4RMd_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  MatricesMultiply_4RMd_SSEu

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
