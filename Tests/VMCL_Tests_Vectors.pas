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
{$INCLUDE '.\test_routines_vec\Vector_CopyVector.inc'}
{$INCLUDE '.\test_routines_vec\Vector_EqualVectors.inc'}
{$INCLUDE '.\test_routines_vec\Vector_SameVectors.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Opposite.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Magnitude.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Normalize.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Normalized.inc'}
{$INCLUDE '.\test_routines_vec\Vector_ScalarMultiply.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsAdd.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsSubtract.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsDotProduct.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsCrossProduct.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsBoxProduct.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsNormal.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsAntinormal.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsAngleRad.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsAngleDeg.inc'}

//==============================================================================

Function Vectors_Main(AutoTest: Boolean = False): Integer;
begin
repeat
  Result := Select('Vectors test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Vector_Build,Vector_Swizzle,Vector_Convert,Vector_LoadZeroVector,Vector_IsZeroVector,
     Vector_CopyVector,Vector_EqualVectors,Vector_SameVectors,Vector_Opposite,Vector_Magnitude,Vector_Normalize,Vector_Normalized,
     Vector_ScalarMultiply,Vector_VectorsAdd,Vector_VectorsSubtract,Vector_VectorsDotProduct,Vector_VectorsCrossProduct,
     Vector_VectorsBoxProduct,Vector_VectorsNormal,Vector_VectorsAntinormal,Vector_VectorsAngleRad,Vector_VectorsAngleDeg],

    ['Vector building','Vector swizzling','Vector conversions','LoadZeroVector','IsZeroVector',
     'CopyVector','EqualVectors','SameVectors','Opposite','Magnitude','Normalize','Normalized',
     'ScalarMultiply','VectorsAdd','VectorsSubtract','VectorsDotProduct','VectorsCrossProduct',
     'VectorsBoxProduct','VectorsNormal','VectorsAntinormal','VectorsAngleRad','VectorsAngleDeg'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
