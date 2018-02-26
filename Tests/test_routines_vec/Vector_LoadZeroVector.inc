Function Vector_LoadZeroVector(AutoTest: Boolean = False): Integer;
var
  v2s:  TVector2s;
  v3s:  TVector3s;
  v4s:  TVector4s;
  v2d:  TVector2d;
  v3d:  TVector3d;
  v4d:  TVector4d;
  PosV: Boolean;
begin
WriteLn;
WriteLn(LineText('LoadZeroVector'));
RandomVec(v2s); RandomVec(v3s); RandomVec(v4s);
RandomVec(v2d); RandomVec(v3d); RandomVec(v4d);
WriteLn; Write('v2s:      ' + VecToStr(v2s) + ' -> '); LoadZeroVector(v2s); WriteLn(VecToStr(v2s));
WriteLn; Write('v3s:      ' + VecToStr(v3s) + ' -> '); LoadZeroVector(v3s); WriteLn(VecToStr(v3s));
WriteLn; Write('v4s(XYZ): ' + VecToStr(v4s) + ' -> '); LoadZeroVectorXYZ(v4s); WriteLn(VecToStr(v4s));
RandomVec(v4s); PosV := Random(2) = 0;
WriteLn; Write('v4s(posv: ' + BoolToStr(PosV,True) + '): ' + VecToStr(v4s) + ' -> '); LoadZeroVector(v4s,PosV); WriteLn(VecToStr(v4s));
WriteLn; Write('v2d:      ' + VecToStr(v2d) + ' -> '); LoadZeroVector(v2d); WriteLn(VecToStr(v2d));
WriteLn; Write('v3d:      ' + VecToStr(v3d) + ' -> '); LoadZeroVector(v3d); WriteLn(VecToStr(v3d));
WriteLn; Write('v4d(XYZ): ' + VecToStr(v4d) + ' -> '); LoadZeroVectorXYZ(v4d); WriteLn(VecToStr(v4d));
RandomVec(v4d); PosV := Random(2) = 0;
WriteLn; Write('v4d(posv: ' + BoolToStr(PosV,True) + '): ' + VecToStr(v4d) + ' -> '); LoadZeroVector(v4d,PosV); WriteLn(VecToStr(v4d));
Result := 0;
end;