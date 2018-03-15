Function Matrix_PrecisionConversionRM_SSE_Spd({%H-}AutoTest: Boolean = False): Integer;
const
  RepeatCount = 100000000;
var
  m2s:    PMatrix2RMs;
  m3s:    PMatrix3RMs;
  m4s:    PMatrix4RMs;
  m2d:    PMatrix2RMd;
  m3d:    PMatrix3RMd;
  m4d:    PMatrix4RMd;
  i:        Integer;
  Freq:     Int64;
  StartCnt: Int64;
  StopCnt:  Int64;
  nSSECnt:  Int64;
begin
QueryPerformanceFrequency({%H-}Freq);
WriteLn;
WriteLn(LineText('PrecisionConversion_SSE (RM) - Speed tests'));
WriteLn;
WriteLn(RepeatCount,' cycles');
VMCL_New(m2s); VMCL_New(m3s); VMCL_New(m4s);
VMCL_New(m2d); VMCL_New(m3d); VMCL_New(m4d);
try
  RandomMat(m2s^); RandomMat(m3s^); RandomMat(m4s^);
  RandomMat(m2d^); RandomMat(m3d^); RandomMat(m4d^);
  WriteLn;
  Write('m2d -> m2s @ nSSE:   ');
  QueryPerformanceCounter({%H-}StartCnt);
  For i := 1 to RepeatCount do
    m2s^ := Matrix2s(m2d^);
  QueryPerformanceCounter({%H-}StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('m2d -> m2s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m2s,m2d),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_SSE(m2d^,m2s^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m2d -> m2s @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_2RMs_SSEu(m2d^,m2s^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m2d -> m2s @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_2RMs_SSEa(m2d^,m2s^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('m3d -> m3s @ nSSE:   ');
  QueryPerformanceCounter({%H-}StartCnt);
  For i := 1 to RepeatCount do
    m3s^ := Matrix3s(m3d^);
  QueryPerformanceCounter({%H-}StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('m3d -> m3s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m3s,m3d),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_SSE(m3d^,m3s^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m3d -> m3s @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_3RMs_SSEu(m3d^,m3s^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m3d -> m3s @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_3RMs_SSEa(m3d^,m3s^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('m4d -> m4s @ nSSE:   ');
  QueryPerformanceCounter({%H-}StartCnt);
  For i := 1 to RepeatCount do
    m4s^ := Matrix4s(m4d^);
  QueryPerformanceCounter({%H-}StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('m4d -> m4s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4s,m4d),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_SSE(m4d^,m4s^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m4d -> m4s @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_4RMs_SSEu(m4d^,m4s^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m4d -> m4s @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_4RMs_SSEa(m4d^,m4s^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('m2s -> m2d @ nSSE:   ');
  QueryPerformanceCounter({%H-}StartCnt);
  For i := 1 to RepeatCount do
    m2d^ := Matrix2d(m2s^);
  QueryPerformanceCounter({%H-}StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('m2s -> m2d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m2d,m2s),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_SSE(m2s^,m2d^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m2s -> m2d @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_2RMd_SSEu(m2s^,m2d^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m2s -> m2d @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_2RMd_SSEa(m2s^,m2d^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('m3s -> m3d @ nSSE:   ');
  QueryPerformanceCounter({%H-}StartCnt);
  For i := 1 to RepeatCount do
    m3d^ := Matrix3d(m3s^);
  QueryPerformanceCounter({%H-}StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('m3s -> m3d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m3d,m3s),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_SSE(m3s^,m3d^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m3s -> m3d @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_3RMd_SSEu(m3s^,m3d^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m3s -> m3d @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_3RMd_SSEa(m3s^,m3d^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
//------------------------------------------------------------------------------
  WriteLn;
  Write('m4s -> m4d @ nSSE:   ');
  QueryPerformanceCounter({%H-}StartCnt);
  For i := 1 to RepeatCount do
    m4d^ := Matrix4d(m4s^);
  QueryPerformanceCounter({%H-}StopCnt);
  WriteLn(Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]));
  nSSECnt := StopCnt - StartCnt;
  Write(Format('m4s -> m4d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4d,m4s),'a','u')]));
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_SSE(m4s^,m4d^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m4s -> m4d @ SSEu:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_4RMd_SSEu(m4s^,m4d^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
  Write('m4s -> m4d @ SSEa:   ');
  QueryPerformanceCounter(StartCnt);
  For i := 1 to RepeatCount do
    PrecisionConversion_4RMd_SSEa(m4s^,m4d^);
  QueryPerformanceCounter(StopCnt);
  WriteLn(Format('%-30s  t: %.2f  s: %.0f%%',[
    Format('%d ticks (%.2f ms)',[StopCnt - StartCnt,((StopCnt - StartCnt) / Freq) * 1000]),
    (StopCnt - StartCnt) / nSSECnt,1 / ((StopCnt - StartCnt) / nSSECnt) * 100]));
finally
  VMCL_Dispose(m2d); VMCL_Dispose(m3s); VMCL_Dispose(m4s);
  VMCL_Dispose(m2s); VMCL_Dispose(m3d); VMCL_Dispose(m4d);
end;
Result := 0;
end;
