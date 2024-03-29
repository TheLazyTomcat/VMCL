Function Vector_Swizzle(AutoTest: Boolean = False): Integer;
var
  v2s:          TVMCLVector2s;
  v3s:          TVMCLVector3s;
  v4s:          TVMCLVector4s;
  v2d:          TVMCLVector2d;
  v3d:          TVMCLVector3d;
  v4d:          TVMCLVector4d;
  f0,f1,f2,f3:  TVMCLVectorField;
begin
WriteLn;
WriteLn(LineText('Vector swizzling'));
RandomVec(v2s); RandomVec(v3s); RandomVec(v4s);
RandomVec(v2d); RandomVec(v3d); RandomVec(v4d);
f0 := TVectorField(Random(2));
WriteLn; WriteLn(Format('Swizzle(v2s,%d):   ',[Ord(f0)]) + VecToStr(v2s) + ' -> ' + VecToStr(Swizzle(v2s,f0)));
f0 := TVectorField(Random(2)); f1 := TVectorField(Random(2));
WriteLn; WriteLn(Format('Swizzle(v2s,%d,%d): ',[Ord(f0),Ord(f1)]) + VecToStr(v2s) + ' -> ' + VecToStr(Swizzle(v2s,f0,f1)));
f0 := TVectorField(Random(3));
WriteLn; WriteLn(Format('Swizzle(v3s,%d):     ',[Ord(f0)]) + VecToStr(v3s) + ' -> ' + VecToStr(Swizzle(v3s,f0)));
f0 := TVectorField(Random(3)); f1 := TVectorField(Random(3));
WriteLn; WriteLn(Format('Swizzle(v3s,%d,%d):   ',[Ord(f0),Ord(f1)]) + VecToStr(v3s) + ' -> ' + VecToStr(Swizzle(v3s,f0,f1)));
f0 := TVectorField(Random(3)); f1 := TVectorField(Random(3)); f2 := TVectorField(Random(3));
WriteLn; WriteLn(Format('Swizzle(v3s,%d,%d,%d): ',[Ord(f0),Ord(f1),Ord(f2)]) + VecToStr(v3s) + ' -> ' + VecToStr(Swizzle(v3s,f0,f1,f2)));
f0 := TVectorField(Random(4));
WriteLn; WriteLn(Format('Swizzle(v4s,%d):       ',[Ord(f0)]) + VecToStr(v4s) + ' -> ' + VecToStr(Swizzle(v4s,f0)));
f0 := TVectorField(Random(4)); f1 := TVectorField(Random(4));
WriteLn; WriteLn(Format('Swizzle(v4s,%d,%d):     ',[Ord(f0),Ord(f1)]) + VecToStr(v4s) + ' -> ' + VecToStr(Swizzle(v4s,f0,f1)));
f0 := TVectorField(Random(4)); f1 := TVectorField(Random(4)); f2 := TVectorField(Random(4));
WriteLn; WriteLn(Format('Swizzle(v4s,%d,%d,%d):   ',[Ord(f0),Ord(f1),Ord(f2)]) + VecToStr(v4s) + ' -> ' + VecToStr(Swizzle(v4s,f0,f1,f2)));
f0 := TVectorField(Random(4)); f1 := TVectorField(Random(4)); f2 := TVectorField(Random(4)); f3 := TVectorField(Random(4));
WriteLn; WriteLn(Format('Swizzle(v4s,%d,%d,%d,%d): ',[Ord(f0),Ord(f1),Ord(f2),Ord(f3)]) + VecToStr(v4s) + ' -> ' + VecToStr(Swizzle(v4s,f0,f1,f2,f3)));
WriteLn;
f0 := TVectorField(Random(2));
WriteLn; WriteLn(Format('Swizzle(v2d,%d):   ',[Ord(f0)]) + VecToStr(v2d) + ' -> ' + VecToStr(Swizzle(v2d,f0)));
f0 := TVectorField(Random(2)); f1 := TVectorField(Random(2));
WriteLn; WriteLn(Format('Swizzle(v2d,%d,%d): ',[Ord(f0),Ord(f1)]) + VecToStr(v2d) + ' -> ' + VecToStr(Swizzle(v2d,f0,f1)));
f0 := TVectorField(Random(3));
WriteLn; WriteLn(Format('Swizzle(v3d,%d):     ',[Ord(f0)]) + VecToStr(v3d) + ' -> ' + VecToStr(Swizzle(v3d,f0)));
f0 := TVectorField(Random(3)); f1 := TVectorField(Random(3));
WriteLn; WriteLn(Format('Swizzle(v3d,%d,%d):   ',[Ord(f0),Ord(f1)]) + VecToStr(v3d) + ' -> ' + VecToStr(Swizzle(v3d,f0,f1)));
f0 := TVectorField(Random(3)); f1 := TVectorField(Random(3)); f2 := TVectorField(Random(3));
WriteLn; WriteLn(Format('Swizzle(v3d,%d,%d,%d): ',[Ord(f0),Ord(f1),Ord(f2)]) + VecToStr(v3d) + ' -> ' + VecToStr(Swizzle(v3d,f0,f1,f2)));
f0 := TVectorField(Random(4));
WriteLn; WriteLn(Format('Swizzle(v4d,%d):       ',[Ord(f0)]) + VecToStr(v4d) + ' -> ' + VecToStr(Swizzle(v4d,f0)));
f0 := TVectorField(Random(4)); f1 := TVectorField(Random(4));
WriteLn; WriteLn(Format('Swizzle(v4d,%d,%d):     ',[Ord(f0),Ord(f1)]) + VecToStr(v4d) + ' -> ' + VecToStr(Swizzle(v4d,f0,f1)));
f0 := TVectorField(Random(4)); f1 := TVectorField(Random(4)); f2 := TVectorField(Random(4));
WriteLn; WriteLn(Format('Swizzle(v4d,%d,%d,%d):   ',[Ord(f0),Ord(f1),Ord(f2)]) + VecToStr(v4d) + ' -> ' + VecToStr(Swizzle(v4d,f0,f1,f2)));
f0 := TVectorField(Random(4)); f1 := TVectorField(Random(4)); f2 := TVectorField(Random(4)); f3 := TVectorField(Random(4));
WriteLn; WriteLn(Format('Swizzle(v4d,%d,%d,%d,%d): ',[Ord(f0),Ord(f1),Ord(f2),Ord(f3)]) + VecToStr(v4d) + ' -> ' + VecToStr(Swizzle(v4d,f0,f1,f2,f3)));
Result := 0;
end;
