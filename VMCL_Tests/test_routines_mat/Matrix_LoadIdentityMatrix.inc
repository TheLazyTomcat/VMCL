Function Matrix_LoadIdentityMatrix(AutoTest: Boolean = False): Integer;
var
  m2s:  TVMCLMatrix2s;
  m3s:  TVMCLMatrix3s;
  m4s:  TVMCLMatrix4s;
  m2d:  TVMCLMatrix2d;
  m3d:  TVMCLMatrix3d;
  m4d:  TVMCLMatrix4d;
begin
WriteLn;
WriteLn(LineText('LoadIdentityMatrix'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn; LoadIdentityMatrix(m2s);
WriteLn('m2s: '); WriteLn; WriteLn(MatToStr(m2s));
WriteLn; LoadIdentityMatrix(m3s);
WriteLn('m3s: '); WriteLn; WriteLn(MatToStr(m3s));
WriteLn; LoadIdentityMatrix(m4s);
WriteLn('m4s: '); WriteLn; WriteLn(MatToStr(m4s));
WriteLn; LoadIdentityMatrix(m2d);
WriteLn('m2d: '); WriteLn; WriteLn(MatToStr(m2d));
WriteLn; LoadIdentityMatrix(m3d);
WriteLn('m3d: '); WriteLn; WriteLn(MatToStr(m3d));
WriteLn; LoadIdentityMatrix(m4d);
WriteLn('m4d: '); WriteLn; WriteLn(MatToStr(m4d));
Result := 0;
end;
