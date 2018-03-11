{.$DEFINE CrossProduct_4s_SSE}
{.$DEFINE CrossProduct_4d_SSE}

{.$DEFINE DotProduct_4s3_SSE}
{.$DEFINE DotProduct_4d3_SSE}

{.$DEFINE Magnitude_4s_r2_SSE}
{.$DEFINE Magnitude_4d_r4_SSE}

{.$DEFINE Normalize_4s3_SSE}
{.$DEFINE Normalize_4d3_SSE}

{.$DEFINE Negate_4s_SSE}
{.$DEFINE Negate_4d_SSE}

{.$DEFINE ArcCosRad_1_x87}
{.$DEFINE ArcCosDeg_1_x87}

{.$DEFINE VectorsProjection_2s_SSE}
{.$DEFINE VectorsProjection_4s_SSE}
{.$DEFINE VectorsProjection_2d_SSE}
{.$DEFINE VectorsProjection_3d_SSE}
{.$DEFINE VectorsProjection_4d_SSE}

{===============================================================================
                                  Cross product
===============================================================================}

{-------------------------------------------------------------------------------

  CrossProduct_4s_SSE

  Computes cross product of two single-precision 4-dimensional vectors.

  Input:

    XMM0: a3  a2  a1  a0  - first vector (4 single)
    XMM1: b3  b3  b1  b0  - second vector (4 single)

  Output:

    Resulting vector is returned in XMM0 register.
    Highest returned component (R3) is always 0.

    XMM0: R3  R2  R1  R0

  Scratch registers:

    XMM1, XMM2, XMM3

-------------------------------------------------------------------------------}
{$IFDEF CrossProduct_4s_SSE}
    MOVAPS  XMM2, XMM0                  //  XMM2: a3  a2  a1  a0
    MOVAPS  XMM3, XMM1                  //  XMM3: b3  b2  b1  b0

    SHUFPS  XMM0, XMM0, $C9 {11001001}  //  XMM0: a3    a0    a2    a1
    SHUFPS  XMM1, XMM1, $D2 {11010010}  //  XMM1: b3    b1    b0    b2
    MULPS   XMM0, XMM1                  //  XMM0: a3b3  a0b1  a2b0  a1b2

    SHUFPS  XMM2, XMM2, $D2 {11010010}  //  XMM2: a3    a1    a0    a2
    SHUFPS  XMM3, XMM3, $C9 {11001001}  //  XMM3: b3    b0    b2    b1
    MULPS   XMM2, XMM3                  //  XMM2: a3b3  a1b0  a0b2  a2b1

    SUBPS   XMM0, XMM2                  //  XMM0: (a3b3 - a3b3) (a0b1 - a1b0) (a2b0 - a0b2) (a1b2 - a2b1)
                                        //  XMM0:    R3 = 0           R2            R1            R0
{$ENDIF}

{-------------------------------------------------------------------------------

  CrossProduct_4d_SSE

  Computes cross product of two double-precision 4-dimensional vectors.

  Input:

    XMM0: a1  a0  - lower 128 bits of first vector (2 double)
    XMM1: a3  a2  - higher 128 bits of first vector (2 double)
    XMM2: b1  b0  - lower 128 bits of second vector (2 double)
    XMM3: b3  b2  - higher 128 bits of second vector (2 double)

  Output:

    Resulting vector is returned in registers XMM0 and XMM1.
    Highest returned component (R3) is always 0.

    XMM0: R1  R0
    XMM1: R3  R2

  Scratch registers:

    XMM2, XMM3, XMM4, XMM5

-------------------------------------------------------------------------------}

{$IFDEF CrossProduct_4d_SSE}
    MOVAPD    XMM4, XMM0            //  XMM4: a1  a0
    SHUFPD    XMM4, XMM1, $1 {01}   //  XMM4: a2  a1
    MOVAPD    XMM5, XMM1            //  XMM5: a3  a2
    MOVSD     XMM5, XMM0            //  XMM5: a3  a0

    MULPD     XMM4, XMM2            //  XMM4: a2b1  a1b0
    MULPD     XMM5, XMM3            //  XMM5: a3b3  a0b2

    MULPD     XMM1, XMM2            //  XMM1:  **   a2b0
    SHUFPD    XMM2, XMM3, $1 {01}   //  XMM2:  b2    b1
    MULPD     XMM0, XMM2            //  XMM0: a1b2  a0b1
    SHUFPD    XMM1, XMM5, $2 {10}   //  XMM1: a3b3  a2b0

    SUBPD     XMM0, XMM4            //  XMM0: (a1b2 - a2b1) (a0b1 - a1b0)
    SUBPD     XMM1, XMM5            //  XMM1: (a3b3 - a3b3) (a2b0 - a0b2)
    MOVAPD    XMM2, XMM0            //  XMM2: (a1b2 - a2b1) (a0b1 - a1b0)

    SHUFPD    XMM0, XMM1, $1 {01}   //  XMM0: (a2b0 - a0b2) (a1b2 - a2b1)
    MOVSD     XMM1, XMM2            //  XMM1: (a3b3 - a3b3) (a0b1 - a1b0)
                                    //  XMM0:       R1            R0
                                    //  XMM1:     R3 = 0          R2
{$ENDIF}

{===============================================================================
                                   Dot product
===============================================================================}

{-------------------------------------------------------------------------------

  DotProduct_4s3_SSE

  Computes dot product of two single-precision 3-dimensional vectors.

  Input:

    Highest single of at least one input vector must be 0.

    XMM0: 00  a2  a1  a0  - first vector (3 single)
    XMM1: 00  b3  b1  b0  - second vector (3 single)

  Output:

    Resulting product (scalar) is returned in lowest single of XMM0 register.

    XMM0: **  **  **  DP

  Scratch registers:

    None - value of register XMM1 is preserved

-------------------------------------------------------------------------------}

{$IFDEF DotProduct_4s3_SSE}
    MULPS     XMM0, XMM1    //  XMM0: 00  a2b2  a1b1  a0b0
  {$IFDEF ASMDirectOPCodes}
    DB  $F2, $0F, $7C, $C0  //  HADDPS XMM0, XMM0
    DB  $F2, $0F, $7C, $C0  //  HADDPS XMM0, XMM0
  {$ELSE}
    HADDPS    XMM0, XMM0    //  XMM0: **   **   a2b2  (a0b0 + a1b1)
    HADDPS    XMM0, XMM0    //  XMM0: **   **    **   (a0b0 + a1b1 + a2b2)
  {$ENDIF}
                            //  XMM0: **   **    **    R
{$ENDIF}

{-------------------------------------------------------------------------------

  DotProduct_4d3_SSE

  Computes dot product of two double-precision 3-dimensional vectors.

  Input:

    Highest double of at least one input vector must be 0.

    XMM0: a1  a0  - lower 128 bits of first vector (2 double)
    XMM1: 00  a2  - highest double of first vector
    XMM2: b1  b0  - lower 128 bits of second vector (2 double)
    XMM3: 00  b2  - highest double of second vector

  Output:

    Resulting product (scalar) is returned in lowest double of XMM0 register.

    XMM0: **  DP

  Scratch registers:

    XMM1 - values in registers XMM2 and XMM3 are preserved

-------------------------------------------------------------------------------}

{$IFDEF DotProduct_4d3_SSE}
    MULPD     XMM0, XMM2    //  XMM0: a1b1  a0b0
    MULPD     XMM1, XMM3    //  XMM1:  00   a2b2
  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $C0  //  HADDPD XMM0, XMM0
  {$ELSE}
    HADDPD    XMM0, XMM0    //  XMM0:  **   (a0b0 + a1b1)
  {$ENDIF}
    ADDSD     XMM0, XMM1    //  XMM0:  **   (a0b0 + a1b1 + a2b2)
                            //  XMM0:  **    R
{$ENDIF}

{===============================================================================
                                Vector magnitude
===============================================================================}

{-------------------------------------------------------------------------------

  Magnitude_4s_r2_SSE

  Computes magnitude (length) of one single-precision 4-dimensional vector.

  Input:

    XMM2: a3  a2  a1  a0  - input vector (4 single)

  Output:

    Result is returned in all four singles of XMM2 register.

    XMM2: M   M   M   M

-------------------------------------------------------------------------------}

{$IFDEF Magnitude_4s_r2_SSE}
    MULPS   XMM2, XMM2      //  XMM2: a3a3  a2a2  a1a1  a0a0
  {$IFDEF ASMDirectOPCodes}
    DB  $F2, $0F, $7C, $D2  //  HADDPS XMM2, XMM2
    DB  $F2, $0F, $7C, $D2  //  HADDPS XMM2, XMM2
  {$ELSE}
    HADDPS  XMM2, XMM2      //  XMM2:  --    --   (a3a3 + a2a2) (a1a1 + a0a0)
    HADDPS  XMM2, XMM2      //  XMM2:  --    --    --   (a3a3 + a2a2 + a1a1 + a0a0)
  {$ENDIF}
    SQRTPS  XMM2, XMM2      //  XMM2:  --    --    --   SQRT(a3a3 + a2a2 + a1a1 + a0a0)(M)
                            //  XMM2:   M     M     M     M
{$ENDIF}

{-------------------------------------------------------------------------------

  Magnitude_4d_r4_SSE

  Computes magnitude (length) of one double-precision 4-dimensional vector.

  Input:

    XMM4: a1  a0  - lower 128 bits of input vector (2 double)
    XMM5: a3  a2  - higher 128 biths of input vector (2 double)

  Output:

    Result is returned in both doubles of XMM4 register.

    XMM4: M   M

  Scratch registers:

    XMM5

-------------------------------------------------------------------------------}

{$IFDEF Magnitude_4d_r4_SSE}
    MULPD   XMM4, XMM4      //  XMM4: a1a1  a0a0
    MULPD   XMM5, XMM5      //  XMM5: a3a3  a2a2
  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $E5  //  HADDPD XMM4, XMM5
    DB  $66, $0F, $7C, $E4  //  HADDPD XMM4, XMM4
  {$ELSE}
    HADDPD  XMM4, XMM5      //  XMM4: (a3a3 + a2a2) (a1a1 + a0a0)
    HADDPD  XMM4, XMM4      //  XMM4:  --   (a3a3 + a2a2 + a1a1 + a0a0)
  {$ENDIF}
    SQRTPD  XMM4, XMM4      //  XMM4:  --   SQRT(a3a3 + a2a2 + a1a1 + a0a0)(M)
                            //  XMM4:   M     M
{$ENDIF}

{===============================================================================
                                  Normalization
===============================================================================}

{-------------------------------------------------------------------------------

  Normalize_4s3_SSE

  Normalizes one single-precision 3-dimensional vector.

  Input:

    Highest single of input register must be 0.

    XMM0: 00  a2  a1  a0  - vector to be normalized (3 single)

  Output:

    Normalized vector is returned in XMM0 register.
    Highest returned component (R3) is always 0.

    XMM0: R3  R2  R1  R0

  Scratch registers:

    XMM1, XMM2

-------------------------------------------------------------------------------}
{$IFDEF Normalize_4s3_SSE}
    MOVAPS  XMM1, XMM0      //  XMM1:  00    a2    a1    a0
    MULPS   XMM1, XMM1      //  XMM1:  00   a2a2  a1a1  a0a0

  {$IFDEF ASMDirectOPCodes}
    DB  $F2, $0F, $7C, $C9  //  HADDPS XMM1, XMM1
    DB  $F2, $0F, $7C, $C9  //  HADDPS XMM1, XMM1
  {$ELSE}
    HADDPS  XMM1, XMM1      //  XMM1:  **    **   a2a2  (a1a1 + a0a0)
    HADDPS  XMM1, XMM1      //  XMM1:  --    --    --   (a2a2 + a1a1 + a0a0)
  {$ENDIF}
    // at this point, all components in XMM1 are the same
    SQRTPS  XMM1, XMM1      //  XMM1:  --    --    --   SQRT(a2a2 + a1a1 + a0a0)(M)
                            //  XMM1:   M     M     M     M

    // check for zero-magnitude vector
    XORPS   XMM2, XMM2      //  XMM2: 00  00  00  00
    COMISS  XMM1, XMM2
    JNE     @iDivision

    // magnitude is zero, set result to zero vector
    XORPS   XMM0, XMM0
    JMP     @iRoutineEnd

  @iDivision:
    DIVPS   XMM0, XMM1      //  XMM0:   00    a2/M    a1/M    a0/M

  @iRoutineEnd:
                            //  XMM0: R3 = 0   R2      R1       R0
{$ENDIF}

{-------------------------------------------------------------------------------

  Normalize_4d3_SSE

  Normalizes one double-precision 3-dimensional vector.

  Input:

    Highest double of second input register must be 0.

    XMM0: a1  a0  - lower 128 bits of input vector (2 double)
    XMM1: 00  a2  - highest double of input vector

  Output:

    Normalized vector is returned in XMM0 and XMM1 registers.
    Highest returned component (R3) is always 0.

    XMM0: R1  R0
    XMM1: R3  R2

  Scratch registers:

    XMM2, XMM3

-------------------------------------------------------------------------------}

{$IFDEF Normalize_4d3_SSE}
    MOVAPD  XMM2, XMM0      //  XMM2: a1  a0
    MOVAPD  XMM3, XMM1      //  XMM3: 00  a2

    MULPD   XMM2, XMM2      //  XMM2: a1a1  a0a0
    MULPD   XMM3, XMM3      //  XMM3:  00   a2a2

  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $D3  //  HADDPD XMM2, XMM3
    DB  $66, $0F, $7C, $D2  //  HADDPD XMM2, XMM2
  {$ELSE}
    HADDPD  XMM2, XMM3      //  XMM2: a2a2  (a1a1 + a0a0)
    HADDPD  XMM2, XMM2      //  XMM2:  --   (a2a2 + a1a1 + a0a0)
  {$ENDIF}
    // at this point, all components in XMM2 are the same
    SQRTPD  XMM2, XMM2      //  XMM2:  --   SQRT(a2a2 + a1a1 + a0a0)(M)
                            //  XMM2:  M     M

    // check for zero-magnitude vector
    XORPD   XMM3, XMM3       //  XMM3: 00  00
    COMISD  XMM2, XMM3
    JNE     @iDivision

    // magnitude is zero, set result to zero vector
    XORPD   XMM0, XMM0
    XORPD   XMM1, XMM1
    JMP     @iRoutineEnd

  @iDivision:
    DIVPD   XMM0, XMM2      //  XMM0:   a1/M    a0/M
    DIVPD   XMM1, XMM2      //  XMM1:    00     a2/M

  @iRoutineEnd:
                            //  XMM0:    R1      R0
                            //  XMM1:  R3 = 0    R2
{$ENDIF}

{===============================================================================
                                    Negation
===============================================================================}

{-------------------------------------------------------------------------------

  Negate_4s_SSE

  Negates (flip sign of all components) one single-precision 4-dimensional
  vector.

  Input:

    XMM0: a3  a2  a1  a0  - vector to be negated (4 single)

  Output:

    Negated vector is returned in register XMM0.

    XMM0: R3  R2  R1  R0

  Scratch registers:

    XMM1

-------------------------------------------------------------------------------}

{$IFDEF Negate_4s_SSE}
    PCMPEQD XMM1, XMM1      //  all bits of register XMM1 are set
    PSLLD   XMM1, 31        //  all DWORDS of XMM1 are set to $80000000
    XORPS   XMM0, XMM1      //  XMM0:  -a3   -a2   -a1   -a0
                            //  XMM0:   R3    R2    R1    R0
{$ENDIF}

{-------------------------------------------------------------------------------

  Negate_4d_SSE

  Negates (flip sign of all components) one double-precision 4-dimensional
  vector.

  Input:

    XMM0: a1  a0  - lower 128 bits of input vector (2 double)
    XMM1: a3  a2  - higher 128 bits of input vector (2 double)

  Output:

    Negated vector is returned in registers XMM0 and XMM1.

    XMM0: R1  R0
    XMM1: R3  R2

  Scratch registers:

    XMM2

-------------------------------------------------------------------------------}

{$IFDEF Negate_4d_SSE}
    PCMPEQD XMM2, XMM2      //  all bits of register XMM2 are set
    PSLLQ   XMM2, 63        //  all QWORDS of XMM2 are set to $8000000000000000
    XORPD   XMM0, XMM2      //  XMM0:  -a1   -a0
    XORPD   XMM1, XMM2      //  XMM1:  -a3   -a2
                            //  XMM0:   R1    R0
                            //  XMM1:   R3    R2
{$ENDIF}

{===============================================================================
                                   Goniometry
===============================================================================}

{-------------------------------------------------------------------------------

  ArcCosRad_1_x87

  Calculates arccosine of an input value passed on FPU stack.

  Input:

    ST0: param

  Output:

    Resulting angle is returned on top of FPU stack, and is in radians.

    ST0: ArcCos(param)[Rad]

  Scratch registers:

    Up-to three positions on FPU stack are used during calculation.  

-------------------------------------------------------------------------------}

{$IFDEF ArcCosRad_1_x87}
    // clip value to <-1,1>
    FLD1                    //  ST0: 1.0      ST1:  param
    FCOMI   ST(0), ST(1)
    JB      @ClipParam
    FCHS                    //  ST0: -1.0     ST1:  param
    FCOMI   ST(0), ST(1)
    JA      @ClipParam
    JMP     @Calculation

  @ClipParam:
    FXCH                    //  ST0: **       ST1:  +/-1.0

    // ArcCos calculation
  @Calculation:
    FSTP    ST(0)           //  ST0:  param
    FLD     ST(0)           //  ST0:  param                     ST1:  param
    FMUL    ST(0), ST(0)    //  ST0:  (param * param)           ST1:  param
    FLD1                    //  ST0:  1.0                       ST1:  (param * param)             ST2:  param
    FSUBRP  ST(1), ST(0)    //  ST0:  1 - (param * param)       ST1:  param
    FSQRT                   //  ST0   SQRT(1 - p^2)             ST1:  param
    FXCH                    //  ST0:  param                     ST1:  SQRT(ABS(1 - p^2))
    FPATAN                  //  ST0:  PATAN(ST1 / ST0)
{$ENDIF}

{-------------------------------------------------------------------------------

  ArcCosDeg_1_x87

  Calculates arccosine of an input value passed on FPU stack.

  Input:

    ST0: param

  Output:

    Resulting angle is returned on top of FPU stack, and is in degrees.

    ST0: ArcCos(param)[Deg]

  Scratch registers:

    Up-to three positions on FPU stack are used during calculation.    

-------------------------------------------------------------------------------}

{$IFDEF ArcCosDeg_1_x87}
    // clip value to <-1,1>
    FLD1                    //  ST0: 1.0      ST1:  param
    FCOMI   ST(0), ST(1)
    JB      @ClipParam
    FCHS                    //  ST0: -1.0     ST1:  param
    FCOMI   ST(0), ST(1)
    JA      @ClipParam
    JMP     @Calculation

  @ClipParam:
    FXCH                    //  ST0: **       ST1:  +/-1.0

    // ArcCos calculation
  @Calculation:
    FSTP    ST(0)           //  ST0:  param
    FLD     ST(0)           //  ST0:  param                     ST1:  param
    FMUL    ST(0), ST(0)    //  ST0:  (param * param)           ST1:  param
    FLD1                    //  ST0:  1.0                       ST1:  (param * param)             ST2:  param
    FSUBRP  ST(1), ST(0)    //  ST0:  1 - (param * param)       ST1:  param
    FSQRT                   //  ST0   SQRT(1 - p^2)             ST1:  param
    FXCH                    //  ST0:  param                     ST1:  SQRT(ABS(1 - p^2))
    FPATAN                  //  ST0:  PATAN(ST1 / ST0)

    // conversion to degrees
  {$IFDEF x64}
    FMUL    qword ptr [RIP + RadToDegCoef]  //  ST0:  RadToDegCoef * RadAngle (DegAngle)
  {$ELSE}
    FMUL    qword ptr [RadToDegCoef]        //  ST0:  RadToDegCoef * RadAngle (DegAngle)
  {$ENDIF}
{$ENDIF}

{===============================================================================
                               Vectors projection                               
===============================================================================}

{-------------------------------------------------------------------------------

  VectorsProjection_2s_SSE

  Calculates projection of 2-dimensional single-precision input vector to base
  vector.

  Input:

    Third and fourth single in both input registers must contain 0.

    XMM0: 00  00  b1  b0  - base vector
    XMM1: 00  00  v1  v0  - vector to be projected to base

  Output:

    Projected vector is returned in lower two singles of register XMM0.
    Higher two singles are set 0.

    XMM0: 00  00  P1  P0

  Scratch registers:

    XMM1, XMM2, XMM3

-------------------------------------------------------------------------------}

{$IFDEF VectorsProjection_2s_SSE}
    MOVAPS    XMM2, XMM0                        //  XMM2: 00  00  b1  b0

    MULPS     XMM1, XMM0                        //  XMM1: 00  00  v1b1  v0b0
    MULPS     XMM2, XMM2                        //  XMM2: 00  00  b1b1  b0b0

  {$IFDEF ASMDirectOPCodes}
    DB  $F2, $0F, $7C, $C9  //  HADDPS XMM1, XMM1
    DB  $F2, $0F, $7C, $D2  //  HADDPS XMM2, XMM2
  {$ELSE}
    HADDPS    XMM1, XMM1                        //  XMM1: **  **  **  (v1b1 + v0b0)(VB_DP)
    HADDPS    XMM2, XMM2                        //  XMM2: **  **  **  (b1b1 + b0b0)(BB_DP)
  {$ENDIF}

    // check for zero BB dot product
    XORPS     XMM3, XMM3                        //  XMM3: 00  00  00  00
    COMISS    XMM2, XMM3
    JNE       @Continue

    // BB dot product is zero, set result to zero vector
    MOVAPS    XMM0, XMM3                        //  XMM0: 00  00  00  00
    JMP       @StoreResult

  @Continue:

    DIVSS     XMM1, XMM2                        //  XMM1: **  **  **  (VB_DP / BB_DP)(D)
    SHUFPS    XMM1, XMM1, $00 {00000000}        //  XMM1: D   D   D   D

    MULPS     XMM0, XMM1                        //  XMM0: 00  00  b1D b0D
                                                //  XMM0: 00  00  P1  P0
{$ENDIF}

{-------------------------------------------------------------------------------

  VectorsProjection_4s_SSE

  Calculates projection of 4-dimensional single-precision input vector to base
  vector.

  Input:

    XMM0: b3  b2  b1  b0  - base vector
    XMM1: v3  v2  v1  v0  - vector to be projected to base

  Output:

    Projected vector is returned in register XMM0.

    XMM0: P3  P2  P1  P0

  Scratch registers:

    XMM1, XMM2, XMM3

-------------------------------------------------------------------------------}

{$IFDEF VectorsProjection_4s_SSE}
    MOVAPS    XMM2, XMM0                        //  XMM2: b3  b2  b1  b0

    MULPS     XMM1, XMM0                        //  XMM1: v3b3  v2b2  v1b1  v0b0
    MULPS     XMM2, XMM2                        //  XMM2: b3b3  b2b2  b1b1  b0b0

  {$IFDEF ASMDirectOPCodes}
    DB  $F2, $0F, $7C, $C9  //  HADDPS XMM1, XMM1
    DB  $F2, $0F, $7C, $D2  //  HADDPS XMM2, XMM2
    DB  $F2, $0F, $7C, $C9  //  HADDPS XMM1, XMM1
    DB  $F2, $0F, $7C, $D2  //  HADDPS XMM2, XMM2
  {$ELSE}
    HADDPS    XMM1, XMM1                        //  XMM1: --  --  (v3b3 + v2b2)  (v1b1 + v0b0)
    HADDPS    XMM2, XMM2                        //  XMM2: --  --  (b3b3 + b2b2)  (b1b1 + b0b0)
    HADDPS    XMM1, XMM1                        //  XMM1: --  --  -- (v3b3 + v2b2 + v1b1 + v0b0)(VB_DP)
    HADDPS    XMM2, XMM2                        //  XMM2: --  --  -- (b3b3 + b2b2 + b1b1 + b0b0)(BB_DP)
  {$ENDIF}

    // check for zero BB dot product
    XORPS     XMM3, XMM3                        //  XMM3: 00  00  00  00
    COMISS    XMM2, XMM3
    JNE       @Continue

    // BB dot product is zero, set result to zero vector
    MOVAPS    XMM0, XMM3                        //  XMM0: 00  00  00  00
  {$IFDEF FunctionVariantXYZ}
    MOVAPS    XMM1, XMM3                        //  XMM1: 00  00  00  00
  {$ENDIF}  
    JMP       @StoreResult

  @Continue:

    // all four entries in XMM1 contains the same value
    DIVPS     XMM1, XMM2                        //  XMM1: --  --  --  (VB_DP / BB_DP)(D)

    MULPS     XMM0, XMM1                        //  XMM0: b3D   b2D   b1D   b0D

  {$IFDEF FunctionVariantXYZ}
    MOVSS     XMM1, dword ptr [Vector + 12]     //  XMM1: **  **  **  v3
  {$ENDIF}
                                                //  XMM0: P3    P2    P1    P0
{$ENDIF}

{-------------------------------------------------------------------------------

  VectorsProjection_2d_SSE

  Calculates projection of 2-dimensional double-precision input vector to base
  vector.

  Input:

    XMM0: b1  b0  - base vector
    XMM1: v1  v0  - vector to be projected to base

  Output:

    Projected vector is returned in register XMM0.

    XMM0: P1  P0

  Scratch registers:

    XMM1, XMM2, XMM3

-------------------------------------------------------------------------------}

{$IFDEF VectorsProjection_2d_SSE}
    MOVAPD    XMM2, XMM0                        //  XMM2: b1  b0

    MULPD     XMM1, XMM0                        //  XMM1: v1b1  v0b0
    MULPD     XMM2, XMM2                        //  XMM2: b1b1  b0b0

  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $C9  //  HADDPD XMM1, XMM1
    DB  $66, $0F, $7C, $D2  //  HADDPD XMM2, XMM2
  {$ELSE}
    HADDPD    XMM1, XMM1                        //  XMM1: --  (v1b1 + v0b0)(VB_DP)
    HADDPD    XMM2, XMM2                        //  XMM2: --  (b1b1 + b0b0)(BB_DP)
  {$ENDIF}

    // check for zero BB dot product
    XORPD     XMM3, XMM3                        //  XMM3: 00  00
    COMISD    XMM2, XMM3
    JNE       @Continue

    // BB dot product is zero, set result to zero vector
    MOVAPD    XMM0, XMM3                        //  XMM0: 00  00
    JMP       @StoreResult

  @Continue:

    // both entries in XMM1 contains the same value
    DIVPD     XMM1, XMM2                        //  XMM1: --  (VB_DP / BB_DP)(D)

    MULPD     XMM0, XMM1                        //  XMM0: b1D   b0D
                                                //  XMM0: P1    P0
{$ENDIF}

{-------------------------------------------------------------------------------

  VectorsProjection_3d_SSE

  Calculates projection of 3-dimensional double-precision input vector to base
  vector.

  Input:

    High doubles of registers XMM1 and XMM3 must be 0.

    XMM0: b1  b0  - lower 128 bits of the base vector
    XMM1: 00  b2  - highest double of base vector
    XMM2: v1  v0  - lower 128 bits of the vector to be projected to base
    XMM3: 00  v2  - highest double of vector to be projected to base

  Output:

    Projected vector is returned in registers XMM0 and XMM1.
    High double of register XMM1 is to be ignored.

    XMM0: P1  P0
    XMM1: **  P2

  Scratch registers:

    XMM2, XMM3, XMM4, XMM5

-------------------------------------------------------------------------------}

{$IFDEF VectorsProjection_3d_SSE}
    MOVAPD    XMM4, XMM0                        //  XMM4: b1  b0
    MOVAPD    XMM5, XMM1                        //  XMM5: 00  b2

    MULPD     XMM2, XMM0                        //  XMM2: v1b1  v0b0
    MULSD     XMM3, XMM1                        //  XMM3:  00   v2b2
    MULPD     XMM4, XMM4                        //  XMM4: b1b1  b0b0
    MULSD     XMM5, XMM5                        //  XMM5:  00   b2b2

  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $D2  //  HADDPD XMM2, XMM2
    DB  $66, $0F, $7C, $E4  //  HADDPD XMM4, XMM4
  {$ELSE}
    HADDPD    XMM2, XMM2                        //  XMM2: --  (v1b1 + v0b0)
    HADDPD    XMM4, XMM4                        //  XMM4: --  (b1b1 + b0b0)
  {$ENDIF}
    ADDSD     XMM2, XMM3                        //  XMM2: **  (v2b2 + v1b1 + v0b0)(VB_DP)
    ADDSD     XMM4, XMM5                        //  XMM4: **  (b2b2 + b1b1 + b0b0)(BB_DP)

    // check for zero BB dot product
    XORPD     XMM3, XMM3                        //  XMM3: 00  00
    COMISD    XMM4, XMM3
    JNE       @Continue

    // BB dot product is zero, set result to zero vector
    MOVAPD    XMM0, XMM3                        //  XMM0: 00  00
    MOVAPD    XMM1, XMM3                        //  XMM1: 00  00
  {$IFDEF FunctionVariantXYZ}
    MOVAPD    XMM2, XMM3                        //  XMM2: 00  00
  {$ENDIF}
    JMP       @StoreResult

  @Continue:

    DIVSD     XMM2, XMM4                        //  XMM2: **  (VB_DP / BB_DP)(D)
    // both entries of XMM2 contains the same value after this instruction
    SHUFPD    XMM2, XMM2, $0 {00}               //  XMM2:  D     D

    MULPD     XMM0, XMM2                        //  XMM0: b1D   b0D
    MULSD     XMM1, XMM2                        //  XMM1: **    b2D
  {$IFDEF FunctionVariantXYZ}
    MOVSD     XMM2, qword ptr [Vector + 24]     //  XMM2: **  v3
  {$ENDIF}
                                                //  XMM0: P1  P0
                                                //  XMM1: **  P2
{$ENDIF}

{-------------------------------------------------------------------------------

  VectorsProjection_4d_SSE

  Calculates projection of 4-dimensional double-precision input vector to base
  vector.

  Input:

    XMM0: b1  b0  - lower 128 bits of the base vector
    XMM1: b3  b2  - higher 128 bits of base vector
    XMM2: v1  v0  - lower 128 bits of the vector to be projected to base
    XMM3: v3  v2  - higher 128 bits of vector to be projected to base

  Output:

    Projected vector is returned in registers XMM0 and XMM1.

    XMM0: P1  P0
    XMM1: P3  P2

  Scratch registers:

    XMM2, XMM3, XMM4, XMM5

-------------------------------------------------------------------------------}

{$IFDEF VectorsProjection_4d_SSE}
    MOVAPD    XMM4, XMM0                        //  XMM4: b1  b0
    MOVAPD    XMM5, XMM1                        //  XMM5: b3  b2

    MULPD     XMM2, XMM0                        //  XMM2: v1b1  v0b0
    MULPD     XMM3, XMM1                        //  XMM3: v3b3  v2b2
    MULPD     XMM4, XMM4                        //  XMM4: b1b1  b0b0
    MULPD     XMM5, XMM5                        //  XMM5: b3b3  b2b2

  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $D3  //  HADDPD XMM2, XMM3
    DB  $66, $0F, $7C, $E5  //  HADDPD XMM4, XMM5
    DB  $66, $0F, $7C, $D2  //  HADDPD XMM2, XMM2
    DB  $66, $0F, $7C, $E4  //  HADDPD XMM4, XMM4
  {$ELSE}
    HADDPD    XMM2, XMM3                        //  XMM2: (v3b3 + v2b2)  (v1b1 + v0b0)
    HADDPD    XMM4, XMM5                        //  XMM4: (b3b3 + b2b2)  (b1b1 + b0b0)
    HADDPD    XMM2, XMM2                        //  XMM2: --  (v3b3 + v2b2 + v1b1 + v0b0)(VB_DP)
    HADDPD    XMM4, XMM4                        //  XMM4: --  (b3b3 + b2b2 + b1b1 + b0b0)(BB_DP)
  {$ENDIF}

    // check for zero BB dot product
    XORPD     XMM3, XMM3                        //  XMM3: 00  00
    COMISD    XMM4, XMM3
    JNE       @Continue

    // BB dot product is zero, set result to zero vector
    MOVAPD    XMM0, XMM3                        //  XMM0: 00  00
    MOVAPD    XMM1, XMM3                        //  XMM1: 00  00
    JMP       @StoreResult

  @Continue:

    // both entries of XMM2 contains the same value after this instruction
    DIVPD     XMM2, XMM4                        //  XMM2: --  (VB_DP / BB_DP)(D)

    MULPD     XMM0, XMM2                        //  XMM0: b1D   b0D
    MULPD     XMM1, XMM2                        //  XMM1: b3D   b2D
                                                //  XMM0: P1    P0
                                                //  XMM1: P3    P2
{$ENDIF}
