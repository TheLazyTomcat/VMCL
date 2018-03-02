unit VMCL_Tests_Matrices;

{$INCLUDE '..\VMCL_defs.inc'}

interface

Function Matrices_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  SysUtils,
  VMCL_Vectors, VMCL_Matrices,
  VMCL_Tests_Common;

// testing routines
{$INCLUDE '.\test_routines_mat\Matrix_Build.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_EntriesAccess.inc'}

//==============================================================================

Function Matrices_Main(AutoTest: Boolean = False): Integer;
begin
repeat
  Result := Select('Matrices test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Matrix_Build,Matrix_EntriesAccess],

    ['Matrix building','Matrix entries access'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
