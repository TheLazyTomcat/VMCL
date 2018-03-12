Function Vector_VectorsNormal_SSE_Man({%H-}AutoTest: Boolean = False): Integer;
var
  v3s1,v3s2,v3s3: PVector3s;
  v4s1,v4s2,v4s3: PVector4s;
  v3d1,v3d2,v3d3: PVector3d;
  v4d1,v4d2,v4d3: PVector4d;
  VF:             TVMCLVectorFormat;
begin
VF := VMCL_DefaultVectorFormat;
VF.CommonFormat.ValueFormat.DecimalPlaces := 6;
WriteLn;
WriteLn(LineText('VectorsNormal_SSE - Manual value checks'));
VMCL_New(v3s1); VMCL_New(v3s2); VMCL_New(v3s3);
VMCL_New(v4s1); VMCL_New(v4s2); VMCL_New(v4s3);
VMCL_New(v3d1); VMCL_New(v3d2); VMCL_New(v3d3);
VMCL_New(v4d1); VMCL_New(v4d2); VMCL_New(v4d3);
try
  RandomVec(v3s1^); RandomVec(v3s2^); RandomVec(v3s3^);
  RandomVec(v4s1^); RandomVec(v4s2^); RandomVec(v4s3^);
  RandomVec(v3d1^); RandomVec(v3d2^); RandomVec(v3d3^);
  RandomVec(v4d1^); RandomVec(v4d2^); RandomVec(v4d3^);
  WriteLn;
  WriteLn('v3s: ' + VecToStr(v3s1^) + ', ' + VecToStr(v3s2^));
  WriteLn;
  v3s3^ := VectorsNormal(v3s1^,v3s2^);
  WriteLn('v3s @ nSSE:  ' + ' -> ' + VecToStr(v3s3^,VF));
  VectorsNormal_SSE(v3s1^,v3s2^,v3s3^);
  WriteLn('v3s @ SSE:   ' + ' -> ' + VecToStr(v3s3^,VF));
  VectorsNormal_3s_SSEua(v3s1^,v3s2^,v3s3^);
  WriteLn('v3s @ SSEua: ' + ' -> ' + VecToStr(v3s3^,VF));

  WriteLn;
  WriteLn('v4s: ' + VecToStr(v4s1^) + ', ' + VecToStr(v4s2^));
  WriteLn;
  v4s3^ := VectorsNormal(v4s1^,v4s2^);
  WriteLn('v4s @ nSSE:  ' + ' -> ' + VecToStr(v4s3^,VF));
  VectorsNormal_SSE(v4s1^,v4s2^,v4s3^);
  WriteLn('v4s @ SSE:   ' + ' -> ' + VecToStr(v4s3^,VF));
  VectorsNormal_4s_SSEu(v4s1^,v4s2^,v4s3^);
  WriteLn('v4s @ SSEu:  ' + ' -> ' + VecToStr(v4s3^,VF));
  VectorsNormal_4s_SSEa(v4s1^,v4s2^,v4s3^);
  WriteLn('v4s @ SSEa:  ' + ' -> ' + VecToStr(v4s3^,VF));

  WriteLn;
  WriteLn('v3d: ' + VecToStr(v3d1^) + ', ' + VecToStr(v3d2^));
  WriteLn;
  v3d3^ := VectorsNormal(v3d1^,v3d2^);
  WriteLn('v3d @ nSSE:  ' + ' -> ' + VecToStr(v3d3^,VF));
  VectorsNormal_SSE(v3d1^,v3d2^,v3d3^);
  WriteLn('v3d @ SSE:   ' + ' -> ' + VecToStr(v3d3^,VF));
  VectorsNormal_3d_SSEu(v3d1^,v3d2^,v3d3^);
  WriteLn('v3d @ SSEu:  ' + ' -> ' + VecToStr(v3d3^,VF));
  VectorsNormal_3d_SSEa(v3d1^,v3d2^,v3d3^);
  WriteLn('v3d @ SSEa:  ' + ' -> ' + VecToStr(v3d3^,VF));

  WriteLn;
  WriteLn('v4d: ' + VecToStr(v4d1^) + ', ' + VecToStr(v4d2^));
  WriteLn;
  v4d3^ := VectorsNormal(v4d1^,v4d2^);
  WriteLn('v4d @ nSSE:  ' + ' -> ' + VecToStr(v4d3^,VF));
  VectorsNormal_SSE(v4d1^,v4d2^,v4d3^);
  WriteLn('v4d @ SSE:   ' + ' -> ' + VecToStr(v4d3^,VF));
  VectorsNormal_4d_SSEu(v4d1^,v4d2^,v4d3^);
  WriteLn('v4d @ SSEu:  ' + ' -> ' + VecToStr(v4d3^,VF));
  VectorsNormal_4d_SSEa(v4d1^,v4d2^,v4d3^);
  WriteLn('v4d @ SSEa:  ' + ' -> ' + VecToStr(v4d3^,VF));   
finally
  VMCL_Dispose(v3s1); VMCL_Dispose(v3s2); VMCL_Dispose(v3s3);
  VMCL_Dispose(v4s1); VMCL_Dispose(v4s2); VMCL_Dispose(v4s3);
  VMCL_Dispose(v3d1); VMCL_Dispose(v3d2); VMCL_Dispose(v3d3);
  VMCL_Dispose(v4d1); VMCL_Dispose(v4d2); VMCL_Dispose(v4d3);
end;
Result := 0;
end;