Function Vector_VectorsAngleRad_SSE_Man({%H-}AutoTest: Boolean = False): Integer;
var
  v2s1,v2s2:  PVector2s;
  v3s1,v3s2:  PVector3s;
  v4s1,v4s2:  PVector4s;
  v2d1,v2d2:  PVector2d;
  v3d1,v3d2:  PVector3d;
  v4d1,v4d2:  PVector4d;
  sRes:       Single;
  dRes:       Double;
begin
WriteLn;
WriteLn(LineText('VectorsAngleRad_SSE - Manual value checks'));
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
  WriteLn('v2s: ' + VecToStr(v2s1^) + ' > ' + VecToStr(v2s2^));
  WriteLn;
  sRes := VectorsAngleRad(v2s1^,v2s2^);
  WriteLn('v2s @ nSSE:  ' + ' -> ' + ValueToStr(sRes));
  VectorsAngleRad_SSE(v2s1^,v2s2^,sRes);
  WriteLn('v2s @ SSE:   ' + ' -> ' + ValueToStr(sRes));
  VectorsAngleRad_2s_SSEua(v2s1^,v2s2^,sRes);
  WriteLn('v2s @ SSEua: ' + ' -> ' + ValueToStr(sRes));

  WriteLn;
  WriteLn('v3s: ' + VecToStr(v3s1^) + ' > ' + VecToStr(v3s2^));
  WriteLn;
  sRes := VectorsAngleRad(v3s1^,v3s2^);
  WriteLn('v3s @ nSSE:  ' + ' -> ' + ValueToStr(sRes));
  VectorsAngleRad_SSE(v3s1^,v3s2^,sRes);
  WriteLn('v3s @ SSE:   ' + ' -> ' + ValueToStr(sRes));
  VectorsAngleRad_3s_SSEua(v3s1^,v3s2^,sRes);
  WriteLn('v3s @ SSEua: ' + ' -> ' + ValueToStr(sRes));

  WriteLn;
  WriteLn('v4s: ' + VecToStr(v4s1^) + ' > ' + VecToStr(v4s2^));
  WriteLn;
  sRes := VectorsAngleRad(v4s1^,v4s2^);
  WriteLn('v4s @ nSSE:  ' + ' -> ' + ValueToStr(sRes));
  VectorsAngleRad_SSE(v4s1^,v4s2^,sRes);
  WriteLn('v4s @ SSE:   ' + ' -> ' + ValueToStr(sRes));
  VectorsAngleRad_4s_SSEu(v4s1^,v4s2^,sRes);
  WriteLn('v4s @ SSEu:  ' + ' -> ' + ValueToStr(sRes));
  VectorsAngleRad_4s_SSEa(v4s1^,v4s2^,sRes);
  WriteLn('v4s @ SSEa:  ' + ' -> ' + ValueToStr(sRes));

  WriteLn;
  WriteLn('v2d: ' + VecToStr(v2d1^) + ' > ' + VecToStr(v2d2^));
  WriteLn;
  dRes := VectorsAngleRad(v2d1^,v2d2^);
  WriteLn('v2d @ nSSE:  ' + ' -> ' + ValueToStr(dRes));
  VectorsAngleRad_SSE(v2d1^,v2d2^,dRes);
  WriteLn('v2d @ SSE:   ' + ' -> ' + ValueToStr(dRes));
  VectorsAngleRad_2d_SSEu(v2d1^,v2d2^,dRes);
  WriteLn('v2d @ SSEu:  ' + ' -> ' + ValueToStr(dRes));
  VectorsAngleRad_2d_SSEa(v2d1^,v2d2^,dRes);
  WriteLn('v2d @ SSEa:  ' + ' -> ' + ValueToStr(dRes));

  WriteLn;
  WriteLn('v3d: ' + VecToStr(v3d1^) + ' > ' + VecToStr(v3d2^));
  WriteLn;
  dRes := VectorsAngleRad(v3d1^,v3d2^);
  WriteLn('v3d @ nSSE:  ' + ' -> ' + ValueToStr(dRes));
  VectorsAngleRad_SSE(v3d1^,v3d2^,dRes);
  WriteLn('v3d @ SSE:   ' + ' -> ' + ValueToStr(dRes));
  VectorsAngleRad_3d_SSEu(v3d1^,v3d2^,dRes);
  WriteLn('v3d @ SSEu:  ' + ' -> ' + ValueToStr(dRes));
  VectorsAngleRad_3d_SSEa(v3d1^,v3d2^,dRes);
  WriteLn('v3d @ SSEa:  ' + ' -> ' + ValueToStr(dRes));

  WriteLn;
  WriteLn('v4d: ' + VecToStr(v4d1^) + ' > ' + VecToStr(v4d2^));
  WriteLn;
  dRes := VectorsAngleRad(v4d1^,v4d2^);
  WriteLn('v4d @ nSSE:  ' + ' -> ' + ValueToStr(dRes));
  VectorsAngleRad_SSE(v4d1^,v4d2^,dRes);
  WriteLn('v4d @ SSE:   ' + ' -> ' + ValueToStr(dRes));
  VectorsAngleRad_4d_SSEu(v4d1^,v4d2^,dRes);
  WriteLn('v4d @ SSEu:  ' + ' -> ' + ValueToStr(dRes));
  VectorsAngleRad_4d_SSEa(v4d1^,v4d2^,dRes);
  WriteLn('v4d @ SSEa:  ' + ' -> ' + ValueToStr(dRes));
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