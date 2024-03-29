Function Matrix_Build(AutoTest: Boolean = False): Integer;
var
  m2s:  TVMCLMatrix2s;
  m3s:  TVMCLMatrix3s;
  m4s:  TVMCLMatrix4s;
  m2d:  TVMCLMatrix2d;
  m3d:  TVMCLMatrix3d;
  m4d:  TVMCLMatrix4d;
  v2s1,v2s2:            TVector2s;
  v3s1,v3s2,v3s3:       TVector3s;
  v4s1,v4s2,v4s3,v4s4:  TVector4s;
  v2d1,v2d2:            TVector2d;
  v3d1,v3d2,v3d3:       TVector3d;
  v4d1,v4d2,v4d3,v4d4:  TVector4d;
begin
WriteLn;
WriteLn(LineText('Matrix building'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
RandomVec(v2s1); RandomVec(v2s2);
RandomVec(v3s1); RandomVec(v3s2); RandomVec(v3s3);
RandomVec(v4s1); RandomVec(v4s2); RandomVec(v4s3); RandomVec(v4s4);
RandomVec(v2d1); RandomVec(v2d2);
RandomVec(v3d1); RandomVec(v3d2); RandomVec(v3d3);
RandomVec(v4d1); RandomVec(v4d2); RandomVec(v4d3); RandomVec(v4d4);
WriteLn;
WriteLn('v2s: ' + VecToStr(v2s1) + ' ' + VecToStr(v2s2));
WriteLn('v3s: ' + VecToStr(v3s1) + ' ' + VecToStr(v3s2) + ' ' + VecToStr(v3s3));
WriteLn('v4s: ' + VecToStr(v4s1) + ' ' + VecToStr(v4s2) + ' ' + VecToStr(v4s3) + ' ' + VecToStr(v4s4));
WriteLn;
WriteLn('MatrixFromRows(v2s): ' + sLineBreak + MatToStr(MatrixFromRows(v2s1,v2s2)));
WriteLn;
WriteLn('MatrixFromRows(v3s): ' + sLineBreak + MatToStr(MatrixFromRows(v3s1,v3s2,v3s3)));
WriteLn;
WriteLn('MatrixFromRows(v4s): ' + sLineBreak + MatToStr(MatrixFromRows(v4s1,v4s2,v4s3,v4s4)));
WriteLn;
WriteLn('v2d: ' + VecToStr(v2d1) + ' ' + VecToStr(v2d2));
WriteLn('v3d: ' + VecToStr(v3d1) + ' ' + VecToStr(v3d2) + ' ' + VecToStr(v3d3));
WriteLn('v4d: ' + VecToStr(v4d1) + ' ' + VecToStr(v4d2) + ' ' + VecToStr(v4d3) + ' ' + VecToStr(v4d4));
WriteLn;
WriteLn('MatrixFromRows(v2d): ' + sLineBreak + MatToStr(MatrixFromRows(v2d1,v2d2)));
WriteLn;
WriteLn('MatrixFromRows(v3d): ' + sLineBreak + MatToStr(MatrixFromRows(v3d1,v3d2,v3d3)));
WriteLn;
WriteLn('MatrixFromRows(v4d): ' + sLineBreak + MatToStr(MatrixFromRows(v4d1,v4d2,v4d3,v4d4)));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
RandomVec(v2s1); RandomVec(v2s2);
RandomVec(v3s1); RandomVec(v3s2); RandomVec(v3s3);
RandomVec(v4s1); RandomVec(v4s2); RandomVec(v4s3); RandomVec(v4s4);
RandomVec(v2d1); RandomVec(v2d2);
RandomVec(v3d1); RandomVec(v3d2); RandomVec(v3d3);
RandomVec(v4d1); RandomVec(v4d2); RandomVec(v4d3); RandomVec(v4d4);
WriteLn;
WriteLn(Splitter);
WriteLn;
WriteLn('v2s: ' + VecToStr(v2s1) + ' ' + VecToStr(v2s2));
WriteLn('v3s: ' + VecToStr(v3s1) + ' ' + VecToStr(v3s2) + ' ' + VecToStr(v3s3));
WriteLn('v4s: ' + VecToStr(v4s1) + ' ' + VecToStr(v4s2) + ' ' + VecToStr(v4s3) + ' ' + VecToStr(v4s4));
WriteLn;
WriteLn('MatrixFromColumns(v2s): ' + sLineBreak + MatToStr(MatrixFromColumns(v2s1,v2s2)));
WriteLn;
WriteLn('MatrixFromColumns(v3s): ' + sLineBreak + MatToStr(MatrixFromColumns(v3s1,v3s2,v3s3)));
WriteLn;
WriteLn('MatrixFromColumns(v4s): ' + sLineBreak + MatToStr(MatrixFromColumns(v4s1,v4s2,v4s3,v4s4)));
WriteLn;
WriteLn('v2d: ' + VecToStr(v2d1) + ' ' + VecToStr(v2d2));
WriteLn('v3d: ' + VecToStr(v3d1) + ' ' + VecToStr(v3d2) + ' ' + VecToStr(v3d3));
WriteLn('v4d: ' + VecToStr(v4d1) + ' ' + VecToStr(v4d2) + ' ' + VecToStr(v4d3) + ' ' + VecToStr(v4d4));
WriteLn;
WriteLn('MatrixFromColumns(v2d): ' + sLineBreak + MatToStr(MatrixFromColumns(v2d1,v2d2)));
WriteLn;
WriteLn('MatrixFromColumns(v3d): ' + sLineBreak + MatToStr(MatrixFromColumns(v3d1,v3d2,v3d3)));
WriteLn;
WriteLn('MatrixFromColumns(v4d): ' + sLineBreak + MatToStr(MatrixFromColumns(v4d1,v4d2,v4d3,v4d4)));
Result := 0;
end;
