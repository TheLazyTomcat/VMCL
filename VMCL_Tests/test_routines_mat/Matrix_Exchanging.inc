Function Matrix_Exchanging(AutoTest: Boolean = False): Integer;
var
  m2s:    TVMCLMatrix2s;
  m3s:    TVMCLMatrix3s;
  m4s:    TVMCLMatrix4s;
  m2d:    TVMCLMatrix2d;
  m3d:    TVMCLMatrix3d;
  m4d:    TVMCLMatrix4d;
  sC,sR:  Integer;
  dC,dR:  Integer;
begin
WriteLn;
WriteLn(LineText('Matrix exchanges'));
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn;
sC := Random(2); sR := Random(2); dC := Random(2); dR := Random(2);
WriteLn('MatrixExchangeEntries(m2s):'); WriteLn; Write(MatToStr(m2s)); WriteLn(Format(' (%d, %d <-> %d, %d)',[sR,sC,dR,dC]));
WriteLn; MatrixExchangeEntries(m2s,sR,sC,dR,dC); WriteLn; WriteLn(MatToStr(m2s));
WriteLn;
sC := Random(3); sR := Random(3); dC := Random(3); dR := Random(3);
WriteLn('MatrixExchangeEntries(m3s):'); WriteLn; Write(MatToStr(m3s)); WriteLn(Format(' (%d, %d <-> %d, %d)',[sR,sC,dR,dC]));
WriteLn; MatrixExchangeEntries(m3s,sR,sC,dR,dC); WriteLn; WriteLn(MatToStr(m3s));
WriteLn;
sC := Random(4); sR := Random(4); dC := Random(4); dR := Random(4);
WriteLn('MatrixExchangeEntries(m4s):'); WriteLn; Write(MatToStr(m4s)); WriteLn(Format(' (%d, %d <-> %d, %d)',[sR,sC,dR,dC]));
WriteLn; MatrixExchangeEntries(m4s,sR,sC,dR,dC); WriteLn; WriteLn(MatToStr(m4s)); 
WriteLn;
sC := Random(2); sR := Random(2); dC := Random(2); dR := Random(2);
WriteLn('MatrixExchangeEntries(m2d):'); WriteLn; Write(MatToStr(m2d)); WriteLn(Format(' (%d, %d <-> %d, %d)',[sR,sC,dR,dC]));
WriteLn; MatrixExchangeEntries(m2d,sR,sC,dR,dC); WriteLn; WriteLn(MatToStr(m2d));
WriteLn;
sC := Random(3); sR := Random(3); dC := Random(3); dR := Random(3);
WriteLn('MatrixExchangeEntries(m3d):'); WriteLn; Write(MatToStr(m3d)); WriteLn(Format(' (%d, %d <-> %d, %d)',[sR,sC,dR,dC]));
WriteLn; MatrixExchangeEntries(m3d,sR,sC,dR,dC); WriteLn; WriteLn(MatToStr(m3d));
WriteLn;
sC := Random(4); sR := Random(4); dC := Random(4); dR := Random(4);
WriteLn('MatrixExchangeEntries(m4d):'); WriteLn; Write(MatToStr(m4d)); WriteLn(Format(' (%d, %d <-> %d, %d)',[sR,sC,dR,dC]));
WriteLn; MatrixExchangeEntries(m4d,sR,sC,dR,dC); WriteLn; WriteLn(MatToStr(m4d));
WriteLn;
WriteLn(Splitter);
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn;
sR := Random(2); dR := Random(2);
WriteLn('MatrixExchangeRows(m2s):'); WriteLn; Write(MatToStr(m2s)); WriteLn(Format(' (%d <-> %d)',[sR,dR]));
WriteLn; MatrixExchangeRows(m2s,sR,dR); WriteLn; WriteLn(MatToStr(m2s));
WriteLn;
sR := Random(3); dR := Random(3);
WriteLn('MatrixExchangeRows(m3s):'); WriteLn; Write(MatToStr(m3s)); WriteLn(Format(' (%d <-> %d)',[sR,dR]));
WriteLn; MatrixExchangeRows(m3s,sR,dR); WriteLn; WriteLn(MatToStr(m3s));
WriteLn;
sR := Random(4); dR := Random(4);
WriteLn('MatrixExchangeRows(m4s):'); WriteLn; Write(MatToStr(m4s)); WriteLn(Format(' (%d <-> %d)',[sR,dR]));
WriteLn; MatrixExchangeRows(m4s,sR,dR); WriteLn; WriteLn(MatToStr(m4s));
WriteLn;
sR := Random(2); dR := Random(2);
WriteLn('MatrixExchangeRows(m2d):'); WriteLn; Write(MatToStr(m2d)); WriteLn(Format(' (%d <-> %d)',[sR,dR]));
WriteLn; MatrixExchangeRows(m2d,sR,dR); WriteLn; WriteLn(MatToStr(m2d));
WriteLn;
sR := Random(3); dR := Random(3);
WriteLn('MatrixExchangeRows(m3d):'); WriteLn; Write(MatToStr(m3d)); WriteLn(Format(' (%d <-> %d)',[sR,dR]));
WriteLn; MatrixExchangeRows(m3d,sR,dR); WriteLn; WriteLn(MatToStr(m3d));
WriteLn;
sR := Random(4); dR := Random(4);
WriteLn('MatrixExchangeRows(m4d):'); WriteLn; Write(MatToStr(m4d)); WriteLn(Format(' (%d <-> %d)',[sR,dR]));
WriteLn; MatrixExchangeRows(m4d,sR,dR); WriteLn; WriteLn(MatToStr(m4d));
WriteLn;
WriteLn(Splitter);
RandomMat(m2s); RandomMat(m3s); RandomMat(m4s);
RandomMat(m2d); RandomMat(m3d); RandomMat(m4d);
WriteLn;
sC := Random(2); dC := Random(2);
WriteLn('MatrixExchangeColumns(m2s):'); WriteLn; Write(MatToStr(m2s)); WriteLn(Format(' (%d <-> %d)',[sC,dC]));
WriteLn; MatrixExchangeColumns(m2s,sC,dC); WriteLn; WriteLn(MatToStr(m2s));
WriteLn;
sC := Random(3); dC := Random(3);
WriteLn('MatrixExchangeColumns(m3s):'); WriteLn; Write(MatToStr(m3s)); WriteLn(Format(' (%d <-> %d)',[sC,dC]));
WriteLn; MatrixExchangeColumns(m3s,sC,dC); WriteLn; WriteLn(MatToStr(m3s));
WriteLn;
sC := Random(4); dC := Random(4);
WriteLn('MatrixExchangeColumns(m4s):'); WriteLn; Write(MatToStr(m4s)); WriteLn(Format(' (%d <-> %d)',[sC,dC]));
WriteLn; MatrixExchangeColumns(m4s,sC,dC); WriteLn; WriteLn(MatToStr(m4s));
WriteLn;
sC := Random(2); dC := Random(2);
WriteLn('MatrixExchangeColumns(m2d):'); WriteLn; Write(MatToStr(m2d)); WriteLn(Format(' (%d <-> %d)',[sC,dC]));
WriteLn; MatrixExchangeColumns(m2d,sC,dC); WriteLn; WriteLn(MatToStr(m2d));
WriteLn;
sC := Random(3); dC := Random(3);
WriteLn('MatrixExchangeColumns(m3d):'); WriteLn; Write(MatToStr(m3d)); WriteLn(Format(' (%d <-> %d)',[sC,dC]));
WriteLn; MatrixExchangeColumns(m3d,sC,dC); WriteLn; WriteLn(MatToStr(m3d));
WriteLn;
sC := Random(4); dC := Random(4);
WriteLn('MatrixExchangeColumns(m4d):'); WriteLn; Write(MatToStr(m4d)); WriteLn(Format(' (%d <-> %d)',[sC,dC]));
WriteLn; MatrixExchangeColumns(m4d,sC,dC); WriteLn; WriteLn(MatToStr(m4d));
Result := 0;
end;
