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

//==============================================================================

procedure QuickTest;
const
  RepCount = 100000000;
  TestCount = 2000000;
(*  
var
  StartCnt: Int64;
  EndCnt:   Int64;
  nSSECnt:  Int64;
  i:        Integer;
  mat1:     TMatrix4RMs;
  mat2:     TMatrix4RMs;

  m4s1, m4s2: PMatrix4RMs;
  i:          Integer;
  EmptyTicks: Int64;
  Ticks:      Int64;
  nSSETicks:  Int64;
  sVal:       Single;
  FuncPAS_2s: Function(const Matrix: TMatrix4RMs; Scalar: Single): TMatrix4RMs;
  FuncASM_2s: procedure(const Matrix: TMatrix4RMs; Scalar: Single; out Product: TMatrix4RMs);
*)  
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
(*
FuncPAS_2s := VMCL_Matrices.ScalarMultiply;
FuncASM_2s := VMCL_Matrices_SSE.ScalarMultiply_SSE;
VMCL_New(m4s1); VMCL_New(m4s2);
try
  sVal := Random(100);
  RandomMat(m4s1^); RandomMat(m4s2^);
  // get average empty call ticks
  WriteLn;
  EmptyTicks := 0;
  PrecisionTest.FunctionAddr := nil;
  For i := 1 to TestCount do
    begin
      Vector_SpeedTestCaller_Empty;
      EmptyTicks := EmptyTicks + PrecisionTestsTicks(PrecisionTest);
    end;
  EmptyTicks := EmptyTicks div TestCount;
  WriteLn('Empty call ticks: ',EmptyTicks);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  WriteLn;
  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncPAS_2s);
  Write('m4d -> m4s @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^);
      Vector_SpeedTestCaller_1P1S1P_R(m4s1,sVal,m4s2);
      If not SameMatrices(m4s2^,ScalarMultiply(m4s1^,sVal),1e-6) then
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
  Write(Format('m4d -> m4s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4s1,m4s2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^);
      Vector_SpeedTestCaller_1P1S1P(m4s1,sVal,m4s2);
      If not SameMatrices(m4s2^,ScalarMultiply(m4s1^,sVal),1e-6) then
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
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;
finally
  VMCL_Dispose(m4s1); VMCL_Dispose(m4s2);
end;
*)
end;

Function Matrices_SSE_Main(AutoTest: Boolean = False): Integer;
begin
QuickTest;
repeat
  Result := Select('Matrices SSE test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [],

    [],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
