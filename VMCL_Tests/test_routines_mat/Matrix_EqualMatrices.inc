Function Matrix_EqualMatrices(AutoTest: Boolean = False): Integer;
var
  m2s1,m2s2:  TVMCLMatrix2s;
  m3s1,m3s2:  TVMCLMatrix3s;
  m4s1,m4s2:  TVMCLMatrix4s;
  m2d1,m2d2:  TVMCLMatrix2d;
  m3d1,m3d2:  TVMCLMatrix3d;
  m4d1,m4d2:  TVMCLMatrix4d;
begin
WriteLn;
WriteLn(LineText('EqualMatrices'));
RandomMat(m2s1); RandomMat(m3s1); RandomMat(m4s1);
RandomMat(m2s2); RandomMat(m3s2); RandomMat(m4s2);
RandomMat(m2d1); RandomMat(m3d1); RandomMat(m4d1);
RandomMat(m2d2); RandomMat(m3d2); RandomMat(m4d2);
WriteLn;
WriteLn('m2s:'); WriteLn; WriteLn(MatToStr(m2s1)); WriteLn; WriteLn(MatToStr(m2s2) + ' ' + BoolToStr(EqualMatrices(m2s1,m2s2),True));
CopyMatrix(m2s1,m2s2); WriteLn; WriteLn(MatToStr(m2s2) + ' ' + BoolToStr(EqualMatrices(m2s1,m2s2),True));
WriteLn;
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3s1)); WriteLn; WriteLn(MatToStr(m3s2) + ' ' + BoolToStr(EqualMatrices(m3s1,m3s2),True));
CopyMatrix(m3s1,m3s2); WriteLn; WriteLn(MatToStr(m3s2) + ' ' + BoolToStr(EqualMatrices(m3s1,m3s2),True));
WriteLn;
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4s1)); WriteLn; WriteLn(MatToStr(m4s2) + ' ' + BoolToStr(EqualMatrices(m4s1,m4s2),True));
CopyMatrix(m4s1,m4s2); WriteLn; WriteLn(MatToStr(m4s2) + ' ' + BoolToStr(EqualMatrices(m4s1,m4s2),True));
WriteLn;
WriteLn('m2d:'); WriteLn; WriteLn(MatToStr(m2d1)); WriteLn; WriteLn(MatToStr(m2d2) + ' ' + BoolToStr(EqualMatrices(m2d1,m2d2),True));
CopyMatrix(m2d1,m2d2); WriteLn; WriteLn(MatToStr(m2d2) + ' ' + BoolToStr(EqualMatrices(m2d1,m2d2),True));
WriteLn;
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3d1)); WriteLn; WriteLn(MatToStr(m3d2) + ' ' + BoolToStr(EqualMatrices(m3d1,m3d2),True));
CopyMatrix(m3d1,m3d2); WriteLn; WriteLn(MatToStr(m3d2) + ' ' + BoolToStr(EqualMatrices(m3d1,m3d2),True));
WriteLn;
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4d1)); WriteLn; WriteLn(MatToStr(m4d2) + ' ' + BoolToStr(EqualMatrices(m4d1,m4d2),True));
CopyMatrix(m4d1,m4d2); WriteLn; WriteLn(MatToStr(m4d2) + ' ' + BoolToStr(EqualMatrices(m4d1,m4d2),True));
Result := 0;
end;