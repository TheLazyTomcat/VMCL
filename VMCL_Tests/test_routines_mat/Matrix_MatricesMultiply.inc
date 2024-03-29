Function Matrix_MatricesMultiply(AutoTest: Boolean = False): Integer;
var
  m2s1,m2s2:  TVMCLMatrix2s;
  m3s1,m3s2:  TVMCLMatrix3s;
  m4s1,m4s2:  TVMCLMatrix4s;
  m2d1,m2d2:  TVMCLMatrix2d;
  m3d1,m3d2:  TVMCLMatrix3d;
  m4d1,m4d2:  TVMCLMatrix4d;
begin
WriteLn;
WriteLn(LineText('MatricesMultiply'));
RandomMat(m2s1,10); RandomMat(m3s1,10); RandomMat(m4s1,10);
RandomMat(m2s2,10); RandomMat(m3s2,10); RandomMat(m4s2,10);
RandomMat(m2d1,10); RandomMat(m3d1,10); RandomMat(m4d1,10);
RandomMat(m2d2,10); RandomMat(m3d2,10); RandomMat(m4d2,10);
WriteLn;
WriteLn('m2s:'); WriteLn; WriteLn(MatToStr(m2s1)); WriteLn; WriteLn(MatToStr(m2s2));
WriteLn; WriteLn(MatToStr(MatricesMultiply(m2s1,m2s2)));
WriteLn;
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3s1)); WriteLn; WriteLn(MatToStr(m3s2));
WriteLn; WriteLn(MatToStr(MatricesMultiply(m3s1,m3s2)));
WriteLn;
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4s1)); WriteLn; WriteLn(MatToStr(m4s2));
WriteLn; WriteLn(MatToStr(MatricesMultiply(m4s1,m4s2)));
WriteLn;
WriteLn('m2s:'); WriteLn; WriteLn(MatToStr(m2d1)); WriteLn; WriteLn(MatToStr(m2d2));
WriteLn; WriteLn(MatToStr(MatricesMultiply(m2d1,m2d2)));
WriteLn;
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3d1)); WriteLn; WriteLn(MatToStr(m3d2));
WriteLn; WriteLn(MatToStr(MatricesMultiply(m3d1,m3d2)));
WriteLn;
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4d1)); WriteLn; WriteLn(MatToStr(m4d2));
WriteLn; WriteLn(MatToStr(MatricesMultiply(m4d1,m4d2)));
Result := 0;
end;
