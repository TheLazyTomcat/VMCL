{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  VMCL - Test Suite

  Matrices tests

  ©František Milt 2018-**-**

  Version 1.0 dev

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    BitVector   - github.com/ncs-sniper/Lib.BitVector
    BitOps      - github.com/ncs-sniper/Lib.BitOps
    StrRect     - github.com/ncs-sniper/Lib.StrRect
    SimpleCPUID - github.com/ncs-sniper/Lib.SimpleCPUID

===============================================================================}
unit VMCL_Tests_Matrices;

{$INCLUDE '..\VMCL_defs.inc'}

interface

Function Matrices_Main(AutoTest: Boolean = False): Integer;

implementation

uses
  SysUtils,
  VMCL_Vectors, VMCL_Matrices,
  VMCL_Tests_Common;

{$IFDEF FPC_DisableWarns}
  {$WARN 5024 OFF} // Parameter "$1" not used
{$ENDIF}

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
{$INCLUDE '.\test_routines_mat\Matrix_LoadZeroMatrix.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_IsZeroMatrix.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_LoadIdentityMatrix.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_IsIdentityMatrix.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_CopyMatrix.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_EqualMatrices.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_SameMatrices.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Invertible.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Transposition.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Negative.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Determinant.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Orthonormalize.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Inverse.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_Inversed.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_ScalarMultiply.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_VectorMultiply.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_MatricesAdd.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_MatricesSubtract.inc'}
{$INCLUDE '.\test_routines_mat\Matrix_MatricesMultiply.inc'}

//==============================================================================

Function Matrices_Main(AutoTest: Boolean = False): Integer;
begin
repeat
  Result := Select('Matrices test group','Select test (X - Exit; 0 - Back; A - Autotest):',

    [Matrix_Build,Matrix_EntriesAccess,Matrix_VectorExtract,Matrix_VectorReplace,Matrix_Filling,
     Matrix_Spreading,Matrix_SubmatrixRead,Matrix_SubmatrixWrite,Matrix_Exchanging,Matrix_Conversions,
     Matrix_OrderConversions,Matrix_LoadZeroMatrix,Matrix_IsZeroMatrix,Matrix_LoadIdentityMatrix,Matrix_IsIdentityMatrix,
     Matrix_CopyMatrix,Matrix_EqualMatrices,Matrix_SameMatrices,Matrix_Invertible,Matrix_Transposition,Matrix_Negative,
     Matrix_Determinant,Matrix_Orthonormalize,Matrix_Inverse,Matrix_Inversed,Matrix_ScalarMultiply,Matrix_VectorMultiply,
     Matrix_MatricesAdd,Matrix_MatricesSubtract,Matrix_MatricesMultiply],

    ['Matrix building','Matrix entries access','Matrix vector extract','Matrix vector replace','Matrix filling',
     'Matrix spreading','Submatrix read access','Submatrix write access','Matrix exchanges','Matrix conversions',
     'Matrix order conversions','LoadZeroMatrix','IsZeroMatrix','LoadIdentityMatrix','IsIdentityMatrix',
     'CopyMatrix','EqualMatrices','SameMatrices','Invertible','Matrix trasposition','Negative',
     'Determinant','Orthonormalize','Inverse','Inversed','ScalarMultiply','VectorMultiply',
     'MatricesAdd','MatricesSubtract','MatricesMultiply'],

  AutoTest);
until (Result = VMCL_RESULT_BACK) or (Result = VMCL_RESULT_EXIT);
end;

end.
