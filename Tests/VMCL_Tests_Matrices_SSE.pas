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

procedure Matrix_SpeedTestCaller_Empty; register; assembler;
asm
{$DEFINE EmptyCall}
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
{$UNDEF EmptyCall}
end;

//--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --

procedure Matrix_SpeedTestCaller_3P(A,B,C: Pointer); register; assembler;
asm
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
end;

//--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --

procedure Matrix_SpeedTestCaller_3P_R(A,B,C: Pointer); register; assembler;
asm
{$IFDEF x64}
    XCHG  A, C    // A = orig C   C = orig A
    XCHG  B, C    // B = orig A   C = orig B
{$ENDIF}
{$DEFINE SpeedTestCaller}{$INCLUDE 'VMCL_Tests_ASM.inc'}{$UNDEF SpeedTestCaller}
end;

//------------------------------------------------------------------------------

// testing routines
{$INCLUDE '.\test_routines_mat_sse\Matrix_MatricesMultiplyRM_SSE_Man.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_MatricesMultiplyCM_SSE_Man.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_MatricesMultiplyRM_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_MatricesMultiplyCM_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_MatricesMultiplyRM_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_MatricesMultiplyCM_SSE_Spd.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_MatricesMultiplyRM_SSE_Prec.inc'}
{$INCLUDE '.\test_routines_mat_sse\Matrix_MatricesMultiplyCM_SSE_Prec.inc'}

//==============================================================================

procedure QuickTest;
const
  TestCount = 1000000;
var
  m4s1,m4s2,m4s3: PMatrix4CMd;
  i:          Integer;
  EmptyTicks: Int64;
  Ticks:      Int64;
  nSSETicks:  Int64;
  FuncPAS_2s: Function(const aMatrix,bMatrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd;
  FuncASM_2s: procedure(const aMatrix,bMatrix: TVMCLMatrix4CMd; out Product: TVMCLMatrix4CMd);

begin
// check validity
(*
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
*)

FuncPAS_2s := VMCL_Matrices.MatricesMultiply;
FuncASM_2s := VMCL_Matrices_SSE.MatricesMultiply_SSE;
VMCL_New(m4s1); VMCL_New(m4s2); VMCL_New(m4s3);
try
  // get average empty call ticks
  WriteLn;
  EmptyTicks := 0;
  PrecisionTest.FunctionAddr := nil;
  For i := 1 to TestCount do
    begin
      Matrix_SpeedTestCaller_Empty;
      EmptyTicks := EmptyTicks + PrecisionTestsTicks(PrecisionTest);
    end;
  EmptyTicks := EmptyTicks div TestCount;
  WriteLn('Empty call ticks: ',EmptyTicks);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  WriteLn;
  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncPAS_2s);
  Write('m4s @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^); RandomMat(m4s3^);
      Matrix_SpeedTestCaller_3P_R(m4s1,m4s2,m4s3);
      If not SameMatrices(m4s3^,MatricesMultiply(m4s1^,m4s2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%d (%d)',[Ticks - EmptyTicks,Ticks]));
    end;
  nSSETicks := Ticks - EmptyTicks;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncASM_2s);
  Write(Format('m4s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4s1,m4s2,m4s2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^); RandomMat(m4s3^);
      Matrix_SpeedTestCaller_3P(m4s1,m4s2,m4s3);
      If not SameMatrices(m4s3^,MatricesMultiply(m4s1^,m4s2^),1e-6) then
        begin
          WriteLn('Error');
          WriteLn(MatToStr(m4s1^)); WriteLn;
          WriteLn(MatToStr(m4s2^)); WriteLn;
          WriteLn(MatToStr(m4s3^)); WriteLn;
          WriteLn(MatToStr(MatricesMultiply(m4s1^,m4s2^)));
          PrintSSERegisters_Double;
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;
finally
  VMCL_Dispose(m4s1); VMCL_Dispose(m4s2); VMCL_Dispose(m4s3);
end;

end;

Function Matrices_SSE_Main(AutoTest: Boolean = False): Integer;
begin
//QuickTest;
repeat
  Result := Select('Matrices SSE test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Matrix_MatricesMultiplyRM_SSE_Man,Matrix_MatricesMultiplyCM_SSE_Man,Matrix_MatricesMultiplyRM_SSE_Auto,Matrix_MatricesMultiplyCM_SSE_Auto,
     Matrix_MatricesMultiplyRM_SSE_Spd,Matrix_MatricesMultiplyCM_SSE_Spd,Matrix_MatricesMultiplyRM_SSE_Prec,Matrix_MatricesMultiplyCM_SSE_Prec],

    ['MatricesMultiply (RM) - Man','MatricesMultiply (CM) - Man','MatricesMultiply (RM) - Auto','MatricesMultiply (CM) - Auto',
     'MatricesMultiply (RM) - Spd','MatricesMultiply (CM) - Spd','MatricesMultiply (RM) - Prec','MatricesMultiply (CM) - Prec'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
