Function Matrix_Determinant({%H-}AutoTest: Boolean = False): Integer;
var
  m2s:  TMatrix2s;
  m3s:  TMatrix3s;
  m4s:  TMatrix4s;
  m2d:  TMatrix2d;
  m3d:  TMatrix3d;
  m4d:  TMatrix4d;
begin
WriteLn;
WriteLn(LineText('Determinant'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn;
WriteLn('m2s:'); WriteLn; WriteLn(MatToStr(m2s)); WriteLn; WriteLn(FloatToStr(Determinant(m2s)));
WriteLn;
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3s)); WriteLn; WriteLn(FloatToStr(Determinant(m3s)));
WriteLn;
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4s)); WriteLn; WriteLn(FloatToStr(Determinant(m4s)));
WriteLn;
WriteLn('m2d:'); WriteLn; WriteLn(MatToStr(m2d)); WriteLn; WriteLn(FloatToStr(Determinant(m2d)));
WriteLn;
WriteLn('m3d:'); WriteLn; WriteLn(MatToStr(m3d)); WriteLn; WriteLn(FloatToStr(Determinant(m3d)));
WriteLn;
WriteLn('m4d:'); WriteLn; WriteLn(MatToStr(m4d)); WriteLn; WriteLn(FloatToStr(Determinant(m4d)));
Result := 0;
end;
