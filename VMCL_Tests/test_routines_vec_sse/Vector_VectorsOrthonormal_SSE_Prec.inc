Function Vector_VectorsOrthonormal_SSE_Prec(AutoTest: Boolean = False): Integer;
const
  TestCount = 1000000;
var
  v2s1,v2s2,v2s3: PVMCLVector2s;
  v3s1,v3s2,v3s3: PVMCLVector3s;
  v4s1,v4s2,v4s3: PVMCLVector4s;
  v2d1,v2d2,v2d3: PVMCLVector2d;
  v3d1,v3d2,v3d3: PVMCLVector3d;
  v4d1,v4d2,v4d3: PVMCLVector4d;
  FuncPAS_2s:   Function(const aVector,bVector: TVMCLVector2s): TVMCLVector2s;
  FuncPAS_3s:   Function(const aVector,bVector: TVMCLVector3s): TVMCLVector3s;
  FuncPAS_4s:   Function(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
  FuncPAS_4s3:  Function(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
  FuncPAS_2d:   Function(const aVector,bVector: TVMCLVector2d): TVMCLVector2d;
  FuncPAS_3d:   Function(const aVector,bVector: TVMCLVector3d): TVMCLVector3d;
  FuncPAS_4d:   Function(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
  FuncPAS_4d3:  Function(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
  FuncASM_2s:   procedure(const aVector,bVector: TVMCLVector2s; out Projection: TVMCLVector2s);
  FuncASM_3s:   procedure(const aVector,bVector: TVMCLVector3s; out Projection: TVMCLVector3s);
  FuncASM_4s:   procedure(const aVector,bVector: TVMCLVector4s; out Projection: TVMCLVector4s);
  FuncASM_4s3:  procedure(const aVector,bVector: TVMCLVector4s; out Projection: TVMCLVector4s);
  FuncASM_2d:   procedure(const aVector,bVector: TVMCLVector2d; out Projection: TVMCLVector2d);
  FuncASM_3d:   procedure(const aVector,bVector: TVMCLVector3d; out Projection: TVMCLVector3d);
  FuncASM_4d:   procedure(const aVector,bVector: TVMCLVector4d; out Projection: TVMCLVector4d);
  FuncASM_4d3:  procedure(const aVector,bVector: TVMCLVector4d; out Projection: TVMCLVector4d);
  i:            Integer;
  EmptyTicks:   Int64;
  Ticks:        Int64;
  nSSETicks:    Int64;
begin
// obtain addresses of proper version of overloaded functions
FuncPAS_2s := VMCL_Vectors.VectorsOrthonormal;
FuncPAS_3s := VMCL_Vectors.VectorsOrthonormal;
FuncPAS_4s := VMCL_Vectors.VectorsOrthonormal;
FuncPAS_4s3 := VMCL_Vectors.VectorsOrthonormalXYZ;
FuncPAS_2d := VMCL_Vectors.VectorsOrthonormal;
FuncPAS_3d := VMCL_Vectors.VectorsOrthonormal;
FuncPAS_4d := VMCL_Vectors.VectorsOrthonormal;
FuncPAS_4d3 := VMCL_Vectors.VectorsOrthonormalXYZ;
FuncASM_2s := VMCL_Vectors_SSE.VectorsOrthonormal_SSE;
FuncASM_3s := VMCL_Vectors_SSE.VectorsOrthonormal_SSE;
FuncASM_4s := VMCL_Vectors_SSE.VectorsOrthonormal_SSE;
FuncASM_4s3 := VMCL_Vectors_SSE.VectorsOrthonormalXYZ_SSE;
FuncASM_2d := VMCL_Vectors_SSE.VectorsOrthonormal_SSE;
FuncASM_3d := VMCL_Vectors_SSE.VectorsOrthonormal_SSE;
FuncASM_4d := VMCL_Vectors_SSE.VectorsOrthonormal_SSE;
FuncASM_4d3 := VMCL_Vectors_SSE.VectorsOrthonormalXYZ_SSE;
WriteLn;
WriteLn(LineText('VectorsOrthonormal_SSE - High precision speed tests'));
WriteLn;
WriteLn(TestCount,' cycles');
VMCL_New(v2s1); VMCL_New(v2s2); VMCL_New(v2s3);
VMCL_New(v3s1); VMCL_New(v3s2); VMCL_New(v3s3);
VMCL_New(v4s1); VMCL_New(v4s2); VMCL_New(v4s3);
VMCL_New(v2d1); VMCL_New(v2d2); VMCL_New(v2d3);
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
  PrecisionTest.FunctionAddr := Addr(FuncPAS_2s);
  Write('v2s VectorsOrthonormal:           ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^); LoadZeroVector(v2s3^);
      Vector_SpeedTestCaller_3P_R(v2s1,v2s2,v2s3);
      If not SameVectors(v2s3^,VectorsOrthonormal(v2s1^,v2s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(FuncASM_2s);
  Write(Format('v2s VectorsOrthonormal_SSE(%s):    ',[BoolToMark(CheckMemAlign16(v2s1,v2s2,v2s3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^); LoadZeroVector(v2s3^);
      Vector_SpeedTestCaller_3P(v2s1,v2s2,v2s3);
      If not SameVectors(v2s3^,VectorsOrthonormal(v2s1^,v2s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_2s_SSEua);
  Write('v2s VectorsOrthonormal_2s_SSEua:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^); LoadZeroVector(v2s3^);
      Vector_SpeedTestCaller_3P(v2s1,v2s2,v2s3);
      If not SameVectors(v2s3^,VectorsOrthonormal(v2s1^,v2s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(FuncPAS_3s);
  Write('v3s VectorsOrthonormal:           ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^); LoadZeroVector(v3s3^);
      Vector_SpeedTestCaller_3P_R(v3s1,v3s2,v3s3);
      If not SameVectors(v3s3^,VectorsOrthonormal(v3s1^,v3s2^),1e-6) then
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
  Write(Format('v3s VectorsOrthonormal_SSE(%s):    ',[BoolToMark(CheckMemAlign16(v3s1,v3s2,v3s3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^); LoadZeroVector(v3s3^);
      Vector_SpeedTestCaller_3P(v3s1,v3s2,v3s3);
      If not SameVectors(v3s3^,VectorsOrthonormal(v3s1^,v3s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_3s_SSEua);
  Write('v3s VectorsOrthonormal_3s_SSEua:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^); LoadZeroVector(v3s3^);
      Vector_SpeedTestCaller_3P(v3s1,v3s2,v3s3);
      If not SameVectors(v3s3^,VectorsOrthonormal(v3s1^,v3s2^),1e-6) then
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
  Write('v4s VectorsOrthonormal:           ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P_R(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsOrthonormal(v4s1^,v4s2^),1e-6) then
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
  Write(Format('v4s VectorsOrthonormal_SSE(%s):    ',[BoolToMark(CheckMemAlign16(v4s1,v4s2,v4s3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsOrthonormal(v4s1^,v4s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_4s_SSEu);
  Write('v4s VectorsOrthonormal_4s_SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsOrthonormal(v4s1^,v4s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_4s_SSEa);
  Write('v4s VectorsOrthonormal_4s_SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsOrthonormal(v4s1^,v4s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(FuncPAS_4s3);
  Write('v4s3 VectorsOrthonormal:          ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P_R(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsOrthonormalXYZ(v4s1^,v4s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(FuncASM_4s3);
  Write(Format('v4s3 VectorsOrthonormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v4s1,v4s2,v4s3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsOrthonormalXYZ(v4s1^,v4s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormalXYZ_4s_SSEu);
  Write('v4s3 VectorsOrthonormal_4s_SSEu:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsOrthonormalXYZ(v4s1^,v4s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormalXYZ_4s_SSEa);
  Write('v4s3 VectorsOrthonormal_4s_SSEa:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,v4s3);
      If not SameVectors(v4s3^,VectorsOrthonormalXYZ(v4s1^,v4s2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(FuncPAS_2d);
  Write('v2d VectorsOrthonormal:           ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^); LoadZeroVector(v2d3^);
      Vector_SpeedTestCaller_3P_R(v2d1,v2d2,v2d3);
      If not SameVectors(v2d3^,VectorsOrthonormal(v2d1^,v2d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(FuncASM_2d);
  Write(Format('v2d VectorsOrthonormal_SSE(%s):    ',[BoolToMark(CheckMemAlign16(v2d1,v2d2,v2d3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^); LoadZeroVector(v2d3^);
      Vector_SpeedTestCaller_3P(v2d1,v2d2,v2d3);
      If not SameVectors(v2d3^,VectorsOrthonormal(v2d1^,v2d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_2d_SSEu);
  Write('v2d VectorsOrthonormal_2d_SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^); LoadZeroVector(v2d3^);
      Vector_SpeedTestCaller_3P(v2d1,v2d2,v2d3);
      If not SameVectors(v2d3^,VectorsOrthonormal(v2d1^,v2d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_2d_SSEa);
  Write('v2d VectorsOrthonormal_2d_SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^); LoadZeroVector(v2d3^);
      Vector_SpeedTestCaller_3P(v2d1,v2d2,v2d3);
      If not SameVectors(v2d3^,VectorsOrthonormal(v2d1^,v2d2^),1e-6) then
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
  Write('v3d VectorsOrthonormal:           ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      Vector_SpeedTestCaller_3P_R(v3d1,v3d2,v3d3);
      If not SameVectors(v3d3^,VectorsOrthonormal(v3d1^,v3d2^),1e-6) then
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
  Write(Format('v3d VectorsOrthonormal_SSE(%s):    ',[BoolToMark(CheckMemAlign16(v3d1,v3d2,v3d3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      Vector_SpeedTestCaller_3P(v3d1,v3d2,v3d3);
      If not SameVectors(v3d3^,VectorsOrthonormal(v3d1^,v3d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_3d_SSEu);
  Write('v3d VectorsOrthonormal_3d_SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      Vector_SpeedTestCaller_3P(v3d1,v3d2,v3d3);
      If not SameVectors(v3d3^,VectorsOrthonormal(v3d1^,v3d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_3d_SSEa);
  Write('v3d VectorsOrthonormal_3d_SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      Vector_SpeedTestCaller_3P(v3d1,v3d2,v3d3);
      If not SameVectors(v3d3^,VectorsOrthonormal(v3d1^,v3d2^),1e-6) then
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
  Write('v4d VectorsOrthonormal:           ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P_R(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsOrthonormal(v4d1^,v4d2^),1e-6) then
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
  Write(Format('v4d VectorsOrthonormal_SSE(%s):    ',[BoolToMark(CheckMemAlign16(v4d1,v4d2,v4d3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsOrthonormal(v4d1^,v4d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_4d_SSEu);
  Write('v4d VectorsOrthonormal_4d_SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsOrthonormal(v4d1^,v4d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormal_4d_SSEa);
  Write('v4d VectorsOrthonormal_4d_SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsOrthonormal(v4d1^,v4d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(FuncPAS_4d3);
  Write('v4d3 VectorsOrthonormal:          ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P_R(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsOrthonormalXYZ(v4d1^,v4d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(FuncASM_4d3);
  Write(Format('v4d3 VectorsOrthonormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v4d1,v4d2,v4d3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsOrthonormalXYZ(v4d1^,v4d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormalXYZ_4d_SSEu);
  Write('v4d3 VectorsOrthonormal_4d_SSEu:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsOrthonormalXYZ(v4d1^,v4d2^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsOrthonormalXYZ_4d_SSEa);
  Write('v4d3 VectorsOrthonormal_4d_SSEa:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,v4d3);
      If not SameVectors(v4d3^,VectorsOrthonormalXYZ(v4d1^,v4d2^),1e-6) then
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
  VMCL_Dispose(v2s1); VMCL_Dispose(v2s2); VMCL_Dispose(v2s3);
  VMCL_Dispose(v3s1); VMCL_Dispose(v3s2); VMCL_Dispose(v3s3);
  VMCL_Dispose(v4s1); VMCL_Dispose(v4s2); VMCL_Dispose(v4s3);
  VMCL_Dispose(v2d1); VMCL_Dispose(v2d2); VMCL_Dispose(v2d3);
  VMCL_Dispose(v3d1); VMCL_Dispose(v3d2); VMCL_Dispose(v3d3);
  VMCL_Dispose(v4d1); VMCL_Dispose(v4d2); VMCL_Dispose(v4d3);
end;
Result := 0;
end;
