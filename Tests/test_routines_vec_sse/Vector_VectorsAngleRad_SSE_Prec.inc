Function Vector_VectorsAngleRad_SSE_Prec({%H-}AutoTest: Boolean = False): Integer;
const
  TestCount = 1000000;
var
  v2s1,v2s2:  PVMCLVector2s;
  v3s1,v3s2:  PVMCLVector3s;
  v4s1,v4s2:  PVMCLVector4s;
  v2d1,v2d2:  PVMCLVector2d;
  v3d1,v3d2:  PVMCLVector3d;
  v4d1,v4d2:  PVMCLVector4d;
  sRes:       Single;
  dRes:       Double;
  FuncPAS_2s: Function(const aVector,bVector: TVMCLVector2s): Single;
  FuncPAS_3s: Function(const aVector,bVector: TVMCLVector3s): Single;
  FuncPAS_4s: Function(const aVector,bVector: TVMCLVector4s): Single;
  FuncPAS_2d: Function(const aVector,bVector: TVMCLVector2d): Double;
  FuncPAS_3d: Function(const aVector,bVector: TVMCLVector3d): Double;
  FuncPAS_4d: Function(const aVector,bVector: TVMCLVector4d): Double;
  FuncASM_2s: procedure(const aVector,bVector: TVMCLVector2s; out Angle: Single);
  FuncASM_3s: procedure(const aVector,bVector: TVMCLVector3s; out Angle: Single);
  FuncASM_4s: procedure(const aVector,bVector: TVMCLVector4s; out Angle: Single);
  FuncASM_2d: procedure(const aVector,bVector: TVMCLVector2d; out Angle: Double);
  FuncASM_3d: procedure(const aVector,bVector: TVMCLVector3d; out Angle: Double);
  FuncASM_4d: procedure(const aVector,bVector: TVMCLVector4d; out Angle: Double);
  i:          Integer;
  EmptyTicks: Int64;
  Ticks:      Int64;
  nSSETicks:  Int64;
begin
// obtain addresses of proper version of overloaded functions
FuncPAS_2s := VMCL_Vectors.VectorsAngleRad;
FuncPAS_3s := VMCL_Vectors.VectorsAngleRad;
FuncPAS_4s := VMCL_Vectors.VectorsAngleRad;
FuncPAS_2d := VMCL_Vectors.VectorsAngleRad;
FuncPAS_3d := VMCL_Vectors.VectorsAngleRad;
FuncPAS_4d := VMCL_Vectors.VectorsAngleRad;
FuncASM_2s := VMCL_Vectors_SSE.VectorsAngleRad_SSE;
FuncASM_3s := VMCL_Vectors_SSE.VectorsAngleRad_SSE;
FuncASM_4s := VMCL_Vectors_SSE.VectorsAngleRad_SSE;
FuncASM_2d := VMCL_Vectors_SSE.VectorsAngleRad_SSE;
FuncASM_3d := VMCL_Vectors_SSE.VectorsAngleRad_SSE;
FuncASM_4d := VMCL_Vectors_SSE.VectorsAngleRad_SSE;
WriteLn;
WriteLn(LineText('VectorsAngleRad_SSE - High precision speed tests'));
WriteLn;
WriteLn(TestCount,' cycles');
VMCL_New(v2s1); VMCL_New(v2s2);
VMCL_New(v3s1); VMCL_New(v3s2);
VMCL_New(v4s1); VMCL_New(v4s2);
VMCL_New(v2d1); VMCL_New(v2d2);
VMCL_New(v3d1); VMCL_New(v3d2);
VMCL_New(v4d1); VMCL_New(v4d2);
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
  Write('v2s VectorsNormal:          ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^);
      sRes := Vector_SpeedTestCaller_2P_S(v2s1,v2s2);
      If not SameValue(sRes,VectorsAngleRad(v2s1^,v2s2^),1e-3) then
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
  Write(Format('v2s VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v2s1,v2s2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^);
      Vector_SpeedTestCaller_3P(v2s1,v2s2,@sRes);
      If not SameValue(sRes,VectorsAngleRad(v2s1^,v2s2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_2s_SSEua);
  Write('v2s VectorsNormal_2s_SSEua: ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^);
      Vector_SpeedTestCaller_3P(v2s1,v2s2,@sRes);
      If not SameValue(sRes,VectorsAngleRad(v2s1^,v2s2^),1e-3) then
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
  Write('v3s VectorsNormal:          ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^);
      sRes := Vector_SpeedTestCaller_2P_S(v3s1,v3s2);
      If not SameValue(sRes,VectorsAngleRad(v3s1^,v3s2^),1e-3) then
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
  Write(Format('v3s VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v3s1,v3s2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^);
      Vector_SpeedTestCaller_3P(v3s1,v3s2,@sRes);
      If not SameValue(sRes,VectorsAngleRad(v3s1^,v3s2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_3s_SSEua);
  Write('v3s VectorsNormal_3s_SSEua: ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^);
      Vector_SpeedTestCaller_3P(v3s1,v3s2,@sRes);
      If not SameValue(sRes,VectorsAngleRad(v3s1^,v3s2^),1e-3) then
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
      RandomVec(v4s1^); RandomVec(v4s2^);
      sRes := Vector_SpeedTestCaller_2P_S(v4s1,v4s2);
      If not SameValue(sRes,VectorsAngleRad(v4s1^,v4s2^),1e-3) then
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
  Write(Format('v4s VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v4s1,v4s2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,@sRes);
      If not SameValue(sRes,VectorsAngleRad(v4s1^,v4s2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_4s_SSEu);
  Write('v4s VectorsNormal_4s_SSEu:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,@sRes);
      If not SameValue(sRes,VectorsAngleRad(v4s1^,v4s2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_4s_SSEa);
  Write('v4s VectorsNormal_4s_SSEa:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^);
      Vector_SpeedTestCaller_3P(v4s1,v4s2,@sRes);
      If not SameValue(sRes,VectorsAngleRad(v4s1^,v4s2^),1e-3) then
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
  Write('v2d VectorsNormal:          ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^);
      dRes := Vector_SpeedTestCaller_2P_D(v2d1,v2d2);
      If not SameValue(dRes,VectorsAngleRad(v2d1^,v2d2^),1e-3) then
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
  Write(Format('v2d VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v2d1,v2d2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^);
      Vector_SpeedTestCaller_3P(v2d1,v2d2,@dRes);
      If not SameValue(dRes,VectorsAngleRad(v2d1^,v2d2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_2d_SSEu);
  Write('v2d VectorsNormal_2d_SSEu:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^);
      Vector_SpeedTestCaller_3P(v2d1,v2d2,@dRes);
      If not SameValue(dRes,VectorsAngleRad(v2d1^,v2d2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_2d_SSEa);
  Write('v2d VectorsNormal_2d_SSEa:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^);
      Vector_SpeedTestCaller_3P(v2d1,v2d2,@dRes);
      If not SameValue(dRes,VectorsAngleRad(v2d1^,v2d2^),1e-3) then
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
      RandomVec(v3d1^); RandomVec(v3d2^);
      dRes := Vector_SpeedTestCaller_2P_D(v3d1,v3d2);
      If not SameValue(dRes,VectorsAngleRad(v3d1^,v3d2^),1e-3) then
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
  Write(Format('v3d VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v3d1,v3d2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^);
      Vector_SpeedTestCaller_3P(v3d1,v3d2,@dRes);
      If not SameValue(dRes,VectorsAngleRad(v3d1^,v3d2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_3d_SSEu);
  Write('v3d VectorsNormal_3d_SSEu:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^);
      Vector_SpeedTestCaller_3P(v3d1,v3d2,@dRes);
      If not SameValue(dRes,VectorsAngleRad(v3d1^,v3d2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_3d_SSEa);
  Write('v3d VectorsNormal_3d_SSEa:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^);
      Vector_SpeedTestCaller_3P(v3d1,v3d2,@dRes);
      If not SameValue(dRes,VectorsAngleRad(v3d1^,v3d2^),1e-3) then
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
      RandomVec(v4d1^); RandomVec(v4d2^);
      dRes := Vector_SpeedTestCaller_2P_D(v4d1,v4d2);
      If not SameValue(dRes,VectorsAngleRad(v4d1^,v4d2^),1e-3) then
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
  Write(Format('v4d VectorsNormal_SSE(%s):   ',[BoolToMark(CheckMemAlign16(v4d1,v4d2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,@dRes);
      If not SameValue(dRes,VectorsAngleRad(v4d1^,v4d2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_4d_SSEu);
  Write('v4d VectorsNormal_4d_SSEu:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,@dRes);
      If not SameValue(dRes,VectorsAngleRad(v4d1^,v4d2^),1e-3) then
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
  PrecisionTest.FunctionAddr := Addr(VectorsAngleRad_4d_SSEa);
  Write('v4d VectorsNormal_4d_SSEa:  ');
  For i := 1 to TestCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^);
      Vector_SpeedTestCaller_3P(v4d1,v4d2,@dRes);
      If not SameValue(dRes,VectorsAngleRad(v4d1^,v4d2^),1e-3) then
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
  VMCL_Dispose(v2s1); VMCL_Dispose(v2s2);
  VMCL_Dispose(v3s1); VMCL_Dispose(v3s2);
  VMCL_Dispose(v4s1); VMCL_Dispose(v4s2);
  VMCL_Dispose(v2d1); VMCL_Dispose(v2d2);
  VMCL_Dispose(v3d1); VMCL_Dispose(v3d2);
  VMCL_Dispose(v4d1); VMCL_Dispose(v4d2);
end;
Result := 0;
end;