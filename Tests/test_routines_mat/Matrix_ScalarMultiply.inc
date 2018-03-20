Function Matrix_ScalarMultiply({%H-}AutoTest: Boolean = False): Integer;
var
  m2s:  TVMCLMatrix2s;
  m3s:  TVMCLMatrix3s;
  m4s:  TVMCLMatrix4s;
  m2d:  TVMCLMatrix2d;
  m3d:  TVMCLMatrix3d;
  m4d:  TVMCLMatrix4d;
  ss:   Single;
  sd:   Double;
begin
WriteLn;
WriteLn(LineText('ScalarMultiply'));
RandomMat(m2s,10); RandomMat(m3s,10); RandomMat(m4s,10);
RandomMat(m2d,10); RandomMat(m3d,10); RandomMat(m4d,10);
WriteLn; ss := Random(10);
WriteLn('m2s:'); WriteLn; WriteLn(MatToStr(m2s) + ' * ' + FloatToStr(ss)); WriteLn; WriteLn(MatToStr(ScalarMultiply(m2s,ss)));
WriteLn; ss := Random(10);
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3s) + ' * ' + FloatToStr(ss)); WriteLn; WriteLn(MatToStr(ScalarMultiply(m3s,ss)));
WriteLn; ss := Random(10);
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4s) + ' * ' + FloatToStr(ss)); WriteLn; WriteLn(MatToStr(ScalarMultiply(m4s,ss)));
WriteLn; sd := Random(10);
WriteLn('m2d:'); WriteLn; WriteLn(MatToStr(m2d) + ' * ' + FloatToStr(sd)); WriteLn; WriteLn(MatToStr(ScalarMultiply(m2d,sd)));
WriteLn; sd := Random(10);
WriteLn('m3d:'); WriteLn; WriteLn(MatToStr(m3d) + ' * ' + FloatToStr(sd)); WriteLn; WriteLn(MatToStr(ScalarMultiply(m3d,sd)));
WriteLn; sd := Random(10);
WriteLn('m4d:'); WriteLn; WriteLn(MatToStr(m4d) + ' * ' + FloatToStr(sd)); WriteLn; WriteLn(MatToStr(ScalarMultiply(m4d,sd)));
Result := 0;
end;
