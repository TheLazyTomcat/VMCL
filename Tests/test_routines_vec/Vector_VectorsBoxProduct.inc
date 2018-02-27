Function Vector_VectorsBoxProduct({%H-}AutoTest: Boolean = False): Integer;
var
  v3s1,v3s2,v3s3:  TVector3s;
  v4s1,v4s2,v4s3:  TVector4s;
  v3d1,v3d2,v3d3:  TVector3d;
  v4d1,v4d2,v4d3:  TVector4d;
begin
WriteLn;
WriteLn(LineText('VectorsBoxProduct'));
RandomVec(v3s1); RandomVec(v4s1);
RandomVec(v3d1); RandomVec(v4d1);
RandomVec(v3s2); RandomVec(v4s2);
RandomVec(v3d2); RandomVec(v4d2);
RandomVec(v3s3); RandomVec(v4s3);
RandomVec(v3d3); RandomVec(v4d3);
WriteLn;
WriteLn('v3s: ' + VecToStr(v3s1) + ' . (' + VecToStr(v3s2) + ' x ' + VecToStr(v3s3) + ') -> ' + FloatToStr(VectorsBoxProduct(v3s1,v3s2,v3s3)));
WriteLn;
WriteLn('v4s: ' + VecToStr(v4s1) + ' . (' + VecToStr(v4s2) + ' x ' + VecToStr(v4s3) + ') -> ' + FloatToStr(VectorsBoxProduct(v4s1,v4s2,v4s3)));
WriteLn;
WriteLn('v3d: ' + VecToStr(v3d1) + ' . (' + VecToStr(v3d2) + ' x ' + VecToStr(v3d3) + ') -> ' + FloatToStr(VectorsBoxProduct(v3d1,v3d2,v3d3)));
WriteLn;
WriteLn('v4d: ' + VecToStr(v4d1) + ' . (' + VecToStr(v4d2) + ' x ' + VecToStr(v4d3) + ') -> ' + FloatToStr(VectorsBoxProduct(v4d1,v4d2,v4d3)));
Result := 0;
end;
