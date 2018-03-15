Function Matrix_TransposeRM_SSE_Prec({%H-}AutoTest: Boolean = False): Integer;
const
  TestCount = 2000000;
var
  m2s1,m2s2:  PMatrix2RMs;
  m3s1,m3s2:  PMatrix3RMs;
  m4s1,m4s2:  PMatrix4RMs;
  m2d1,m2d2:  PMatrix2RMd;
  m3d1,m3d2:  PMatrix3RMd;
  m4d1,m4d2:  PMatrix4RMd;
  FuncPAS_2s: Function(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs;
  FuncPAS_3s: Function(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs;
  FuncPAS_4s: Function(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs;
  FuncPAS_2d: Function(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd;
  FuncPAS_3d: Function(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd;
  FuncPAS_4d: Function(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd;
  FuncASM_2s: procedure(const Matrix: TVMCLMatrix2RMs; out Transposed: TVMCLMatrix2RMs);
  FuncASM_3s: procedure(const Matrix: TVMCLMatrix3RMs; out Transposed: TVMCLMatrix3RMs);
  FuncASM_4s: procedure(const Matrix: TVMCLMatrix4RMs; out Transposed: TVMCLMatrix4RMs);
  FuncASM_2d: procedure(const Matrix: TVMCLMatrix2RMd; out Transposed: TVMCLMatrix2RMd);
  FuncASM_3d: procedure(const Matrix: TVMCLMatrix3RMd; out Transposed: TVMCLMatrix3RMd);
  FuncASM_4d: procedure(const Matrix: TVMCLMatrix4RMd; out Transposed: TVMCLMatrix4RMd);
  i:          Integer;
  EmptyTicks: Int64;
  Ticks:      Int64;
  nSSETicks:  Int64;
begin
FuncPAS_2s := VMCL_Matrices.Transposed;
FuncPAS_3s := VMCL_Matrices.Transposed;
FuncPAS_4s := VMCL_Matrices.Transposed;
FuncPAS_2d := VMCL_Matrices.Transposed;
FuncPAS_3d := VMCL_Matrices.Transposed;
FuncPAS_4d := VMCL_Matrices.Transposed;
FuncASM_2s := VMCL_Matrices_SSE.Transpose_SSE;
FuncASM_3s := VMCL_Matrices_SSE.Transpose_SSE;
FuncASM_4s := VMCL_Matrices_SSE.Transpose_SSE;
//FuncASM_2d := VMCL_Matrices_SSE.Transpose_SSE;
//FuncASM_3d := VMCL_Matrices_SSE.Transpose_SSE;
//FuncASM_4d := VMCL_Matrices_SSE.Transpose_SSE;
WriteLn;
WriteLn(LineText('Transposition (RM) - High precision speed tests'));
WriteLn;
WriteLn(TestCount,' cycles');
VMCL_New(m2s1); VMCL_New(m3s1); VMCL_New(m4s1);
VMCL_New(m2s2); VMCL_New(m3s2); VMCL_New(m4s2);
VMCL_New(m2d1); VMCL_New(m3d1); VMCL_New(m4d1);
VMCL_New(m2d2); VMCL_New(m3d2); VMCL_New(m4d2);
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
      RandomMat(m2s1^); RandomMat(m2s2^);
      Vector_SpeedTestCaller_2P_R(m2s1,m2s2);
      If not SameMatrices(m2s2^,Transposed(m2s1^),1e-6) then
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
  Write(Format('m2d -> m2s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m2s1,m2s2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^);
      Vector_SpeedTestCaller_2P_R(m2s1,m2s2);
      If not SameMatrices(m2s2^,Transposed(m2s1^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(Transpose_2RMs_SSEu);
  Write('m2d -> m2s @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^);
      Vector_SpeedTestCaller_2P_R(m2s1,m2s2);
      If not SameMatrices(m2s2^,Transposed(m2s1^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(Transpose_2RMs_SSEa);
  Write('m2d -> m2s @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^);
      Vector_SpeedTestCaller_2P_R(m2s1,m2s2);
      If not SameMatrices(m2s2^,Transposed(m2s1^),1e-6) then
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
      RandomMat(m3s1^); RandomMat(m3s2^);
      Vector_SpeedTestCaller_2P_R(m3s1,m3s2);
      If not SameMatrices(m3s2^,Transposed(m3s1^),1e-6) then
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
  Write(Format('m3d -> m3s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m3s1,m3s2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m3s1^); RandomMat(m3s2^);
      Vector_SpeedTestCaller_2P_R(m3s1,m3s2);
      If not SameMatrices(m3s2^,Transposed(m3s1^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(Transpose_3RMs_SSEu);
  Write('m3d -> m3s @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3s1^); RandomMat(m3s2^);
      Vector_SpeedTestCaller_2P_R(m3s1,m3s2);
      If not SameMatrices(m3s2^,Transposed(m3s1^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(Transpose_3RMs_SSEa);
  Write('m3d -> m3s @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m3s1^); RandomMat(m3s2^);
      Vector_SpeedTestCaller_2P_R(m3s1,m3s2);
      If not SameMatrices(m3s2^,Transposed(m3s1^),1e-6) then
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
      RandomMat(m4s1^); RandomMat(m4s2^);
      Vector_SpeedTestCaller_2P_R(m4s1,m4s2);
      If not SameMatrices(m4s2^,Transposed(m4s1^),1e-6) then
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
  Write(Format('m4d -> m4s @ SSE(%s): ',[BoolToMark(CheckMemAlign16(m4s1,m4s2),'a','u')]));
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^);
      Vector_SpeedTestCaller_2P_R(m4s1,m4s2);
      If not SameMatrices(m4s2^,Transposed(m4s1^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(Transpose_4RMs_SSEu);
  Write('m4d -> m4s @ SSEu:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^);
      Vector_SpeedTestCaller_2P_R(m4s1,m4s2);
      If not SameMatrices(m4s2^,Transposed(m4s1^),1e-6) then
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
  PrecisionTest.FunctionAddr := Addr(Transpose_4RMs_SSEa);
  Write('m4d -> m4s @ SSEa:   ');
  For i := 1 to TestCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^);
      Vector_SpeedTestCaller_2P_R(m4s1,m4s2);
      If not SameMatrices(m4s2^,Transposed(m4s1^),1e-6) then
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
  VMCL_Dispose(m2s1); VMCL_Dispose(m3s1); VMCL_Dispose(m4s1);
  VMCL_Dispose(m2s2); VMCL_Dispose(m3s2); VMCL_Dispose(m4s2);
  VMCL_Dispose(m2d1); VMCL_Dispose(m3d1); VMCL_Dispose(m4d1);
  VMCL_Dispose(m2d2); VMCL_Dispose(m3d2); VMCL_Dispose(m4d2);
end;
Result := 0;
end;