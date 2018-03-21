{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  VMCL - Test Suite

  Vector tests

  ©František Milt 2018-**-**

  Version 1.0 dev

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    BitVector   - github.com/ncs-sniper/Lib.BitVector
    BitOps      - github.com/ncs-sniper/Lib.BitOps
    StrRect     - github.com/ncs-sniper/Lib.StrRect
    SimpleCPUID - github.com/ncs-sniper/Lib.SimpleCPUID

===============================================================================}
unit VMCL_Tests_Vectors;

{$INCLUDE '..\VMCL_defs.inc'}

interface

Function Vectors_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  SysUtils,{$IFNDEF FPC} Math,{$ENDIF}
  VMCL_Common, VMCL_Vectors,
  VMCL_Tests_Common;

// testing routines
{$INCLUDE '.\test_routines_vec\Vector_Build.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Swizzle.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Convert.inc'}
{$INCLUDE '.\test_routines_vec\Vector_LoadZeroVector.inc'}
{$INCLUDE '.\test_routines_vec\Vector_IsZeroVector.inc'}
{$INCLUDE '.\test_routines_vec\Vector_IsUnitVector.inc'}
{$INCLUDE '.\test_routines_vec\Vector_CopyVector.inc'}
{$INCLUDE '.\test_routines_vec\Vector_EqualVectors.inc'}
{$INCLUDE '.\test_routines_vec\Vector_SameVectors.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Opposite.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Magnitude.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Normalized.inc'}
{$INCLUDE '.\test_routines_vec\Vector_Normalize.inc'}
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
{$INCLUDE '.\test_routines_vec\Vector_VectorsProjection.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsOrthogonal.inc'}
{$INCLUDE '.\test_routines_vec\Vector_VectorsOrthonormal.inc'}

//==============================================================================

Function Vectors_Main(AutoTest: Boolean = False): Integer;
begin
repeat
  Result := Select('Vectors test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Vector_Build,Vector_Swizzle,Vector_Convert,Vector_LoadZeroVector,Vector_IsZeroVector,Vector_IsUnitVector,
     Vector_CopyVector,Vector_EqualVectors,Vector_SameVectors,Vector_Opposite,Vector_Magnitude,Vector_Normalized,Vector_Normalize,
     Vector_ScalarMultiply,Vector_VectorsAdd,Vector_VectorsSubtract,Vector_VectorsDotProduct,Vector_VectorsCrossProduct,
     Vector_VectorsBoxProduct,Vector_VectorsNormal,Vector_VectorsAntinormal,Vector_VectorsAngleRad,Vector_VectorsAngleDeg,
     Vector_VectorsProjection,Vector_VectorsOrthogonal,Vector_VectorsOrthonormal],

    ['Vector building','Vector swizzling','Vector conversions','LoadZeroVector','IsZeroVector','IsUnitVector',
     'CopyVector','EqualVectors','SameVectors','Opposite','Magnitude','Normalized','Normalize',
     'ScalarMultiply','VectorsAdd','VectorsSubtract','VectorsDotProduct','VectorsCrossProduct',
     'VectorsBoxProduct','VectorsNormal','VectorsAntinormal','VectorsAngleRad','VectorsAngleDeg',
     'VectorsProjection','VectorsOrthogonal','VectorsOrthonormal'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
