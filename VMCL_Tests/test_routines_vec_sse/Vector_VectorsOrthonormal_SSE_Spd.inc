Function Vector_VectorsOrthonormal_SSE_Spd(AutoTest: Boolean = False): Integer;
const
  RepeatCount = 20000000;
var
  v2s1,v2s2,v2s3: PVMCLVector2s;
  v3s1,v3s2,v3s3: PVMCLVector3s;
  v4s1,v4s2,v4s3: PVMCLVector4s;
  v2d1,v2d2,v2d3: PVMCLVector2d;
  v3d1,v3d2,v3d3: PVMCLVector3d;
  v4d1,v4d2,v4d3: PVMCLVector4d;
  i:              Integer;
  Freq:           Int64;
  StartCnt:       Int64;
  StopCnt:        Int64;
  nSSECnt:        Int64;
begin
QueryPerformanceFrequency(Freq);
WriteLn;
WriteLn(LineText('VectorsOrthonormal_SSE - Speed tests'));
WriteLn;
WriteLn(RepeatCount,' cycles');
VMCL_New(v2s1); VMCL_New(v2s2); VMCL_New(v2s3);
VMCL_New(v3s1); VMCL_New(v3s2); VMCL_New(v3s3);
VMCL_New(v4s1); VMCL_New(v4s2); VMCL_New(v4s3);
VMCL_New(v2d1); VMCL_New(v2d2); VMCL_New(v2d3);
VMCL_New(v3d1); VMCL_New(v3d2); VMCL_New(v3d3);
VMCL_New(v4d1); VMCL_New(v4d2); VMCL_New(v4d3);
try
  RandomVec(v2s1^); RandomVec(v2s2^); LoadZeroVector(v2s3^);
  RandomVec(v3s1^); RandomVec(v3s2^); LoadZeroVector(v3s3^);
  RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
  RandomVec(v2d1^); RandomVec(v2d2^); LoadZeroVector(v2d3^);
  RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
  RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
  WriteLn;
  Write('v2s @ nonSSE:  ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    v2s3^ := VectorsOrthonormal(v2s1^,v2s2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v2s @ SSE(%s):  ',[BoolToMark(CheckMemAlign16(v2s1,v2s2,v2s3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_SSE(v2s1^,v2s2^,v2s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v2s @ SSEua:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_2s_SSEua(v2s1^,v2s2^,v2s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v3s @ nonSSE:  ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    v3s3^ := VectorsOrthonormal(v3s1^,v3s2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v3s @ SSE(%s):  ',[BoolToMark(CheckMemAlign16(v3s1,v3s2,v3s3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_SSE(v3s1^,v3s2^,v3s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v3s @ SSEua:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_3s_SSEua(v3s1^,v3s2^,v3s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4s @ nonSSE:  ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    v4s3^ := VectorsOrthonormal(v4s1^,v4s2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v4s @ SSE(%s):  ',[BoolToMark(CheckMemAlign16(v4s1,v4s2,v4s3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_SSE(v4s1^,v4s2^,v4s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4s @ SSEu:    ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_4s_SSEu(v4s1^,v4s2^,v4s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4s @ SSEa:    ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_4s_SSEa(v4s1^,v4s2^,v4s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4s3 @ nonSSE: ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    v4s3^ := VectorsOrthonormalXYZ(v4s1^,v4s2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v4s3 @ SSE(%s): ',[BoolToMark(CheckMemAlign16(v4s1,v4s2,v4s3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormalXYZ_SSE(v4s1^,v4s2^,v4s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4s3 @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormalXYZ_4s_SSEu(v4s1^,v4s2^,v4s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4s3 @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormalXYZ_4s_SSEa(v4s1^,v4s2^,v4s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v2d @ nonSSE:  ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    v2d3^ := VectorsOrthonormal(v2d1^,v2d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v2d @ SSE(%s):  ',[BoolToMark(CheckMemAlign16(v2d1,v2d2,v2d3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_SSE(v2d1^,v2d2^,v2d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v2d @ SSEu:    ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_2d_SSEu(v2d1^,v2d2^,v2d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v2d @ SSEa:    ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_2d_SSEa(v2d1^,v2d2^,v2d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v3d @ nonSSE:  ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    v3d3^ := VectorsOrthonormal(v3d1^,v3d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v3d @ SSE(%s):  ',[BoolToMark(CheckMemAlign16(v3d1,v3d2,v3d3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_SSE(v3d1^,v3d2^,v3d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v3d @ SSEu:    ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_3d_SSEu(v3d1^,v3d2^,v3d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v3d @ SSEa:    ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_3d_SSEa(v3d1^,v3d2^,v3d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4d @ nonSSE:  ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    v4d3^ := VectorsOrthonormal(v4d1^,v4d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v4d @ SSE(%s):  ',[BoolToMark(CheckMemAlign16(v4d1,v4d2,v4d3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_SSE(v4d1^,v4d2^,v4d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4d @ SSEu:    ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_4d_SSEu(v4d1^,v4d2^,v4d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4d @ SSEa:    ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormal_4d_SSEa(v4d1^,v4d2^,v4d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4d3 @ nonSSE: ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    v4d3^ := VectorsOrthonormalXYZ(v4d1^,v4d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('v4d3 @ SSE(%s): ',[BoolToMark(CheckMemAlign16(v4d1,v4d2,v4d3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormalXYZ_SSE(v4d1^,v4d2^,v4d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4d3 @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormalXYZ_4d_SSEu(v4d1^,v4d2^,v4d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('v4d3 @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    VectorsOrthonormalXYZ_4d_SSEa(v4d1^,v4d2^,v4d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
finally
  VMCL_Dispose(v2s1); VMCL_Dispose(v2s2); VMCL_Dispose(v2s3);
  VMCL_Dispose(v3s1); VMCL_Dispose(v3s2); VMCL_Dispose(v3s3);
  VMCL_Dispose(v4s1); VMCL_Dispose(v4s2); VMCL_Dispose(v4s3);
  VMCL_Dispose(v2d1); VMCL_Dispose(v2d2); VMCL_Dispose(v2d3);
  VMCL_Dispose(v3d1); VMCL_Dispose(v3d2); VMCL_Dispose(v3d3);
  VMCL_Dispose(v4d1); VMCL_Dispose(v4d2); VMCL_Dispose(v4d3);
end;
Result := 0;
end;
