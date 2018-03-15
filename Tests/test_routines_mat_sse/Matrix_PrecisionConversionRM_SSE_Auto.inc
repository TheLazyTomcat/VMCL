Function Matrix_PrecisionConversionRM_SSE_Auto({%H-}AutoTest: Boolean = False): Integer;
const
  ValueCount = 2000000;
  Epsilon    = 1e-6;
var
  m2s:    PMatrix2RMs;
  m3s:    PMatrix3RMs;
  m4s:    PMatrix4RMs;
  m2d:    PMatrix2RMd;
  m3d:    PMatrix3RMd;
  m4d:    PMatrix4RMd;
  Status: Boolean;
  i:      Integer;
begin
WriteLn;
WriteLn(LineText('PrecisionConversion_SSE (RM) - Automatic value checks'));
WriteLn;
WriteLn('Value count: ',ValueCount,'   Epsilon: ',FloatToStr(Epsilon));
VMCL_New(m2s); VMCL_New(m3s); VMCL_New(m4s);
VMCL_New(m2d); VMCL_New(m3d); VMCL_New(m4d);
try
  WriteLn;
  Write('m2d -> m2s @ SSE:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      PrecisionConversion_SSE(m2d^,m2s^);
      If not SameMatrices(m2s^,Matrix2s(m2d^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m2d -> m2s @ SSEu: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      PrecisionConversion_2RMs_SSEu(m2d^,m2s^);
      If not SameMatrices(m2s^,Matrix2s(m2d^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m2d -> m2s @ SSEa: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      PrecisionConversion_2RMs_SSEa(m2d^,m2s^);
      If not SameMatrices(m2s^,Matrix2s(m2d^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m3d -> m3s @ SSE:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      PrecisionConversion_SSE(m3d^,m3s^);
      If not SameMatrices(m3s^,Matrix3s(m3d^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m3d -> m3s @ SSEu: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      PrecisionConversion_3RMs_SSEu(m3d^,m3s^);
      If not SameMatrices(m3s^,Matrix3s(m3d^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m3d -> m3s @ SSEa: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      PrecisionConversion_3RMs_SSEa(m3d^,m3s^);
      If not SameMatrices(m3s^,Matrix3s(m3d^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m4d -> m4s @ SSE:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      PrecisionConversion_SSE(m4d^,m4s^);
      If not SameMatrices(m4s^,Matrix4s(m4d^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m4d -> m4s @ SSEu: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      PrecisionConversion_4RMs_SSEu(m4d^,m4s^);
      If not SameMatrices(m4s^,Matrix4s(m4d^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m4d -> m4s @ SSEa: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      PrecisionConversion_4RMs_SSEa(m4d^,m4s^);
      If not SameMatrices(m4s^,Matrix4s(m4d^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m2s -> m2d @ SSE:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      PrecisionConversion_SSE(m2s^,m2d^);
      If not SameMatrices(m2d^,Matrix2d(m2s^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m2s -> m2d @ SSEu: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      PrecisionConversion_2RMd_SSEu(m2s^,m2d^);
      If not SameMatrices(m2d^,Matrix2d(m2s^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m2s -> m2d @ SSEa: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m2d^); RandomMat(m2s^);
      PrecisionConversion_2RMd_SSEa(m2s^,m2d^);
      If not SameMatrices(m2d^,Matrix2d(m2s^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m3s -> m3d @ SSE:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      PrecisionConversion_SSE(m3s^,m3d^);
      If not SameMatrices(m3d^,Matrix3d(m3s^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m3s -> m3d @ SSEu: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      PrecisionConversion_3RMd_SSEu(m3s^,m3d^);
      If not SameMatrices(m3d^,Matrix3d(m3s^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m3s -> m3d @ SSEa: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m3d^); RandomMat(m3s^);
      PrecisionConversion_3RMd_SSEa(m3s^,m3d^);
      If not SameMatrices(m3d^,Matrix3d(m3s^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('m4s -> m4d @ SSE:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      PrecisionConversion_SSE(m4s^,m4d^);
      If not SameMatrices(m4d^,Matrix4d(m4s^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m4s -> m4d @ SSEu: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      PrecisionConversion_4RMd_SSEu(m4s^,m4d^);
      If not SameMatrices(m4d^,Matrix4d(m4s^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
  Write('m4s -> m4d @ SSEa: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomMat(m4d^); RandomMat(m4s^);
      PrecisionConversion_4RMd_SSEa(m4s^,m4d^);
      If not SameMatrices(m4d^,Matrix4d(m4s^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteLn(BoolToStr(Status,True));
finally
  VMCL_Dispose(m2s); VMCL_Dispose(m3s); VMCL_Dispose(m4s);
  VMCL_Dispose(m2d); VMCL_Dispose(m3d); VMCL_Dispose(m4d);
end;
Result := 0;
end;
