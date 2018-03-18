{.$DEFINE MatricesMultiply_2s_Round_SSE}
{.$DEFINE MatricesMultiply_3s_Round_SSE}
{.$DEFINE MatricesMultiply_4s_Round_SSE}
{.$DEFINE MatricesMultiply_2d_Round_SSE}
{.$DEFINE MatricesMultiply_3d_Round_SSE}
{.$DEFINE MatricesMultiply_4d_Round_SSE}

{$IFDEF MatricesMultiply_2s_Round_SSE}
    MOVAPS    XMM2, XMM0                        //  XMM2: a11   a10   a01   a00
    MOVAPS    XMM3, XMM1                        //  XMM3: b11   b10   b01   b00

    SHUFPS    XMM1, XMM1, $CC {11001100}        //  XMM1: b11   b00   b11   b00

    SHUFPS    XMM2, XMM2, $B1 {10110001}        //  XMM2: a10   a11   a00   a01
    SHUFPS    XMM3, XMM3, $66 {01100110}        //  XMM3: b01   b10   b01   b10

    MULPS     XMM0, XMM1                        //  XMM0: a11b11  a10b00  a01b11  a00b00
    MULPS     XMM2, XMM3                        //  XMM2: a10b01  a11b10  a00b01  a01b10
    ADDPS     XMM0, XMM2                        //  XMM0: (a11b11 + a10b01)(p11) (a10b00 + a11b10)(p10) (a01b11 + a00b01)(p01) (a00b00 + a01b10)(p00)
                                                //  XMM0: p11   p10   p01   p00
{$ENDIF}

{$IFDEF MatricesMultiply_3s_Round_SSE}
    MOVSS     XMM3, dword ptr [aMatrix]         //  XMM3: 00    00    00    a0i
    MOVSS     XMM4, dword ptr [aMatrix + 12]    //  XMM4: 00    00    00    a1i
    MOVSS     XMM5, dword ptr [aMatrix + 24]    //  XMM5: 00    00    00    a2i
    SHUFPS    XMM3, XMM3, $00 {00000000}        //  XMM3: a0i   a0i   a0i   a0i
    SHUFPS    XMM4, XMM4, $00 {00000000}        //  XMM4: a1i   a1i   a1i   a1i
    SHUFPS    XMM5, XMM5, $00 {00000000}        //  XMM5: a2i   a2i   a2i   a2i

    MOVSS     XMM6, dword ptr [bMatrix]         //  XMM6: 00    00    00    bi0
    MOVHPS    XMM6, qword ptr [bMatrix + 4]     //  XMM6: bi2   bi1   00    bi0

    MULPS     XMM3, XMM6                        //  XMM3: a0ibi2(r02)  a0ibi1(r01)      00      a0ibi0(r00)
    MULPS     XMM4, XMM6                        //  XMM4: a1ibi2(r12)  a1ibi1(r11)      00      a1ibi0(r10)
    MULPS     XMM5, XMM6                        //  XMM5: a2ibi2(r22)  a2ibi1(r21)      00      a2ibi0(r20)

  {$IFDEF FirstRound}
    MOVAPS    XMM0, XMM3                        //  XMM0: r02   r01   00    r00
    MOVAPS    XMM1, XMM4                        //  XMM1: r12   r11   00    r10
    MOVAPS    XMM2, XMM5                        //  XMM2: r22   r21   00    r20
  {$ELSE}
    ADDPS     XMM0, XMM3                        //  XMM0: (p02 + r02) (p01 + r01) 00  (p00 + r00)
    ADDPS     XMM1, XMM4                        //  XMM1: (p12 + r12) (p11 + r11) 00  (p10 + r10)
    ADDPS     XMM2, XMM5                        //  XMM2: (p22 + r22) (p21 + r21) 00  (p20 + r20)
  {$ENDIF}

    ADD       aMatrix, 4
    ADD       bMatrix, 12
{$ENDIF}

{$IFDEF MatricesMultiply_4s_Round_SSE}
  {$IFDEF AlignedMemoryAccess}
    MOVAPS    XMM6, dqword ptr [bMatrix]        //  XMM6: bi3   bi2   bi1   bi0
  {$ELSE}
    MOVUPS    XMM6, dqword ptr [bMatrix]        //  XMM6: bi3   bi2   bi1   bi0
  {$ENDIF}

    MOVSS     XMM4, dword ptr [aMatrix]         //  XMM4: 00    00    00    a0i
    MOVSS     XMM5, dword ptr [aMatrix + 16]    //  XMM5: 00    00    00    a1i

    SHUFPS    XMM4, XMM4, $00 {00000000}        //  XMM4: a0i   a0i   a0i   a0i
    SHUFPS    XMM5, XMM5, $00 {00000000}        //  XMM5: a1i   a1i   a1i   a1i

    MULPS     XMM4, XMM6                        //  XMM4: a0ibi3(r03)   a0ibi2(r02)   a0ibi1(r01)   a0ibi0(r00)
    MULPS     XMM5, XMM6                        //  XMM5: a1ibi3(r13)   a1ibi2(r12)   a1ibi1(r11)   a1ibi0(r10)

  {$IFDEF FirstRound}
    MOVAPS    XMM0, XMM4                        //  XMM0: r03   r02   r01   r00
    MOVAPS    XMM1, XMM5                        //  XMM1: r12   r12   r11   r10
  {$ELSE}
    ADDPS     XMM0, XMM4                        //  XMM0: (p03 + r03) (p02 + r02) (p01 + r01) (p00 + r00)
    ADDPS     XMM1, XMM5                        //  XMM1: (p13 + r13) (p12 + r12) (p11 + r11) (p10 + r10)
  {$ENDIF}

    MOVSS     XMM4, dword ptr [aMatrix + 32]    //  XMM4: 00    00    00    a2i
    MOVSS     XMM5, dword ptr [aMatrix + 48]    //  XMM5: 00    00    00    a3i

    SHUFPS    XMM4, XMM4, $00 {00000000}        //  XMM4: a2i   a2i   a2i   a2i
    SHUFPS    XMM5, XMM5, $00 {00000000}        //  XMM5: a3i   a3i   a3i   a3i

    MULPS     XMM4, XMM6                        //  XMM4: a2ibi3(r23)   a2ibi2(r22)   a2ibi1(r21)   a2ibi0(r20)
    MULPS     XMM5, XMM6                        //  XMM5: a3ibi3(r33)   a3ibi2(r32)   a3ibi1(r31)   a3ibi0(r30)

  {$IFDEF FirstRound}
    MOVAPS    XMM2, XMM4                        //  XMM0: r23   r22   r21   r20
    MOVAPS    XMM3, XMM5                        //  XMM1: r32   r32   r31   r30
  {$ELSE}
    ADDPS     XMM2, XMM4                        //  XMM0: (p23 + r23) (p22 + r22) (p21 + r21) (p20 + r20)
    ADDPS     XMM3, XMM5                        //  XMM1: (p33 + r33) (p32 + r32) (p31 + r31) (p30 + r30)
  {$ENDIF}

    ADD       aMatrix, 4
    ADD       bMatrix, 16  
{$ENDIF}

{$IFDEF MatricesMultiply_2d_Round_SSE}
    MOVSD     XMM2, qword ptr [aMatrix]         //  XMM2: 00    a0i
    MOVSD     XMM3, qword ptr [aMatrix + 16]    //  XMM3: 00    a1i
    SHUFPD    XMM2, XMM2, $0 {00}               //  XMM2: a0i   a0i
    SHUFPD    XMM3, XMM3, $0 {00}               //  XMM3: a1i   a1i

  {$IFDEF AlignedMemoryAccess}
    MOVAPD    XMM4, dqword ptr [bMatrix]        //  XMM4: bi1   bi0
  {$ELSE}
    MOVUPD    XMM4, dqword ptr [bMatrix]        //  XMM4: bi1   bi0
  {$ENDIF}
  
    MULPD     XMM2, XMM4                        //  XMM2: a0ibi1(r01)   a0ibi0(r00)
    MULPD     XMM3, XMM4                        //  XMM3: a1ibi1(r11)   a1ibi0(r10)

  {$IFDEF FirstRound}
    MOVAPD    XMM0, XMM2                        //  XMM0: r01   r00
    MOVAPD    XMM1, XMM3                        //  XMM1: r11   r10

    ADD       aMatrix, 8
    ADD       bMatrix, 16
  {$ELSE}
    ADDPD     XMM0, XMM2                        //  XMM0: (p01 + r01) (p00 + r00)
    ADDPD     XMM1, XMM3                        //  XMM1: (r11 + r11) (p10 + r10)
  {$ENDIF}
{$ENDIF}

{$IFDEF MatricesMultiply_3d_Round_SSE}
  {$IFDEF AlignedMemoryAccess}
    MOVAPD    XMM0, dqword ptr [bMatrix]        //  XMM0: bi1   bi0
  {$ELSE}
    MOVUPD    XMM0, dqword ptr [bMatrix]        //  XMM0: bi1   bi0
  {$ENDIF}
    MOVSD     XMM1, qword ptr [bMatrix + 16]    //  XMM1: 00    bi2

    MOVSD     XMM2, qword ptr [aMatrix]         //  XMM2: 00    a0i
    MOVAPD    XMM3, XMM2                        //  XMM3: 00    a0i
    SHUFPD    XMM2, XMM2, $0 {00}               //  XMM2: a0i   a0i

    MULPD     XMM2, XMM0                        //  XMM2: a0ibi1(r01) a0ibi0(r00)
    MULSD     XMM3, XMM1                        //  XMM3:     00      a0ibi2(r02)

  {$IFDEF FirstRound}
    MOVAPD    XMM4, XMM2                        //  XMM4: r01   r00
    MOVSD     XMM5, XMM3                        //  XMM5: **    r02
  {$ELSE}
    ADDPD     XMM4, XMM2                        //  XMM4: (p01 + r01) (p00 + r00)
    ADDSD     XMM5, XMM3                        //  XMM5:     **      (p02 + r02)
  {$ENDIF}

    MOVSD     XMM2, qword ptr [aMatrix + 24]    //  XMM2: 00    a1i
    MOVAPD    XMM3, XMM2                        //  XMM3: 00    a1i
    SHUFPD    XMM2, XMM2, $0 {00}               //  XMM2: a1i   a1i

    MULPD     XMM2, XMM0                        //  XMM2: a1ibi1(r11) a1ibi0(r10)
    MULSD     XMM3, XMM1                        //  XMM3:     00      a1ibi2(r12)

  {$IFDEF FirstRound}
    MOVAPD    XMM6, XMM2                        //  XMM6: r11   r10
    MOVSD     XMM7, XMM3                        //  XMM7: **    r12
  {$ELSE}
    ADDPD     XMM6, XMM2                        //  XMM6: (p11 + r11) (p10 + r10)
    ADDSD     XMM7, XMM3                        //  XMM7:     **      (p12 + r12)
  {$ENDIF}

    MOVSD     XMM2, qword ptr [aMatrix + 48]    //  XMM2: 00    a2i
    MOVAPD    XMM3, XMM2                        //  XMM3: 00    a2i
    SHUFPD    XMM2, XMM2, $0 {00}               //  XMM2: a2i   a2i

    MULPD     XMM2, XMM0                        //  XMM2: a2ibi1(r21) a2ibi0(r20)
    MULSD     XMM3, XMM1                        //  XMM3:     00      a2ibi2(r22)

{$IFDEF x64} //- 64bit code... - - - - - - - - - - - - - - - - - - - - - - - - -

  {$IFDEF FirstRound}
    MOVAPD    XMM8, XMM2                        //  XMM8: r21   r20
    MOVSD     XMM9, XMM3                        //  XMM9: **    r22
  {$ELSE}
    ADDPD     XMM8, XMM2                        //  XMM8: (p21 + r21) (p20 + r20)
    ADDSD     XMM9, XMM3                        //  XMM9:     **      (p22 + r22)
  {$ENDIF}

{$ELSE x64}  //- 32bit code... - - - - - - - - - - - - - - - - - - - - - - - - -

  {$IFNDEF FirstRound}
    ADDPD     XMM2, dqword ptr [ESP]            //  XMM2: (p21 + r21) (p20 + r20)
    ADDSD     XMM3, qword ptr [ESP + 16]        //  XMM3:     **      (p22 + r22)
  {$ENDIF}

  {$IFNDEF LastRound}
    MOVAPD    dqword ptr [ESP], XMM2            //  [ESP]: (p20 + r20)  (p21 + r21)
    MOVSD     qword ptr [ESP + 16], XMM3        //  [ESP]: (p20 + r20)  (p21 + r21) (p22 + r22)
  {$ENDIF}

{$ENDIF x64}

  {$IFNDEF LastRound}
    ADD       aMatrix, 8
    ADD       bMatrix, 24
  {$ENDIF}
{$ENDIF}

{$IFDEF MatricesMultiply_4d_Round_SSE}
{$IFDEF x64} //- 64bit code... - - - - - - - - - - - - - - - - - - - - - - - - -

  {$IFDEF AlignedMemoryAccess}
    MOVUPD    XMM0, dqword ptr [bMatrix]        //  XMM0: bi1   bi0
    MOVUPD    XMM1, dqword ptr [bMatrix + 16]   //  XMM1: bi3   bi2
  {$ELSE}
    MOVAPD    XMM0, dqword ptr [bMatrix]        //  XMM0: bi1   bi0
    MOVAPD    XMM1, dqword ptr [bMatrix + 16]   //  XMM1: bi3   bi2
  {$ENDIF}

    MOVSD     XMM2, qword ptr [aMatrix]         //  XMM2: 00    a0i
    MOVSD     XMM4, qword ptr [aMatrix + 32]    //  XMM4: 00    a1i
    SHUFPD    XMM2, XMM2, 0                     //  XMM2: a0i   a0i
    SHUFPD    XMM4, XMM4, 0                     //  XMM4: a1i   a1i
    MOVAPD    XMM3, XMM2                        //  XMM3: a0i   a0i
    MOVAPD    XMM5, XMM4                        //  XMM5: a1i   a1i

    MULPD     XMM2, XMM0                        //  XMM2: a0ibi1(r01) a0ibi0(r00)
    MULPD     XMM3, XMM1                        //  XMM3: a0ibi3(r03) a0ibi2(r02)
    MULPD     XMM4, XMM0                        //  XMM4: a1ibi1(r11) a1ibi0(r10)
    MULPD     XMM5, XMM1                        //  XMM5: a1ibi3(r13) a1ibi2(r12)

  {$IFDEF FirstRound}
    MOVAPD    XMM6, XMM2                        //  XMM6: r01   r00
    MOVAPD    XMM7, XMM3                        //  XMM7: r03   r02
    MOVAPD    XMM8, XMM4                        //  XMM8: r11   r10
    MOVAPD    XMM9, XMM5                        //  XMM9: r13   r12
  {$ELSE}
    ADDPD     XMM6, XMM2                        //  XMM6: (p01 + r01) (p00 + r00)
    ADDPD     XMM7, XMM3                        //  XMM7: (p03 + r03) (p02 + r02)
    ADDPD     XMM8, XMM4                        //  XMM8: (p11 + r11) (p10 + r10)
    ADDPD     XMM9, XMM5                        //  XMM9: (p13 + r13) (p12 + r12)
  {$ENDIF}

    MOVSD     XMM2, qword ptr [aMatrix + 64]    //  XMM2: 00    a2i
    MOVSD     XMM4, qword ptr [aMatrix + 96]    //  XMM4: 00    a3i
    SHUFPD    XMM2, XMM2, 0                     //  XMM2: a2i   a2i
    SHUFPD    XMM4, XMM4, 0                     //  XMM4: a3i   a3i
    MOVAPD    XMM3, XMM2                        //  XMM3: a2i   a2i
    MOVAPD    XMM5, XMM4                        //  XMM5: a3i   a3i

    MULPD     XMM2, XMM0                        //  XMM2: a2ibi1(r21) a2ibi0(r20)
    MULPD     XMM3, XMM1                        //  XMM3: a2ibi3(r23) a2ibi2(r22)
    MULPD     XMM4, XMM0                        //  XMM4: a3ibi1(r31) a3ibi0(r30)
    MULPD     XMM5, XMM1                        //  XMM5: a3ibi3(r33) a3ibi2(r32)

  {$IFDEF FirstRound}
    MOVAPD    XMM10, XMM2                       //  XMM10:  r21   r20
    MOVAPD    XMM11, XMM3                       //  XMM11:  r23   r22
    MOVAPD    XMM12, XMM4                       //  XMM12:  r31   r30
    MOVAPD    XMM13, XMM5                       //  XMM13:  r33   r32
  {$ELSE}
    ADDPD     XMM10, XMM2                       //  XMM10:  (p21 + r21) (p20 + r20)
    ADDPD     XMM11, XMM3                       //  XMM11:  (p23 + r23) (p22 + r22)
    ADDPD     XMM12, XMM4                       //  XMM12:  (p31 + r31) (p30 + r30)
    ADDPD     XMM13, XMM5                       //  XMM13:  (p33 + r33) (p32 + r32)
  {$ENDIF}

  {$IFNDEF LastRound}
    ADD       aMatrix, 8
    ADD       bMatrix, 32
  {$ENDIF}    

{$ELSE x64}  //- 32bit code... - - - - - - - - - - - - - - - - - - - - - - - - -
                                                //--- odd rounds ---------------------------------------//--- even rounds -----------------
    MOVSD     XMM0, qword ptr [aMatrix]         //  XMM0: 00    ai0                                     //  XMM0: 00    ai0
    MOVSD     XMM1, qword ptr [aMatrix + 8]     //  XMM1: 00    ai1                                     //  XMM1: 00    ai1
    MOVSD     XMM2, qword ptr [aMatrix + 16]    //  XMM2: 00    ai2                                     //  XMM2: 00    ai2
    MOVSD     XMM3, qword ptr [aMatrix + 24]    //  XMM3: 00    ai3                                     //  XMM3: 00    ai3

    SHUFPD    XMM0, XMM0, $0 {00}               //  XMM0: ai0   ai0                                     //  XMM0: ai0   ai0
    SHUFPD    XMM1, XMM1, $0 {00}               //  XMM1: ai1   ai1                                     //  XMM1: ai1   ai1
    SHUFPD    XMM2, XMM2, $0 {00}               //  XMM2: ai2   ai2                                     //  XMM2: ai2   ai2
    SHUFPD    XMM3, XMM3, $0 {00}               //  XMM3: ai3   ai3                                     //  XMM3: ai3   ai3

    MULPD     XMM4, XMM0                        //  XMM4: ai0b01    ai0b00                              //  XMM4: ai0b03    ai0b02
    MULPD     XMM5, XMM1                        //  XMM5: ai1b11    ai1b10                              //  XMM5: ai1b13    ai1b12
    MULPD     XMM6, XMM2                        //  XMM6: ai2b21    ai2b20                              //  XMM6: ai2b23    ai2b22
    MULPD     XMM7, XMM3                        //  XMM7: ai3b31    ai3b30                              //  XMM7: ai3b33    ai3b32

    ADDPD     XMM4, XMM5                        //  XMM4: (ai0b01 + ai1b11) (ai0b00 + ai1b10)           //  XMM4: (ai0b03 + ai1b13) (ai0b02 + ai1b12)
    ADDPD     XMM6, XMM7                        //  XMM6: (ai2b21 + ai3b31) (ai2b20 + ai3b30)           //  XMM6: (ai2b23 + ai3b33) (ai2b22 + ai3b32)
    ADDPD     XMM4, XMM6                        //  XMM4: (ai0b00 + ai1b10 + ai2b20 + ai3b30)(ri0)      //  XMM4: (ai0b02 + ai1b12 + ai2b22 + ai3b32)(ri2)
                                                //        (ai0b01 + ai1b11 + ai2b21 + ai3b31)(ri1)      //        (ai0b03 + ai1b13 + ai2b23 + ai3b33)(ri3)
{$IFDEF OddRound}
  {$IFDEF AlignedMemoryAccess}
    MOVAPD    dqword ptr [Product], XMM4        //  [Product]:  ri0   ri1

    MOVAPD    XMM7, dqword ptr [bMatrix + 112]  //  XMM7: b33   b32
    MOVAPD    XMM6, dqword ptr [bMatrix + 80]   //  XMM6: b23   b22
    MOVAPD    XMM4, dqword ptr [bMatrix + 16]   //  XMM4: b03   b02
    MOVAPD    XMM5, dqword ptr [bMatrix + 48]   //  XMM5: b13   b12
  {$ELSE}
    MOVUPD    dqword ptr [Product], XMM4        //  [Product]:  ri0   ri1

    MOVUPD    XMM7, dqword ptr [bMatrix + 112]  //  XMM7: b33   b32
    MOVUPD    XMM6, dqword ptr [bMatrix + 80]   //  XMM6: b23   b22
    MOVUPD    XMM4, dqword ptr [bMatrix + 16]   //  XMM4: b03   b02
    MOVUPD    XMM5, dqword ptr [bMatrix + 48]   //  XMM5: b13   b12
  {$ENDIF}
{$ELSE}
  {$IFDEF AlignedMemoryAccess}
    MOVAPD    dqword ptr [Product + 16], XMM4                                                           //  [Product + 16]: ri2   ri3

    MOVAPD    XMM7, dqword ptr [bMatrix + 96]                                                           //  XMM7: b31   b30
    MOVAPD    XMM6, dqword ptr [bMatrix + 64]                                                           //  XMM6: b21   b20
    MOVAPD    XMM4, dqword ptr [bMatrix]                                                                //  XMM4: b01   b00
    MOVAPD    XMM5, dqword ptr [bMatrix + 32]                                                           //  XMM5: b11   b10
  {$ELSE}
    MOVUPD    dqword ptr [Product + 16], XMM4                                                           //  [Product + 16]: ri2   ri3

    MOVUPD    XMM7, dqword ptr [bMatrix + 96]                                                           //  XMM7: b31   b30
    MOVUPD    XMM6, dqword ptr [bMatrix + 64]                                                           //  XMM6: b21   b20
    MOVUPD    XMM4, dqword ptr [bMatrix]                                                                //  XMM4: b01   b00
    MOVUPD    XMM5, dqword ptr [bMatrix + 32]                                                           //  XMM5: b11   b10
  {$ENDIF}
{$ENDIF}

    MULPD     XMM0, XMM4                        //  XMM0: ai0b03  ai0b02                                //  XMM0: ai0b01  ai0b00
    MULPD     XMM1, XMM5                        //  XMM1: ai1b13  ai1b12                                //  XMM1: ai1b11  ai1b10
    MULPD     XMM2, XMM6                        //  XMM2: ai2b23  ai2b22                                //  XMM2: ai2b21  ai2b20
    MULPD     XMM3, XMM7                        //  XMM3: ai3b33  ai3b32                                //  XMM3: ai3b31  ai3b30

    ADDPD     XMM0, XMM1                        //  XMM0: (ai0b03 + ai1b13) (ai0b02 + ai1b12)           //  XMM0: (ai0b01 + ai1b11) (ai0b00 + ai1b10)
    ADDPD     XMM2, XMM3                        //  XMM2: (ai2b23 + ai3b33) (ai2b22 + ai3b32)           //  XMM2: (ai2b21 + ai3b31) (ai2b20 + ai3b30)
    ADDPD     XMM0, XMM2                        //  XMM0: (ai0b02 + ai1b12 + ai2b22 + ai3b32)(ri2)      //  XMM0: (ai0b00 + ai1b10 + ai2b20 + ai3b30)(ri0)
                                                //        (ai0b03 + ai1b13 + ai2b23 + ai3b33)(ri3)      //        (ai0b01 + ai1b11 + ai2b21 + ai3b31)(ri1)
{$IFDEF OddRound}
  {$IFDEF AlignedMemoryAccess}
    MOVAPD    dqword ptr [Product + 16], XMM0   //  [Product + 16]:  ri2   ri3
  {$ELSE}
    MOVUPD    dqword ptr [Product + 16], XMM0   //  [Product + 16]:  ri2   ri3
  {$ENDIF}
{$ELSE}
  {$IFDEF AlignedMemoryAccess}
    MOVAPD    dqword ptr [Product], XMM0                                                                //  [Product]:  ri0   ri1
  {$ELSE}
    MOVUPD    dqword ptr [Product], XMM0                                                                //  [Product]:  ri0   ri1
  {$ENDIF}
{$ENDIF}

  {$IFNDEF LastRound}
    ADD       aMatrix, 32
    ADD       Product, 32
  {$ENDIF}
  
{$ENDIF x64}
{$ENDIF}
