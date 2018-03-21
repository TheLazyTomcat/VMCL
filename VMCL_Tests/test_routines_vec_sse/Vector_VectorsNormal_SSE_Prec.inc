Function Vector_VectorsNormal_SSE_Prec({%H-}AutoTest: Boolean = False): Integer;
const
  TestCount = 1000000;
var
  v3s1,v3s2,v3s3: PVMCLVector3s;
  v4s1,v4s2,v4s3: PVMCLVector4s;
  v3d1,v3d2,v3d3: PVMCLVector3d;
  v4d1,v4d2,v4d3: PVMCLVector4d;
  FuncPAS_3s: Function(const aVector,bVector: TVMCLVector3s): TVMCLVector3s;
  FuncPAS_4s: Function(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
  FuncPAS_3d: Function(const aVector,bVector: TVMCLVector3d): TVMCLVector3d;
  FuncPAS_4d: Function(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
  FuncASM_3s: procedure(const aVector,bVector: TVMCLVector3s; out Normal: TVMCLVector3s);
  FuncASM_4s: procedure(const aVector,bVector: TVMCLVector4s; out Normal: TVMCLVector4s);
  FuncASM_3d: procedure(const aVector,bVector: TVMCLVector3d; out Normal: TVMCLVector3d);
  FuncASM_4d: procedure(const aVector,bVector: TVMCLVector4d; out Normal: TVMCLVector4d);
  i:          Integer;
  EmptyTicks: Int64;
  Ticks:      Int64;
  nSSETicks:  Int64;
begin
// obtain addresses of proper version of overloaded functions
FuncPAS_3s := VMCL_Vectors.VectorsNormal;
FuncPAS_4s := VMCL_Vectors.VectorsNormal;
FuncPAS_3d := VMCL_Vectors.VectorsNormal;
FuncPAS_4d := VMCL_Vectors.VectorsNormal;
FuncASM_3s := VMCL_Vectors_SSE.VectorsNormal_SSE;
FuncASM_4s := VMCL_Vectors_SSE.VectorsNormal_SSE;
FuncASM_3d := VMCL_Vectors_SSE.VectorsNormal_SSE;
FuncASM_4d := VMCL_Vectors_SSE.VectorsNormal_SSE;
WriteLn;
WriteLn(LineText('VectorsNormal_SSE - High precision speed tests'));
WriteLn;
WriteLn(TestCount,' cycles');
VMCL_New(v3s1); VMCL_New(v3s2); VMCL_New(v3s3);
VMCL_New(v4s1); VMCL_New(v4s2); VMCL_New(v4s3);
VMCL_New(v3d1); VMCL_New(v3d2); VMCL_New(v3d3);
VMCL_New(v4d1); VMCL_New(v4d2); VMCL_New(v4d3);
try
  // get average empty call ticks
  WriteLn;
  EmptyTicks := 0;
  PrecisionTest.FunctionAddr := nil;
  For i := 1 to TestCount do
    begin
      Vector_SpeedTestCaller_Empty;
      EmptyTicks := EmptyTicks + PrecisionTestsTicks(PrecisionTest);
    end;
  EmptyTicks := EmptyTicks div TestCount;
  WriteLn('Empty call ticks: ',EmptyTicks);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncPAS_3s);
  Write('v3s VectorsNormal:          ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^); LoadZeroVector(v3s3^);
      Vector_SpeedTestCaller_3P_R(v3s1,v3s2,v3s3);
      If not SameVectors(v3s3^,VectorsNormal(v3s1^,v3s2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%d (%d)',[Ticks - EmptyTicks,Ticks]));
    end;
  nSSETicks := Ticks - EmptyTicks;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncASM_3s);
  Write(Format('v3s VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v3s1,v3s2,v3s3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^); LoadZeroVector(v3s3^);
      Vector_SpeedTestCaller_3P(v3s1,v3s2,v3s3);
      If not SameVectors(v3s3^,VectorsNormal(v3s1^,v3s2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(VectorsNormal_3s_SSEua);
  Write('v3s VectorsNormal_3s_SSEua: ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^); LoadZeroVector(v3s3^);
      Vector_SpeedTestCaller_3P(v3s1,v3s2,v3s3);
      If not SameVectors(v3s3^,VectorsNormal(v3s1^,v3s2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncPAS_4s);
  Write('v4s VectorsNormal:          ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P_R(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsNormal(v4s1^,v4s2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%d (%d)',[Ticks - EmptyTicks,Ticks]));
    end;
  nSSETicks := Ticks - EmptyTicks;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncASM_4s);
  Write(Format('v4s VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v4s1,v4s2,v4s3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsNormal(v4s1^,v4s2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(VectorsNormal_4s_SSEu);
  Write('v4s VectorsNormal_4s_SSEu:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsNormal(v4s1^,v4s2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(VectorsNormal_4s_SSEa);
  Write('v4s VectorsNormal_4s_SSEa:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsNormal(v4s1^,v4s2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncPAS_3d);
  Write('v3d VectorsNormal:          ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      Vector_SpeedTestCaller_3P_R(v3d1,v3d2,v3d3);
      If not SameVectors(v3d3^,VectorsNormal(v3d1^,v3d2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%d (%d)',[Ticks - EmptyTicks,Ticks]));
    end;
  nSSETicks := Ticks - EmptyTicks;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncASM_3d);
  Write(Format('v3d VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v3d1,v3d2,v3d3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      Vector_SpeedTestCaller_3P(v3d1,v3d2,v3d3);
      If not SameVectors(v3d3^,VectorsNormal(v3d1^,v3d2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(VectorsNormal_3d_SSEu);
  Write('v3d VectorsNormal_3d_SSEu:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      Vector_SpeedTestCaller_3P(v3d1,v3d2,v3d3);
      If not SameVectors(v3d3^,VectorsNormal(v3d1^,v3d2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(VectorsNormal_3d_SSEa);
  Write('v3d VectorsNormal_3d_SSEa:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      Vector_SpeedTestCaller_3P(v3d1,v3d2,v3d3);
      If not SameVectors(v3d3^,VectorsNormal(v3d1^,v3d2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncPAS_4d);
  Write('v4d VectorsNormal:          ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P_R(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsNormal(v4d1^,v4d2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%d (%d)',[Ticks - EmptyTicks,Ticks]));
    end;
  nSSETicks := Ticks - EmptyTicks;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncASM_4d);
  Write(Format('v4d VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v4d1,v4d2,v4d3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsNormal(v4d1^,v4d2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(VectorsNormal_4d_SSEu);
  Write('v4d VectorsNormal_4d_SSEu:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsNormal(v4d1^,v4d2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;

  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(VectorsNormal_4d_SSEa);
  Write('v4d VectorsNormal_4d_SSEa:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsNormal(v4d1^,v4d2^),1e-6) then
        begin
          WriteLn('Error');
          Ticks := 0;
          Break{For i};
        end
      else Ticks := Ticks + PrecisionTestsTicks(PrecisionTest)
    end;
  If Ticks > 0 then
    begin
      Ticks := Ticks div TestCount;
      WriteLn(Format('%-15s  t: %.2f  s: %.0f%%',[Format('%d (%d)',[Ticks - EmptyTicks,Ticks]),
        (Ticks - EmptyTicks) / nSSETicks,1 / ((Ticks - EmptyTicks) / nSSETicks) * 100]));
    end;
finally
  VMCL_Dispose(v3s1); VMCL_Dispose(v3s2); VMCL_Dispose(v3s3);
  VMCL_Dispose(v4s1); VMCL_Dispose(v4s2); VMCL_Dispose(v4s3);
  VMCL_Dispose(v3d1); VMCL_Dispose(v3d2); VMCL_Dispose(v3d3);
  VMCL_Dispose(v4d1); VMCL_Dispose(v4d2); VMCL_Dispose(v4d3);
end;
Result := 0;
end;
