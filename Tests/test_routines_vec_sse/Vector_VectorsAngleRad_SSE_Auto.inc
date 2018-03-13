Function Vector_VectorsAngleRad_SSE_Auto({%H-}AutoTest: Boolean = False): Integer;
const
  ValueCount = 1000000;
  Epsilon    = 1e-3;
var
  v2s1,v2s2:  PVector2s;
  v3s1,v3s2:  PVector3s;
  v4s1,v4s2:  PVector4s;
  v2d1,v2d2:  PVector2d;
  v3d1,v3d2:  PVector3d;
  v4d1,v4d2:  PVector4d;
  i:          Integer;
  Status:     Boolean;
  sRes:       Single;
  dRes:       Double;

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
WriteLn(LineText('VectorsAngleRad_SSE - Automatic value checks'));
WriteLn;
WriteLn('Value count: ',ValueCount,'   Epsilon: ',FloatToStr(Epsilon));
VMCL_New(v2s1); VMCL_New(v2s2);
VMCL_New(v3s1); VMCL_New(v3s2);
VMCL_New(v4s1); VMCL_New(v4s2);
VMCL_New(v2d1); VMCL_New(v2d2);
VMCL_New(v3d1); VMCL_New(v3d2);
VMCL_New(v4d1); VMCL_New(v4d2);
try
  WriteLn;
  Write('v2s @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^);
      VectorsAngleRad_SSE(v2s1^,v2s2^,sRes);
      If not SameValue(sRes,VectorsAngleRad(v2s1^,v2s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(13);
  Write('v2s @ SSEua: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2s1^); RandomVec(v2s2^);
      VectorsAngleRad_2s_SSEua(v2s1^,v2s2^,sRes);
      If not SameValue(sRes,VectorsAngleRad(v2s1^,v2s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(12);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v3s @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^);
      VectorsAngleRad_SSE(v3s1^,v3s2^,sRes);
      If not SameValue(sRes,VectorsAngleRad(v3s1^,v3s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(13);
  Write('v3s @ SSEua: '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3s1^); RandomVec(v3s2^);
      VectorsAngleRad_3s_SSEua(v3s1^,v3s2^,sRes);
      If not SameValue(sRes,VectorsAngleRad(v3s1^,v3s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(13);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4s @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^);
      VectorsAngleRad_SSE(v4s1^,v4s2^,sRes);
      If not SameValue(sRes,VectorsAngleRad(v4s1^,v4s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(13);
  Write('v4s @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^);
      VectorsAngleRad_4s_SSEu(v4s1^,v4s2^,sRes);
      If not SameValue(sRes,VectorsAngleRad(v4s1^,v4s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
  Write('v4s @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4s1^); RandomVec(v4s2^);
      VectorsAngleRad_4s_SSEa(v4s1^,v4s2^,sRes);
      If not SameValue(sRes,VectorsAngleRad(v4s1^,v4s2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v2d @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^);
      VectorsAngleRad_SSE(v2d1^,v2d2^,dRes);
      If not SameValue(dRes,VectorsAngleRad(v2d1^,v2d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(13);
  Write('v2d @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^);
      VectorsAngleRad_2d_SSEu(v2d1^,v2d2^,dRes);
      If not SameValue(dRes,VectorsAngleRad(v2d1^,v2d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
  Write('v2d @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v2d1^); RandomVec(v2d2^);
      VectorsAngleRad_2d_SSEa(v2d1^,v2d2^,dRes);
      If not SameValue(dRes,VectorsAngleRad(v2d1^,v2d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(22);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v3d @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^);
      VectorsAngleRad_SSE(v3d1^,v3d2^,dRes);
      If not SameValue(dRes,VectorsAngleRad(v3d1^,v3d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(13);
  Write('v3d @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^);
      VectorsAngleRad_3d_SSEu(v3d1^,v3d2^,dRes);
      If not SameValue(dRes,VectorsAngleRad(v3d1^,v3d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
  Write('v3d @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v3d1^); RandomVec(v3d2^);
      VectorsAngleRad_3d_SSEa(v3d1^,v3d2^,dRes);
      If not SameValue(dRes,VectorsAngleRad(v3d1^,v3d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(23);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WriteLn;
  Write('v4d @ SSE:   '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^);
      VectorsAngleRad_SSE(v4d1^,v4d2^,dRes);
      If not SameValue(dRes,VectorsAngleRad(v4d1^,v4d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(13);
  Write('v4d @ SSEu:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^);
      VectorsAngleRad_4d_SSEu(v4d1^,v4d2^,dRes);
      If not SameValue(dRes,VectorsAngleRad(v4d1^,v4d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(14);
  Write('v4d @ SSEa:  '); Status := True;
  For i := 1 to ValueCount do
    begin
      RandomVec(v4d1^); RandomVec(v4d2^);
      VectorsAngleRad_4d_SSEa(v4d1^,v4d2^,dRes);
      If not SameValue(dRes,VectorsAngleRad(v4d1^,v4d2^),Epsilon) then
        begin
          Status := False;
          Break {For i};
        end;
    end;
  WriteResult(24);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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