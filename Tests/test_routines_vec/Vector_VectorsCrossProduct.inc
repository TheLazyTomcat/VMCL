Function Vector_VectorsCrossProduct({%H-}AutoTest: Boolean = False): Integer;
var
  v3s1,v3s2:  TVector3s;
  v4s1,v4s2:  TVector4s;
  v3d1,v3d2:  TVector3d;
  v4d1,v4d2:  TVector4d;
begin
WriteLn;
WriteLn(LineText('VectorsCrossProduct'));
RandomVec(v3s1); RandomVec(v4s1);
RandomVec(v3d1); RandomVec(v4d1);
RandomVec(v3s2); RandomVec(v4s2);
RandomVec(v3d2); RandomVec(v4d2);
WriteLn;
WriteLn('v3s: ' + VecToStr(v3s1) + ' x ' + VecToStr(v3s2) + ' -> ' + VecToStr(VectorsCrossProduct(v3s1,v3s2)));
WriteLn;
WriteLn('v4s: ' + VecToStr(v4s1) + ' x ' + VecToStr(v4s2) + ' -> ' + VecToStr(VectorsCrossProduct(v4s1,v4s2)));
WriteLn;
WriteLn('v3d: ' + VecToStr(v3d1) + ' x ' + VecToStr(v3d2) + ' -> ' + VecToStr(VectorsCrossProduct(v3d1,v3d2)));
WriteLn;
WriteLn('v4d: ' + VecToStr(v4d1) + ' x ' + VecToStr(v4d2) + ' -> ' + VecToStr(VectorsCrossProduct(v4d1,v4d2)));
Result := 0;
end;
