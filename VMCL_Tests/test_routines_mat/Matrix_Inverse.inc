Function Matrix_Inverse(AutoTest: Boolean = False): Integer;
var
  m2s:  TVMCLMatrix2s;
  m3s:  TVMCLMatrix3s;
  m4s:  TVMCLMatrix4s;
  m2d:  TVMCLMatrix2d;
  m3d:  TVMCLMatrix3d;
  m4d:  TVMCLMatrix4d;
  MFS:  TVMCLMatrixFormat;
begin
MFS := VMCL_DefaultMatrixFormat;
MFS.CommonFormat.ValueFormat.DecimalPlaces := 6;
WriteLn;
WriteLn(LineText('Inverse'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn;
WriteLn('m2s:'); WriteLn; WriteLn(MatToStr(m2s)); Inverse(m2s); WriteLn; WriteLn(MatToStr(m2s,MFS));
WriteLn;
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3s)); Inverse(m3s); WriteLn; WriteLn(MatToStr(m3s,MFS));
WriteLn;
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4s)); Inverse(m4s); WriteLn; WriteLn(MatToStr(m4s,MFS));
WriteLn;
WriteLn('m2d:'); WriteLn; WriteLn(MatToStr(m2d)); Inverse(m2d); WriteLn; WriteLn(MatToStr(m2d,MFS));
WriteLn;
WriteLn('m3d:'); WriteLn; WriteLn(MatToStr(m3d)); Inverse(m3d); WriteLn; WriteLn(MatToStr(m3d,MFS));
WriteLn;
WriteLn('m4d:'); WriteLn; WriteLn(MatToStr(m4d)); Inverse(m4d); WriteLn; WriteLn(MatToStr(m4d,MFS));
WriteLn; RandomMat(m4s); MatrixSetRow(m4s,3,Vector4s(0,0,0,1));
WriteLn('m4s(aff):'); WriteLn; WriteLn(MatToStr(m4s));
WriteLn; WriteLn(MatToStr(Inversed(m4s),MFS) + ' normal');
InverseAffine(m4s); WriteLn; WriteLn(MatToStr(m4s,MFS) + ' affine');
WriteLn; RandomMat(m4d); MatrixSetRow(m4d,3,Vector4d(0,0,0,1));
WriteLn('m4d(aff):'); WriteLn; WriteLn(MatToStr(m4d));
WriteLn; WriteLn(MatToStr(Inversed(m4d),MFS) + ' normal');
InverseAffine(m4d); WriteLn; WriteLn(MatToStr(m4d,MFS) + ' affine');
Result := 0;
end;