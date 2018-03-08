Function Matrix_LoadZeroMatrix(AutoTest: Boolean = False): Integer;
var
  m2s:  TMatrix2s;
  m3s:  TMatrix3s;
  m4s:  TMatrix4s;
  m2d:  TMatrix2d;
  m3d:  TMatrix3d;
  m4d:  TMatrix4d;
begin
WriteLn;
WriteLn(LineText('LoadZeroMatrix'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn; LoadZeroMatrix(m2s);
WriteLn('m2s: '); WriteLn; WriteLn(MatToStr(m2s));
WriteLn; LoadZeroMatrix(m3s);
WriteLn('m3s: '); WriteLn; WriteLn(MatToStr(m3s));
WriteLn; LoadZeroMatrix(m4s);
WriteLn('m4s: '); WriteLn; WriteLn(MatToStr(m4s));
WriteLn; LoadZeroMatrix(m2d);
WriteLn('m2d: '); WriteLn; WriteLn(MatToStr(m2d));
WriteLn; LoadZeroMatrix(m3d);
WriteLn('m3d: '); WriteLn; WriteLn(MatToStr(m3d));
WriteLn; LoadZeroMatrix(m4d);
WriteLn('m4d: '); WriteLn; WriteLn(MatToStr(m4d));
Result := 0;
end;