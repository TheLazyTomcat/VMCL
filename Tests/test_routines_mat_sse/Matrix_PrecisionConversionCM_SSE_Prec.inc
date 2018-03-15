Function Matrix_PrecisionConversionCM_SSE_Prec({%H-}AutoTest: Boolean = False): Integer;
const
  TestCount = 2000000;
var
  m2s:  PMatrix2CMs;
  m3s:  PMatrix3CMs;
  m4s:  PMatrix4CMs;
  m2d:  PMatrix2CMd;
  m3d:  PMatrix3CMd;
  m4d:  PMatrix4CMd;
  FuncPAS_2s: Function(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMs;
  FuncPAS_3s: Function(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMs;
  FuncPAS_4s: Function(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMs;
  FuncPAS_2d: Function(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2CMd;
  FuncPAS_3d: Function(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3CMd;
  FuncPAS_4d: Function(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMd;
  FuncASM_2s: procedure(const InMat: TVMCLMatrix2CMd; out OutMat: TVMCLMatrix2CMs);
  FuncASM_3s: procedure(const InMat: TVMCLMatrix3CMd; out OutMat: TVMCLMatrix3CMs);
  FuncASM_4s: procedure(const InMat: TVMCLMatrix4CMd; out OutMat: TVMCLMatrix4CMs);
  FuncASM_2d: procedure(const InMat: TVMCLMatrix2CMs; out OutMat: TVMCLMatrix2CMd);
  FuncASM_3d: procedure(const InMat: TVMCLMatrix3CMs; out OutMat: TVMCLMatrix3CMd);
  FuncASM_4d: procedure(const InMat: TVMCLMatrix4CMs; out OutMat: TVMCLMatrix4CMd);
  i:          Integer;
  EmptyTicks: Int64;
  Ticks:      Int64;
  nSSETicks:  Int64;
begin
FuncPAS_2s := VMCL_Matrices.Matrix2s;
FuncPAS_3s := VMCL_Matrices.Matrix3s;
FuncPAS_4s := VMCL_Matrices.Matrix4s;
FuncPAS_2d := VMCL_Matrices.Matrix2d;
FuncPAS_3d := VMCL_Matrices.Matrix3d;
FuncPAS_4d := VMCL_Matrices.Matrix4d;
FuncASM_2s := VMCL_Matrices_SSE.PrecisionConversion_SSE;
FuncASM_3s := VMCL_Matrices_SSE.PrecisionConversion_SSE;
FuncASM_4s := VMCL_Matrices_SSE.PrecisionConversion_SSE;
FuncASM_2d := VMCL_Matrices_SSE.PrecisionConversion_SSE;
FuncASM_3d := VMCL_Matrices_SSE.PrecisionConversion_SSE;
FuncASM_4d := VMCL_Matrices_SSE.PrecisionConversion_SSE;
WriteLn;
WriteLn(LineText('PrecisionConversion_SSE (CM) - High precision speed tests'));
WriteLn;
WriteLn(TestCount,' cycles');
VMCL_New(m2s); VMCL_New(m3s); VMCL_New(m4s);
VMCL_New(m2d); VMCL_New(m3d); VMCL_New(m4d);
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
  Write('m2d -> m2s @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      Vector_SpeedTestCaller_2P_R(m2d,m2s);
      If not SameMatrices(m2s^,Matrix2s(m2d^),1e-6) then
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
  Write(Format('m2d -> m2s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m2d,m2s),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      Vector_SpeedTestCaller_2P(m2d,m2s);
      If not SameMatrices(m2s^,Matrix2s(m2d^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_2CMs_SSEu);
  Write('m2d -> m2s @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      Vector_SpeedTestCaller_2P(m2d,m2s);
      If not SameMatrices(m2s^,Matrix2s(m2d^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_2CMs_SSEa);
  Write('m2d -> m2s @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      Vector_SpeedTestCaller_2P(m2d,m2s);
      If not SameMatrices(m2s^,Matrix2s(m2d^),1e-6) then
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
  Write('m3d -> m3s @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      Vector_SpeedTestCaller_2P_R(m3d,m3s);
      If not SameMatrices(m3s^,Matrix3s(m3d^),1e-6) then
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
  Write(Format('m3d -> m3s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m3d,m3s),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      Vector_SpeedTestCaller_2P(m3d,m3s);
      If not SameMatrices(m3s^,Matrix3s(m3d^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_3CMs_SSEu);
  Write('m3d -> m3s @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      Vector_SpeedTestCaller_2P(m3d,m3s);
      If not SameMatrices(m3s^,Matrix3s(m3d^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_3CMs_SSEa);
  Write('m3d -> m3s @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      Vector_SpeedTestCaller_2P(m3d,m3s);
      If not SameMatrices(m3s^,Matrix3s(m3d^),1e-6) then
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
  Write('m4d -> m4s @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      Vector_SpeedTestCaller_2P_R(m4d,m4s);
      If not SameMatrices(m4s^,Matrix4s(m4d^),1e-6) then
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
  Write(Format('m4d -> m4s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4d,m4s),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      Vector_SpeedTestCaller_2P(m4d,m4s);
      If not SameMatrices(m4s^,Matrix4s(m4d^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_4CMs_SSEu);
  Write('m4d -> m4s @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      Vector_SpeedTestCaller_2P(m4d,m4s);
      If not SameMatrices(m4s^,Matrix4s(m4d^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_4CMs_SSEa);
  Write('m4d -> m4s @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      Vector_SpeedTestCaller_2P(m4d,m4s);
      If not SameMatrices(m4s^,Matrix4s(m4d^),1e-6) then
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
  Write('m2s -> m2d @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2s^); RandomMat(m2d^);
      Vector_SpeedTestCaller_2P_R(m2s,m2d);
      If not SameMatrices(m2d^,Matrix2d(m2s^),1e-6) then
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
  Write(Format('m2s -> m2d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m2s,m2d),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m2s^); RandomMat(m2d^);
      Vector_SpeedTestCaller_2P(m2s,m2d);
      If not SameMatrices(m2d^,Matrix2d(m2s^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_2CMd_SSEu);
  Write('m2s -> m2d @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2s^); RandomMat(m2d^);
      Vector_SpeedTestCaller_2P(m2s,m2d);
      If not SameMatrices(m2d^,Matrix2d(m2s^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_2CMd_SSEa);
  Write('m2s -> m2d @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2s^); RandomMat(m2d^);
      Vector_SpeedTestCaller_2P(m2s,m2d);
      If not SameMatrices(m2d^,Matrix2d(m2s^),1e-6) then
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
  Write('m3s -> m3d @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3s^); RandomMat(m3d^);
      Vector_SpeedTestCaller_2P_R(m3s,m3d);
      If not SameMatrices(m3d^,Matrix3d(m3s^),1e-6) then
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
  Write(Format('m3s -> m3d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m3s,m3d),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m3s^); RandomMat(m3d^);
      Vector_SpeedTestCaller_2P(m3s,m3d);
      If not SameMatrices(m3d^,Matrix3d(m3s^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_3CMd_SSEu);
  Write('m3s -> m3d @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3s^); RandomMat(m3d^);
      Vector_SpeedTestCaller_2P(m3s,m3d);
      If not SameMatrices(m3d^,Matrix3d(m3s^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_3CMd_SSEa);
  Write('m3s -> m3d @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3s^); RandomMat(m3d^);
      Vector_SpeedTestCaller_2P(m3s,m3d);
      If not SameMatrices(m3d^,Matrix3d(m3s^),1e-6) then
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
  Write('m4s -> m4d @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s^); RandomMat(m4d^);
      Vector_SpeedTestCaller_2P_R(m4s,m4d);
      If not SameMatrices(m4d^,Matrix4d(m4s^),1e-6) then
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
  Write(Format('m4s -> m4d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4s,m4d),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m4s^); RandomMat(m4d^);
      Vector_SpeedTestCaller_2P(m4s,m4d);
      If not SameMatrices(m4d^,Matrix4d(m4s^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_4CMd_SSEu);
  Write('m4s -> m4d @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s^); RandomMat(m4d^);
      Vector_SpeedTestCaller_2P(m4s,m4d);
      If not SameMatrices(m4d^,Matrix4d(m4s^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(PrecisionConversion_4CMd_SSEa);
  Write('m4s -> m4d @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s^); RandomMat(m4d^);
      Vector_SpeedTestCaller_2P(m4s,m4d);
      If not SameMatrices(m4d^,Matrix4d(m4s^),1e-6) then
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
  VMCL_Dispose(m2s); VMCL_Dispose(m3s); VMCL_Dispose(m4s);
  VMCL_Dispose(m2d); VMCL_Dispose(m3d); VMCL_Dispose(m4d);
end;
Result := 0;
end;