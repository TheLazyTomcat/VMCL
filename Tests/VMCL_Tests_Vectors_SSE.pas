unit VMCL_Tests_Vectors_SSE;

{$INCLUDE '..\VMCL_defs.inc'}

interface

Function Vectors_SSE_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  SysUtils, Windows,
  VMCL_Tests_Common,
  VMCL_Common, VMCL_Alloc, VMCL_Vectors, VMCL_Vectors_SSE;

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
//loadzerovector(vec1); 
WriteLn('nSSE: ',VecToStr(VectorsNormal(vec1,vec2)));
VectorsNormal_SSE(vec1,vec2,vec3);
WriteLn(' SSE: ',VecToStr(vec3));
// non-sse call
QueryPerformanceCounter({%H-}StartCnt);
For i := 1 to RepCount do
  begin
    vec3 := VectorsNormal(vec1,vec2);
  end;
QueryPerformanceCounter({%H-}EndCnt);
WriteLn('nSSE: ',EndCnt - StartCnt);
nSSECnt := EndCnt - StartCnt;
// sse call
QueryPerformanceCounter(StartCnt);
For i := 1 to RepCount do
  begin
    VectorsNormal_SSE(vec1,vec2,vec3);
  end;
QueryPerformanceCounter(EndCnt);
Write(' SSE: ',EndCnt - StartCnt);
WriteLn(' (t: ',Format('%.2f',[(EndCnt - StartCnt) / nSSECnt]),
        ', s: ',Format('%.0f',[(1/((EndCnt - StartCnt) / nSSECnt)) * 100]),'%)');
end;

// testing routines
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsNormal_SSE_Man.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsNormal_SSE_Auto.inc'}
{$INCLUDE '.\test_routines_vec_sse\Vector_VectorsNormal_SSE_Spd.inc'}

//==============================================================================

Function Vectors_SSE_Main(AutoTest: Boolean = False): Integer;
begin
//QuickTest;
repeat
  Result := Select('Vectors SSE test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Vector_VectorsNormal_SSE_Man,Vector_VectorsNormal_SSE_Auto,Vector_VectorsNormal_SSE_Spd],

    ['VectorsNormal_SSE - Man','VectorsNormal_SSE - Auto','VectorsNormal_SSE - Spd'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
