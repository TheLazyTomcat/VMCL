unit VMCL_Tests_Vectors_SSE;

{$INCLUDE '..\VMCL_defs.inc'}

interface

Function Vectors_SSE_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  SysUtils, Windows,
  VMCL_Tests_Common, vmcl_common,
  VMCL_Vectors, VMCL_Vectors_SSE;

procedure QuickTest;
const
  RepCount = 10000000;
var
  StartCnt: Int64;
  EndCnt:   Int64;
  nSSECnt:  Int64;
  i:        Integer;
  vec1:     TVector4d;
  vec2:     TVector4d;
  vec3:     TVector4d;
begin
// check validity
RandomVec(vec1); RandomVec(vec2);
WriteLn(VecToStr(vec1));
WriteLn(VecToStr(vec2));
WriteLn('nSSE: ',VecToStr(VectorsProjectionXYZ(vec1,vec2)));
VectorsProjectionXYZ_SSE(vec1,vec2,vec3);
WriteLn(' SSE: ',VecToStr(vec3));
// non-sse call
QueryPerformanceCounter({%H-}StartCnt);
For i := 1 to RepCount do
  begin
    vec3 := VectorsProjectionXYZ(vec1,vec2);
  end;
QueryPerformanceCounter({%H-}EndCnt);
WriteLn('nSSE: ',EndCnt - StartCnt);
nSSECnt := EndCnt - StartCnt;
// sse call
QueryPerformanceCounter(StartCnt);
For i := 1 to RepCount do
  begin
    VectorsProjectionXYZ_SSE(vec1,vec2,vec3);
  end;
QueryPerformanceCounter(EndCnt);
Write(' SSE: ',EndCnt - StartCnt);
WriteLn(' (t: ',Format('%.2f',[(EndCnt - StartCnt) / nSSECnt]),
        ', s: ',Format('%.0f',[(1/((EndCnt - StartCnt) / nSSECnt)) * 100]),'%)');
end;

// testing routines

//==============================================================================

Function Vectors_SSE_Main(AutoTest: Boolean = False): Integer;
begin
QuickTest;
repeat
  Result := Select('Vectors SSE test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [],

    [],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
