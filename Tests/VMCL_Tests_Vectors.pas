unit VMCL_Tests_Vectors;

interface

Function Vectors_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  SysUtils,
  VMCL_Vectors,
  VMCL_Tests_Common;

{$INCLUDE '.\test_routines_vec\Vector_build.inc'}
{$INCLUDE '.\test_routines_vec\Vector_swizzle.inc'}
{$INCLUDE '.\test_routines_vec\Vector_convert.inc'}
{$INCLUDE '.\test_routines_vec\Vector_LoadZeroVector.inc'}
{$INCLUDE '.\test_routines_vec\Vector_IsZeroVector.inc'}
{$INCLUDE '.\test_routines_vec\Vector_IsZeroMagnitudeVector.inc'}
{$INCLUDE '.\test_routines_vec\Vector_CopyVector.inc'}
{$INCLUDE '.\test_routines_vec\Vector_EqualVectors.inc'}
{$INCLUDE '.\test_routines_vec\Vector_SameVectors.inc'}

//==============================================================================

Function Vectors_Main(AutoTest: Boolean = False): Integer;
begin
repeat
  Result := Select('Vectors test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Vector_Build,Vector_Swizzle,Vector_Convert,Vector_LoadZeroVector,Vector_IsZeroVector,
     Vector_IsZeroMagnitudeVector,Vector_CopyVector,Vector_EqualVectors,Vector_SameVectors],

    ['Vector building','Vector swizzling','Vector conversions','LoadZeroVector','IsZeroVector',
     'IsZeroMagnitudeVector','CopyVector','EqualVectors','SameVectors','Opposite','Magnitude',
     'Normalize','Normalized','ScalarMultiply','VectorsAdd','VectorsSubtract','VectorsDotProduct',
     'VectorsCrossProduct','VectorsBoxProduct','VectorsNormal','VectorsAntinormal','VectorsAngleRad',
     'VectorsAngleDeg'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
