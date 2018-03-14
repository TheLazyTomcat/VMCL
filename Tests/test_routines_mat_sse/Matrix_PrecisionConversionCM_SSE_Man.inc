Function Matrix_PrecisionConversionCM_SSE_Man({%H-}AutoTest: Boolean = False): Integer;
var
  m2s:  PMatrix2CMs;
  m3s:  PMatrix3CMs;
  m4s:  PMatrix4CMs;
  m2d:  PMatrix2CMd;
  m3d:  PMatrix3CMd;
  m4d:  PMatrix4CMd;
begin
WriteLn;
WriteLn(LineText('PrecisionConversion_SSE (CM) - Manual value checks'));
VMCL_New(m2s); VMCL_New(m3s); VMCL_New(m4s);
VMCL_New(m2d); VMCL_New(m3d); VMCL_New(m4d);
try
  WriteLn;
  RandomMat(m2s^); RandomMat(m2d^); m2s^ := Matrix2s(m2d^);
  WriteLn('m2d -> m2s @ nSSE:'); WriteLn(MatToStr(m2d^)); WriteLn; WriteLn(MatToStr(m2s^));
  WriteLn;
  RandomMat(m2s^); RandomMat(m2d^); PrecisionConversion_SSE(m2d^,m2s^);
  WriteLn('m2d -> m2s @ SSE:'); WriteLn(MatToStr(m2d^)); WriteLn; WriteLn(MatToStr(m2s^));
  WriteLn;
  RandomMat(m2s^); RandomMat(m2d^); PrecisionConversion_2CMs_SSEu(m2d^,m2s^);
  WriteLn('m2d -> m2s @ SSEu:'); WriteLn(MatToStr(m2d^)); WriteLn; WriteLn(MatToStr(m2s^));
  WriteLn;
  RandomMat(m2s^); RandomMat(m2d^); PrecisionConversion_2CMs_SSEa(m2d^,m2s^);
  WriteLn('m2d -> m2s @ SSEa:'); WriteLn(MatToStr(m2d^)); WriteLn; WriteLn(MatToStr(m2s^));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  RandomMat(m3s^); RandomMat(m3d^); m3s^ := Matrix3s(m3d^);
  WriteLn('m3d -> m3s @ nSSE:'); WriteLn(MatToStr(m3d^)); WriteLn; WriteLn(MatToStr(m3s^));
  WriteLn;
  RandomMat(m3s^); RandomMat(m3d^); PrecisionConversion_SSE(m3d^,m3s^);
  WriteLn('m3d -> m3s @ SSE:'); WriteLn(MatToStr(m3d^)); WriteLn; WriteLn(MatToStr(m3s^));
  WriteLn;
  RandomMat(m3s^); RandomMat(m3d^); PrecisionConversion_3CMs_SSEu(m3d^,m3s^);
  WriteLn('m3d -> m3s @ SSEu:'); WriteLn(MatToStr(m3d^)); WriteLn; WriteLn(MatToStr(m3s^));
  WriteLn;
  RandomMat(m3s^); RandomMat(m3d^); PrecisionConversion_3CMs_SSEa(m3d^,m3s^);
  WriteLn('m3d -> m3s @ SSEa:'); WriteLn(MatToStr(m3d^)); WriteLn; WriteLn(MatToStr(m3s^));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  RandomMat(m4s^); RandomMat(m4d^); m4s^ := Matrix4s(m4d^);
  WriteLn('m4d -> m4s @ nSSE:'); WriteLn(MatToStr(m4d^)); WriteLn; WriteLn(MatToStr(m4s^));
  WriteLn;
  RandomMat(m4s^); RandomMat(m4d^); PrecisionConversion_SSE(m4d^,m4s^);
  WriteLn('m4d -> m4s @ SSE:'); WriteLn(MatToStr(m4d^)); WriteLn; WriteLn(MatToStr(m4s^));
  WriteLn;
  RandomMat(m4s^); RandomMat(m4d^); PrecisionConversion_4CMs_SSEu(m4d^,m4s^);
  WriteLn('m4d -> m4s @ SSEu:'); WriteLn(MatToStr(m4d^)); WriteLn; WriteLn(MatToStr(m4s^));
  WriteLn;
  RandomMat(m4s^); RandomMat(m4d^); PrecisionConversion_4CMs_SSEa(m4d^,m4s^);
  WriteLn('m4d -> m4s @ SSEa:'); WriteLn(MatToStr(m4d^)); WriteLn; WriteLn(MatToStr(m4s^));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  RandomMat(m2d^); RandomMat(m2s^); m2d^ := Matrix2d(m2s^);
  WriteLn('m2d -> m2s @ nSSE:'); WriteLn(MatToStr(m2s^)); WriteLn; WriteLn(MatToStr(m2d^));
  WriteLn;
  RandomMat(m2d^); RandomMat(m2s^); PrecisionConversion_SSE(m2s^,m2d^);
  WriteLn('m2d -> m2s @ SSE:'); WriteLn(MatToStr(m2s^)); WriteLn; WriteLn(MatToStr(m2d^));
  WriteLn;
  RandomMat(m2d^); RandomMat(m2s^); PrecisionConversion_2CMd_SSEu(m2s^,m2d^);
  WriteLn('m2d -> m2s @ SSEu:'); WriteLn(MatToStr(m2s^)); WriteLn; WriteLn(MatToStr(m2d^));
  WriteLn;
  RandomMat(m2d^); RandomMat(m2s^); PrecisionConversion_2CMd_SSEa(m2s^,m2d^);
  WriteLn('m2d -> m2s @ SSEa:'); WriteLn(MatToStr(m2s^)); WriteLn; WriteLn(MatToStr(m2d^));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  RandomMat(m3d^); RandomMat(m3s^); m3d^ := Matrix3d(m3s^);
  WriteLn('m3d -> m3s @ nSSE:'); WriteLn(MatToStr(m3s^)); WriteLn; WriteLn(MatToStr(m3d^));
  WriteLn;
  RandomMat(m3d^); RandomMat(m3s^); PrecisionConversion_SSE(m3s^,m3d^);
  WriteLn('m3d -> m3s @ SSE:'); WriteLn(MatToStr(m3s^)); WriteLn; WriteLn(MatToStr(m3d^));
  WriteLn;
  RandomMat(m3d^); RandomMat(m3s^); PrecisionConversion_3CMd_SSEu(m3s^,m3d^);
  WriteLn('m3d -> m3s @ SSEu:'); WriteLn(MatToStr(m3s^)); WriteLn; WriteLn(MatToStr(m3d^));
  WriteLn;
  RandomMat(m3d^); RandomMat(m3s^); PrecisionConversion_3CMd_SSEa(m3s^,m3d^);
  WriteLn('m3d -> m3s @ SSEa:'); WriteLn(MatToStr(m3s^)); WriteLn; WriteLn(MatToStr(m3d^));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  RandomMat(m4d^); RandomMat(m4s^); m4d^ := Matrix4d(m4s^);
  WriteLn('m4d -> m4s @ nSSE:'); WriteLn(MatToStr(m4s^)); WriteLn; WriteLn(MatToStr(m4d^));
  WriteLn;
  RandomMat(m4d^); RandomMat(m4s^); PrecisionConversion_SSE(m4s^,m4d^);
  WriteLn('m4d -> m4s @ SSE:'); WriteLn(MatToStr(m4s^)); WriteLn; WriteLn(MatToStr(m4d^));
  WriteLn;
  RandomMat(m4d^); RandomMat(m4s^); PrecisionConversion_4CMd_SSEu(m4s^,m4d^);
  WriteLn('m4d -> m4s @ SSEu:'); WriteLn(MatToStr(m4s^)); WriteLn; WriteLn(MatToStr(m4d^));
  WriteLn;
  RandomMat(m4d^); RandomMat(m4s^); PrecisionConversion_4CMd_SSEa(m4s^,m4d^);
  WriteLn('m4d -> m4s @ SSEa:'); WriteLn(MatToStr(m4s^)); WriteLn; WriteLn(MatToStr(m4d^));
finally
  VMCL_Dispose(m2s); VMCL_Dispose(m3s); VMCL_Dispose(m4s);
  VMCL_Dispose(m2d); VMCL_Dispose(m3d); VMCL_Dispose(m4d);
end;
Result := 0;
end;