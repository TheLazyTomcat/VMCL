Function Vector_VectorsAngleRad_SSE_Spd({%H-}AutoTest: Boolean = False): Integer;
const
  RepeatCount = 5000000;
var
  v2s1,v2s2:  PVMCLVector2s;
  v3s1,v3s2:  PVMCLVector3s;
  v4s1,v4s2:  PVMCLVector4s;
  v2d1,v2d2:  PVMCLVector2d;
  v3d1,v3d2:  PVMCLVector3d;
  v4d1,v4d2:  PVMCLVector4d;
  sRes:       Single;
  dRes:       Double;
  i:          Integer;
  Freq:       Int64;
  StartCnt:   Int64;
  StopCnt:    Int64;
  nSSECnt:    Int64;
begin
QueryPerformanceFrequency({%H-}Freq);
WriteLn;
WriteLn(LineText('VectorsAngleRad_SSE - Speed tests'));
WriteLn;
WriteLn(RepeatCount,' cycles');
VMCL_New(v2s1); VMCL_New(v2s2);
VMCL_New(v3s1); VMCL_New(v3s2);
VMCL_New(v4s1); VMCL_New(v4s2);
VMCL_New(v2d1); VMCL_New(v2d2);
VMCL_New(v3d1); VMCL_New(v3d2);
VMCL_New(v4d1); VMCL_New(v4d2);
try
  RandomVec(v2s1^); RandomVec(v2s2^);
  RandomVec(v3s1^); RandomVec(v3s2^);
  RandomVec(v4s1^); RandomVec(v4s2^);
  RandomVec(v2d1^); RandomVec(v2d2^);
  RandomVec(v3d1^); RandomVec(v3d2^);
  RandomVec(v4d1^); RandomVec(v4d2^);
  WriteLn;
  Write('v2s @ nonSSE: ');
  QueryPerformanceCounter({%H-}StartCnt);
  For i := 1 to RepeatCount do
    sRes := VectorsAngleRad(v2s1^,v2s2^);
  QueryPerformanceCounter({%H-}StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v2s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(v2s1,v2s2),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_SSE(v2s1^,v2s2^,sRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v2s @ SSEua:  ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_2s_SSEua(v2s1^,v2s2^,sRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('v3s @ nonSSE: ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    sRes := VectorsAngleRad(v3s1^,v3s2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v3s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(v3s1,v3s2),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_SSE(v3s1^,v3s2^,sRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v3s @ SSEua:  ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_3s_SSEua(v3s1^,v3s2^,sRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('v4s @ nonSSE: ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    sRes := VectorsAngleRad(v4s1^,v4s2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v4s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(v4s1,v4s2),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_SSE(v4s1^,v4s2^,sRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4s @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_4s_SSEu(v4s1^,v4s2^,sRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4s @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_4s_SSEa(v4s1^,v4s2^,sRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('v2d @ nonSSE: ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    dRes := VectorsAngleRad(v2d1^,v2d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v2d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(v2d1,v2d2),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_SSE(v2d1^,v2d2^,dRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v2d @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_2d_SSEu(v2d1^,v2d2^,dRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v2d @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_2d_SSEa(v2d1^,v2d2^,dRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('v3d @ nonSSE: ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    dRes := VectorsAngleRad(v3d1^,v3d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v3d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(v3d1,v3d2),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_SSE(v3d1^,v3d2^,dRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v3d @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_3d_SSEu(v3d1^,v3d2^,dRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v3d @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_3d_SSEa(v3d1^,v3d2^,dRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('v4d @ nonSSE: ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    dRes := VectorsAngleRad(v4d1^,v4d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v4d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(v4d1,v4d2),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_SSE(v4d1^,v4d2^,dRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4d @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_4d_SSEu(v4d1^,v4d2^,dRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4d @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsAngleRad_4d_SSEa(v4d1^,v4d2^,dRes);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
finally
  VMCL_Dispose(v2s1); VMCL_Dispose(v2s2);
  VMCL_Dispose(v3s1); VMCL_Dispose(v3s2);
  VMCL_Dispose(v4s1); VMCL_Dispose(v4s2);
  VMCL_Dispose(v2d1); VMCL_Dispose(v2d2);
  VMCL_Dispose(v3d1); VMCL_Dispose(v3d2);
  VMCL_Dispose(v4d1); VMCL_Dispose(v4d2);
end;
Result := 0;
end;
