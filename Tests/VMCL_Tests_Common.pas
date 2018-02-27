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
  VMCL_Vectors;

type
  TVMCLTestFunction = Function(AutoTest: Boolean = False): Integer;

Function BoolToMark(Value: Boolean; MarkTrue: String = '+'; MarkFalse: String = '-'): String;

Function Splitter(SplitterChar: Char = '-'; Count: Integer = 60): String;
Function CenteredText(const Text: String; BorderChar: Char = '-'; Width: Integer = 60): String;
Function LineText(const Text: String; LineChar: Char = '-'; Width: Integer = 60): String;

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

Function Splitter(SplitterChar: Char = '-'; Count: Integer = 60): String;
begin
Result := StringOfChar(SplitterChar,Count);
end;

//------------------------------------------------------------------------------

Function CenteredText(const Text: String; BorderChar: Char = '-'; Width: Integer = 60): String;
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

Function LineText(const Text: String; LineChar: Char = '-'; Width: Integer = 60): String;
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
            Write(Format('%-30s',[Format('%4d - %s',[i + 1,Tests[i]])]))
          else
            Write(Format('%-30s',[Format('%4d - unknown #%d',[i + 1,i])]));
          If (Succ(i) >= Low(Tests)) and (Succ(i) <= High(Tests)) then
            WriteLn(Format('%-30s',[Format('%4d - %s',[i + 2,Tests[Succ(i)]])]))
          else
            WriteLn(Format('%-30s',[Format('%4d - unknown #%d',[i + 2,Succ(i)])]));
          Inc(i,2);
        end;
      If (Length(Functions) and 1) <> 0 then
        If (High(Functions) >= Low(Tests)) and (High(Functions) <= High(Tests)) then
          WriteLn(Format('%-30s',[Format('%4d - %s',[High(Functions) + 1,Tests[High(Functions)]])]))
        else
          WriteLn(Format('%-30s',[Format('%4d - unknown #%d',[High(Functions) + 1,High(Functions)])]));
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

end.
