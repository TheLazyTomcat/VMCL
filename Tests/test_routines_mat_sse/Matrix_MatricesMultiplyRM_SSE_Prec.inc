Function Matrix_MatricesMultiplyRM_SSE_Prec({%H-}AutoTest: Boolean = False): Integer;
const
  TestCount = 2000000;
var
  m2s1,m2s2,m2s3: PVMCLMatrix2RMs;
  m3s1,m3s2,m3s3: PVMCLMatrix3RMs;
  m4s1,m4s2,m4s3: PVMCLMatrix4RMs;
  m2d1,m2d2,m2d3: PVMCLMatrix2RMd;
  m3d1,m3d2,m3d3: PVMCLMatrix3RMd;
  m4d1,m4d2,m4d3: PVMCLMatrix4RMd;
  i:              Integer;
  EmptyTicks:     Int64;
  Ticks:          Int64;
  nSSETicks:      Int64;
  FuncPAS_2s: Function(const aMatrix, bMatrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs;
  FuncPAS_3s: Function(const aMatrix, bMatrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs;
  FuncPAS_4s: Function(const aMatrix, bMatrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs;
  FuncPAS_2d: Function(const aMatrix, bMatrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd;
  FuncPAS_3d: Function(const aMatrix, bMatrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd;
  FuncPAS_4d: Function(const aMatrix, bMatrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd;
  FuncASM_2s: procedure(const aMatrix, bMatrix: TVMCLMatrix2RMs; out Product: TVMCLMatrix2RMs);
  FuncASM_3s: procedure(const aMatrix, bMatrix: TVMCLMatrix3RMs; out Product: TVMCLMatrix3RMs);
  FuncASM_4s: procedure(const aMatrix, bMatrix: TVMCLMatrix4RMs; out Product: TVMCLMatrix4RMs);
  FuncASM_2d: procedure(const aMatrix, bMatrix: TVMCLMatrix2RMd; out Product: TVMCLMatrix2RMd);
  FuncASM_3d: procedure(const aMatrix, bMatrix: TVMCLMatrix3RMd; out Product: TVMCLMatrix3RMd);
  FuncASM_4d: procedure(const aMatrix, bMatrix: TVMCLMatrix4RMd; out Product: TVMCLMatrix4RMd);
begin
FuncPAS_2s := VMCL_Matrices.MatricesMultiply;
FuncPAS_3s := VMCL_Matrices.MatricesMultiply;
FuncPAS_4s := VMCL_Matrices.MatricesMultiply;
FuncPAS_2d := VMCL_Matrices.MatricesMultiply;
FuncPAS_3d := VMCL_Matrices.MatricesMultiply;
FuncPAS_4d := VMCL_Matrices.MatricesMultiply;
FuncASM_2s := VMCL_Matrices_SSE.MatricesMultiply_SSE;
FuncASM_3s := VMCL_Matrices_SSE.MatricesMultiply_SSE;
FuncASM_4s := VMCL_Matrices_SSE.MatricesMultiply_SSE;
FuncASM_2d := VMCL_Matrices_SSE.MatricesMultiply_SSE;
FuncASM_3d := VMCL_Matrices_SSE.MatricesMultiply_SSE;
FuncASM_4d := VMCL_Matrices_SSE.MatricesMultiply_SSE;
WriteLn;
WriteLn(LineText('MatricesMultiply_SSE (RM) - High precision speed tests'));
WriteLn;
WriteLn(TestCount,' cycles');
VMCL_New(m2s1); VMCL_New(m2s2); VMCL_New(m2s3);
VMCL_New(m3s1); VMCL_New(m3s2); VMCL_New(m3s3);
VMCL_New(m4s1); VMCL_New(m4s2); VMCL_New(m4s3);
VMCL_New(m2d1); VMCL_New(m2d2); VMCL_New(m2d3);
VMCL_New(m3d1); VMCL_New(m3d2); VMCL_New(m3d3);
VMCL_New(m4d1); VMCL_New(m4d2); VMCL_New(m4d3);
try
  // get average empty call ticks
  WriteLn;
  EmptyTicks := 0;
  PrecisionTest.FunctionAddr := nil;
  For i := 1 to TestCount do
    begin
      Matrix_SpeedTestCaller_Empty;
      EmptyTicks := EmptyTicks + PrecisionTestsTicks(PrecisionTest);
    end;
  EmptyTicks := EmptyTicks div TestCount;
  WriteLn('Empty call ticks: ',EmptyTicks);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  WriteLn;
  Ticks := 0;
  PrecisionTest.FunctionAddr := Addr(FuncPAS_2s);
  Write('m2s * m2s @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^); RandomMat(m2s3^);
      Matrix_SpeedTestCaller_3P_R(m2s1,m2s2,m2s3);
      If not EqualMatrices(m2s3^,MatricesMultiply(m2s1^,m2s2^)) then
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
  Write(Format('m2s * m2s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m2s1,m2s2,m2s3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^); RandomMat(m2s3^);
      Matrix_SpeedTestCaller_3P(m2s1,m2s2,m2s3);
      If not EqualMatrices(m2s3^,MatricesMultiply(m2s1^,m2s2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_2RMs_SSEu);
  Write('m2s * m2s @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^); RandomMat(m2s3^);
      Matrix_SpeedTestCaller_3P(m2s1,m2s2,m2s3);
      If not EqualMatrices(m2s3^,MatricesMultiply(m2s1^,m2s2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_2RMs_SSEa);
  Write('m2s * m2s @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^); RandomMat(m2s3^);
      Matrix_SpeedTestCaller_3P(m2s1,m2s2,m2s3);
      If not EqualMatrices(m2s3^,MatricesMultiply(m2s1^,m2s2^)) then
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
  Write('m3s * m3s @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3s1^); RandomMat(m3s2^); RandomMat(m3s3^);
      Matrix_SpeedTestCaller_3P_R(m3s1,m3s2,m3s3);
      If not EqualMatrices(m3s3^,MatricesMultiply(m3s1^,m3s2^)) then
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
  Write(Format('m3s * m3s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m3s1,m3s2,m3s3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m3s1^); RandomMat(m3s2^); RandomMat(m3s3^);
      Matrix_SpeedTestCaller_3P(m3s1,m3s2,m3s3);
      If not EqualMatrices(m3s3^,MatricesMultiply(m3s1^,m3s2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_3RMs_SSEua);
  Write('m3s * m3s @ SSEua:  ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3s1^); RandomMat(m3s2^); RandomMat(m3s3^);
      Matrix_SpeedTestCaller_3P(m3s1,m3s2,m3s3);
      If not EqualMatrices(m3s3^,MatricesMultiply(m3s1^,m3s2^)) then
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
  Write('m4s * m4s @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^); RandomMat(m4s3^);
      Matrix_SpeedTestCaller_3P_R(m4s1,m4s2,m4s3);
      If not EqualMatrices(m4s3^,MatricesMultiply(m4s1^,m4s2^)) then
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
  Write(Format('m4s * m4s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4s1,m4s2,m4s3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^); RandomMat(m4s3^);
      Matrix_SpeedTestCaller_3P(m4s1,m4s2,m4s3);
      If not EqualMatrices(m4s3^,MatricesMultiply(m4s1^,m4s2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_4RMs_SSEu);
  Write('m4s * m4s @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^); RandomMat(m4s3^);
      Matrix_SpeedTestCaller_3P(m4s1,m4s2,m4s3);
      If not EqualMatrices(m4s3^,MatricesMultiply(m4s1^,m4s2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_4RMs_SSEa);
  Write('m4s * m4s @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^); RandomMat(m4s3^);
      Matrix_SpeedTestCaller_3P(m4s1,m4s2,m4s3);
      If not EqualMatrices(m4s3^,MatricesMultiply(m4s1^,m4s2^)) then
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
  Write('m2d * m2d @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2d1^); RandomMat(m2d2^); RandomMat(m2d3^);
      Matrix_SpeedTestCaller_3P_R(m2d1,m2d2,m2d3);
      If not EqualMatrices(m2d3^,MatricesMultiply(m2d1^,m2d2^)) then
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
  Write(Format('m2d * m2d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m2d1,m2d2,m2d3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m2d1^); RandomMat(m2d2^); RandomMat(m2d3^);
      Matrix_SpeedTestCaller_3P(m2d1,m2d2,m2d3);
      If not EqualMatrices(m2d3^,MatricesMultiply(m2d1^,m2d2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_2RMd_SSEu);
  Write('m2d * m2d @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2d1^); RandomMat(m2d2^); RandomMat(m2d3^);
      Matrix_SpeedTestCaller_3P(m2d1,m2d2,m2d3);
      If not EqualMatrices(m2d3^,MatricesMultiply(m2d1^,m2d2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_2RMd_SSEa);
  Write('m2d * m2d @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2d1^); RandomMat(m2d2^); RandomMat(m2d3^);
      Matrix_SpeedTestCaller_3P(m2d1,m2d2,m2d3);
      If not EqualMatrices(m2d3^,MatricesMultiply(m2d1^,m2d2^)) then
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
  Write('m3d * m3d @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3d1^); RandomMat(m3d2^); RandomMat(m3d3^);
      Matrix_SpeedTestCaller_3P_R(m3d1,m3d2,m3d3);
      If not EqualMatrices(m3d3^,MatricesMultiply(m3d1^,m3d2^)) then
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
  Write(Format('m3d * m3d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m3d1,m3d2,m3d3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m3d1^); RandomMat(m3d2^); RandomMat(m3d3^);
      Matrix_SpeedTestCaller_3P(m3d1,m3d2,m3d3);
      If not EqualMatrices(m3d3^,MatricesMultiply(m3d1^,m3d2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_3RMd_SSEu);
  Write('m3d * m3d @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3d1^); RandomMat(m3d2^); RandomMat(m3d3^);
      Matrix_SpeedTestCaller_3P(m3d1,m3d2,m3d3);
      If not EqualMatrices(m3d3^,MatricesMultiply(m3d1^,m3d2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_3RMd_SSEa);
  Write('m3d * m3d @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3d1^); RandomMat(m3d2^); RandomMat(m3d3^);
      Matrix_SpeedTestCaller_3P(m3d1,m3d2,m3d3);
      If not EqualMatrices(m3d3^,MatricesMultiply(m3d1^,m3d2^)) then
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
  Write('m4d * m4d @ nSSE:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4d1^); RandomMat(m4d2^); RandomMat(m4d3^);
      Matrix_SpeedTestCaller_3P_R(m4d1,m4d2,m4d3);
      If not EqualMatrices(m4d3^,MatricesMultiply(m4d1^,m4d2^)) then
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
  Write(Format('m4d * m4d @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4d1,m4d2,m4d3),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m4d1^); RandomMat(m4d2^); RandomMat(m4d3^);
      Matrix_SpeedTestCaller_3P(m4d1,m4d2,m4d3);
      If not EqualMatrices(m4d3^,MatricesMultiply(m4d1^,m4d2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_4RMd_SSEu);
  Write('m4d * m4d @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4d1^); RandomMat(m4d2^); RandomMat(m4d3^);
      Matrix_SpeedTestCaller_3P(m4d1,m4d2,m4d3);
      If not EqualMatrices(m4d3^,MatricesMultiply(m4d1^,m4d2^)) then
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
  PrecisionTest.FunctionAddr := Addr(MatricesMultiply_4RMd_SSEa);
  Write('m4d * m4d @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4d1^); RandomMat(m4d2^); RandomMat(m4d3^);
      Matrix_SpeedTestCaller_3P(m4d1,m4d2,m4d3);
      If not EqualMatrices(m4d3^,MatricesMultiply(m4d1^,m4d2^)) then
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
  VMCL_Dispose(m2s1); VMCL_Dispose(m2s2); VMCL_Dispose(m2s3);
  VMCL_Dispose(m3s1); VMCL_Dispose(m3s2); VMCL_Dispose(m3s3);
  VMCL_Dispose(m4s1); VMCL_Dispose(m4s2); VMCL_Dispose(m4s3);
  VMCL_Dispose(m2d1); VMCL_Dispose(m2d2); VMCL_Dispose(m2d3);
  VMCL_Dispose(m3d1); VMCL_Dispose(m3d2); VMCL_Dispose(m3d3);
  VMCL_Dispose(m4d1); VMCL_Dispose(m4d2); VMCL_Dispose(m4d3);
end;
Result := 0;
end;
