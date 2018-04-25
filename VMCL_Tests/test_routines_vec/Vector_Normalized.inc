Function Vector_Normalized(AutoTest: Boolean = False): Integer;
var
  v2s:  TVMCLVector2s;
  v3s:  TVMCLVector3s;
  v4s:  TVMCLVector4s;
  v2d:  TVMCLVector2d;
  v3d:  TVMCLVector3d;
  v4d:  TVMCLVector4d;
  LFS:  TVMCLVectorFormat;
begin
LFS := VMCL_DefaultVectorFormat;
LFS.CommonFormat.ValueFormat.DecimalPlaces := 3;
WriteLn;
WriteLn(LineText('Normalized'));
RandomVec(v2s); RandomVec(v3s); RandomVec(v4s);
RandomVec(v2d); RandomVec(v3d); RandomVec(v4d);
WriteLn;
Write('v2s:      ' + VecToStr(v2s) + ' -> '); v2s := Normalized(v2s);
WriteLn(VecToStr(v2s,LFS) +  Format(' (%f)',[Magnitude(v2s)]));
WriteLn;
Write('v3s:      ' + VecToStr(v3s) + ' -> '); v3s := Normalized(v3s);
WriteLn(VecToStr(v3s,LFS) +  Format(' (%f)',[Magnitude(v3s)]));
WriteLn;
Write('v4s:      ' + VecToStr(v4s) + ' -> '); v4s := Normalized(v4s);
WriteLn(VecToStr(v4s,LFS) +  Format(' (%f)',[Magnitude(v4s)]));
RandomVec(v4s);
WriteLn;
Write('v4s(XYZ): ' + VecToStr(v4s) + ' -> '); v4s := NormalizedXYZ(v4s);
WriteLn(VecToStr(v4s,LFS) +  Format(' (%f)',[MagnitudeXYZ(v4s)]));
WriteLn;
Write('v2d:      ' + VecToStr(v2d) + ' -> '); v2d := Normalized(v2d);
WriteLn(VecToStr(v2d,LFS) +  Format(' (%f)',[Magnitude(v2d)]));
WriteLn;
Write('v3d:      ' + VecToStr(v3d) + ' -> '); v3d := Normalized(v3d);
WriteLn(VecToStr(v3d,LFS) +  Format(' (%f)',[Magnitude(v3d)]));
WriteLn;
Write('v4d:      ' + VecToStr(v4d) + ' -> '); v4d := Normalized(v4d);
WriteLn(VecToStr(v4d,LFS) +  Format(' (%f)',[Magnitude(v4d)]));
RandomVec(v4d);
WriteLn;
Write('v4d(XYZ): ' + VecToStr(v4d) + ' -> '); v4d := NormalizedXYZ(v4d);
WriteLn(VecToStr(v4d,LFS) +  Format(' (%f)',[MagnitudeXYZ(v4d)]));
Result := 0;
end;