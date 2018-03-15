unit VMCL_Tests_Vectors_SSE;

{$INCLUDE '..\VMCL_defs.inc'}

interface

Function Vectors_SSE_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  SysUtils, Windows, Math,
  VMCL_Tests_Common,
  VMCL_Common, VMCL_Alloc, VMCL_Vectors, VMCL_Vectors_SSE;

//- Helpers for high-precision speed tests -------------------------------------
var
  PrecisionTest:  TVMCLPrecisionTests;

procedure Vector_SpeedTestCaller_Empty; register; assembler;
asm
{$DEFINE EmptyCall}
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
{$UNDEF EmptyCall}
end;

//--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --

procedure Vector_SpeedTestCaller_3P(A,B,C: Pointer); register; assembler;
asm
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
end;

//--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --

procedure Vector_SpeedTestCaller_3P_R(A,B,C: Pointer); register; assembler;
asm
{$IFDEF x64}
    XCHG  A, C    // A = orig C   C = orig A
    XCHG  B, C    // B = orig A   C = orig B
{$ENDIF}
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
end;

//--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --

Function Vector_SpeedTestCaller_2P_S(A,B: Pointer): Single; register; assembler;
asm
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
end;

//--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --

Function Vector_SpeedTestCaller_2P_D(A,B: Pointer): Double; register; assembler;
asm
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
end;

//------------------------------------------------------------------------------

// testing routines
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsNormal_SSE_Man.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsNormal_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsNormal_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsNormal_SSE_Prec.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsAntinormal_SSE_Man.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsAntinormal_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsAntinormal_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsAntinormal_SSE_Prec.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsAngleRad_SSE_Man.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsAngleRad_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsAngleRad_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsAngleRad_SSE_Prec.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsProjection_SSE_Man.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsProjection_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsProjection_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsProjection_SSE_Prec.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsOrthogonal_SSE_Man.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsOrthogonal_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsOrthogonal_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsOrthogonal_SSE_Prec.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsOrthonormal_SSE_Man.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsOrthonormal_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsOrthonormal_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsOrthonormal_SSE_Prec.inc'}

//==============================================================================

Function Vectors_SSE_Main(AutoTest: Boolean = False): Integer;
begin
repeat
  Result := Select('Vectors SSE test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Vector_VectorsNormal_SSE_Man,Vector_VectorsNormal_SSE_Auto,Vector_VectorsNormal_SSE_Spd,Vector_VectorsNormal_SSE_Prec,
     Vector_VectorsAntinormal_SSE_Man,Vector_VectorsAntinormal_SSE_Auto,Vector_VectorsAntinormal_SSE_Spd,Vector_VectorsAntinormal_SSE_Prec,
     Vector_VectorsAngleRad_SSE_Man,Vector_VectorsAngleRad_SSE_Auto,Vector_VectorsAngleRad_SSE_Spd,Vector_VectorsAngleRad_SSE_Prec,
     Vector_VectorsProjection_SSE_Man,Vector_VectorsProjection_SSE_Auto,Vector_VectorsProjection_SSE_Spd,Vector_VectorsProjection_SSE_Prec,
     Vector_VectorsOrthogonal_SSE_Man,Vector_VectorsOrthogonal_SSE_Auto,Vector_VectorsOrthogonal_SSE_Spd,Vector_VectorsOrthogonal_SSE_Prec,
     Vector_VectorsOrthonormal_SSE_Man,Vector_VectorsOrthonormal_SSE_Auto,Vector_VectorsOrthonormal_SSE_Spd,Vector_VectorsOrthonormal_SSE_Prec],

    ['VectorsNormal - Man','VectorsNormal - Auto','VectorsNormal - Spd','VectorsNormal - Prec',
     'VectorsAntinormal - Man','VectorsAntinormal - Auto','VectorsAntinormal - Spd','VectorsAntinormal - Prec',
     'VectorsAngleRad - Man','VectorsAngleRad - Auto','VectorsAngleRad - Spd','VectorsAngleRad - Prec',
     'VectorsProjection - Man','VectorsProjection - Auto','VectorsProjection - Spd','VectorsProjection - Prec',
     'VectorsOrthogonal - Man','VectorsOrthogonal - Auto','VectorsOrthogonal - Spd','VectorsOrthogonal - Prec',
     'VectorsOrthonormal - Man','VectorsOrthonormal - Auto','VectorsOrthonormal - Spd','VectorsOrthonormal - Prec'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
