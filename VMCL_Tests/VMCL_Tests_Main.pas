{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  VMCL - Test Suite

  Main test suite function

    To run any of the tests, add entire VMCL library to the program and call
    procedure called "Main" provided by this unit.

    The test suit offers function of autotesting - when selecting test, just
    enter "a" and entire currently selected test group (all individual tests)
    will be executed.

    WARNING - the test suite is written only for console programs, do not use
              it in GUI programs.

  ©František Milt 2018-**-**

  Version 1.0 dev

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    BitVector   - github.com/ncs-sniper/Lib.BitVector
    BitOps      - github.com/ncs-sniper/Lib.BitOps
    StrRect     - github.com/ncs-sniper/Lib.StrRect
    SimpleCPUID - github.com/ncs-sniper/Lib.SimpleCPUID

===============================================================================}
unit VMCL_Tests_Main;

{$INCLUDE '..\VMCL_defs.inc'}

interface

procedure Main;

implementation

uses
  SysUtils,
  VMCL_Common,
  VMCL_Tests_Common, VMCL_Tests_Vectors, VMCL_Tests_Matrices
{$IFNDEF PurePascal}
  , VMCL_Tests_Vectors_SSE, VMCL_Tests_Matrices_SSE
{$ENDIF};

//= Main procedure implemntation ===============================================

procedure Main;
var
  SelectResult: Integer;
begin
try
{$IFDEF DeterministicRnd}
  RandSeed := 0;
{$ELSE}
  Randomize;
{$ENDIF}   
  WriteLn(Splitter('='));
  WriteLn(CenteredText('','='));
  WriteLn(CenteredText('VMCL - Vectors & Matrices calculation library','='));
  WriteLn(CenteredText('','='));
  WriteLn(CenteredText('Test suite','='));
  WriteLn(CenteredText('','='));
  WriteLn(Splitter('='));
  WriteLn;
  WriteLn('RandSeed: ',Format('0x%.8x',[RandSeed]));
  WriteLn;
  WriteLn('Defines, switches, features: ');
  WriteLn;
    Write(ColumnText(Format('  %s SSE supported by CPU        ',[BoolToMark(infSSE in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s SSE2 supported by CPU',       [BoolToMark(infSSE2 in VMCL_InfoSet)])));
    Write(ColumnText(Format('  %s SSE3 supported by CPU       ',[BoolToMark(infSSE3 in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s library supports SSE',        [BoolToMark(infSupportsSSE in VMCL_InfoSet)])));
  WriteLn;
  WriteLn(ColumnText(Format('  %s PurePascal',                  [BoolToMark(infPurePascal in VMCL_InfoSet)])));
    Write(ColumnText(Format('  %s x86                         ',[BoolToMark(infX86 in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s x64',                         [BoolToMark(infX64 in VMCL_InfoSet)])));
    Write(ColumnText(Format('  %s Windows                     ',[BoolToMark(infWindows in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s Unix',                        [BoolToMark(infUnix in VMCL_InfoSet)])));
    Write(ColumnText(Format('  %s FPC                         ',[BoolToMark(infFPC in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s Delphi',                      [BoolToMark(infDelphi in VMCL_InfoSet)])));
    Write(ColumnText(Format('  %s ASMSuppressSizeWarnings     ',[BoolToMark(infASMSuppressSizeWarnings in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s ASMDirectOPCodes',            [BoolToMark(infASMDirectOPCodes in VMCL_InfoSet)])));
  WriteLn;
    Write(ColumnText(Format('  %s AllocLargeMemSegment        ',[BoolToMark(infAllocLargeMemSegment in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s AllocOptimizeForSpeed',       [BoolToMark(infAllocOptimizeForSpeed in VMCL_InfoSet)])));
    Write(ColumnText(Format('  %s AllocAutoInit               ',[BoolToMark(infAllocAutoInit in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s AllocGrowOnly',               [BoolToMark(infAllocGrowOnly in VMCL_InfoSet)])));
  WriteLn;
  WriteLn(ColumnText(Format('  %s VectorsDoubleIsDefault',      [BoolToMark(infVectorsDoubleIsDefault in VMCL_InfoSet)])));
  WriteLn;
    Write(ColumnText(Format('  %s MatricesColumnMajorIsDefault',[BoolToMark(infMatricesColumnMajorIsDefault in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s MatricesDoubleIsDefault',     [BoolToMark(infMatricesDoubleIsDefault in VMCL_InfoSet)])));
  WriteLn(ColumnText(Format('  %s MatricesUnwindLoops',         [BoolToMark(infMatricesUnwindLoops in VMCL_InfoSet)])));
  repeat
    SelectResult := Select('Test groups','Select test group (X,0 - exit; A - autotest):',
      [Vectors_Main,Matrices_Main{$IFNDEF PurePascal},Vectors_SSE_Main,Matrices_SSE_Main{$ENDIF}],
      ['Vectors','Matrices'{$IFNDEF PurePascal},'Vectors SSE','Matrices SSE'{$ENDIF}]);
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
