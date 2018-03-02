Function Vector_VectorsAngleDeg({%H-}AutoTest: Boolean = False): Integer;
var
  v2s1,v2s2:  TVector2s;
  v3s1,v3s2:  TVector3s;
  v4s1,v4s2:  TVector4s;
  v2d1,v2d2:  TVector2d;
  v3d1,v3d2:  TVector3d;
  v4d1,v4d2:  TVector4d;
begin
WriteLn;
WriteLn(LineText('VectorsAngleDeg'));
RandomVec(v2s1); RandomVec(v3s1); RandomVec(v4s1);
RandomVec(v2d1); RandomVec(v3d1); RandomVec(v4d1);
RandomVec(v2s2); RandomVec(v3s2); RandomVec(v4s2);
RandomVec(v2d2); RandomVec(v3d2); RandomVec(v4d2);
WriteLn;
WriteLn('v2s: ' + VecToStr(v2s1) + ' > ' + VecToStr(v2s2) + ' -> ' + FloatToStr(VectorsAngleDeg(v2s1,v2s2)));
WriteLn;
WriteLn('v3s: ' + VecToStr(v3s1) + ' > ' + VecToStr(v3s2) + ' -> ' + FloatToStr(VectorsAngleDeg(v3s1,v3s2)));
WriteLn;
WriteLn('v4s: ' + VecToStr(v4s1) + ' > ' + VecToStr(v4s2) + ' -> ' + FloatToStr(VectorsAngleDeg(v4s1,v4s2)));
WriteLn;
WriteLn('v2d: ' + VecToStr(v2d1) + ' > ' + VecToStr(v2d2) + ' -> ' + FloatToStr(VectorsAngleDeg(v2d1,v2d2)));
WriteLn;
WriteLn('v3d: ' + VecToStr(v3d1) + ' > ' + VecToStr(v3d2) + ' -> ' + FloatToStr(VectorsAngleDeg(v3d1,v3d2)));
WriteLn;
WriteLn('v4d: ' + VecToStr(v4d1) + ' > ' + VecToStr(v4d2) + ' -> ' + FloatToStr(VectorsAngleDeg(v4d1,v4d2)));
Result := 0;
end;