Function Matrix_MatricesMultiplyRM_SSE_Auto(AutoTest: Boolean = False): Integer;
const
  ValueCount = 2000000;
var
  m2s1,m2s2,m2s3: PVMCLMatrix2RMs;
  m3s1,m3s2,m3s3: PVMCLMatrix3RMs;
  m4s1,m4s2,m4s3: PVMCLMatrix4RMs;
  m2d1,m2d2,m2d3: PVMCLMatrix2RMd;
  m3d1,m3d2,m3d3: PVMCLMatrix3RMd;
  m4d1,m4d2,m4d3: PVMCLMatrix4RMd;
  Status:         Boolean;
  i:              Integer;
begin
WriteLn;
WriteLn(LineText('MatricesMultiply_SSE (RM) - Automatic value checks'));
WriteLn;
WriteLn('Value count: ',ValueCount);
VMCL_New(m2s1); VMCL_New(m2s2); VMCL_New(m2s3);
VMCL_New(m3s1); VMCL_New(m3s2); VMCL_New(m3s3);
VMCL_New(m4s1); VMCL_New(m4s2); VMCL_New(m4s3);
VMCL_New(m2d1); VMCL_New(m2d2); VMCL_New(m2d3);
VMCL_New(m3d1); VMCL_New(m3d2); VMCL_New(m3d3);
VMCL_New(m4d1); VMCL_New(m4d2); VMCL_New(m4d3);
try
  WriteLn;
  Write('m2s * m2s @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^); LoadZeroMatrix(m2s3^);
      MatricesMultiply_SSE(m2s1^,m2s2^,m2s3^);
      If not EqualMatrices(m2s3^,MatricesMultiply(m2s1^,m2s2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m2s * m2s @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^); LoadZeroMatrix(m2s3^);
      MatricesMultiply_2RMs_SSEu(m2s1^,m2s2^,m2s3^);
      If not EqualMatrices(m2s3^,MatricesMultiply(m2s1^,m2s2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m2s * m2s @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2s1^); RandomMat(m2s2^); LoadZeroMatrix(m2s3^);
      MatricesMultiply_2RMs_SSEa(m2s1^,m2s2^,m2s3^);
      If not EqualMatrices(m2s3^,MatricesMultiply(m2s1^,m2s2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m3s * m3s @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3s1^); RandomMat(m3s2^); LoadZeroMatrix(m3s3^);
      MatricesMultiply_SSE(m3s1^,m3s2^,m3s3^);
      If not EqualMatrices(m3s3^,MatricesMultiply(m3s1^,m3s2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m3s * m3s @ SSEua: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3s1^); RandomMat(m3s2^); LoadZeroMatrix(m3s3^);
      MatricesMultiply_3RMs_SSEua(m3s1^,m3s2^,m3s3^);
      If not EqualMatrices(m3s3^,MatricesMultiply(m3s1^,m3s2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m4s * m4s @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^); LoadZeroMatrix(m4s3^);
      MatricesMultiply_SSE(m4s1^,m4s2^,m4s3^);
      If not EqualMatrices(m4s3^,MatricesMultiply(m4s1^,m4s2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m4s * m4s @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^); LoadZeroMatrix(m4s3^);
      MatricesMultiply_4RMs_SSEu(m4s1^,m4s2^,m4s3^);
      If not EqualMatrices(m4s3^,MatricesMultiply(m4s1^,m4s2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m4s * m4s @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4s1^); RandomMat(m4s2^); LoadZeroMatrix(m4s3^);
      MatricesMultiply_4RMs_SSEa(m4s1^,m4s2^,m4s3^);
      If not EqualMatrices(m4s3^,MatricesMultiply(m4s1^,m4s2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m2d * m2d @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2d1^); RandomMat(m2d2^); LoadZeroMatrix(m2d3^);
      MatricesMultiply_SSE(m2d1^,m2d2^,m2d3^);
      If not EqualMatrices(m2d3^,MatricesMultiply(m2d1^,m2d2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m2d * m2d @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2d1^); RandomMat(m2d2^); LoadZeroMatrix(m2d3^);
      MatricesMultiply_2RMd_SSEu(m2d1^,m2d2^,m2d3^);
      If not EqualMatrices(m2d3^,MatricesMultiply(m2d1^,m2d2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m2d * m2d @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2d1^); RandomMat(m2d2^); LoadZeroMatrix(m2d3^);
      MatricesMultiply_2RMd_SSEa(m2d1^,m2d2^,m2d3^);
      If not EqualMatrices(m2d3^,MatricesMultiply(m2d1^,m2d2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m3d * m3d @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3d1^); RandomMat(m3d2^); LoadZeroMatrix(m3d3^);
      MatricesMultiply_SSE(m3d1^,m3d2^,m3d3^);
      If not EqualMatrices(m3d3^,MatricesMultiply(m3d1^,m3d2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m3d * m3d @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3d1^); RandomMat(m3d2^); LoadZeroMatrix(m3d3^);
      MatricesMultiply_3RMd_SSEu(m3d1^,m3d2^,m3d3^);
      If not EqualMatrices(m3d3^,MatricesMultiply(m3d1^,m3d2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m3d * m3d @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3d1^); RandomMat(m3d2^); LoadZeroMatrix(m3d3^);
      MatricesMultiply_3RMd_SSEa(m3d1^,m3d2^,m3d3^);
      If not EqualMatrices(m3d3^,MatricesMultiply(m3d1^,m3d2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m4d * m4d @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4d1^); RandomMat(m4d2^); LoadZeroMatrix(m4d3^);
      MatricesMultiply_SSE(m4d1^,m4d2^,m4d3^);
      If not EqualMatrices(m4d3^,MatricesMultiply(m4d1^,m4d2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m4d * m4d @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4d1^); RandomMat(m4d2^); LoadZeroMatrix(m4d3^);
      MatricesMultiply_4RMd_SSEu(m4d1^,m4d2^,m4d3^);
      If not EqualMatrices(m4d3^,MatricesMultiply(m4d1^,m4d2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m4d * m4d @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4d1^); RandomMat(m4d2^); LoadZeroMatrix(m4d3^);
      MatricesMultiply_4RMd_SSEa(m4d1^,m4d2^,m4d3^);
      If not EqualMatrices(m4d3^,MatricesMultiply(m4d1^,m4d2^)) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
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
