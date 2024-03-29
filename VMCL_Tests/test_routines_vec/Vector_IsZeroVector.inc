Function Vector_IsZeroVector(AutoTest: Boolean = False): Integer;
var
  v2s:  TVMCLVector2s;
  v3s:  TVMCLVector3s;
  v4s:  TVMCLVector4s;
  v2d:  TVMCLVector2d;
  v3d:  TVMCLVector3d;
  v4d:  TVMCLVector4d;
begin
WriteLn;
WriteLn(LineText('IsZeroVector'));
RandomVec(v2s); RandomVec(v3s); RandomVec(v4s);
RandomVec(v2d); RandomVec(v3d); RandomVec(v4d);
WriteLn; Write('v2s:      '+ VecToStr(v2s) + ' ' + BoolToStr(IsZeroVector(v2s),True) + ' -> ');
LoadZeroVector(v2s);
WriteLn(VecToStr(v2s) + ' ' + BoolToStr(IsZeroVector(v2s),True));
WriteLn; Write('v3s:      '+ VecToStr(v3s) + ' ' + BoolToStr(IsZeroVector(v3s),True) + ' -> ');
LoadZeroVector(v3s);
WriteLn(VecToStr(v3s) + ' ' + BoolToStr(IsZeroVector(v3s),True));
WriteLn; Write('v4s:      '+ VecToStr(v4s) + ' ' + BoolToStr(IsZeroVector(v4s),True) + ' -> ');
LoadZeroVector(v4s);
WriteLn(VecToStr(v4s) + ' ' + BoolToStr(IsZeroVector(v4s),True));
RandomVec(v4s);
WriteLn; Write('v4s(XYZ): '+ VecToStr(v4s) + ' ' + BoolToStr(IsZeroVectorXYZ(v4s),True) + ' -> ');
LoadZeroVectorXYZ(v4s);
WriteLn(VecToStr(v4s) + ' ' + BoolToStr(IsZeroVectorXYZ(v4s),True));
WriteLn; Write('v2d:      '+ VecToStr(v2d) + ' ' + BoolToStr(IsZeroVector(v2d),True) + ' -> ');
LoadZeroVector(v2d);
WriteLn(VecToStr(v2d) + ' ' + BoolToStr(IsZeroVector(v2d),True));
WriteLn; Write('v3d:      '+ VecToStr(v3d) + ' ' + BoolToStr(IsZeroVector(v3d),True) + ' -> ');
LoadZeroVector(v3d);
WriteLn(VecToStr(v3d) + ' ' + BoolToStr(IsZeroVector(v3d),True));
WriteLn; Write('v4d:      '+ VecToStr(v4d) + ' ' + BoolToStr(IsZeroVector(v4d),True) + ' -> ');
LoadZeroVector(v4d);
WriteLn(VecToStr(v4d) + ' ' + BoolToStr(IsZeroVector(v4d),True));
RandomVec(v4d);
WriteLn; Write('v4d(XYZ): '+ VecToStr(v4d) + ' ' + BoolToStr(IsZeroVectorXYZ(v4d),True) + ' -> ');
LoadZeroVectorXYZ(v4d);
WriteLn(VecToStr(v4d) + ' ' + BoolToStr(IsZeroVectorXYZ(v4d),True));
Result := 0;
end;
