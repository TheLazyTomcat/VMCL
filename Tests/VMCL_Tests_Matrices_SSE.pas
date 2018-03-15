unit VMCL_Tests_Matrices_SSE;

{$INCLUDE '..\VMCL_defs.inc'}

interface

Function Matrices_SSE_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  SysUtils, Windows,
  VMCL_Common, VMCL_Alloc, VMCL_Matrices, VMCL_Matrices_SSE,
  VMCL_Tests_Common;

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

procedure Vector_SpeedTestCaller_2P(A,B: Pointer); register; assembler;
asm
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
end;

//--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --

procedure Vector_SpeedTestCaller_2P_R(A,B: Pointer); register; assembler;
asm
{$IFDEF x64}
    XCHG  A, B    // A = orig B   B = orig A
{$ENDIF}
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
end;

//------------------------------------------------------------------------------

// testing routines
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionRM_SSE_Man.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionCM_SSE_Man.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionRM_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionCM_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionRM_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionCM_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionRM_SSE_Prec.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionCM_SSE_Prec.inc'}

{$INCLUDE '.\test_routines_mat_sse\Matrix_TransposeRM_SSE_Prec.inc'}

//==============================================================================

procedure QuickTest;
const
  RepCount = 100000000;
var
  StartCnt: Int64;
  EndCnt:   Int64;
  nSSECnt:  Int64;
  i:        Integer;
  mat1:     TMatrix4RMs;
  mat2:     TMatrix4RMs;
begin
// check validity
RandomMat(mat1); RandomMat(mat2);
WriteLn(MatToStr(mat1));
WriteLn('nSSE: '); WriteLn(MatToStr(Transposed(mat1)));
Transpose_SSE(mat1,mat2);
WriteLn(' SSE: '); WriteLn(MatToStr(mat2));
// non-sse call
QueryPerformanceCounter({%H-}StartCnt);
For i := 1 to RepCount do
  begin
    mat2 := Transposed(mat1);
  end;
QueryPerformanceCounter({%H-}EndCnt);
WriteLn('nSSE: ',EndCnt - StartCnt);
nSSECnt := EndCnt - StartCnt;
// sse call
QueryPerformanceCounter(StartCnt);
For i := 1 to RepCount do
  begin
    Transpose_SSE(mat1,mat2);
  end;
QueryPerformanceCounter(EndCnt);
Write(' SSE: ',EndCnt - StartCnt);
WriteLn(' (t: ',Format('%.2f',[(EndCnt - StartCnt) / nSSECnt]),
        ', s: ',Format('%.0f',[(1/((EndCnt - StartCnt) / nSSECnt)) * 100]),'%)');
end;

Function Matrices_SSE_Main(AutoTest: Boolean = False): Integer;
begin
//QuickTest;
repeat
  Result := Select('Matrices SSE test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Matrix_PrecisionConversionRM_SSE_Man,Matrix_PrecisionConversionCM_SSE_Man,
     Matrix_PrecisionConversionRM_SSE_Auto,Matrix_PrecisionConversionCM_SSE_Auto,
     Matrix_PrecisionConversionRM_SSE_Spd,Matrix_PrecisionConversionCM_SSE_Spd,
     Matrix_PrecisionConversionRM_SSE_Prec,Matrix_PrecisionConversionCM_SSE_Prec,

     Matrix_TransposeRM_SSE_Prec],

    ['PrecConversion (RM) - Man','PrecConversion (CM) - Man','PrecConversion (RM) - Auto','PrecConversion (CM) - Auto',
     'PrecConversion (RM) - Spd','PrecConversion (CM) - Spd','PrecConversion (RM) - Prec','PrecConversion (CM) - Prec',

     'Transpose (CM) - Prec'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
