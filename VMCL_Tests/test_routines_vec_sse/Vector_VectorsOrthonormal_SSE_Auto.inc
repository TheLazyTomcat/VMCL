Function Vector_VectorsOrthonormal_SSE_Auto(AutoTest: Boolean = False): Integer;
const
  ValueCount = 1000000;
  Epsilon    = 1e-6;
var
  v2s1,v2s2,v2s3: PVMCLVector2s;
  v3s1,v3s2,v3s3: PVMCLVector3s;
  v4s1,v4s2,v4s3: PVMCLVector4s;
  v2d1,v2d2,v2d3: PVMCLVector2d;
  v3d1,v3d2,v3d3: PVMCLVector3d;
  v4d1,v4d2,v4d3: PVMCLVector4d;
  i:              Integer;
  Status:         Boolean;

  procedure WriteResult(VecSize: Integer);
  begin
    If not Status then
      begin
        Write('False ');
        case VecSize of
          12: WriteLn(VecToStr(v2s1^),' ',VecToStr(v2s2^));
          13: WriteLn(VecToStr(v3s1^),' ',VecToStr(v3s2^));
          14: WriteLn(VecToStr(v4s1^),' ',VecToStr(v4s2^));
          22: WriteLn(VecToStr(v2d1^),' ',VecToStr(v2d2^));
          23: WriteLn(VecToStr(v3d1^),' ',VecToStr(v3d2^));
          24: WriteLn(VecToStr(v4d1^),' ',VecToStr(v4d2^));
        else
          WriteLn;
        end;
      end
    else WriteLn('True');
  end;

begin
WriteLn;
WriteLn(LineText('VectorsOrthonormal_SSE - Automatic value checks'));
WriteLn;
WriteLn('Value count: ',ValueCount,'   Epsilon: ',FloatToStr(Epsilon));
VMCL_New(v2s1); VMCL_New(v2s2); VMCL_New(v2s3);
VMCL_New(v3s1); VMCL_New(v3s2); VMCL_New(v3s3);
VMCL_New(v4s1); VMCL_New(v4s2); VMCL_New(v4s3);
VMCL_New(v2d1); VMCL_New(v2d2); VMCL_New(v2d3);
VMCL_New(v3d1); VMCL_New(v3d2); VMCL_New(v3d3);
VMCL_New(v4d1); VMCL_New(v4d2); VMCL_New(v4d3);
try
  WriteLn;
  Write('v2s @ SSE:    '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^); LoadZeroVector(v2s3^);
      VectorsOrthonormal_SSE(v2s1^,v2s2^,v2s3^);
      If not SameVectors(v2s3^,VectorsOrthonormal(v2s1^,v2s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(12);
  Write('v2s @ SSEua:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^); LoadZeroVector(v2s3^);
      VectorsOrthonormal_2s_SSEua(v2s1^,v2s2^,v2s3^);
      If not SameVectors(v2s3^,VectorsOrthonormal(v2s1^,v2s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(12);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v3s @ SSE:    '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^); LoadZeroVector(v3s3^);
      VectorsOrthonormal_SSE(v3s1^,v3s2^,v3s3^);
      If not SameVectors(v3s3^,VectorsOrthonormal(v3s1^,v3s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(13);
  Write('v3s @ SSEua:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^); LoadZeroVector(v3s3^);
      VectorsOrthonormal_3s_SSEua(v3s1^,v3s2^,v3s3^);
      If not SameVectors(v3s3^,VectorsOrthonormal(v3s1^,v3s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(13);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4s @ SSE:    '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      VectorsOrthonormal_SSE(v4s1^,v4s2^,v4s3^);
      If not SameVectors(v4s3^,VectorsOrthonormal(v4s1^,v4s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
  Write('v4s @ SSEu:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      VectorsOrthonormal_4s_SSEu(v4s1^,v4s2^,v4s3^);
      If not SameVectors(v4s3^,VectorsOrthonormal(v4s1^,v4s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
  Write('v4s @ SSEa:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      VectorsOrthonormal_4s_SSEa(v4s1^,v4s2^,v4s3^);
      If not SameVectors(v4s3^,VectorsOrthonormal(v4s1^,v4s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4s3 @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      VectorsOrthonormalXYZ_SSE(v4s1^,v4s2^,v4s3^);
      If not SameVectors(v4s3^,VectorsOrthonormalXYZ(v4s1^,v4s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
  Write('v4s3 @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      VectorsOrthonormalXYZ_4s_SSEu(v4s1^,v4s2^,v4s3^);
      If not SameVectors(v4s3^,VectorsOrthonormalXYZ(v4s1^,v4s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
  Write('v4s3 @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^); LoadZeroVector(v4s3^);
      VectorsOrthonormalXYZ_4s_SSEa(v4s1^,v4s2^,v4s3^);
      If not SameVectors(v4s3^,VectorsOrthonormalXYZ(v4s1^,v4s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v2d @ SSE:    '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^); LoadZeroVector(v2d3^);
      VectorsOrthonormal_SSE(v2d1^,v2d2^,v2d3^);
      If not SameVectors(v2d3^,VectorsOrthonormal(v2d1^,v2d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(22);
  Write('v2d @ SSEu:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^); LoadZeroVector(v2d3^);
      VectorsOrthonormal_2d_SSEu(v2d1^,v2d2^,v2d3^);
      If not SameVectors(v2d3^,VectorsOrthonormal(v2d1^,v2d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(22);
  Write('v2d @ SSEa:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^); LoadZeroVector(v2d3^);
      VectorsOrthonormal_2d_SSEa(v2d1^,v2d2^,v2d3^);
      If not SameVectors(v2d3^,VectorsOrthonormal(v2d1^,v2d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(22);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v3d @ SSE:    '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      VectorsOrthonormal_SSE(v3d1^,v3d2^,v3d3^);
      If not SameVectors(v3d3^,VectorsOrthonormal(v3d1^,v3d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(23);
  Write('v3d @ SSEu:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      VectorsOrthonormal_3d_SSEu(v3d1^,v3d2^,v3d3^);
      If not SameVectors(v3d3^,VectorsOrthonormal(v3d1^,v3d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(23);
  Write('v3d @ SSEa:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^); LoadZeroVector(v3d3^);
      VectorsOrthonormal_3d_SSEa(v3d1^,v3d2^,v3d3^);
      If not SameVectors(v3d3^,VectorsOrthonormal(v3d1^,v3d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(23);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4d @ SSE:    '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      VectorsOrthonormal_SSE(v4d1^,v4d2^,v4d3^);
      If not SameVectors(v4d3^,VectorsOrthonormal(v4d1^,v4d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(24);
  Write('v4d @ SSEu:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      VectorsOrthonormal_4d_SSEu(v4d1^,v4d2^,v4d3^);
      If not SameVectors(v4d3^,VectorsOrthonormal(v4d1^,v4d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(24);
  Write('v4d @ SSEa:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      VectorsOrthonormal_4d_SSEa(v4d1^,v4d2^,v4d3^);
      If not SameVectors(v4d3^,VectorsOrthonormal(v4d1^,v4d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(24);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4d3 @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      VectorsOrthonormalXYZ_SSE(v4d1^,v4d2^,v4d3^);
      If not SameVectors(v4d3^,VectorsOrthonormalXYZ(v4d1^,v4d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(24);
  Write('v4d3 @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      VectorsOrthonormalXYZ_4d_SSEu(v4d1^,v4d2^,v4d3^);
      If not SameVectors(v4d3^,VectorsOrthonormalXYZ(v4d1^,v4d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(24);
  Write('v4d3 @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^); LoadZeroVector(v4d3^);
      VectorsOrthonormalXYZ_4d_SSEa(v4d1^,v4d2^,v4d3^);
      If not SameVectors(v4d3^,VectorsOrthonormalXYZ(v4d1^,v4d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(24);
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