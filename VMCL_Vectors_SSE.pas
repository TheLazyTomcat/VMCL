unit VMCL_Vectors_SSE;

{$INCLUDE 'VMCL_defs.inc'}

interface

uses
  VMCL_Vectors;

{$IFNDEF PurePascal}

procedure VectorsNormal_3s_SSEau(const aVector,bVector: TVector3s; out Normal: TVector3s); register; assembler;
procedure VectorsNormal_4s_SSEu(const aVector,bVector: TVector4s; out Normal: TVector4s); register; assembler;
procedure VectorsNormal_4s_SSEa(const aVector,bVector: TVector4s; out Normal: TVector4s); register; assembler;
procedure VectorsNormal_3d_SSEu(const aVector,bVector: TVector3d; out Normal: TVector3d); register; assembler;
procedure VectorsNormal_3d_SSEa(const aVector,bVector: TVector3d; out Normal: TVector3d); register; assembler;
procedure VectorsNormal_4d_SSEu(const aVector,bVector: TVector4d; out Normal: TVector4d); register; assembler;
procedure VectorsNormal_4d_SSEa(const aVector,bVector: TVector4d; out Normal: TVector4d); register; assembler;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VectorsNormal_SSE(const aVector,bVector: TVector3s; out Normal: TVector3s); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsNormal_SSE(const aVector,bVector: TVector4s; out Normal: TVector4s); register; assembler; overload;
procedure VectorsNormal_SSE(const aVector,bVector: TVector3d; out Normal: TVector3d); register; assembler; overload;
procedure VectorsNormal_SSE(const aVector,bVector: TVector4d; out Normal: TVector4d); register; assembler; overload;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_3s_SSEau(const aVector,bVector: TVector3s; out Antinormal: TVector3s); register; assembler;
procedure VectorsAntinormal_4s_SSEu(const aVector,bVector: TVector4s; out Antinormal: TVector4s); register; assembler;
procedure VectorsAntinormal_4s_SSEa(const aVector,bVector: TVector4s; out Antinormal: TVector4s); register; assembler;
procedure VectorsAntinormal_3d_SSEu(const aVector,bVector: TVector3d; out Antinormal: TVector3d); register; assembler;
procedure VectorsAntinormal_3d_SSEa(const aVector,bVector: TVector3d; out Antinormal: TVector3d); register; assembler;
procedure VectorsAntinormal_4d_SSEu(const aVector,bVector: TVector4d; out Antinormal: TVector4d); register; assembler;
procedure VectorsAntinormal_4d_SSEa(const aVector,bVector: TVector4d; out Antinormal: TVector4d); register; assembler;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VectorsAntinormal_SSE(const aVector,bVector: TVector3s; out Antinormal: TVector3s); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsAntinormal_SSE(const aVector,bVector: TVector4s; out Antinormal: TVector4s); register; assembler; overload;
procedure VectorsAntinormal_SSE(const aVector,bVector: TVector3d; out Antinormal: TVector3d); register; assembler; overload;
procedure VectorsAntinormal_SSE(const aVector,bVector: TVector4d; out Antinormal: TVector4d); register; assembler; overload;

//------------------------------------------------------------------------------
{$IFDEF DevelMsgs}
  {$MESSAGE 'Mark as platform in x64'}
{$ENDIF}
procedure VectorsAngleRad_2s_SSEau(const aVector,bVector: TVector2s; out Angle: Single); register; assembler; // <100% in x64
procedure VectorsAngleRad_3s_SSEau(const aVector,bVector: TVector3s; out Angle: Single); register; assembler; // <100% in x64
procedure VectorsAngleRad_4s_SSEu(const aVector,bVector: TVector4s; out Angle: Single); register; assembler;  // <100% in x64
procedure VectorsAngleRad_4s_SSEa(const aVector,bVector: TVector4s; out Angle: Single); register; assembler;  // <100% in x64
procedure VectorsAngleRad_2d_SSEu(const aVector,bVector: TVector2d; out Angle: Double); register; assembler;  // <100% in x64
procedure VectorsAngleRad_2d_SSEa(const aVector,bVector: TVector2d; out Angle: Double); register; assembler;  // <100% in x64
procedure VectorsAngleRad_3d_SSEu(const aVector,bVector: TVector3d; out Angle: Double); register; assembler;  // <100% in x64
procedure VectorsAngleRad_3d_SSEa(const aVector,bVector: TVector3d; out Angle: Double); register; assembler;  // <100% in x64
procedure VectorsAngleRad_4d_SSEu(const aVector,bVector: TVector4d; out Angle: Double); register; assembler;  // <100% in x64
procedure VectorsAngleRad_4d_SSEa(const aVector,bVector: TVector4d; out Angle: Double); register; assembler;  // <100% in x64

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VectorsAngleRad_SSE(const aVector,bVector: TVector2s; out Angle: Single); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsAngleRad_SSE(const aVector,bVector: TVector3s; out Angle: Single); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsAngleRad_SSE(const aVector,bVector: TVector4s; out Angle: Single); register; assembler; overload;
procedure VectorsAngleRad_SSE(const aVector,bVector: TVector2d; out Angle: Double); register; assembler; overload;
procedure VectorsAngleRad_SSE(const aVector,bVector: TVector3d; out Angle: Double); register; assembler; overload;
procedure VectorsAngleRad_SSE(const aVector,bVector: TVector4d; out Angle: Double); register; assembler; overload;

//------------------------------------------------------------------------------
{$IFDEF DevelMsgs}
  {$MESSAGE 'Make zero-vector comparison sooner'}
{$ENDIF}  
procedure VectorsProjection_2s_SSEau(const Base,Vector: TVMCLVector2s; out Projection: TVMCLVector2s); register; assembler;
procedure VectorsProjection_3s_SSEau(const Base,Vector: TVMCLVector3s; out Projection: TVMCLVector3s); register; assembler;
procedure VectorsProjection_4s_SSEu(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s); register; assembler;
procedure VectorsProjection_4s_SSEa(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s); register; assembler;
procedure VectorsProjectionXYZ_4s_SSEu(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s); register; assembler;
procedure VectorsProjectionXYZ_4s_SSEa(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s); register; assembler;
procedure VectorsProjection_2d_SSEu(const Base,Vector: TVMCLVector2d; out Projection: TVMCLVector2d); register; assembler;
procedure VectorsProjection_2d_SSEa(const Base,Vector: TVMCLVector2d; out Projection: TVMCLVector2d); register; assembler;
procedure VectorsProjection_3d_SSEu(const Base,Vector: TVMCLVector3d; out Projection: TVMCLVector3d); register; assembler;
procedure VectorsProjection_3d_SSEa(const Base,Vector: TVMCLVector3d; out Projection: TVMCLVector3d); register; assembler;
procedure VectorsProjection_4d_SSEu(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d); register; assembler;
procedure VectorsProjection_4d_SSEa(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d); register; assembler;
procedure VectorsProjectionXYZ_4d_SSEu(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d); register; assembler;
procedure VectorsProjectionXYZ_4d_SSEa(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d); register; assembler;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector2s; out Projection: TVMCLVector2s); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector3s; out Projection: TVMCLVector3s); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s); register; assembler; overload;
procedure VectorsProjectionXYZ_SSE(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s); register; assembler; overload;
procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector2d; out Projection: TVMCLVector2d); register; assembler; overload;
procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector3d; out Projection: TVMCLVector3d); register; assembler; overload;
procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d); register; assembler; overload;
procedure VectorsProjectionXYZ_SSE(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d); register; assembler; overload;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_2s_SSEau(const Base,Vector: TVMCLVector2s; out Orthogonal: TVMCLVector2s); register; assembler;
procedure VectorsOrthogonal_3s_SSEau(const Base,Vector: TVMCLVector3s; out Orthogonal: TVMCLVector3s); register; assembler;
procedure VectorsOrthogonal_4s_SSEu(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s); register; assembler;
procedure VectorsOrthogonal_4s_SSEa(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s); register; assembler;
procedure VectorsOrthogonalXYZ_4s_SSEu(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s); register; assembler;
procedure VectorsOrthogonalXYZ_4s_SSEa(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s); register; assembler;
procedure VectorsOrthogonal_2d_SSEu(const Base,Vector: TVMCLVector2d; out Orthogonal: TVMCLVector2d); register; assembler;
procedure VectorsOrthogonal_2d_SSEa(const Base,Vector: TVMCLVector2d; out Orthogonal: TVMCLVector2d); register; assembler;
procedure VectorsOrthogonal_3d_SSEu(const Base,Vector: TVMCLVector3d; out Orthogonal: TVMCLVector3d); register; assembler;
procedure VectorsOrthogonal_3d_SSEa(const Base,Vector: TVMCLVector3d; out Orthogonal: TVMCLVector3d); register; assembler;
procedure VectorsOrthogonal_4d_SSEu(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d); register; assembler;
procedure VectorsOrthogonal_4d_SSEa(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d); register; assembler;
procedure VectorsOrthogonalXYZ_4d_SSEu(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d); register; assembler;
procedure VectorsOrthogonalXYZ_4d_SSEa(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d); register; assembler;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector2s; out Orthogonal: TVMCLVector2s); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector3s; out Orthogonal: TVMCLVector3s); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s); register; assembler; overload;
procedure VectorsOrthogonalXYZ_SSE(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s); register; assembler; overload;
procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector2d; out Orthogonal: TVMCLVector2d); register; assembler; overload;
procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector3d; out Orthogonal: TVMCLVector3d); register; assembler; overload;
procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d); register; assembler; overload;
procedure VectorsOrthogonalXYZ_SSE(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d); register; assembler; overload;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_2s_SSEau(const Base,Vector: TVMCLVector2s; out Orthonormal: TVMCLVector2s); register; assembler;
procedure VectorsOrthonormal_3s_SSEau(const Base,Vector: TVMCLVector3s; out Orthonormal: TVMCLVector3s); register; assembler;
procedure VectorsOrthonormal_4s_SSEu(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s); register; assembler;
procedure VectorsOrthonormal_4s_SSEa(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s); register; assembler;
procedure VectorsOrthonormalXYZ_4s_SSEu(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s); register; assembler;
procedure VectorsOrthonormalXYZ_4s_SSEa(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s); register; assembler;
procedure VectorsOrthonormal_2d_SSEu(const Base,Vector: TVMCLVector2d; out Orthonormal: TVMCLVector2d); register; assembler;
procedure VectorsOrthonormal_2d_SSEa(const Base,Vector: TVMCLVector2d; out Orthonormal: TVMCLVector2d); register; assembler;
procedure VectorsOrthonormal_3d_SSEu(const Base,Vector: TVMCLVector3d; out Orthonormal: TVMCLVector3d); register; assembler;
procedure VectorsOrthonormal_3d_SSEa(const Base,Vector: TVMCLVector3d; out Orthonormal: TVMCLVector3d); register; assembler;
procedure VectorsOrthonormal_4d_SSEu(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d); register; assembler;
procedure VectorsOrthonormal_4d_SSEa(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d); register; assembler;
procedure VectorsOrthonormalXYZ_4d_SSEu(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d); register; assembler;
procedure VectorsOrthonormalXYZ_4d_SSEa(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d); register; assembler;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector2s; out Orthonormal: TVMCLVector2s); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector3s; out Orthonormal: TVMCLVector3s); overload; {$IFDEF CanInline} inline;{$ENDIF}
procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s); register; assembler; overload;
procedure VectorsOrthonormalXYZ_SSE(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s); register; assembler; overload;
procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector2d; out Orthonormal: TVMCLVector2d); register; assembler; overload;
procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector3d; out Orthonormal: TVMCLVector3d); register; assembler; overload;
procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d); register; assembler; overload;
procedure VectorsOrthonormalXYZ_SSE(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d); register; assembler; overload;

{$ENDIF PurePascal}

implementation

{$IFNDEF PurePascal}

{$IFDEF ASMSuppressSizeWarnings}
  {$WARN 2087 OFF}  //  Supresses warnings on following two $WARN (FPC 2.X)
  {$WARN 7121 OFF}  //  Warning: Check size of memory operand "op: memory-operand-size is X bits, but expected [Y bits]"
  {$WARN 7122 OFF}  //  Warning: Check size of memory operand "op: memory-operand-size is X bits, but expected [Y bits + Z byte offset]"
  {$WARN 2087 ON}
{$ENDIF}

//==============================================================================

procedure VectorsNormal_3s_SSEau(const aVector,bVector: TVector3s; out Normal: TVector3s);
asm
    MOVSS   XMM0, dword ptr [aVector]           //  XMM0: 00  00  00  a0
    MOVHPS  XMM0, qword ptr [aVector + 4]       //  XMM0: a2  a1  00  a0
    SHUFPS  XMM0, XMM0, $78 {01111000}          //  XMM0: 00  a2  a1  a0

    MOVSS   XMM1, dword ptr [bVector]           //  XMM1: 00  00  00  b0
    MOVHPS  XMM1, qword ptr [bVector + 4]       //  XMM1: b2  b1  00  b0
    SHUFPS  XMM1, XMM1, $78 {01111000}          //  XMM1: 00  b2  b1  b0

    // cross product                            //  XMM0: 00  CP2 CP1 CP0
  {$DEFINE CrossProduct_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4s_SSE}

    // normalize                                //  XMM0: 00  n2  n1  n0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

    SHUFPS  XMM0, XMM0, $9C {10011100}          //  XMM0: n2  n1  **  n0

    MOVSS   dword ptr [Normal], XMM0            //  [Normal]:   n0
    MOVHPS  qword ptr [Normal + 4], XMM0        //  [Normal]:   n0  n1  n2
end;

//------------------------------------------------------------------------------

procedure VectorsNormal_4s_SSEu(const aVector,bVector: TVector4s; out Normal: TVector4s);
asm
    MOVUPS  XMM0, dqword ptr [aVector]          //  XMM0: a3  a2  a1  a0
    MOVUPS  XMM1, dqword ptr [bVector]          //  XMM1: b3  b2  b1  b0

    // cross product                            //  XMM0: 00  CP2 CP1 CP0
  {$DEFINE CrossProduct_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4s_SSE}

    // normalize                                //  XMM0: 00  n2  n1  n0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

    MOVUPS  dqword ptr [Normal], XMM0           //  [Normal]: n0  n1  n2  00
end;

//------------------------------------------------------------------------------

procedure VectorsNormal_4s_SSEa(const aVector,bVector: TVector4s; out Normal: TVector4s);
asm
    MOVAPS  XMM0, dqword ptr [aVector]          //  XMM0: a3  a2  a1  a0
    MOVAPS  XMM1, dqword ptr [bVector]          //  XMM1: b3  b2  b1  b0

    // cross product                            //  XMM0: 00  CP2 CP1 CP0
  {$DEFINE CrossProduct_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4s_SSE}

    // normalize                                //  XMM0: 00  n2  n1  n0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

    MOVAPS  dqword ptr [Normal], XMM0           //  [Normal]: n0  n1  n2  00
end;

//------------------------------------------------------------------------------

procedure VectorsNormal_3d_SSEu(const aVector,bVector: TVector3d; out Normal: TVector3d);
asm
    MOVUPD  XMM0, dqword ptr [aVector]          //  XMM0: a1  a0
    MOVSD   XMM1, qword ptr [aVector + 16]      //  XMM1: 00  a2
    MOVUPD  XMM2, dqword ptr [bVector]          //  XMM2: b1  b0
    MOVSD   XMM3, qword ptr [bVector + 16]      //  XMM3: 00  b2

    // cross product                            //  XMM0: CP1 CP0
                                                //  XMM1: 00  CP2
  {$DEFINE CrossProduct_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4d_SSE}

    // normalize                                //  XMM0: n1  n0
                                                //  XMM1: 00  n2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

    MOVUPD  dqword ptr [Normal], XMM0           //  [Normal]: n0  n1
    MOVSD   qword ptr [Normal + 16], XMM1       //  [Normal]: n0  n1  n2
end;

//------------------------------------------------------------------------------

procedure VectorsNormal_3d_SSEa(const aVector,bVector: TVector3d; out Normal: TVector3d);
asm
    MOVAPD  XMM0, dqword ptr [aVector]          //  XMM0: a1  a0
    MOVSD   XMM1, qword ptr [aVector + 16]      //  XMM1: 00  a2
    MOVAPD  XMM2, dqword ptr [bVector]          //  XMM2: b1  b0
    MOVSD   XMM3, qword ptr [bVector + 16]      //  XMM3: 00  b2

    // cross product                            //  XMM0: CP1 CP0
                                                //  XMM1: 00  CP2
  {$DEFINE CrossProduct_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4d_SSE}

    // normalize                                //  XMM0: n1  n0
                                                //  XMM1: 00  n2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

    MOVAPD  dqword ptr [Normal], XMM0           //  [Normal]: n0  n1
    MOVSD   qword ptr [Normal + 16], XMM1       //  [Normal]: n0  n1  n2  
end;

//------------------------------------------------------------------------------

procedure VectorsNormal_4d_SSEu(const aVector,bVector: TVector4d; out Normal: TVector4d);
asm
    MOVUPD  XMM0, dqword ptr [aVector]          //  XMM0: a1  a0
    MOVUPD  XMM1, dqword ptr [aVector + 16]     //  XMM1: a3  a2
    MOVUPD  XMM2, dqword ptr [bVector]          //  XMM2: b1  b0
    MOVUPD  XMM3, dqword ptr [bVector + 16]     //  XMM3: b3  b2

    // cross product                            //  XMM0: CP1 CP0
                                                //  XMM1: 00  CP2
  {$DEFINE CrossProduct_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4d_SSE}

    // normalize                                //  XMM0: n1  n0
                                                //  XMM1: 00  n2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

    MOVUPD  dqword ptr [Normal], XMM0           //  [Normal]: n0  n1
    MOVUPD  dqword ptr [Normal + 16], XMM1      //  [Normal]: n0  n1  n2  00
end;

//------------------------------------------------------------------------------

procedure VectorsNormal_4d_SSEa(const aVector,bVector: TVector4d; out Normal: TVector4d);
asm
    MOVAPD  XMM0, dqword ptr [aVector]          //  XMM0: a1  a0
    MOVAPD  XMM1, dqword ptr [aVector + 16]     //  XMM1: a3  a2
    MOVAPD  XMM2, dqword ptr [bVector]          //  XMM2: b1  b0
    MOVAPD  XMM3, dqword ptr [bVector + 16]     //  XMM3: b3  b2

    // cross product                            //  XMM0: CP1 CP0
                                                //  XMM1: 00  CP2
  {$DEFINE CrossProduct_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4d_SSE}

    // normalize                                //  XMM0: n1  n0
                                                //  XMM1: 00  n2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

    MOVAPD  dqword ptr [Normal], XMM0           //  [Normal]: n0  n1
    MOVAPD  dqword ptr [Normal + 16], XMM1      //  [Normal]: n0  n1  n2  00
end;

//==============================================================================

procedure VectorsNormal_SSE(const aVector,bVector: TVector3s; out Normal: TVector3s);
begin
// aligned and unaligned code is the same
VectorsNormal_3s_SSEau(aVector,bVector,Normal);
end;

//------------------------------------------------------------------------------

procedure VectorsNormal_SSE(const aVector,bVector: TVector4s; out Normal: TVector4s);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsNormal_4s_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsNormal_4s_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsNormal_SSE(const aVector,bVector: TVector3d; out Normal: TVector3d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsNormal_3d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsNormal_3d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsNormal_SSE(const aVector,bVector: TVector4d; out Normal: TVector4d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsNormal_4d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsNormal_4d_SSEu

  @RoutineEnd:
end;

//==============================================================================

procedure VectorsAntinormal_3s_SSEau(const aVector,bVector: TVector3s; out Antinormal: TVector3s);
asm
    MOVSS   XMM0, dword ptr [aVector]           //  XMM0: 00  00  00  a0
    MOVHPS  XMM0, qword ptr [aVector + 4]       //  XMM0: a2  a1  00  a0
    SHUFPS  XMM0, XMM0, $78 {01111000}          //  XMM0: 00  a2  a1  a0

    MOVSS   XMM1, dword ptr [bVector]           //  XMM1: 00  00  00  b0
    MOVHPS  XMM1, qword ptr [bVector + 4]       //  XMM1: b2  b1  00  b0
    SHUFPS  XMM1, XMM1, $78 {01111000}          //  XMM1: 00  b2  b1  b0

    // cross product                            //  XMM0: 00  CP2 CP1 CP0
  {$DEFINE CrossProduct_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4s_SSE}

    // normalize                                //  XMM0: 00  n2  n1  n0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

    // negate                                   //  XMM0: 00 -n2 -n1 -n0
  {$DEFINE Negate_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Negate_4s_SSE}

    SHUFPS  XMM0, XMM0, $9C {10011100}          //  XMM0: -n2 -n1  ** -n0

    MOVSS   dword ptr [Antinormal], XMM0        // [Antinormal]: -n0
    MOVHPS  qword ptr [Antinormal + 4], XMM0    // [Antinormal]: -n0 -n1 -n2
end;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_4s_SSEu(const aVector,bVector: TVector4s; out Antinormal: TVector4s);
asm
    MOVUPS  XMM0, dqword ptr [aVector]          //  XMM0: a3  a2  a1  a0
    MOVUPS  XMM1, dqword ptr [bVector]          //  XMM1: b3  b2  b1  b0

    // cross product                            //  XMM0: 00  CP2 CP1 CP0
  {$DEFINE CrossProduct_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4s_SSE}

    // normalize                                //  XMM0: 00  n2  n1  n0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

    // negate                                   //  XMM0: 00 -n2 -n1 -n0
  {$DEFINE Negate_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Negate_4s_SSE}

    MOVUPS  dqword ptr [Antinormal], XMM0       //  [Antinormal]: -n0 -n1 -n2  00
end;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_4s_SSEa(const aVector,bVector: TVector4s; out Antinormal: TVector4s);
asm
    MOVAPS  XMM0, dqword ptr [aVector]          //  XMM0: a3  a2  a1  a0
    MOVAPS  XMM1, dqword ptr [bVector]          //  XMM1: b3  b2  b1  b0

    // cross product                            //  XMM0: 00  CP2 CP1 CP0
  {$DEFINE CrossProduct_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4s_SSE}

    // normalize                                //  XMM0: 00  n2  n1  n0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

    // negate                                   //  XMM0: 00 -n2 -n1 -n0
  {$DEFINE Negate_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Negate_4s_SSE}

    MOVAPS  dqword ptr [Antinormal], XMM0       //  [Antinormal]: -n0 -n1 -n2  00
end;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_3d_SSEu(const aVector,bVector: TVector3d; out Antinormal: TVector3d);
asm
    MOVUPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVSD     XMM1, qword ptr [aVector + 16]    //  XMM1: 00  a2
    MOVUPD    XMM2, dqword ptr [bVector]        //  XMM2: b1  b0
    MOVSD     XMM3, qword ptr [bVector + 16]    //  XMM3: 00  b2

    // cross product                            //  XMM0:  CP1  CP0
                                                //  XMM1:  00   CP2
  {$DEFINE CrossProduct_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4d_SSE}

    // normalize                                //  XMM0: n1  n0
                                                //  XMM1: 00  n2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

    // negate                                   //  XMM0: -n1 -n0
                                                //  XMM1:  00 -n2
  {$DEFINE Negate_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Negate_4d_SSE}

    MOVUPD  dqword ptr [Antinormal], XMM0       //  [Antinormal]: -n0  -n1
    MOVSD   qword ptr [Antinormal + 16], XMM1   //  [Antinormal]: -n0  -n1  -n2
end;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_3d_SSEa(const aVector,bVector: TVector3d; out Antinormal: TVector3d);
asm
    MOVAPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVSD     XMM1, qword ptr [aVector + 16]    //  XMM1: 00  a2
    MOVAPD    XMM2, dqword ptr [bVector]        //  XMM2: b1  b0
    MOVSD     XMM3, qword ptr [bVector + 16]    //  XMM3: 00  b2

    // cross product                            //  XMM0:  CP1  CP0
                                                //  XMM1:  00   CP2
  {$DEFINE CrossProduct_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4d_SSE}

    // normalize                                //  XMM0: n1  n0
                                                //  XMM1: 00  n2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

    // negate                                   //  XMM0: -n1 -n0
                                                //  XMM1:  00 -n2
  {$DEFINE Negate_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Negate_4d_SSE}

    MOVAPD  dqword ptr [Antinormal], XMM0       //  [Antinormal]: -n0  -n1
    MOVSD   qword ptr [Antinormal + 16], XMM1   //  [Antinormal]: -n0  -n1  -n2
end;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_4d_SSEu(const aVector,bVector: TVector4d; out Antinormal: TVector4d);
asm
    MOVUPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVUPD    XMM1, dqword ptr [aVector + 16]   //  XMM1: a3  a2
    MOVUPD    XMM2, dqword ptr [bVector]        //  XMM2: b1  b0
    MOVUPD    XMM3, dqword ptr [bVector + 16]   //  XMM3: b3  b2

    // cross product                            //  XMM0:  CP1  CP0
                                                //  XMM1:  00   CP2
  {$DEFINE CrossProduct_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4d_SSE}

    // normalize                                //  XMM0: n1  n0
                                                //  XMM1: 00  n2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

    // negate                                   //  XMM0: -n1 -n0
                                                //  XMM1:  00 -n2
  {$DEFINE Negate_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Negate_4d_SSE}

    MOVUPD  dqword ptr [Antinormal], XMM0       //  [Antinormal]: -n0  -n1
    MOVUPD  dqword ptr [Antinormal + 16], XMM1  //  [Antinormal]: -n0  -n1  -n2   00
end;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_4d_SSEa(const aVector,bVector: TVector4d; out Antinormal: TVector4d);
asm
    MOVAPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVAPD    XMM1, dqword ptr [aVector + 16]   //  XMM1: a3  a2
    MOVAPD    XMM2, dqword ptr [bVector]        //  XMM2: b1  b0
    MOVAPD    XMM3, dqword ptr [bVector + 16]   //  XMM3: b3  b2

    // cross product                            //  XMM0:  CP1  CP0
                                                //  XMM1:  00   CP2
  {$DEFINE CrossProduct_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF CrossProduct_4d_SSE}

    // normalize                                //  XMM0: n1  n0
                                                //  XMM1: 00  n2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

    // negate                                   //  XMM0: -n1 -n0
                                                //  XMM1:  00 -n2
  {$DEFINE Negate_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Negate_4d_SSE}

    MOVAPD  dqword ptr [Antinormal], XMM0       //  [Antinormal]: -n0  -n1
    MOVAPD  dqword ptr [Antinormal + 16], XMM1  //  [Antinormal]: -n0  -n1  -n2   00
end;

//==============================================================================

procedure VectorsAntinormal_SSE(const aVector,bVector: TVector3s; out Antinormal: TVector3s);
begin
// aligned and unaligned code is the same
VectorsAntinormal_3s_SSEau(aVector,bVector,Antinormal);
end;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_SSE(const aVector,bVector: TVector4s; out Antinormal: TVector4s);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsAntinormal_4s_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsAntinormal_4s_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_SSE(const aVector,bVector: TVector3d; out Antinormal: TVector3d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsAntinormal_3d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsAntinormal_3d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAntinormal_SSE(const aVector,bVector: TVector4d; out Antinormal: TVector4d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsAntinormal_4d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsAntinormal_4d_SSEu

  @RoutineEnd:
end;

//==============================================================================

procedure VectorsAngleRad_2s_SSEau(const aVector,bVector: TVector2s; out Angle: Single);
asm
    MOVLPS    XMM1, qword ptr [aVector]         //  XMM1: **  **  a1  a0
    MOVHPS    XMM1, qword ptr [bVector]         //  XMM1: b1  b0  a1  a0

    // dot product
    MOVHLPS   XMM0, XMM1                        //  XMM0: **  **   b1    b0
    MULPS     XMM0, XMM1                        //  XMM0: **  **  a1b1  a0b0
  {$IFDEF ASMDirectOPCodes}
    DB  $F2, $0F, $7C, $C0  {HADDPS XMM0, XMM0}
  {$ELSE}
    HADDPS    XMM0, XMM0                        //  XMM0: **  **   **   (a0b0 + a1b1)(DP)
  {$ENDIF}

    // magnitudes
    MULPS     XMM1, XMM1                        //  XMM1: b1b1  b0b0  a1a1  a0a0
  {$IFDEF ASMDirectOPCodes}
    DB  $F2, $0F, $7C, $C9  {HADDPS XMM1, XMM1}
  {$ELSE}
    HADDPS    XMM1, XMM1                        //  XMM1:  --    --   (b1b1 + b0b0) (a1a1 + a0a0)
  {$ENDIF}
    SQRTPS    XMM1, XMM1                        //  XMM1:  --    --   SQRT(b1b1 + b0b0)(Mb) SQRT(a1a1 + a0a0)(Ma)
    MOVAPS    XMM2, XMM1                        //  XMM2:  Mb    Ma    Mb    Ma
    SHUFPS    XMM2, XMM2, $11 {00010001}        //  XMM2:  Ma    Mb    Ma    Mb
    MULSS     XMM1, XMM2                        //  XMM1:  **    **    **    MaMb

    // check for zero
    XORPS     XMM2, XMM2                        //  XMM2: 00  00  00  00
    COMISS    XMM1, XMM2
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSS     dword ptr [Angle],  XMM2
    JMP       @RoutineEnd

  @Continue:

    DIVSS     XMM0, XMM1                        //  XMM0: **  **  **  DP / MaMb (Cos)

    // load lowest single of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1s}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1s}

    //  ArcCos                                  //  ST0:  ArcCosRad
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      dword ptr [Angle]                 // store resulting angle (in radians)
    FWAIT

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_3s_SSEau(const aVector,bVector: TVector3s; out Angle: Single);
asm
    MOVSS     XMM0, dword ptr [aVector]         //  XMM0: 00  00  00  a0
    MOVHPS    XMM0, qword ptr [aVector + 4]     //  XMM0: a2  a1  00  a0
    SHUFPS    XMM0, XMM0, $78 {01111000}        //  XMM0: 00  a2  a1  a0

    MOVSS     XMM1, dword ptr [bVector]         //  XMM1: 00  00  00  b0
    MOVHPS    XMM1, qword ptr [bVector + 4]     //  XMM1: b2  b1  00  b0
    SHUFPS    XMM1, XMM1, $78 {01111000}        //  XMM1: 00  b2  b1  b0

    MOVAPS    XMM2, XMM0                        //  XMM2: 00  a2  a1  a0

    // magnitude of the first vector            //  XMM2: **  **  **  Ma
  {$DEFINE Magnitude_4s_r2_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4s_r2_SSE}

    MOVAPS    XMM3, XMM2                        //  XMM3: **  **  **  Ma
    MOVAPS    XMM2, XMM1                        //  XMM2: 00  b2  b1  b0

    // magnitude of the second vector           //  XMM2: **  **  **  Mb
  {$DEFINE Magnitude_4s_r2_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4s_r2_SSE}

    MULSS     XMM2, XMM3                        //  XMM2: **  **  **  MaMb

    // check for zero
    XORPS     XMM3, XMM3                        //  XMM3: 00  00  00  00
    COMISS    XMM2, XMM3
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSS     dword ptr [Angle],  XMM3
    JMP       @RoutineEnd

  @Continue:

    // dot product                              //  XMM0: **  **  **  DP
  {$DEFINE DotProduct_4s3_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF DotProduct_4s3_SSE}

    DIVSS     XMM0, XMM2                        //  XMM0: **  **  **  DP / MaMb (Cos)

    // load lowest single of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1s}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1s}

    //  ArcCos                                  //  ST0:  ArcCosRad
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      dword ptr [Angle]                 // store resulting angle
    FWAIT

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_4s_SSEu(const aVector,bVector: TVector4s; out Angle: Single);
asm
    MOVUPS    XMM0, dqword ptr [aVector]        //  XMM0: a3  a2  a1  a0
    MOVUPS    XMM1, dqword ptr [bVector]        //  XMM1: b3  b2  b1  b0

    // discard highest single of both input vectors
    PCMPEQD   XMM2, XMM2                        //  register XMM2 set to all ones
    PSRLDQ    XMM2, 4                           //  XMM2: 00  11  11  11
    ANDPS     XMM0, XMM2                        //  XMM0: 00  a2  a1  a0
    ANDPS     XMM1, XMM2                        //  XMM1: 00  b2  b1  b0

    MOVAPS    XMM2, XMM0                        //  XMM2: 00  a2  a1  a0

    // magnitude of the first vector            //  XMM2: **  **  **  Ma
  {$DEFINE Magnitude_4s_r2_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4s_r2_SSE}

    MOVAPS    XMM3, XMM2                        //  XMM3: **  **  **  Ma
    MOVAPS    XMM2, XMM1                        //  XMM2: 00  b2  b1  b0

    // magnitude of the second vector           //  XMM2: **  **  **  Mb
  {$DEFINE Magnitude_4s_r2_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4s_r2_SSE}

    MULSS     XMM2, XMM3                        //  XMM2: **  **  **  MaMb

    // check for zero
    XORPS     XMM3, XMM3                        //  XMM3: 00  00  00  00
    COMISS    XMM2, XMM3
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSS     dword ptr [Angle],  XMM3
    JMP       @RoutineEnd

  @Continue:

    // dot product                              //  XMM0: **  **  **  DP
  {$DEFINE DotProduct_4s3_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF DotProduct_4s3_SSE}

    DIVSS     XMM0, XMM2                        //  XMM0: **  **  **  DP / MaMb (Cos)

    // load lowest single of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1s}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1s}

    //  ArcCos                                  //  ST0:  ArcCosDeg
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      dword ptr [Angle]                 // store resulting angle
    FWAIT

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_4s_SSEa(const aVector,bVector: TVector4s; out Angle: Single);
asm
    // load vectors and discard highest single of both input vectors
    PCMPEQD   XMM0, XMM0                        //  register XMM2 set to all ones
    PSRLDQ    XMM0, 4                           //  XMM2: 00  11  11  11
    MOVAPS    XMM1, XMM0
    ANDPS     XMM0, dqword ptr [aVector]        //  XMM0: 00  a2  a1  a0
    ANDPS     XMM1, dqword ptr [bVector]        //  XMM1: 00  b2  b1  b0

    MOVAPS    XMM2, XMM0                        //  XMM2: 00  a2  a1  a0

    // magnitude of the first vector            //  XMM2: **  **  **  Ma
  {$DEFINE Magnitude_4s_r2_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4s_r2_SSE}

    MOVAPS    XMM3, XMM2                        //  XMM3: **  **  **  Ma
    MOVAPS    XMM2, XMM1                        //  XMM2: 00  b2  b1  b0

    // magnitude of the second vector           //  XMM2: **  **  **  Mb
  {$DEFINE Magnitude_4s_r2_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4s_r2_SSE}

    MULSS     XMM2, XMM3                        //  XMM2: **  **  **  MaMb

    // check for zero
    XORPS     XMM3, XMM3                        //  XMM3: 00  00  00  00
    COMISS    XMM2, XMM3
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSS     dword ptr [Angle],  XMM3
    JMP       @RoutineEnd

  @Continue:

    // dot product                              //  XMM0: **  **  **  DP
  {$DEFINE DotProduct_4s3_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF DotProduct_4s3_SSE}

    DIVSS     XMM0, XMM2                        //  XMM0: **  **  **  DP / MaMb (Cos)

    // load lowest single of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1s}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1s}

    //  ArcCos                                  //  ST0:  ArcCosRad
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      dword ptr [Angle]                 // store resulting angle
    FWAIT

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_2d_SSEu(const aVector,bVector: TVector2d; out Angle: Double);
asm
    MOVUPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVUPD    XMM1, dqword ptr [bVector]        //  XMM1: b1  b0
    MOVAPD    XMM2, XMM0                        //  XMM2: a1  a0

    // dot product
    MULPD     XMM0, XMM1                        //  XMM0: a1b1  a0b0
  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $C0  {HADDPD XMM0, XMM0}
  {$ELSE}
    HADDPD    XMM0, XMM0                        //  XMM0:  --   (a1b1 + a0b0)(DP)
  {$ENDIF}

    // magnitudes
    MULPD     XMM1, XMM1                        //  XMM1: b1b1  b0b0
    MULPD     XMM2, XMM2                        //  XMM2: a1a1  a0a0
  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $C9  {HADDPD XMM1, XMM1}
    DB  $66, $0F, $7C, $D2  {HADDPD XMM2, XMM2}
  {$ELSE}
    HADDPD    XMM1, XMM1                        //  XMM1:  --   (b1b1 + b0b0)
    HADDPD    XMM2, XMM2                        //  XMM2:  --   (a1a1 + a0a0)
  {$ENDIF}
    SQRTSD    XMM1, XMM1                        //  XMM1:  **   SQRT(b1b1 + b0b0)(Mb)
    SQRTSD    XMM2, XMM2                        //  XMM2:  **   SQRT(a1a1 + a0a0)(Ma)

    MULSD     XMM1, XMM2                        //  XMM1: **  MaMb

    // check for zero
    XORPD     XMM2, XMM2                        //  XMM2: 00  00
    COMISD    XMM1, XMM2
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSD     qword ptr [Angle],  XMM2
    JMP       @RoutineEnd

  @Continue:

    DIVSD     XMM0, XMM1                        //  XMM0:  **   DP / MaMb (Cos)

    // load lowest double of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1d}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1d}

    //  ArcCos                                  //  ST0:  ArcCosDeg
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      qword ptr [Angle]                 // store resulting angle
    FWAIT

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_2d_SSEa(const aVector,bVector: TVector2d; out Angle: Double);
asm
    MOVAPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVAPD    XMM1, dqword ptr [bVector]        //  XMM1: b1  b0
    MOVAPD    XMM2, XMM0                        //  XMM2: a1  a0

    // dot product
    MULPD     XMM0, XMM1                        //  XMM0: a1b1  a0b0
  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $C0  {HADDPD XMM0, XMM0}
  {$ELSE}
    HADDPD    XMM0, XMM0                        //  XMM0:  --   (a1b1 + a0b0)(DP)
  {$ENDIF}

    // magnitudes
    MULPD     XMM1, XMM1                        //  XMM1: b1b1  b0b0
    MULPD     XMM2, XMM2                        //  XMM2: a1a1  a0a0
  {$IFDEF ASMDirectOPCodes}
    DB  $66, $0F, $7C, $C9  {HADDPD XMM1, XMM1}
    DB  $66, $0F, $7C, $D2  {HADDPD XMM2, XMM2}
  {$ELSE}
    HADDPD    XMM1, XMM1                        //  XMM1:  --   (b1b1 + b0b0)
    HADDPD    XMM2, XMM2                        //  XMM2:  --   (a1a1 + a0a0)
  {$ENDIF}
    SQRTSD    XMM1, XMM1                        //  XMM1:  **   SQRT(b1b1 + b0b0)(Mb)
    SQRTSD    XMM2, XMM2                        //  XMM2:  **   SQRT(a1a1 + a0a0)(Ma)

    MULSD     XMM1, XMM2                        //  XMM1: **  MaMb

    // check for zero
    XORPD     XMM2, XMM2                        //  XMM2: 00  00
    COMISD    XMM1, XMM2
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSD     qword ptr [Angle],  XMM2
    JMP       @RoutineEnd

  @Continue:

    DIVSD     XMM0, XMM1                        //  XMM0:  **   DP / MaMb (Cos)

    // load lowest double of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1d}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1d}

    //  ArcCos                                  //  ST0:  ArcCosDeg
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      qword ptr [Angle]                 // store resulting angle
    FWAIT

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_3d_SSEu(const aVector,bVector: TVector3d; out Angle: Double);
asm
    MOVUPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVSD     XMM1, qword ptr [aVector + 16]    //  XMM1: 00  a2
    MOVUPD    XMM2, dqword ptr [bVector]        //  XMM2: b1  b0
    MOVSD     XMM3, qword ptr [bVector + 16]    //  XMM3: 00  b2

    MOVAPD    XMM4, XMM0                        //  XMM4: a1  a0
    MOVAPD    XMM5, XMM1                        //  XMM5: 00  a2

    // magnitude of the first vector            //  XMM4: **  Ma
  {$DEFINE Magnitude_4d_r4_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4d_r4_SSE}

    MOVAPD    XMM5, XMM3                        //  XMM5: 00  b2
    SHUFPD    XMM3, XMM4, $0                    //  XMM3: Ma  b2
    MOVAPD    XMM4, XMM2                        //  XMM4: b1  b0

    // magnitude of the second vector           //  XMM4: **  Mb
  {$DEFINE Magnitude_4d_r4_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4d_r4_SSE}

    MOVHLPS   XMM5, XMM3                        //  XMM5: **  Ma    (there is no MOVHL(LH)PD instruction)
    MULSD     XMM4, XMM5                        //  XMM4: **  MaMb

    // check for zero
    XORPD     XMM5, XMM5                        //  XMM5: 00  00
    COMISD    XMM4, XMM5
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSD     qword ptr [Angle],  XMM5
    JMP       @RoutineEnd

  @Continue:

    // dot product                              //  XMM0: **  DP
  {$DEFINE DotProduct_4d3_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF DotProduct_4d3_SSE}

    DIVSD     XMM0, XMM4                        //  XMM0: **  DP / MaMb (Cos)

    // load lowest double of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1d}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1d}

    //  ArcCos                                  //  ST0:  ArcCosDeg
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      qword ptr [Angle]                 // store resulting angle
    FWAIT

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_3d_SSEa(const aVector,bVector: TVector3d; out Angle: Double);
asm
    MOVAPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVSD     XMM1, qword ptr [aVector + 16]    //  XMM1: 00  a2
    MOVAPD    XMM2, dqword ptr [bVector]        //  XMM2: b1  b0
    MOVSD     XMM3, qword ptr [bVector + 16]    //  XMM3: 00  b2

    MOVAPD    XMM4, XMM0                        //  XMM4: a1  a0
    MOVAPD    XMM5, XMM1                        //  XMM5: 00  a2

    // magnitude of the first vector            //  XMM4: **  Ma
  {$DEFINE Magnitude_4d_r4_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4d_r4_SSE}

    MOVAPD    XMM5, XMM3                        //  XMM5: 00  b2
    SHUFPD    XMM3, XMM4, $0                    //  XMM3: Ma  b2
    MOVAPD    XMM4, XMM2                        //  XMM4: b1  b0

    // magnitude of the second vector           //  XMM4: **  Mb
  {$DEFINE Magnitude_4d_r4_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4d_r4_SSE}

    MOVHLPS   XMM5, XMM3                        //  XMM5: **  Ma    (there is no MOVHL(LH)PD instruction)
    MULSD     XMM4, XMM5                        //  XMM4: **  MaMb

    // check for zero
    XORPD     XMM5, XMM5                        //  XMM5: 00  00
    COMISD    XMM4, XMM5
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSD     qword ptr [Angle],  XMM5
    JMP       @RoutineEnd

  @Continue:

    // dot product                              //  XMM0: **  DP
  {$DEFINE DotProduct_4d3_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF DotProduct_4d3_SSE}

    DIVSD     XMM0, XMM4                        //  XMM0: **  DP / MaMb (Cos)

    // load lowest double of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1d}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1d}

    //  ArcCos                                  //  ST0:  ArcCosDeg
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      qword ptr [Angle]                 // store resulting angle
    FWAIT

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_4d_SSEu(const aVector,bVector: TVector4d; out Angle: Double);
asm
    MOVUPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVSD     XMM1, qword ptr [aVector + 16]    //  XMM1: 00  a2  (a3 is not used)
    MOVUPD    XMM2, dqword ptr [bVector]        //  XMM2: b1  b0
    MOVSD     XMM3, qword ptr [bVector + 16]    //  XMM3: 00  b2  (b3 is not used)

    MOVAPD    XMM4, XMM0                        //  XMM4: a1  a0
    MOVAPD    XMM5, XMM1                        //  XMM5: 00  a2

    // magnitude of the first vector            //  XMM4: **  Ma
  {$DEFINE Magnitude_4d_r4_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4d_r4_SSE}

    MOVAPD    XMM5, XMM3                        //  XMM5: 00  b2
    SHUFPD    XMM3, XMM4, $0                    //  XMM3: Ma  b2
    MOVAPD    XMM4, XMM2                        //  XMM4: b1  b0

    // magnitude of the second vector           //  XMM4: **  Mb
  {$DEFINE Magnitude_4d_r4_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4d_r4_SSE}

    MOVHLPS   XMM5, XMM3                        //  XMM5: **  Ma    (there is no MOVHL(LH)PD instruction)
    MULSD     XMM4, XMM5                        //  XMM4: **  MaMb

    // check for zero
    XORPD     XMM5, XMM5                        //  XMM5: 00  00
    COMISD    XMM4, XMM5
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSD     qword ptr [Angle],  XMM5
    JMP       @RoutineEnd

  @Continue:

    // dot product                              //  XMM0: **  DP
  {$DEFINE DotProduct_4d3_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF DotProduct_4d3_SSE}

    DIVSD     XMM0, XMM4                        //  XMM0: **  DP / MaMb (Cos)

    // load lowest double of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1d}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1d}

    //  ArcCos                                  //  ST0:  ArcCosDeg
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      qword ptr [Angle]                 // store resulting angle
    FWAIT

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_4d_SSEa(const aVector,bVector: TVector4d; out Angle: Double);
asm
    MOVAPD    XMM0, dqword ptr [aVector]        //  XMM0: a1  a0
    MOVSD     XMM1, qword ptr [aVector + 16]    //  XMM1: 00  a2  (a3 is not used)
    MOVAPD    XMM2, dqword ptr [bVector]        //  XMM2: b1  b0
    MOVSD     XMM3, qword ptr [bVector + 16]    //  XMM3: 00  b2  (b3 is not used)

    MOVAPD    XMM4, XMM0                        //  XMM4: a1  a0
    MOVAPD    XMM5, XMM1                        //  XMM5: 00  a2

    // magnitude of the first vector            //  XMM4: **  Ma
  {$DEFINE Magnitude_4d_r4_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4d_r4_SSE}

    MOVAPD    XMM5, XMM3                        //  XMM5: 00  b2
    SHUFPD    XMM3, XMM4, $0                    //  XMM3: Ma  b2
    MOVAPD    XMM4, XMM2                        //  XMM4: b1  b0

    // magnitude of the second vector           //  XMM4: **  Mb
  {$DEFINE Magnitude_4d_r4_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Magnitude_4d_r4_SSE}

    MOVHLPS   XMM5, XMM3                        //  XMM5: **  Ma    (there is no MOVHL(LH)PD instruction)
    MULSD     XMM4, XMM5                        //  XMM4: **  MaMb

    // check for zero
    XORPD     XMM5, XMM5                        //  XMM5: 00  00
    COMISD    XMM4, XMM5
    JNE       @Continue

    // multiplication of magnitudes is zero, set resulting angle to zero
    MOVSD     qword ptr [Angle],  XMM5
    JMP       @RoutineEnd

  @Continue:

    // dot product                              //  XMM0: **  DP
  {$DEFINE DotProduct_4d3_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF DotProduct_4d3_SSE}

    DIVSD     XMM0, XMM4                        //  XMM0: **  DP / MaMb (Cos)

    // load lowest double of XMM0 to ST0        //  ST0:  Cos
  {$DEFINE Load_XMM0_to_ST0_1d}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF Load_XMM0_to_ST0_1d}

    //  ArcCos                                  //  ST0:  ArcCosDeg
  {$DEFINE ArcCosRad_1_x87}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF ArcCosRad_1_x87}

    FSTP      qword ptr [Angle]                 // store resulting angle
    FWAIT

  @RoutineEnd:
end;

//==============================================================================

procedure VectorsAngleRad_SSE(const aVector,bVector: TVector2s; out Angle: Single);
begin
// aligned and unaligned code is the same
VectorsAngleRad_2s_SSEau(aVector,bVector,Angle);
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_SSE(const aVector,bVector: TVector3s; out Angle: Single);
begin
// aligned and unaligned code is the same
VectorsAngleRad_3s_SSEau(aVector,bVector,Angle);
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_SSE(const aVector,bVector: TVector4s; out Angle: Single);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsAngleRad_4s_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsAngleRad_4s_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_SSE(const aVector,bVector: TVector2d; out Angle: Double);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsAngleRad_2d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsAngleRad_2d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_SSE(const aVector,bVector: TVector3d; out Angle: Double);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsAngleRad_3d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsAngleRad_3d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsAngleRad_SSE(const aVector,bVector: TVector4d; out Angle: Double);
asm
  {$DEFINE CheckMemAlign16_2}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_2}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsAngleRad_4d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsAngleRad_4d_SSEu

  @RoutineEnd:
end;

//==============================================================================

procedure VectorsProjection_2s_SSEau(const Base,Vector: TVMCLVector2s; out Projection: TVMCLVector2s);
asm
    // zero-out registers
    XORPS     XMM0, XMM0                        //  XMM0: 00  00  00  00
    XORPS     XMM1, XMM1                        //  XMM1: 00  00  00  00

    MOVLPS    XMM0, qword ptr [Base]            //  XMM0: 00  00  b1  b0
    MOVLPS    XMM1, qword ptr [Vector]          //  XMM1: 00  00  v1  v0

    // projection                               //  XMM0: 00  00  P1  P0
  {$DEFINE VectorsProjection_2s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_2s_SSE}

  @StoreResult:

    MOVLPS    qword ptr [Projection], XMM0      //  [Projection]:   P0  P1
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_3s_SSEau(const Base,Vector: TVMCLVector3s; out Projection: TVMCLVector3s);
asm
    MOVSS     XMM0, dword ptr [Base]            //  XMM0: 00  00  00  b0
    MOVHPS    XMM0, qword ptr [Base + 4]        //  XMM0: b2  b1  00  b0
    MOVSS     XMM1, dword ptr [Vector]          //  XMM1: 00  00  00  v0
    MOVHPS    XMM1, qword ptr [Vector + 4]      //  XMM1: v2  v1  00  v0

    // projection                               //  XMM0: P2  P1  00  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

  @StoreResult:

    MOVSS     dword ptr [Projection], XMM0      //  [Projection]:   P0
    MOVHPS    qword ptr [Projection + 4], XMM0  //  [Projection]:   P0  P1  P2
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_4s_SSEu(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s);
asm
    MOVUPS    XMM0, dqword ptr [Base]           //  XMM0: b3  b2  b1  b0
    MOVUPS    XMM1, dqword ptr [Vector]         //  XMM1: v3  v2  v1  v0

    // projection                               //  XMM0: P3  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

  @StoreResult:

    MOVUPS    dqword ptr [Projection], XMM0     //  [Projection]:   P0  P1  P2  P3
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_4s_SSEa(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s);
asm
    MOVAPS    XMM0, dqword ptr [Base]           //  XMM0: b3  b2  b1  b0
    MOVAPS    XMM1, dqword ptr [Vector]         //  XMM1: v3  v2  v1  v0

    MOVAPS    XMM2, XMM0                        //  XMM2: b3  b2  b1  b0

    // projection                               //  XMM0: P3  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

  @StoreResult:

    MOVAPS    dqword ptr [Projection], XMM0     //  [Projection]:   P0  P1  P2  P3
end;

//------------------------------------------------------------------------------

procedure VectorsProjectionXYZ_4s_SSEu(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s);
asm
{$DEFINE FunctionVariantXYZ}

    MOVUPS    XMM0, dqword ptr [Base]           //  XMM0: b3  b2  b1  b0
    MOVUPS    XMM1, dqword ptr [Vector]         //  XMM1: v3  v2  v1  v0

    // discard highest single of both input vectors
    PCMPEQD   XMM2, XMM2                        //  register XMM2 set to all ones
    PSRLDQ    XMM2, 4                           //  XMM2: 00  11  11  11
    ANDPS     XMM0, XMM2                        //  XMM0: 00  b2  b1  b0
    ANDPS     XMM1, XMM2                        //  XMM1: 00  v2  v1  v0

    // projection                               //  XMM0: 00  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

  @StoreResult:

    MOVUPS    dqword ptr [Projection], XMM0     //  [Projection]:   P0  P1  P2  00
    MOVSS     dword ptr [Projection + 12], XMM5 //  [Projection]:   P0  P1  P2  v3

{$UNDEF FunctionVariantXYZ}
end;

//------------------------------------------------------------------------------

procedure VectorsProjectionXYZ_4s_SSEa(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s);
asm
{$DEFINE FunctionVariantXYZ}

    // load vectors and discard highest single
    PCMPEQD   XMM0, XMM0                        //  register XMM0 set to all ones
    PSRLDQ    XMM0, 4                           //  XMM0: 00  11  11  11
    MOVAPS    XMM1, XMM0                        //  XMM1: 00  11  11  11
    ANDPS     XMM0, dqword ptr [Base]           //  XMM0: 00  b2  b1  b0
    ANDPS     XMM1, dqword ptr [Vector]         //  XMM1: 00  v2  v1  v0

    // projection                               //  XMM0: 00  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

  @StoreResult:

    MOVAPS    dqword ptr [Projection], XMM0     //  [Projection]:   P0  P1  P2  00
    MOVSS     dword ptr [Projection + 12], XMM5 //  [Projection]:   P0  P1  P2  v3

{$UNDEF FunctionVariantXYZ}
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_2d_SSEu(const Base,Vector: TVMCLVector2d; out Projection: TVMCLVector2d);
asm
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVUPD    XMM1, dqword ptr [Vector]         //  XMM1: v1  v0

    // projection                               //  XMM0: P1  P0
  {$DEFINE VectorsProjection_2d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_2d_SSE}

  @StoreResult:

    MOVUPD    dqword ptr [Projection], XMM0     //  [Projection]:   P0  P1
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_2d_SSEa(const Base,Vector: TVMCLVector2d; out Projection: TVMCLVector2d);
asm
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVAPD    XMM1, dqword ptr [Vector]         //  XMM1: v1  v0

    // projection                               //  XMM0: P1  P0
  {$DEFINE VectorsProjection_2d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_2d_SSE}

  @StoreResult:

    MOVAPD    dqword ptr [Projection], XMM0     //  [Projection]:   P0  P1
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_3d_SSEu(const Base,Vector: TVMCLVector3d; out Projection: TVMCLVector3d);
asm
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

  @StoreResult:

    MOVUPD    dqword ptr [Projection], XMM0       //  [Projection]:  P0  P1
    MOVSD     qword ptr [Projection + 16],  XMM1  //  [Projection]:  P0  P1  P2
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_3d_SSEa(const Base,Vector: TVMCLVector3d; out Projection: TVMCLVector3d);
asm
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

  @StoreResult:

    MOVAPD    dqword ptr [Projection], XMM0       //  [Projection]:  P0  P1
    MOVSD     qword ptr [Projection + 16],  XMM1  //  [Projection]:  P0  P1  P2
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_4d_SSEu(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d);
asm
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVUPD    XMM1, dqword ptr [Base + 16]      //  XMM1: b3  b2
    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVUPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: P3  P2
  {$DEFINE VectorsProjection_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4d_SSE}

  @StoreResult:

    MOVUPD    dqword ptr [Projection], XMM0         //  [Projection]:   P0  P1
    MOVUPD    dqword ptr [Projection + 16],  XMM1   //  [Projection]:   P0  P1  P2  P3
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_4d_SSEa(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d);
asm
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVAPD    XMM1, dqword ptr [Base + 16]      //  XMM1: b3  b2
    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVAPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: P3  P2
  {$DEFINE VectorsProjection_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4d_SSE}

  @StoreResult:

    MOVAPD    dqword ptr [Projection], XMM0         //  [Projection]:   P0  P1
    MOVAPD    dqword ptr [Projection + 16],  XMM1   //  [Projection]:   P0  P1  P2  P3
end;

//------------------------------------------------------------------------------

procedure VectorsProjectionXYZ_4d_SSEu(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d);
asm
{$DEFINE FunctionVariantXYZ}

    // highest entries are ignored
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

  @StoreResult:

    MOVUPD    dqword ptr [Projection], XMM0         //  [Projection]:   P0  P1
    MOVSD     qword ptr [Projection + 16], XMM1     //  [Projection]:   P0  P1  P2
    MOVSD     qword ptr [Projection + 24], XMM5     //  [Projection]:   P0  P1  P2  v3

{$UNDEF FunctionVariantXYZ}
end;

//------------------------------------------------------------------------------

procedure VectorsProjectionXYZ_4d_SSEa(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d);
asm
{$DEFINE FunctionVariantXYZ}

    // highest entries are ignored
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

  @StoreResult:

    MOVAPD    dqword ptr [Projection], XMM0         //  [Projection]:   P0  P1
    MOVSD     qword ptr [Projection + 16], XMM1     //  [Projection]:   P0  P1  P2
    MOVSD     qword ptr [Projection + 24], XMM5     //  [Projection]:   P0  P1  P2  v3

{$UNDEF FunctionVariantXYZ}
end;

//==============================================================================

procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector2s; out Projection: TVMCLVector2s);
begin
// aligned and unaligned code is the same
VectorsProjection_2s_SSEau(Base,Vector,Projection);
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector3s; out Projection: TVMCLVector3s);
begin
// aligned and unaligned code is the same
VectorsProjection_3s_SSEau(Base,Vector,Projection);
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsProjection_4s_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsProjection_4s_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsProjectionXYZ_SSE(const Base,Vector: TVMCLVector4s; out Projection: TVMCLVector4s);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsProjectionXYZ_4s_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsProjectionXYZ_4s_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector2d; out Projection: TVMCLVector2d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsProjection_2d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsProjection_2d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector3d; out Projection: TVMCLVector3d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsProjection_3d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsProjection_3d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsProjection_SSE(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsProjection_4d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsProjection_4d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsProjectionXYZ_SSE(const Base,Vector: TVMCLVector4d; out Projection: TVMCLVector4d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsProjectionXYZ_4d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsProjectionXYZ_4d_SSEu

  @RoutineEnd:
end;

//==============================================================================

procedure VectorsOrthogonal_2s_SSEau(const Base,Vector: TVMCLVector2s; out Orthogonal: TVMCLVector2s);
asm
    // zero-out registers
    XORPS     XMM0, XMM0                        //  XMM0: 00  00  00  00
    XORPS     XMM1, XMM1                        //  XMM1: 00  00  00  00

    MOVLPS    XMM0, qword ptr [Base]            //  XMM0: 00  00  b1  b0
    MOVLPS    XMM1, qword ptr [Vector]          //  XMM1: 00  00  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: 00  00  v1  v0

    // projection                               //  XMM0: 00  00  P1  P0
  {$DEFINE VectorsProjection_2s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_2s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: 00  00  (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: 00  00  O1  O0

  @StoreResult:

    MOVLPS    qword ptr [Orthogonal], XMM0      //  [Orthogonal]:   O0  O1
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_3s_SSEau(const Base,Vector: TVMCLVector3s; out Orthogonal: TVMCLVector3s);
asm
    MOVSS     XMM0, dword ptr [Base]            //  XMM0: 00  00  00  b0
    MOVHPS    XMM0, qword ptr [Base + 4]        //  XMM0: b2  b1  00  b0
    MOVSS     XMM1, dword ptr [Vector]          //  XMM1: 00  00  00  v0
    MOVHPS    XMM1, qword ptr [Vector + 4]      //  XMM1: v2  v1  00  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: v2  v1  00  v0

    // projection                               //  XMM0: P2  P1  00  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: (v2 - P2)(O2) (v1 - P1)(O1) 00 (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: O2  O1  00  O0

  @StoreResult:

    MOVSS     dword ptr [Orthogonal], XMM0      //  [Orthogonal]:   O0
    MOVHPS    qword ptr [Orthogonal + 4], XMM0  //  [Orthogonal]:   O0  O1  O2
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_4s_SSEu(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s);
asm
    MOVUPS    XMM0, dqword ptr [Base]           //  XMM0: b3  b2  b1  b0
    MOVUPS    XMM1, dqword ptr [Vector]         //  XMM1: v3  v2  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: v3  v2  v1  v0

    // projection                               //  XMM0: P3  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: (v3 - P3)(O3) (v2 - P2)(O2) (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: O3  O2  O1  O0

  @StoreResult:

    MOVUPS    dqword ptr [Orthogonal], XMM0     //  [Orthogonal]:   O0  O1  O2  O3
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_4s_SSEa(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s);
asm
    MOVAPS    XMM0, dqword ptr [Base]           //  XMM0: b3  b2  b1  b0
    MOVAPS    XMM1, dqword ptr [Vector]         //  XMM1: v3  v2  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: v3  v2  v1  v0

    // projection                               //  XMM0: P3  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: (v3 - P3)(O3) (v2 - P2)(O2) (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: O3  O2  O1  O0

  @StoreResult:

    MOVAPS    dqword ptr [Orthogonal], XMM0     //  [Orthogonal]:   O0  O1  O2  O3
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonalXYZ_4s_SSEu(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s);
asm
{$DEFINE FunctionVariantXYZ}

    MOVUPS    XMM0, dqword ptr [Base]           //  XMM0: b3  b2  b1  b0
    MOVUPS    XMM1, dqword ptr [Vector]         //  XMM1: v3  v2  v1  v0

    // discard highest single of both input vectors
    PCMPEQD   XMM2, XMM2                        //  register XMM2 set to all ones
    PSRLDQ    XMM2, 4                           //  XMM2: 00  11  11  11
    ANDPS     XMM0, XMM2                        //  XMM0: 00  b2  b1  b0
    ANDPS     XMM1, XMM2                        //  XMM1: 00  v2  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: 00  v2  v1  v0

    // projection                               //  XMM0: 00  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: 00 (v2 - P2)(O2) (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: 00  O2  O1  O0

  @StoreResult:

    MOVUPS    dqword ptr [Orthogonal], XMM0     //  [Orthogonal]:   O0  O1  O2  00
    MOVSS     dword ptr [Orthogonal + 12], XMM5 //  [Orthogonal]:   O0  O1  O2  v3

{$UNDEF FunctionVariantXYZ}
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonalXYZ_4s_SSEa(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s);
asm
{$DEFINE FunctionVariantXYZ}

    // load vectors and discard highest single
    PCMPEQD   XMM0, XMM0                        //  register XMM0 set to all ones
    PSRLDQ    XMM0, 4                           //  XMM0: 00  11  11  11
    MOVAPS    XMM1, XMM0                        //  XMM1: 00  11  11  11
    ANDPS     XMM0, dqword ptr [Base]           //  XMM0: 00  b2  b1  b0
    ANDPS     XMM1, dqword ptr [Vector]         //  XMM1: 00  v2  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: 00  v2  v1  v0

    // projection                               //  XMM0: 00  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: 00 (v2 - P2)(O2) (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: 00  O2  O1  O0

  @StoreResult:

    MOVAPS    dqword ptr [Orthogonal], XMM0     //  [Orthogonal]:   O0  O1  O2  00
    MOVSS     dword ptr [Orthogonal + 12], XMM5 //  [Orthogonal]:   O0  O1  O2  v3

{$UNDEF FunctionVariantXYZ}
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_2d_SSEu(const Base,Vector: TVMCLVector2d; out Orthogonal: TVMCLVector2d);
asm
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVUPD    XMM1, dqword ptr [Vector]         //  XMM1: v1  v0

    MOVAPD    XMM4, XMM1                        //  XMM4: v1  v0

    // projection                               //  XMM0: P1  P0
  {$DEFINE VectorsProjection_2d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_2d_SSE}

    SUBPD     XMM4, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPD    XMM0, XMM4                        //  XMM0: O1  O0

  @StoreResult:

    MOVUPD    dqword ptr [Orthogonal], XMM0     //  [Orthogonal]:   O0  O1
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_2d_SSEa(const Base,Vector: TVMCLVector2d; out Orthogonal: TVMCLVector2d);
asm
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVAPD    XMM1, dqword ptr [Vector]         //  XMM1: v1  v0

    MOVAPD    XMM4, XMM1                        //  XMM4: v1  v0

    // projection                               //  XMM0: P1  P0
  {$DEFINE VectorsProjection_2d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_2d_SSE}

    SUBPD     XMM4, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPD    XMM0, XMM4                        //  XMM0: O1  O0

  @StoreResult:

    MOVAPD    dqword ptr [Orthogonal], XMM0     //  [Orthogonal]:   O0  O1
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_3d_SSEu(const Base,Vector: TVMCLVector3d; out Orthogonal: TVMCLVector3d);
asm
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    SUBPD     XMM2, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBSD     XMM3, XMM1                        //  XMM3: **  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM2                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM3                        //  XMM1: **  O2

  @StoreResult:

    MOVUPD    dqword ptr [Orthogonal], XMM0       //  [Orthogonal]:   O0  O1
    MOVSD     qword ptr [Orthogonal + 16],  XMM1  //  [Orthogonal]:   O0  O1  O2
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_3d_SSEa(const Base,Vector: TVMCLVector3d; out Orthogonal: TVMCLVector3d);
asm
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    SUBPD     XMM2, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBSD     XMM3, XMM1                        //  XMM3: **  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM2                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM3                        //  XMM1: **  O2

  @StoreResult:

    MOVAPD    dqword ptr [Orthogonal], XMM0       //  [Orthogonal]:   O0  O1
    MOVSD     qword ptr [Orthogonal + 16],  XMM1  //  [Orthogonal]:   O0  O1  O2
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_4d_SSEu(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d);
asm
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVUPD    XMM1, dqword ptr [Base + 16]      //  XMM1: b3  b2
    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVUPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: P3  P2
  {$DEFINE VectorsProjection_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4d_SSE}

    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVUPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    SUBPD     XMM2, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBSD     XMM3, XMM1                        //  XMM3: (v3 - P3)(O3)  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM2                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM3                        //  XMM1: O3  O2

  @StoreResult:

    MOVUPD    dqword ptr [Orthogonal], XMM0       //  [Orthogonal]:   O0  O1
    MOVUPD    dqword ptr [Orthogonal + 16],  XMM1 //  [Orthogonal]:   O0  O1  O2  O3
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_4d_SSEa(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d);
asm
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVAPD    XMM1, dqword ptr [Base + 16]      //  XMM1: b3  b2
    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVAPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: P3  P2
  {$DEFINE VectorsProjection_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4d_SSE}

    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVAPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    SUBPD     XMM2, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBPD     XMM3, XMM1                        //  XMM3: (v3 - P3)(O3)  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM2                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM3                        //  XMM1: O3  O2

  @StoreResult:

    MOVAPD    dqword ptr [Orthogonal], XMM0       //  [Orthogonal]:   O0  O1
    MOVAPD    dqword ptr [Orthogonal + 16],  XMM1 //  [Orthogonal]:   O0  O1  O2  O3
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonalXYZ_4d_SSEu(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d);
asm
{$DEFINE FunctionVariantXYZ}

    // highest entries are ignored
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

    MOVUPD    XMM3, dqword ptr [Vector]         //  XMM3: v1  v0
    MOVSD     XMM4, qword ptr [Vector + 16]     //  XMM4: 00  v2

    SUBPD     XMM3, XMM0                        //  XMM3: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBSD     XMM4, XMM1                        //  XMM4: **  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM3                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM4                        //  XMM1: **  O2

  @StoreResult:

    MOVUPD    dqword ptr [Orthogonal], XMM0         //  [Orthogonal]:   O0  O1
    MOVSD     qword ptr [Orthogonal + 16], XMM1     //  [Orthogonal]:   O0  O1  O2
    MOVSD     qword ptr [Orthogonal + 24], XMM5     //  [Orthogonal]:   O0  O1  O2  v3

{$UNDEF FunctionVariantXYZ}
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonalXYZ_4d_SSEa(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d);
asm
{$DEFINE FunctionVariantXYZ}

    // highest entries are ignored
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

    MOVAPD    XMM3, dqword ptr [Vector]         //  XMM3: v1  v0
    MOVSD     XMM4, qword ptr [Vector + 16]     //  XMM4: 00  v2

    SUBPD     XMM3, XMM0                        //  XMM3: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBSD     XMM4, XMM1                        //  XMM4: **  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM3                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM4                        //  XMM1: **  O2

  @StoreResult:

    MOVAPD    dqword ptr [Orthogonal], XMM0         //  [Orthogonal]:   O0  O1
    MOVSD     qword ptr [Orthogonal + 16], XMM1     //  [Orthogonal]:   O0  O1  O2
    MOVSD     qword ptr [Orthogonal + 24], XMM5     //  [Orthogonal]:   O0  O1  O2  v3

{$UNDEF FunctionVariantXYZ}
end;

//==============================================================================

procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector2s; out Orthogonal: TVMCLVector2s);
begin
// aligned and unaligned code is the same
VectorsOrthogonal_2s_SSEau(Base,Vector,Orthogonal);
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector3s; out Orthogonal: TVMCLVector3s);
begin
// aligned and unaligned code is the same
VectorsOrthogonal_3s_SSEau(Base,Vector,Orthogonal);
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthogonal_4s_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthogonal_4s_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonalXYZ_SSE(const Base,Vector: TVMCLVector4s; out Orthogonal: TVMCLVector4s);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthogonalXYZ_4s_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthogonalXYZ_4s_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector2d; out Orthogonal: TVMCLVector2d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthogonal_2d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthogonal_2d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector3d; out Orthogonal: TVMCLVector3d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthogonal_3d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthogonal_3d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonal_SSE(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthogonal_4d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthogonal_4d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthogonalXYZ_SSE(const Base,Vector: TVMCLVector4d; out Orthogonal: TVMCLVector4d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthogonalXYZ_4d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthogonalXYZ_4d_SSEu

  @RoutineEnd:
end;

//==============================================================================

procedure VectorsOrthonormal_2s_SSEau(const Base,Vector: TVMCLVector2s; out Orthonormal: TVMCLVector2s);
asm
    // zero-out registers
    XORPS     XMM0, XMM0                        //  XMM0: 00  00  00  00
    XORPS     XMM1, XMM1                        //  XMM1: 00  00  00  00

    MOVLPS    XMM0, qword ptr [Base]            //  XMM0: 00  00  b1  b0
    MOVLPS    XMM1, qword ptr [Vector]          //  XMM1: 00  00  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: 00  00  v1  v0

    // projection                               //  XMM0: 00  00  P1  P0
  {$DEFINE VectorsProjection_2s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_2s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: 00  00  (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: 00  00  O1  O0

    // normalize                                //  XMM0: 00  00  N1  N0
  {$DEFINE Normalize_2s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_2s_SSE}

  @StoreResult:

    MOVLPS    qword ptr [Orthonormal], XMM0     //  [Orthonormal]:    N0  N1
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_3s_SSEau(const Base,Vector: TVMCLVector3s; out Orthonormal: TVMCLVector3s);
asm
    MOVSS     XMM0, dword ptr [Base]            //  XMM0: 00  00  00  b0
    MOVHPS    XMM0, qword ptr [Base + 4]        //  XMM0: b2  b1  00  b0
    MOVSS     XMM1, dword ptr [Vector]          //  XMM1: 00  00  00  v0
    MOVHPS    XMM1, qword ptr [Vector + 4]      //  XMM1: v2  v1  00  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: v2  v1  00  v0

    // projection                               //  XMM0: P2  P1  00  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: (v2 - P2)(O2) (v1 - P1)(O1) 00 (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: O2  O1  00  O0

    // normalize                                //  XMM0: N2  N1  00  N0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

  @StoreResult:

    MOVSS     dword ptr [Orthonormal], XMM0     //  [Orthonormal]:    N0
    MOVHPS    qword ptr [Orthonormal + 4], XMM0 //  [Orthonormal]:    N0  N1  N2
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_4s_SSEu(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s);
asm
    MOVUPS    XMM0, dqword ptr [Base]           //  XMM0: b3  b2  b1  b0
    MOVUPS    XMM1, dqword ptr [Vector]         //  XMM1: v3  v2  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: v3  v2  v1  v0

    // projection                               //  XMM0: P3  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: (v3 - P3)(O3) (v2 - P2)(O2) (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: O3  O2  O1  O0

    // normalize                                //  XMM0: N3  N2  N1  N0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

  @StoreResult:

    MOVUPS    dqword ptr [Orthonormal], XMM0     //  [Orthonormal]:   N0  N1  N2  N3
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_4s_SSEa(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s);
asm
    MOVAPS    XMM0, dqword ptr [Base]           //  XMM0: b3  b2  b1  b0
    MOVAPS    XMM1, dqword ptr [Vector]         //  XMM1: v3  v2  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: v3  v2  v1  v0

    // projection                               //  XMM0: P3  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: (v3 - P3)(O3) (v2 - P2)(O2) (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: O3  O2  O1  O0

    // normalize                                //  XMM0: N3  N2  N1  N0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

  @StoreResult:

    MOVAPS    dqword ptr [Orthonormal], XMM0     //  [Orthonormal]:   N0  N1  N2  N3
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormalXYZ_4s_SSEu(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s);
asm
{$DEFINE FunctionVariantXYZ}

    MOVUPS    XMM0, dqword ptr [Base]           //  XMM0: b3  b2  b1  b0
    MOVUPS    XMM1, dqword ptr [Vector]         //  XMM1: v3  v2  v1  v0

    // discard highest single of both input vectors
    PCMPEQD   XMM2, XMM2                        //  register XMM2 set to all ones
    PSRLDQ    XMM2, 4                           //  XMM2: 00  11  11  11
    ANDPS     XMM0, XMM2                        //  XMM0: 00  b2  b1  b0
    ANDPS     XMM1, XMM2                        //  XMM1: 00  v2  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: 00  v2  v1  v0

    // projection                               //  XMM0: 00  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: 00 (v2 - P2)(O2) (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: 00  O2  O1  O0

    // normalize                                //  XMM0: 00  N2  N1  N0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

  @StoreResult:

    MOVUPS    dqword ptr [Orthonormal], XMM0     //  [Orthonormal]:   N0  N1  N2  00
    MOVSS     dword ptr [Orthonormal + 12], XMM5 //  [Orthonormal]:   N0  N1  N2  v3

{$UNDEF FunctionVariantXYZ}
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormalXYZ_4s_SSEa(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s);
asm
{$DEFINE FunctionVariantXYZ}

    // load vectors and discard highest single
    PCMPEQD   XMM0, XMM0                        //  register XMM0 set to all ones
    PSRLDQ    XMM0, 4                           //  XMM0: 00  11  11  11
    MOVAPS    XMM1, XMM0                        //  XMM1: 00  11  11  11
    ANDPS     XMM0, dqword ptr [Base]           //  XMM0: 00  b2  b1  b0
    ANDPS     XMM1, dqword ptr [Vector]         //  XMM1: 00  v2  v1  v0

    MOVAPS    XMM4, XMM1                        //  XMM4: 00  v2  v1  v0

    // projection                               //  XMM0: 00  P2  P1  P0
  {$DEFINE VectorsProjection_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4s_SSE}

    SUBPS     XMM4, XMM0                        //  XMM4: 00 (v2 - P2)(O2) (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPS    XMM0, XMM4                        //  XMM0: 00  O2  O1  O0

    // normalize                                //  XMM0: 00  N2  N1  N0
  {$DEFINE Normalize_4s_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4s_SSE}

  @StoreResult:

    MOVAPS    dqword ptr [Orthonormal], XMM0     //  [Orthonormal]:   N0  N1  N2  00
    MOVSS     dword ptr [Orthonormal + 12], XMM5 //  [Orthonormal]:   N0  N1  N2  v3

{$UNDEF FunctionVariantXYZ}
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_2d_SSEu(const Base,Vector: TVMCLVector2d; out Orthonormal: TVMCLVector2d);
asm
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVUPD    XMM1, dqword ptr [Vector]         //  XMM1: v1  v0

    MOVAPD    XMM4, XMM1                        //  XMM4: v1  v0

    // projection                               //  XMM0: P1  P0
  {$DEFINE VectorsProjection_2d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_2d_SSE}

    SUBPD     XMM4, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPD    XMM0, XMM4                        //  XMM0: O1  O0

    // normalize                                //  XMM0: N1  N0
  {$DEFINE Normalize_2d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_2d_SSE}

  @StoreResult:

    MOVUPD    dqword ptr [Orthonormal], XMM0     //  [Orthonormal]:   N0  N1
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_2d_SSEa(const Base,Vector: TVMCLVector2d; out Orthonormal: TVMCLVector2d);
asm
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVAPD    XMM1, dqword ptr [Vector]         //  XMM1: v1  v0

    MOVAPD    XMM4, XMM1                        //  XMM4: v1  v0

    // projection                               //  XMM0: P1  P0
  {$DEFINE VectorsProjection_2d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_2d_SSE}

    SUBPD     XMM4, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    MOVAPD    XMM0, XMM4                        //  XMM0: O1  O0

    // normalize                                //  XMM0: N1  N0
  {$DEFINE Normalize_2d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_2d_SSE}

  @StoreResult:

    MOVAPD    dqword ptr [Orthonormal], XMM0    //  [Orthonormal]:   N0  N1
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_3d_SSEu(const Base,Vector: TVMCLVector3d; out Orthonormal: TVMCLVector3d);
asm
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    SUBPD     XMM2, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBSD     XMM3, XMM1                        //  XMM3: **  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM2                        //  XMM0: O1  O0
    XORPD     XMM1, XMM1                        //  XMM1: 00  00
    MOVSD    XMM1, XMM3                         //  XMM1: 00  O2

    // normalize                                //  XMM0: N1  N0
                                                //  XMM1: **  N2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

  @StoreResult:

    MOVUPD    dqword ptr [Orthonormal], XMM0        //  [Orthonormal]:  N0  N1
    MOVSD     qword ptr [Orthonormal + 16],  XMM1   //  [Orthonormal]:  N0  N1  N2
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_3d_SSEa(const Base,Vector: TVMCLVector3d; out Orthonormal: TVMCLVector3d);
asm
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    SUBPD     XMM2, XMM0                        //  XMM4: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBSD     XMM3, XMM1                        //  XMM3: **  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM2                        //  XMM0: O1  O0
    XORPD     XMM1, XMM1                        //  XMM1: 00  00
    MOVSD     XMM1, XMM3                        //  XMM1: 00  O2

    // normalize                                //  XMM0: N1  N0
                                                //  XMM1: **  N2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

  @StoreResult:

    MOVAPD    dqword ptr [Orthonormal], XMM0        //  [Orthonormal]:  N0  N1
    MOVSD     qword ptr [Orthonormal + 16],  XMM1   //  [Orthonormal]:  N0  N1  N2
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_4d_SSEu(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d);
asm
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVUPD    XMM1, dqword ptr [Base + 16]      //  XMM1: b3  b2
    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVUPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: P3  P2
  {$DEFINE VectorsProjection_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4d_SSE}

    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVUPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    SUBPD     XMM2, XMM0                        //  XMM4: (v1 - P1)(O1)  (v0 - P0)(O0)
    SUBPD     XMM3, XMM1                        //  XMM3: (v3 - P3)(O3)  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM2                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM3                        //  XMM1: O3  O2

    // normalize                                //  XMM0: N1  N0
                                                //  XMM1: N3  N2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

  @StoreResult:

    MOVUPD    dqword ptr [Orthonormal], XMM0        //  [Orthonormal]:  N0  N1
    MOVUPD    dqword ptr [Orthonormal + 16],  XMM1  //  [Orthonormal]:  N0  N1  N2  N3
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_4d_SSEa(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d);
asm
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVAPD    XMM1, dqword ptr [Base + 16]      //  XMM1: b3  b2
    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVAPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: P3  P2
  {$DEFINE VectorsProjection_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_4d_SSE}

    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVAPD    XMM3, dqword ptr [Vector + 16]    //  XMM3: v3  v2

    SUBPD     XMM2, XMM0                        //  XMM4: (v1 - P1)(O1)  (v0 - P0)(O0)
    SUBPD     XMM3, XMM1                        //  XMM3: (v3 - P3)(O3)  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM2                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM3                        //  XMM1: O3  O2

    // normalize                                //  XMM0: N1  N0
                                                //  XMM1: N3  N2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}

  @StoreResult:

    MOVAPD    dqword ptr [Orthonormal], XMM0        //  [Orthonormal]:  N0  N1
    MOVAPD    dqword ptr [Orthonormal + 16],  XMM1  //  [Orthonormal]:  N0  N1  N2  N3
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormalXYZ_4d_SSEu(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d);
asm
{$DEFINE FunctionVariantXYZ}

    // highest entries are ignored
    MOVUPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVUPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

    MOVUPD    XMM3, dqword ptr [Vector]         //  XMM3: v1  v0
    MOVSD     XMM4, qword ptr [Vector + 16]     //  XMM4: 00  v2

    SUBPD     XMM3, XMM0                        //  XMM3: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBSD     XMM4, XMM1                        //  XMM4: 00  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM3                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM4                        //  XMM1: 00  O2

    // normalize                                //  XMM0: N1  N0
                                                //  XMM1: **  N2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}    

  @StoreResult:

    MOVUPD    dqword ptr [Orthonormal], XMM0        //  [Orthonormal]:  N0  N1
    MOVSD     qword ptr [Orthonormal + 16], XMM1    //  [Orthonormal]:  N0  N1  N2
    MOVSD     qword ptr [Orthonormal + 24], XMM5    //  [Orthonormal]:  N0  N1  N2  v3

{$UNDEF FunctionVariantXYZ}
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormalXYZ_4d_SSEa(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d);
asm
{$DEFINE FunctionVariantXYZ}

    // highest entries are ignored
    MOVAPD    XMM0, dqword ptr [Base]           //  XMM0: b1  b0
    MOVSD     XMM1, qword ptr [Base + 16]       //  XMM1: 00  b2
    MOVAPD    XMM2, dqword ptr [Vector]         //  XMM2: v1  v0
    MOVSD     XMM3, qword ptr [Vector + 16]     //  XMM3: 00  v2

    // projection                               //  XMM0: P1  P0
                                                //  XMM1: **  P2
  {$DEFINE VectorsProjection_3d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF VectorsProjection_3d_SSE}

    MOVAPD    XMM3, dqword ptr [Vector]         //  XMM3: v1  v0
    MOVSD     XMM4, qword ptr [Vector + 16]     //  XMM4: 00  v2

    SUBPD     XMM3, XMM0                        //  XMM3: (v1 - P1)(O1) (v0 - P0)(O0)
    SUBSD     XMM4, XMM1                        //  XMM4: 00  (v2 - P2)(O2)

    MOVAPD    XMM0, XMM3                        //  XMM0: O1  O0
    MOVAPD    XMM1, XMM4                        //  XMM1: 00  O2

    // normalize                                //  XMM0: N1  N0
                                                //  XMM1: **  N2
  {$DEFINE Normalize_4d_SSE}{$INCLUDE 'VMCL_Vectors_SSE.inc'}{$UNDEF Normalize_4d_SSE}    

  @StoreResult:

    MOVAPD    dqword ptr [Orthonormal], XMM0        //  [Orthonormal]:  N0  N1
    MOVSD     qword ptr [Orthonormal + 16], XMM1    //  [Orthonormal]:  N0  N1  N2
    MOVSD     qword ptr [Orthonormal + 24], XMM5    //  [Orthonormal]:  N0  N1  N2  v3

{$UNDEF FunctionVariantXYZ}
end;

//==============================================================================

procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector2s; out Orthonormal: TVMCLVector2s);
begin
// aligned and unaligned code is the same
VectorsOrthonormal_2s_SSEau(Base,Vector,Orthonormal);
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector3s; out Orthonormal: TVMCLVector3s);
begin
// aligned and unaligned code is the same
VectorsOrthonormal_3s_SSEau(Base,Vector,Orthonormal);
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthonormal_4s_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthonormal_4s_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormalXYZ_SSE(const Base,Vector: TVMCLVector4s; out Orthonormal: TVMCLVector4s);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthonormalXYZ_4s_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthonormalXYZ_4s_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector2d; out Orthonormal: TVMCLVector2d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthonormal_2d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthonormal_2d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector3d; out Orthonormal: TVMCLVector3d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthonormal_3d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthonormal_3d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormal_SSE(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthonormal_4d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthonormal_4d_SSEu

  @RoutineEnd:
end;

//------------------------------------------------------------------------------

procedure VectorsOrthonormalXYZ_SSE(const Base,Vector: TVMCLVector4d; out Orthonormal: TVMCLVector4d);
asm
  {$DEFINE CheckMemAlign16_3}{$INCLUDE 'VMCL_Common_SSE.inc'}{$UNDEF CheckMemAlign16_3}

    JNZ   @Unaligned

  @Aligned:
    CALL  VectorsOrthonormalXYZ_4d_SSEa
    JMP   @RoutineEnd

  @Unaligned:
    CALL  VectorsOrthonormalXYZ_4d_SSEu

  @RoutineEnd:
end;

//==============================================================================

{$IFDEF ASMSuppressSizeWarnings}
  {$WARN 2087 OFF}
  {$WARN 7121 ON}
  {$WARN 7122 ON}
  {$WARN 2087 ON}
{$ENDIF}

{$ENDIF PurePascal}

end.
