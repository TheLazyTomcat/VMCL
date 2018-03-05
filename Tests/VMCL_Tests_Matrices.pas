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
{$INCLUDE '.\test_routines_mat\Matrix_VectorExtract.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_VectorReplace.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Filling.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Spreading.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_SubmatrixRead.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_SubmatrixWrite.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Exchanging.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Conversions.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_OrderConversions.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Transposition.inc'}

//==============================================================================

Function Matrices_Main(AutoTest: Boolean = False): Integer;
begin
repeat
  Result := Select('Matrices test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Matrix_Build,Matrix_EntriesAccess,Matrix_VectorExtract,Matrix_VectorReplace,Matrix_Filling,
     Matrix_Spreading,Matrix_SubmatrixRead,Matrix_SubmatrixWrite,Matrix_Exchanging,Matrix_Conversions,
     Matrix_OrderConversions,Matrix_Transposition],

    ['Matrix building','Matrix entries access','Matrix vector extract','Matrix vector replace','Matrix filling',
     'Matrix spreading','Submatrix read access','Submatrix write access','Matrix exchanges','Matrix conversions',
     'Matrix order conversions','Matrix trasposition'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
