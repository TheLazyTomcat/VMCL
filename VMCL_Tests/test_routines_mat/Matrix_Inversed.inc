Function Matrix_Inversed(AutoTest: Boolean = False): Integer;
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
WriteLn(LineText('Inversed'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn;
WriteLn('m2s:'); WriteLn; WriteLn(MatToStr(m2s)); WriteLn; Write(MatToStr(Inversed(m2s),MFS));
WriteLn(' check: ',BoolToStr(SameMatrices(MatricesMultiply(Inversed(m2s),m2s),VMCL_IdentityMatrix2s,1e-6),True));
WriteLn;
WriteLn('m3s:'); WriteLn; WriteLn(MatToStr(m3s)); WriteLn; Write(MatToStr(Inversed(m3s),MFS));
WriteLn(' check: ',BoolToStr(SameMatrices(MatricesMultiply(Inversed(m3s),m3s),VMCL_IdentityMatrix3s,1e-6),True));
WriteLn;
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4s)); WriteLn; Write(MatToStr(Inversed(m4s),MFS));
WriteLn(' check: ',BoolToStr(SameMatrices(MatricesMultiply(Inversed(m4s),m4s),VMCL_IdentityMatrix4s,1e-6),True));
WriteLn;
WriteLn('m2d:'); WriteLn; WriteLn(MatToStr(m2d)); WriteLn; Write(MatToStr(Inversed(m2d),MFS));
WriteLn(' check: ',BoolToStr(SameMatrices(MatricesMultiply(Inversed(m2d),m2d),VMCL_IdentityMatrix2d,1e-12),True));
WriteLn;
WriteLn('m3d:'); WriteLn; WriteLn(MatToStr(m3d)); WriteLn; Write(MatToStr(Inversed(m3d),MFS));
WriteLn(' check: ',BoolToStr(SameMatrices(MatricesMultiply(Inversed(m3d),m3d),VMCL_IdentityMatrix3d,1e-12),True));
WriteLn;
WriteLn('m4d:'); WriteLn; WriteLn(MatToStr(m4d)); WriteLn; Write(MatToStr(Inversed(m4d),MFS));
WriteLn(' check: ',BoolToStr(SameMatrices(MatricesMultiply(Inversed(m4d),m4d),VMCL_IdentityMatrix4d,1e-12),True));
WriteLn; RandomMat(m4s); MatrixSetRow(m4s,3,Vector4s(0,0,0,1));
WriteLn('m4s:'); WriteLn; WriteLn(MatToStr(m4s)); WriteLn;
WriteLn(MatToStr(Inversed(m4s),MFS) + ' normal'); WriteLn; Write(MatToStr(InversedAffine(m4s),MFS) + ' affine, ');
WriteLn(' check: ',BoolToStr(SameMatrices(MatricesMultiply(InversedAffine(m4s),m4s),VMCL_IdentityMatrix4s,1e-6),True));
WriteLn; RandomMat(m4d); MatrixSetRow(m4d,3,Vector4d(0,0,0,1));
WriteLn('m4d:'); WriteLn; WriteLn(MatToStr(m4d)); WriteLn;
WriteLn(MatToStr(Inversed(m4d),MFS) + ' normal'); WriteLn; Write(MatToStr(InversedAffine(m4d),MFS) + ' affine, ');
WriteLn(' check: ',BoolToStr(SameMatrices(MatricesMultiply(InversedAffine(m4d),m4d),VMCL_IdentityMatrix4d,1e-12),True));
Result := 0;
end;
