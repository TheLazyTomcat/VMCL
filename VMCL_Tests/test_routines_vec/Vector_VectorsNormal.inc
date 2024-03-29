Function Vector_VectorsNormal(AutoTest: Boolean = False): Integer;
var
  v3s1,v3s2,v3s3:  TVMCLVector3s;
  v4s1,v4s2,v4s3:  TVMCLVector4s;
  v3d1,v3d2,v3d3:  TVMCLVector3d;
  v4d1,v4d2,v4d3:  TVMCLVector4d;
  LFS:             TVMCLVectorFormat;
begin
LFS := VMCL_DefaultVectorFormat;
LFS.CommonFormat.ValueFormat.DecimalPlaces := 3;
WriteLn;
WriteLn(LineText('VectorsNormal'));
RandomVec(v3s1); RandomVec(v4s1);
RandomVec(v3d1); RandomVec(v4d1);
RandomVec(v3s2); RandomVec(v4s2);
RandomVec(v3d2); RandomVec(v4d2);
WriteLn;
v3s3 := VectorsNormal(v3s1,v3s2);
WriteLn('v3s: ' + VecToStr(v3s1) + ' N ' + VecToStr(v3s2) + ' -> ' + VecToStr(v3s3,LFS));
WriteLn(Format('     (%f, %f)',[VectorsAngleDeg(v3s1,v3s3),VectorsAngleDeg(v3s2,v3s3)]));
WriteLn;
v4s3 := VectorsNormal(v4s1,v4s2);
WriteLn('v4s: ' + VecToStr(v4s1) + ' N ' + VecToStr(v4s2) + ' -> ' + VecToStr(v4s3,LFS));
WriteLn(Format('     (%f, %f)',[VectorsAngleDeg(v4s1,v4s3),VectorsAngleDeg(v4s2,v4s3)]));
WriteLn;
v3d3 := VectorsNormal(v3d1,v3d2);
WriteLn('v3d: ' + VecToStr(v3d1) + ' N ' + VecToStr(v3d2) + ' -> ' + VecToStr(v3d3,LFS));
WriteLn(Format('     (%f, %f)',[VectorsAngleDeg(v3d1,v3d3),VectorsAngleDeg(v3d2,v3d3)]));
WriteLn;
v4d3 := VectorsNormal(v4d1,v4d2);
WriteLn('v4d: ' + VecToStr(v4d1) + ' N ' + VecToStr(v4d2) + ' -> ' + VecToStr(v4d3,LFS));
WriteLn(Format('     (%f, %f)',[VectorsAngleDeg(v4d1,v4d3),VectorsAngleDeg(v4d2,v4d3)]));
Result := 0;
end;
