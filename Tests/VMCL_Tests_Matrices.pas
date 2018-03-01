unit VMCL_Tests_Matrices;

{$INCLUDE '..\VMCL_defs.inc'}

interface

Function Matrices_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  VMCL_Tests_Common;

Function Matrices_Main(AutoTest: Boolean = False): Integer;
begin
repeat
  Result := Select('Matrices test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [],

    [],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
