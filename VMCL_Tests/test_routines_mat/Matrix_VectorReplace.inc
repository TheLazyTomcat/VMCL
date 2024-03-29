Function Matrix_VectorReplace(AutoTest: Boolean = False): Integer;
var
  m2s:  TVMCLMatrix2s;
  m3s:  TVMCLMatrix3s;
  m4s:  TVMCLMatrix4s;
  m2d:  TVMCLMatrix2d;
  m3d:  TVMCLMatrix3d;
  m4d:  TVMCLMatrix4d;
  Idx:  Integer;
  v2s:  TVector2s;
  v3s:  TVector3s;
  v4s:  TVector4s;
  v2d:  TVector2d;
  v3d:  TVector3d;
  v4d:  TVector4d;
begin
WriteLn;
WriteLn(LineText('Matrix vector insertion'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
RandomVec(v2s); RandomVec(v3s); RandomVec(v4s);
RandomVec(v2d); RandomVec(v3d); RandomVec(v4d);
WriteLn; Idx := Random(2);
WriteLn('MatrixSetRow(m2s):'); WriteLn; Write(MatToStr(m2s));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v2s));
WriteLn;
MatrixSetRow(m2s,Idx,v2s); WriteLn(MatToStr(m2s));
WriteLn; Idx := Random(3);
WriteLn('MatrixSetRow(m3s):'); WriteLn; Write(MatToStr(m3s));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v3s));
WriteLn;
MatrixSetRow(m3s,Idx,v3s); WriteLn(MatToStr(m3s));
WriteLn; Idx := Random(4);
WriteLn('MatrixSetRow(m4s):'); WriteLn; Write(MatToStr(m4s));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v4s));
WriteLn;
MatrixSetRow(m4s,Idx,v4s); WriteLn(MatToStr(m4s));
WriteLn; Idx := Random(2);
WriteLn('MatrixSetRow(m2d):'); WriteLn; Write(MatToStr(m2d));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v2d));
WriteLn;
MatrixSetRow(m2d,Idx,v2d); WriteLn(MatToStr(m2d));
WriteLn; Idx := Random(3);
WriteLn('MatrixSetRow(m3d):'); WriteLn; Write(MatToStr(m3d));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v3d));
WriteLn;
MatrixSetRow(m3d,Idx,v3d); WriteLn(MatToStr(m3d));
WriteLn; Idx := Random(4);
WriteLn('MatrixSetRow(m4d):'); WriteLn; Write(MatToStr(m4d));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v4d));
WriteLn;
MatrixSetRow(m4d,Idx,v4d); WriteLn(MatToStr(m4d));
WriteLn;
WriteLn(Splitter);
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
RandomVec(v2s); RandomVec(v3s); RandomVec(v4s);
RandomVec(v2d); RandomVec(v3d); RandomVec(v4d);
WriteLn; Idx := Random(2);
WriteLn('MatrixSetColumn(m2s):'); WriteLn; Write(MatToStr(m2s));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v2s));
WriteLn;
MatrixSetColumn(m2s,Idx,v2s); WriteLn(MatToStr(m2s));
WriteLn; Idx := Random(3);
WriteLn('MatrixSetColumn(m3s):'); WriteLn; Write(MatToStr(m3s));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v3s));
WriteLn;
MatrixSetColumn(m3s,Idx,v3s); WriteLn(MatToStr(m3s));
WriteLn; Idx := Random(4);
WriteLn('MatrixSetColumn(m4s):'); WriteLn; Write(MatToStr(m4s));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v4s));
WriteLn;
MatrixSetColumn(m4s,Idx,v4s); WriteLn(MatToStr(m4s));
WriteLn; Idx := Random(2);
WriteLn('MatrixSetColumn(m2d):'); WriteLn; Write(MatToStr(m2d));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v2d));
WriteLn;
MatrixSetColumn(m2d,Idx,v2d); WriteLn(MatToStr(m2d));
WriteLn; Idx := Random(3);
WriteLn('MatrixSetColumn(m3d):'); WriteLn; Write(MatToStr(m3d));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v3d));
WriteLn;
MatrixSetColumn(m3d,Idx,v3d); WriteLn(MatToStr(m3d));
WriteLn; Idx := Random(4);
WriteLn('MatrixSetColumn(m4d):'); WriteLn; Write(MatToStr(m4d));
WriteLn(Format(' (%d) <- ',[Idx]) + VecToStr(v4d));
WriteLn;
MatrixSetColumn(m4d,Idx,v4d); WriteLn(MatToStr(m4d));
Result := 0;
end;
