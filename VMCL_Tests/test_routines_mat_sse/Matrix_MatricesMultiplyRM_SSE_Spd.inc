Function Matrix_MatricesMultiplyRM_SSE_Spd(AutoTest: Boolean = False): Integer;
const
  RepeatCount = 50000000;
var
  m2s1,m2s2,m2s3: PVMCLMatrix2RMs;
  m3s1,m3s2,m3s3: PVMCLMatrix3RMs;
  m4s1,m4s2,m4s3: PVMCLMatrix4RMs;
  m2d1,m2d2,m2d3: PVMCLMatrix2RMd;
  m3d1,m3d2,m3d3: PVMCLMatrix3RMd;
  m4d1,m4d2,m4d3: PVMCLMatrix4RMd;
  i:              Integer;
  Freq:           Int64;
  StartCnt:       Int64;
  StopCnt:        Int64;
  nSSECnt:        Int64;
begin
QueryPerformanceFrequency(Freq);
WriteLn;
WriteLn(LineText('MatricesMultiply_SSE (RM) - Speed tests'));
WriteLn;
WriteLn(RepeatCount,' cycles');
VMCL_New(m2s1); VMCL_New(m2s2); VMCL_New(m2s3);
VMCL_New(m3s1); VMCL_New(m3s2); VMCL_New(m3s3);
VMCL_New(m4s1); VMCL_New(m4s2); VMCL_New(m4s3);
VMCL_New(m2d1); VMCL_New(m2d2); VMCL_New(m2d3);
VMCL_New(m3d1); VMCL_New(m3d2); VMCL_New(m3d3);
VMCL_New(m4d1); VMCL_New(m4d2); VMCL_New(m4d3);
try
  RandomMat(m2s1^); RandomMat(m2s2^); RandomMat(m2s3^);
  RandomMat(m3s1^); RandomMat(m3s2^); RandomMat(m3s3^);
  RandomMat(m4s1^); RandomMat(m4s2^); RandomMat(m4s3^);
  RandomMat(m2d1^); RandomMat(m2d2^); RandomMat(m2d3^);
  RandomMat(m3d1^); RandomMat(m3d2^); RandomMat(m3d3^);
  RandomMat(m4d1^); RandomMat(m4d2^); RandomMat(m4d3^);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  WriteLn;
  Write('m2s * m2s @ nSSE:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    m2s3^ := MatricesMultiply(m2s1^,m2s2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;

  Write(Format('m2s * m2s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m2s1,m2s2,m2s3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_SSE(m2s1^,m2s2^,m2s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m2s * m2s @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_2RMs_SSEu(m2s1^,m2s2^,m2s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m2s * m2s @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_2RMs_SSEa(m2s1^,m2s2^,m2s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  WriteLn;
  Write('m3s * m3s @ nSSE:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    m3s3^ := MatricesMultiply(m3s1^,m3s2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;

  Write(Format('m3s * m3s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m3s1,m3s2,m3s3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_SSE(m3s1^,m3s2^,m3s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m3s * m3s @ SSEua:  ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_3RMs_SSEua(m3s1^,m3s2^,m3s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  WriteLn;
  Write('m4s * m4s @ nSSE:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    m4s3^ := MatricesMultiply(m4s1^,m4s2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;

  Write(Format('m4s * m4s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4s1,m4s2,m4s3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_SSE(m4s1^,m4s2^,m4s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m4s * m4s @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_4RMs_SSEu(m4s1^,m4s2^,m4s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m4s * m4s @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_4RMs_SSEa(m4s1^,m4s2^,m4s3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  WriteLn;
  Write('m2d * m2d @ nSSE:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    m2d3^ := MatricesMultiply(m2d1^,m2d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;

  Write(Format('m2d * m2d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m2d1,m2d2,m2d3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_SSE(m2d1^,m2d2^,m2d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m2d * m2d @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_2RMd_SSEu(m2d1^,m2d2^,m2d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m2d * m2d @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_2RMd_SSEa(m2d1^,m2d2^,m2d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  WriteLn;
  Write('m3d * m3d @ nSSE:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    m3d3^ := MatricesMultiply(m3d1^,m3d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;

  Write(Format('m3d * m3d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m3d1,m3d2,m3d3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_SSE(m3d1^,m3d2^,m3d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m3d * m3d @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_3RMd_SSEu(m3d1^,m3d2^,m3d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m3d * m3d @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_3RMd_SSEa(m3d1^,m3d2^,m3d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  WriteLn;
  Write('m4d * m4d @ nSSE:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    m4d3^ := MatricesMultiply(m4d1^,m4d2^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;

  Write(Format('m4d * m4d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4d1,m4d2,m4d3),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_SSE(m4d1^,m4d2^,m4d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m4d * m4d @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_4RMd_SSEu(m4d1^,m4d2^,m4d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

  Write('m4d * m4d @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    MatricesMultiply_4RMd_SSEa(m4d1^,m4d2^,m4d3^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));

finally
  VMCL_Dispose(m2s1); VMCL_Dispose(m2s2); VMCL_Dispose(m2s3);
  VMCL_Dispose(m3s1); VMCL_Dispose(m3s2); VMCL_Dispose(m3s3);
  VMCL_Dispose(m4s1); VMCL_Dispose(m4s2); VMCL_Dispose(m4s3);
  VMCL_Dispose(m2d1); VMCL_Dispose(m2d2); VMCL_Dispose(m2d3);
  VMCL_Dispose(m3d1); VMCL_Dispose(m3d2); VMCL_Dispose(m3d3);
  VMCL_Dispose(m4d1); VMCL_Dispose(m4d2); VMCL_Dispose(m4d3);
end;
Result := 0;
end;
