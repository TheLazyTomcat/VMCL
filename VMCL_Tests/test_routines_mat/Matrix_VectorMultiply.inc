Function Matrix_VectorMultiply(AutoTest: Boolean = False): Integer;
var
  m2s:  TVMCLMatrix2s;
  m3s:  TVMCLMatrix3s;
  m4s:  TVMCLMatrix4s;
  m2d:  TVMCLMatrix2d;
  m3d:  TVMCLMatrix3d;
  m4d:  TVMCLMatrix4d;
  v2s:  TVector2s;
  v3s:  TVector3s;
  v4s:  TVector4s;
  v2d:  TVector2d;
  v3d:  TVector3d;
  v4d:  TVector4d;
begin
WriteLn;
WriteLn(LineText('VectorMultiply'));
RandomMat(m2s,10); RandomMat(m3s,10); RandomMat(m4s,10);
RandomMat(m2d,10); RandomMat(m3d,10); RandomMat(m4d,10);
RandomVec(v2s,10); RandomVec(v3s,10); RandomVec(v4s,10);
RandomVec(v2d,10); RandomVec(v3d,10); RandomVec(v4d,10);
WriteLn;
WriteLn('m2s:'); WriteLn; WriteLn(MatToStr(m2s) + ' * ' + VecToStr(v2s)); WriteLn; WriteLn(VecToStr(VectorMultiply(m2s,v2s)));
WriteLn;
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3s) + ' * ' + VecToStr(v3s)); WriteLn; WriteLn(VecToStr(VectorMultiply(m3s,v3s)));
WriteLn;
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4s) + ' * ' + VecToStr(v4s)); WriteLn; WriteLn(VecToStr(VectorMultiply(m4s,v4s)));
WriteLn;
WriteLn('m2d:'); WriteLn; WriteLn(MatToStr(m2d) + ' * ' + VecToStr(v2d)); WriteLn; WriteLn(VecToStr(VectorMultiply(m2d,v2d)));
WriteLn;
WriteLn('m3d:'); WriteLn; WriteLn(MatToStr(m3d) + ' * ' + VecToStr(v3d)); WriteLn; WriteLn(VecToStr(VectorMultiply(m3d,v3d)));
WriteLn;
WriteLn('m4d:'); WriteLn; WriteLn(MatToStr(m4d) + ' * ' + VecToStr(v4d)); WriteLn; WriteLn(VecToStr(VectorMultiply(m4d,v4d)));
Result := 0;
end;
