unit VMCL_Tests_Main;

{$INCLUDE '..\VMCL_defs.inc'}

interface

procedure Main;

implementation

uses
  SysUtils,
  VMCL_Common,
  VMCL_Tests_Common;

//= Main procedure implemntation ===============================================

procedure Main;
var
  SelectResult: Integer;
begin
try
  Randomize;
  WriteLn(Splitter('='));
  WriteLn(CenteredText('','='));
  WriteLn(CenteredText('VMCL - Vectors & Matrices calculation library','='));
  WriteLn(CenteredText('','='));
  WriteLn(CenteredText('Test suite','='));
  WriteLn(CenteredText('','='));
  WriteLn(Splitter('='));
  WriteLn;
  WriteLn('Defines, switches, features: ');
  WriteLn;
    Write(Format('  %s SSE supported by CPU     ',[BoolToMark(ftsSSE in VMCL_InfoSet)]));
  WriteLn(Format('  %s SSE2 supported by CPU',    [BoolToMark(ftsSSE2 in VMCL_InfoSet)]));
    Write(Format('  %s SSE3 supported by CPU    ',    [BoolToMark(ftsSSE3 in VMCL_InfoSet)]));
  WriteLn(Format('  %s library supports SSE',     [BoolToMark(ftsSupportsSSE in VMCL_InfoSet)]));
  WriteLn;
  WriteLn(Format('  %s PurePascal',               [BoolToMark(ftdPurePascal in VMCL_InfoSet)]));
    Write(Format('  %s x86                      ',[BoolToMark(ftdX86 in VMCL_InfoSet)]));
  WriteLn(Format('  %s x64',                      [BoolToMark(ftdX64 in VMCL_InfoSet)]));
    Write(Format('  %s Windows                  ',[BoolToMark(ftdWindows in VMCL_InfoSet)]));
  WriteLn(Format('  %s Unix',                     [BoolToMark(ftdUnix in VMCL_InfoSet)]));
    Write(Format('  %s FPC                      ',[BoolToMark(ftdFPC in VMCL_InfoSet)]));
  WriteLn(Format('  %s Delphi',                   [BoolToMark(ftdDelphi in VMCL_InfoSet)]));
    Write(Format('  %s ASMSuppressSizeWarnings  ',[BoolToMark(ftdASMSuppressSizeWarnings in VMCL_InfoSet)]));
  WriteLn(Format('  %s ASMDirectOPCodes',         [BoolToMark(ftdASMDirectOPCodes in VMCL_InfoSet)]));
  WriteLn;
    Write(Format('  %s AllocLargeMemSegment     ',[BoolToMark(ftdAllocLargeMemSegment in VMCL_InfoSet)]));
  WriteLn(Format('  %s AllocOptimizeForSpeed',    [BoolToMark(ftdAllocOptimizeForSpeed in VMCL_InfoSet)]));
    Write(Format('  %s AllocAutoInit            ',[BoolToMark(ftdAllocAutoInit in VMCL_InfoSet)]));
  WriteLn(Format('  %s AllocGrowOnly',            [BoolToMark(ftdAllocGrowOnly in VMCL_InfoSet)]));
  repeat
    SelectResult := Select('Test groups','Select test group (X,0 - exit; A - autotest):',[nil,nil,nil],['vec','mat','3','4','5','6']);
  until (SelectResult = VMCL_RESULT_BACK) or (SelectResult = VMCL_RESULT_EXIT);
except
  on E: Exception do
    begin
      WriteLn;
      WriteLn('  Error: ',E.Message);
      WriteLn;
      Write('Press enter to continue...'); ReadLn;
    end;
end;
end;

end.
