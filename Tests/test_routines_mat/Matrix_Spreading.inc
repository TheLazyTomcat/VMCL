Function Matrix_Spreading(AutoTest: Boolean = False): Integer;
var
  m2s:  TMatrix2s;
  m3s:  TMatrix3s;
  m4s:  TMatrix4s;
  m2d:  TMatrix2d;
  m3d:  TMatrix3d;
  m4d:  TMatrix4d;
  Idx:  Integer;
begin
WriteLn;
WriteLn(LineText('Matrix spreading'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn; Idx := Random(2);
WriteLn('MatrixSpreadRow(m2s):'); WriteLn; Write(MatToStr(m2s)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadRow(m2s,Idx); WriteLn; WriteLn(MatToStr(m2s));
WriteLn; Idx := Random(3);
WriteLn('MatrixSpreadRow(m3s):'); WriteLn; Write(MatToStr(m3s)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadRow(m3s,Idx); WriteLn; WriteLn(MatToStr(m3s));
WriteLn; Idx := Random(4);
WriteLn('MatrixSpreadRow(m4s):'); WriteLn; Write(MatToStr(m4s)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadRow(m4s,Idx); WriteLn; WriteLn(MatToStr(m4s));
WriteLn; Idx := Random(2);
WriteLn('MatrixSpreadRow(m2d):'); WriteLn; Write(MatToStr(m2d)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadRow(m2d,Idx); WriteLn; WriteLn(MatToStr(m2d));
WriteLn; Idx := Random(3);
WriteLn('MatrixSpreadRow(m3d):'); WriteLn; Write(MatToStr(m3d)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadRow(m3d,Idx); WriteLn; WriteLn(MatToStr(m3d));
WriteLn; Idx := Random(4);
WriteLn('MatrixSpreadRow(m4d):'); WriteLn; Write(MatToStr(m4d)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadRow(m4d,Idx); WriteLn; WriteLn(MatToStr(m4d));
WriteLn;
WriteLn(Splitter);
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn; Idx := Random(2);
WriteLn('MatrixSpreadColumn(m2s):'); WriteLn; Write(MatToStr(m2s)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadColumn(m2s,Idx); WriteLn; WriteLn(MatToStr(m2s));
WriteLn; Idx := Random(3);
WriteLn('MatrixSpreadColumn(m3s):'); WriteLn; Write(MatToStr(m3s)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadColumn(m3s,Idx); WriteLn; WriteLn(MatToStr(m3s));
WriteLn; Idx := Random(4);
WriteLn('MatrixSpreadColumn(m4s):'); WriteLn; Write(MatToStr(m4s)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadColumn(m4s,Idx); WriteLn; WriteLn(MatToStr(m4s));
WriteLn; Idx := Random(2);
WriteLn('MatrixSpreadColumn(m2d):'); WriteLn; Write(MatToStr(m2d)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadColumn(m2d,Idx); WriteLn; WriteLn(MatToStr(m2d));
WriteLn; Idx := Random(3);
WriteLn('MatrixSpreadColumn(m3d):'); WriteLn; Write(MatToStr(m3d)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadColumn(m3d,Idx); WriteLn; WriteLn(MatToStr(m3d));
WriteLn; Idx := Random(4);
WriteLn('MatrixSpreadColumn(m4d):'); WriteLn; Write(MatToStr(m4d)); WriteLn(Format(' (%d)',[Idx]));
MatrixSpreadColumn(m4d,Idx); WriteLn; WriteLn(MatToStr(m4d));
Result := 0;
end;