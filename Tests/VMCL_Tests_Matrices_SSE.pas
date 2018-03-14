unit VMCL_Tests_Matrices_SSE;

{$INCLUDE '..\VMCL_defs.inc'}

interface

Function Matrices_SSE_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  SysUtils, Windows,
  VMCL_Alloc, VMCL_Matrices, VMCL_Matrices_SSE,
  VMCL_Tests_Common;

// testing routines
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionRM_SSE_Man.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_PrecisionConversionCM_SSE_Man.inc'}

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
  mat2:     TMatrix4RMd;
begin
// check validity
RandomMat(mat1); RandomMat(mat2);
WriteLn(MatToStr(mat1));
WriteLn('nSSE: '); WriteLn(MatToStr(Matrix4d(mat1)));
PrecisionConversion_SSE(mat1,mat2);
WriteLn(' SSE: '); WriteLn(MatToStr(mat2));
// non-sse call
QueryPerformanceCounter({%H-}StartCnt);
For i := 1 to RepCount do
  begin
    mat2 := Matrix4d(mat1);
  end;
QueryPerformanceCounter({%H-}EndCnt);
WriteLn('nSSE: ',EndCnt - StartCnt);
nSSECnt := EndCnt - StartCnt;
// sse call
QueryPerformanceCounter(StartCnt);
For i := 1 to RepCount do
  begin
    PrecisionConversion_SSE(mat1,mat2);
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

    [Matrix_PrecisionConversionRM_SSE_Man,Matrix_PrecisionConversionCM_SSE_Man],

    ['PrecConversion (RM) - Man','PrecConversion (CM) - Man'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
