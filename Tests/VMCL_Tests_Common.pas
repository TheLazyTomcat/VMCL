{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  VMCL Test Suite

  Common routines

  ©František Milt 2018-02-26

  Version 1.0 dev

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    BitVector   - github.com/ncs-sniper/Lib.BitVector
    BitOps      - github.com/ncs-sniper/Lib.BitOps
    StrRect     - github.com/ncs-sniper/Lib.StrRect
    SimpleCPUID - github.com/ncs-sniper/Lib.SimpleCPUID

===============================================================================}
unit VMCL_Tests_Common;

{$INCLUDE '..\VMCL_defs.inc'}

interface

uses
  VMCL_Vectors, VMCL_Matrices;

type
  TVMCLTestFunction = Function(AutoTest: Boolean = False): Integer;

Function BoolToMark(Value: Boolean; MarkTrue: String = '+'; MarkFalse: String = '-'): String;

Function Splitter(SplitterChar: Char = '-'; Count: Integer = 64): String;
Function CenteredText(const Text: String; BorderChar: Char = '-'; Width: Integer = 64): String;
Function LineText(const Text: String; LineChar: Char = '-'; Width: Integer = 64): String;

const
  VMCL_RESULT_BACK = 0;
  VMCL_RESULT_INVL = -1;
  VMCL_RESULT_EXIT = -2;
  VMCL_RESULT_AUTO = -3;

Function Prompt(Min,Max: Integer): Integer;
Function Select(Caption, Text: String; Functions: array of TVMCLTestFunction; Tests: array of String; AutoTest: Boolean = False): Integer;


//= Vectors randomization ======================================================

procedure RandomVec(out Vec: TVMCLVector2s; Max: Integer = 100; Offset: Single = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector3s; Max: Integer = 100; Offset: Single = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector4s; Max: Integer = 100; Offset: Single = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector2d; Max: Integer = 100; Offset: Double = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector3d; Max: Integer = 100; Offset: Double = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector4d; Max: Integer = 100; Offset: Double = 0.0); overload;

procedure RandomVec(out Vec: TVMCLVector2sr; Max: Integer = 100; Offset: Single = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector3sr; Max: Integer = 100; Offset: Single = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector4sr; Max: Integer = 100; Offset: Single = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector2dr; Max: Integer = 100; Offset: Double = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector3dr; Max: Integer = 100; Offset: Double = 0.0); overload;
procedure RandomVec(out Vec: TVMCLVector4dr; Max: Integer = 100; Offset: Double = 0.0); overload;

//= Matrices randomization =====================================================

procedure RandomMat(out Mat: TMatrix2s; Max: Integer = 100; Offset: Double = 0.0); overload;
procedure RandomMat(out Mat: TMatrix3s; Max: Integer = 100; Offset: Double = 0.0); overload;
procedure RandomMat(out Mat: TMatrix4s; Max: Integer = 100; Offset: Double = 0.0); overload;
procedure RandomMat(out Mat: TMatrix2d; Max: Integer = 100; Offset: Double = 0.0); overload;
procedure RandomMat(out Mat: TMatrix3d; Max: Integer = 100; Offset: Double = 0.0); overload;
procedure RandomMat(out Mat: TMatrix4d; Max: Integer = 100; Offset: Double = 0.0); overload;

//= Specialized functions ======================================================

{$IFNDEF PurePascal}
procedure PrintSSERegisters_Single;
procedure PrintSSERegisters_Double;
{$ENDIF}

implementation

uses
  SysUtils;

Function BoolToMark(Value: Boolean; MarkTrue: String = '+'; MarkFalse: String = '-'): String;
begin
If Value then
  Result := MarkTrue
else
  Result := MarkFalse;
end;

//------------------------------------------------------------------------------

Function Splitter(SplitterChar: Char = '-'; Count: Integer = 64): String;
begin
Result := StringOfChar(SplitterChar,Count);
end;

//------------------------------------------------------------------------------

Function CenteredText(const Text: String; BorderChar: Char = '-'; Width: Integer = 64): String;
var
  WhiteSpace: Integer;
begin
If Length(Text) < (Width - 2) then
  begin
    WhiteSpace := Width - Length(Text) - 2;
    Result := BorderChar + StringOfChar(' ',WhiteSpace div 2) + Text +
              StringOfChar(' ',WhiteSpace - (WhiteSpace div 2)) + BorderChar;
  end
else Result := Text;
end;

//------------------------------------------------------------------------------

Function LineText(const Text: String; LineChar: Char = '-'; Width: Integer = 64): String;
begin
If Length(Text) < (Width - 6) then
  begin
    Result := StringOfChar(LineChar,3) + ' ' + Text + ' ' +
              StringOfChar(LineChar,Width - Length(Text) - 5);
  end
else Result := Text;
end;

//------------------------------------------------------------------------------

Function Prompt(Min,Max: Integer): Integer;
var
  Str:  String;
begin
Write(':/> '); ReadLn(Str);
If Length(Str) > 0 then
  begin
    If (Str = 'a') or (Str = 'A') then
      Result := VMCL_RESULT_AUTO
    else If (Str = 'x') or (Str = 'X') then
      Result := VMCL_RESULT_EXIT
    else
      begin
        Result := StrToIntDef(Str,VMCL_RESULT_INVL);
        If ((Result < Min) or (Result > Max)) and (Result <> VMCL_RESULT_BACK) then
          Result := VMCL_RESULT_INVL;
      end;
  end
else Result := VMCL_RESULT_INVL;
end;

//------------------------------------------------------------------------------

Function Select(Caption, Text: String; Functions: array of TVMCLTestFunction; Tests: array of String; AutoTest: Boolean = False): Integer;
var
  i:  Integer;
begin
repeat
  WriteLn;
  WriteLn(LineText(Caption,'='));
  If not AutoTest then
    begin
      WriteLn;
      WriteLn(Text);
      WriteLn;
      // list of functions
      i := Low(Functions);
      while i < High(Functions) do
        begin
          If (i >= Low(Tests)) and (i <= High(Tests)) then
            Write(Format('%-32s',[Format('%4d - %s',[i + 1,Tests[i]])]))
          else
            Write(Format('%-32s',[Format('%4d - unknown #%d',[i + 1,i])]));
          If (Succ(i) >= Low(Tests)) and (Succ(i) <= High(Tests)) then
            WriteLn(Format('%-32s',[Format('%4d - %s',[i + 2,Tests[Succ(i)]])]))
          else
            WriteLn(Format('%-32s',[Format('%4d - unknown #%d',[i + 2,Succ(i)])]));
          Inc(i,2);
        end;
      If (Length(Functions) and 1) <> 0 then
        If (High(Functions) >= Low(Tests)) and (High(Functions) <= High(Tests)) then
          WriteLn(Format('%-32s',[Format('%4d - %s',[High(Functions) + 1,Tests[High(Functions)]])]))
        else
          WriteLn(Format('%-32s',[Format('%4d - unknown #%d',[High(Functions) + 1,High(Functions)])]));
      // prompt
      WriteLn;
      Result := Prompt(1,Length(Functions));
    end
  else Result := VMCL_RESULT_AUTO;
  case Result of
    VMCL_RESULT_BACK: WriteLn('Back...');
    VMCL_RESULT_INVL: WriteLn('Invalid value...');
    VMCL_RESULT_EXIT: WriteLn('Exit...');
    VMCL_RESULT_AUTO:
      begin
        WriteLn('Autotest...');
        For i := Low(Functions) to High(Functions) do
          Functions[i](True);
        If AutoTest then
          Result := VMCL_RESULT_BACK;
      end;
  else
    If Functions[Result - 1](False) = VMCL_RESULT_EXIT then
      Result := VMCL_RESULT_EXIT;
  end;
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

//= Vectors randomization ======================================================

procedure RandomVec(out Vec: TVMCLVector2s; Max: Integer = 100; Offset: Single = 0.0);
begin
Vec[0] := Random(Max) + Offset;
Vec[1] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector3s; Max: Integer = 100; Offset: Single = 0.0);
begin
Vec[0] := Random(Max) + Offset;
Vec[1] := Random(Max) + Offset;
Vec[2] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector4s; Max: Integer = 100; Offset: Single = 0.0);
begin
Vec[0] := Random(Max) + Offset;
Vec[1] := Random(Max) + Offset;
Vec[2] := Random(Max) + Offset;
Vec[3] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector2d; Max: Integer = 100; Offset: Double = 0.0);
begin
Vec[0] := Random(Max) + Offset;
Vec[1] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector3d; Max: Integer = 100; Offset: Double = 0.0);
begin
Vec[0] := Random(Max) + Offset;
Vec[1] := Random(Max) + Offset;
Vec[2] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector4d; Max: Integer = 100; Offset: Double = 0.0);
begin
Vec[0] := Random(Max) + Offset;
Vec[1] := Random(Max) + Offset;
Vec[2] := Random(Max) + Offset;
Vec[3] := Random(Max) + Offset;
end;

//------------------------------------------------------------------------------

procedure RandomVec(out Vec: TVMCLVector2sr; Max: Integer = 100; Offset: Single = 0.0);
begin
Vec.X := Random(Max) + Offset;
Vec.Y := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector3sr; Max: Integer = 100; Offset: Single = 0.0);
begin
Vec.X := Random(Max) + Offset;
Vec.Y := Random(Max) + Offset;
Vec.Z := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector4sr; Max: Integer = 100; Offset: Single = 0.0);
begin
Vec.X := Random(Max) + Offset;
Vec.Y := Random(Max) + Offset;
Vec.Z := Random(Max) + Offset;
Vec.W := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector2dr; Max: Integer = 100; Offset: Double = 0.0);
begin
Vec.X := Random(Max) + Offset;
Vec.Y := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector3dr; Max: Integer = 100; Offset: Double = 0.0);
begin
Vec.X := Random(Max) + Offset;
Vec.Y := Random(Max) + Offset;
Vec.Z := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomVec(out Vec: TVMCLVector4dr; Max: Integer = 100; Offset: Double = 0.0);
begin
Vec.X := Random(Max) + Offset;
Vec.Y := Random(Max) + Offset;
Vec.Z := Random(Max) + Offset;
Vec.W := Random(Max) + Offset;
end;

//= Matrices randomization ======================================================

procedure RandomMat(out Mat: TMatrix2s; Max: Integer = 100; Offset: Double = 0.0);
var
  i:  Integer;
begin
For i := Low(TMatrix2so) to High(TMatrix2so) do
   TMatrix2so(Mat)[i] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomMat(out Mat: TMatrix3s; Max: Integer = 100; Offset: Double = 0.0);
var
  i:  Integer;
begin
For i := Low(TMatrix3so) to High(TMatrix3so) do
   TMatrix3so(Mat)[i] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomMat(out Mat: TMatrix4s; Max: Integer = 100; Offset: Double = 0.0);
var
  i:  Integer;
begin
For i := Low(TMatrix4so) to High(TMatrix4so) do
   TMatrix4so(Mat)[i] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomMat(out Mat: TMatrix2d; Max: Integer = 100; Offset: Double = 0.0);
var
  i:  Integer;
begin
For i := Low(TMatrix2do) to High(TMatrix2do) do
   TMatrix2do(Mat)[i] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomMat(out Mat: TMatrix3d; Max: Integer = 100; Offset: Double = 0.0);
var
  i:  Integer;
begin
For i := Low(TMatrix3do) to High(TMatrix3do) do
   TMatrix3do(Mat)[i] := Random(Max) + Offset;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure RandomMat(out Mat: TMatrix4d; Max: Integer = 100; Offset: Double = 0.0);
var
  i:  Integer;
begin
For i := Low(TMatrix4do) to High(TMatrix4do) do
   TMatrix4do(Mat)[i] := Random(Max) + Offset;
end;

//= Specialized functions ======================================================

{$IFNDEF PurePascal}

procedure PrintSSERegisters_Single;
var
{$IFDEF x64}
  Buff: array[0..15] of TVector4s;
{$ELSE}
  Buff: array[0..7] of TVector4s;
{$ENDIF}
begin
asm
  MOVUPS  dqword ptr [Buff],       XMM0
  MOVUPS  dqword ptr [Buff + 16],  XMM1
  MOVUPS  dqword ptr [Buff + 32],  XMM2
  MOVUPS  dqword ptr [Buff + 48],  XMM3
  MOVUPS  dqword ptr [Buff + 64],  XMM4
  MOVUPS  dqword ptr [Buff + 80],  XMM5
  MOVUPS  dqword ptr [Buff + 96],  XMM6
  MOVUPS  dqword ptr [Buff + 112], XMM7
{$IFDEF x64}
  MOVUPS  dqword ptr [Buff + 128], XMM8
  MOVUPS  dqword ptr [Buff + 144], XMM9
  MOVUPS  dqword ptr [Buff + 160], XMM10
  MOVUPS  dqword ptr [Buff + 176], XMM11
  MOVUPS  dqword ptr [Buff + 192], XMM12
  MOVUPS  dqword ptr [Buff + 208], XMM13
  MOVUPS  dqword ptr [Buff + 224], XMM14
  MOVUPS  dqword ptr [Buff + 240], XMM15
{$ENDIF}  
end;
WriteLn;
WriteLn('XMM0  ' + VecToStr(Buff[0]));
WriteLn('XMM1  ' + VecToStr(Buff[1]));
WriteLn('XMM2  ' + VecToStr(Buff[2]));
WriteLn('XMM3  ' + VecToStr(Buff[3]));
WriteLn('XMM4  ' + VecToStr(Buff[4]));
WriteLn('XMM5  ' + VecToStr(Buff[5]));
WriteLn('XMM6  ' + VecToStr(Buff[6]));
WriteLn('XMM7  ' + VecToStr(Buff[7]));
{$IFDEF x64}
WriteLn('XMM8  ' + VecToStr(Buff[8]));
WriteLn('XMM9  ' + VecToStr(Buff[9]));
WriteLn('XMM10 ' + VecToStr(Buff[10]));
WriteLn('XMM11 ' + VecToStr(Buff[11]));
WriteLn('XMM12 ' + VecToStr(Buff[12]));
WriteLn('XMM13 ' + VecToStr(Buff[13]));
WriteLn('XMM14 ' + VecToStr(Buff[14]));
WriteLn('XMM15 ' + VecToStr(Buff[15]));
{$ENDIF}
asm
  MOVUPD  XMM0, dqword ptr [Buff]
  MOVUPD  XMM1, dqword ptr [Buff + 16]
  MOVUPD  XMM2, dqword ptr [Buff + 32]
  MOVUPD  XMM3, dqword ptr [Buff + 48]
  MOVUPD  XMM4, dqword ptr [Buff + 64]
  MOVUPD  XMM5, dqword ptr [Buff + 80]
  MOVUPD  XMM6, dqword ptr [Buff + 96]
  MOVUPD  XMM7, dqword ptr [Buff + 112]
{$IFDEF x64}
  MOVUPD  XMM8,  dqword ptr [Buff + 128]
  MOVUPD  XMM9,  dqword ptr [Buff + 144]
  MOVUPD  XMM10, dqword ptr [Buff + 160]
  MOVUPD  XMM11, dqword ptr [Buff + 176]
  MOVUPD  XMM12, dqword ptr [Buff + 192]
  MOVUPD  XMM13, dqword ptr [Buff + 208]
  MOVUPD  XMM14, dqword ptr [Buff + 224]
  MOVUPD  XMM15, dqword ptr [Buff + 240]
{$ENDIF}
end;
end;

//------------------------------------------------------------------------------

procedure PrintSSERegisters_Double;
var
{$IFDEF x64}
  Buff: array[0..15] of TVector2d;
{$ELSE}
  Buff: array[0..7] of TVector2d;
{$ENDIF}
begin
asm
  MOVUPD  dqword ptr [Buff],       XMM0
  MOVUPD  dqword ptr [Buff + 16],  XMM1
  MOVUPD  dqword ptr [Buff + 32],  XMM2
  MOVUPD  dqword ptr [Buff + 48],  XMM3
  MOVUPD  dqword ptr [Buff + 64],  XMM4
  MOVUPD  dqword ptr [Buff + 80],  XMM5
  MOVUPD  dqword ptr [Buff + 96],  XMM6
  MOVUPD  dqword ptr [Buff + 112], XMM7
{$IFDEF x64}
  MOVUPD  dqword ptr [Buff + 128], XMM8
  MOVUPD  dqword ptr [Buff + 144], XMM9
  MOVUPD  dqword ptr [Buff + 160], XMM10
  MOVUPD  dqword ptr [Buff + 176], XMM11
  MOVUPD  dqword ptr [Buff + 192], XMM12
  MOVUPD  dqword ptr [Buff + 208], XMM13
  MOVUPD  dqword ptr [Buff + 224], XMM14
  MOVUPD  dqword ptr [Buff + 240], XMM15
{$ENDIF}
end;
WriteLn;
WriteLn('XMM0  ' + VecToStr(Buff[0]));
WriteLn('XMM1  ' + VecToStr(Buff[1]));
WriteLn('XMM2  ' + VecToStr(Buff[2]));
WriteLn('XMM3  ' + VecToStr(Buff[3]));
WriteLn('XMM4  ' + VecToStr(Buff[4]));
WriteLn('XMM5  ' + VecToStr(Buff[5]));
WriteLn('XMM6  ' + VecToStr(Buff[6]));
WriteLn('XMM7  ' + VecToStr(Buff[7]));
{$IFDEF x64}
WriteLn('XMM8  ' + VecToStr(Buff[8]));
WriteLn('XMM9  ' + VecToStr(Buff[9]));
WriteLn('XMM10 ' + VecToStr(Buff[10]));
WriteLn('XMM11 ' + VecToStr(Buff[11]));
WriteLn('XMM12 ' + VecToStr(Buff[12]));
WriteLn('XMM13 ' + VecToStr(Buff[13]));
WriteLn('XMM14 ' + VecToStr(Buff[14]));
WriteLn('XMM15 ' + VecToStr(Buff[15]));
{$ENDIF}
asm
  MOVUPD  XMM0, dqword ptr [Buff]
  MOVUPD  XMM1, dqword ptr [Buff + 16]
  MOVUPD  XMM2, dqword ptr [Buff + 32]
  MOVUPD  XMM3, dqword ptr [Buff + 48]
  MOVUPD  XMM4, dqword ptr [Buff + 64]
  MOVUPD  XMM5, dqword ptr [Buff + 80]
  MOVUPD  XMM6, dqword ptr [Buff + 96]
  MOVUPD  XMM7, dqword ptr [Buff + 112]
{$IFDEF x64}
  MOVUPD  XMM8,  dqword ptr [Buff + 128]
  MOVUPD  XMM9,  dqword ptr [Buff + 144]
  MOVUPD  XMM10, dqword ptr [Buff + 160]
  MOVUPD  XMM11, dqword ptr [Buff + 176]
  MOVUPD  XMM12, dqword ptr [Buff + 192]
  MOVUPD  XMM13, dqword ptr [Buff + 208]
  MOVUPD  XMM14, dqword ptr [Buff + 224]
  MOVUPD  XMM15, dqword ptr [Buff + 240]
{$ENDIF}
end;
end;

{$ENDIF}

end.
