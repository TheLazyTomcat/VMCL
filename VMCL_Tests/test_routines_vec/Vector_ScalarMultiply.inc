Function Vector_ScalarMultiply(AutoTest: Boolean = False): Integer;
var
  v2s:  TVMCLVector2s;
  v3s:  TVMCLVector3s;
  v4s:  TVMCLVector4s;
  v2d:  TVMCLVector2d;
  v3d:  TVMCLVector3d;
  v4d:  TVMCLVector4d;
  Scls: Single;
  Scld: Double;
begin
WriteLn;
WriteLn(LineText('ScalarMultiply'));
RandomVec(v2s); RandomVec(v3s); RandomVec(v4s);
RandomVec(v2d); RandomVec(v3d); RandomVec(v4d);
Scls := Random(10);
WriteLn;
WriteLn('v2s:      ' + VecToStr(v2s) + Format(' * %f -> ',[Scls]) + VecToStr(ScalarMultiply(v2s,Scls)));
WriteLn; Scls := Random(10);
WriteLn('v3s:      ' + VecToStr(v3s) + Format(' * %f -> ',[Scls]) + VecToStr(ScalarMultiply(v3s,Scls)));
WriteLn; Scls := Random(10);
WriteLn('v4s:      ' + VecToStr(v4s) + Format(' * %f -> ',[Scls]) + VecToStr(ScalarMultiply(v4s,Scls)));
WriteLn; RandomVec(v4s); Scls := Random(10);
WriteLn('v4s(XYZ): ' + VecToStr(v4s) + Format(' * %f -> ',[Scls]) + VecToStr(ScalarMultiplyXYZ(v4s,Scls)));
WriteLn; Scld := Random(10);
WriteLn('v2d:      ' + VecToStr(v2d) + Format(' * %f -> ',[Scld]) + VecToStr(ScalarMultiply(v2d,Scld)));
WriteLn; Scld := Random(10);
WriteLn('v3d:      ' + VecToStr(v3d) + Format(' * %f -> ',[Scld]) + VecToStr(ScalarMultiply(v3d,Scld)));
WriteLn; Scld := Random(10);
WriteLn('v4d:      ' + VecToStr(v4d) + Format(' * %f -> ',[Scld]) + VecToStr(ScalarMultiply(v4d,Scld)));
WriteLn; RandomVec(v4d); Scld := Random(10);
WriteLn('v4d(XYZ): ' + VecToStr(v4d) + Format(' * %f -> ',[Scld]) + VecToStr(ScalarMultiplyXYZ(v4d,Scld)));
Result := 0;
end;