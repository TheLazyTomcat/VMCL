Function Matrix_Invertible(AutoTest: Boolean = False): Integer;
var
  m2s:  TVMCLMatrix2s;
  m3s:  TVMCLMatrix3s;
  m4s:  TVMCLMatrix4s;
  m2d:  TVMCLMatrix2d;
  m3d:  TVMCLMatrix3d;
  m4d:  TVMCLMatrix4d;
begin
WriteLn;
WriteLn(LineText('Invertible'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn;
WriteLn('m2s:'); WriteLn; WriteLn(MatToStr(m2s) + ' ' + BoolToStr(Invertible(m2s),True));
LoadZeroMatrix(m2s); WriteLn; WriteLn(MatToStr(m2s) + ' ' + BoolToStr(Invertible(m2s),True));
WriteLn;
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3s) + ' ' + BoolToStr(Invertible(m3s),True));
LoadZeroMatrix(m3s); WriteLn; WriteLn(MatToStr(m3s) + ' ' + BoolToStr(Invertible(m3s),True));
WriteLn;
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4s) + ' ' + BoolToStr(Invertible(m4s),True));
LoadZeroMatrix(m4s); WriteLn; WriteLn(MatToStr(m4s) + ' ' + BoolToStr(Invertible(m4s),True));
WriteLn;
WriteLn('m2d:'); WriteLn; WriteLn(MatToStr(m2d) + ' ' + BoolToStr(Invertible(m2d),True));
LoadZeroMatrix(m2d); WriteLn; WriteLn(MatToStr(m2d) + ' ' + BoolToStr(Invertible(m2d),True));
WriteLn;
WriteLn('m3d:'); WriteLn; WriteLn(MatToStr(m3d) + ' ' + BoolToStr(Invertible(m3d),True));
LoadZeroMatrix(m3d); WriteLn; WriteLn(MatToStr(m3d) + ' ' + BoolToStr(Invertible(m3d),True));
WriteLn;
WriteLn('m4d:'); WriteLn; WriteLn(MatToStr(m4d) + ' ' + BoolToStr(Invertible(m4d),True));
LoadZeroMatrix(m4d); WriteLn; WriteLn(MatToStr(m4d) + ' ' + BoolToStr(Invertible(m4d),True));
Result := 0;
end;