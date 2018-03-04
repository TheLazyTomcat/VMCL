unit VMCL_Matrices;

{$INCLUDE 'VMCL_defs.inc'}

interface

uses
  VMCL_Common, VMCL_Vectors;

{===============================================================================
    Matrix types and constants
===============================================================================}

//- matrices 2 x 2 -------------------------------------------------------------
type
  TVMCLMatrix2RMs = packed array[0..1,0..1] of Single;    PVMCLMatrix2RMs = ^TVMCLMatrix2RMs;
  TVMCLMatrix2RMd = packed array[0..1,0..1] of Double;    PVMCLMatrix2RMd = ^TVMCLMatrix2RMd;
  TVMCLMatrix2CMs = packed array[0..1,0..1] of Single;    PVMCLMatrix2CMs = ^TVMCLMatrix2CMs;
  TVMCLMatrix2CMd = packed array[0..1,0..1] of Double;    PVMCLMatrix2CMd = ^TVMCLMatrix2CMd;
{$IFDEF MatricesDoubleIsDefault}
  TVMCLMatrix2RM = TVMCLMatrix2RMd;   PVMCLMatrix2RM = ^TVMCLMatrix2RM;
  TVMCLMatrix2CM = TVMCLMatrix2CMd;   PVMCLMatrix2CM = ^TVMCLMatrix2CM;
{$ELSE}
  TVMCLMatrix2RM = TVMCLMatrix2RMs;   PVMCLMatrix2RM = ^TVMCLMatrix2RM;
  TVMCLMatrix2CM = TVMCLMatrix2CMs;   PVMCLMatrix2CM = ^TVMCLMatrix2CM;
{$ENDIF}
{$IFDEF MatricesColumnMajorIsDefault}
  TVMCLMatrix2s = TVMCLMatrix2CMs;    PVMCLMatrix2s = ^TVMCLMatrix2s;
  TVMCLMatrix2d = TVMCLMatrix2CMd;    PVMCLMatrix2d = ^TVMCLMatrix2d;
  TVMCLMatrix2  = TVMCLMatrix2CM;     PVMCLMatrix2  = ^TVMCLMatrix2;
{$ELSE}
  TVMCLMatrix2s = TVMCLMatrix2RMs;    PVMCLMatrix2s = ^TVMCLMatrix2s;
  TVMCLMatrix2d = TVMCLMatrix2RMd;    PVMCLMatrix2d = ^TVMCLMatrix2d;
  TVMCLMatrix2  = TVMCLMatrix2RM;     PVMCLMatrix2  = ^TVMCLMatrix2;
{$ENDIF}

//- matrices 3 x 3 -------------------------------------------------------------

  TVMCLMatrix3RMs = packed array[0..2,0..2] of Single;    PVMCLMatrix3RMs = ^TVMCLMatrix3RMs;
  TVMCLMatrix3RMd = packed array[0..2,0..2] of Double;    PVMCLMatrix3RMd = ^TVMCLMatrix3RMd;
  TVMCLMatrix3CMs = packed array[0..2,0..2] of Single;    PVMCLMatrix3CMs = ^TVMCLMatrix3CMs;
  TVMCLMatrix3CMd = packed array[0..2,0..2] of Double;    PVMCLMatrix3CMd = ^TVMCLMatrix3CMd;
{$IFDEF MatricesDoubleIsDefault}
  TVMCLMatrix3RM = TVMCLMatrix3RMd;   PVMCLMatrix3RM = ^TVMCLMatrix3RM;
  TVMCLMatrix3CM = TVMCLMatrix3CMd;   PVMCLMatrix3CM = ^TVMCLMatrix3CM;
{$ELSE}
  TVMCLMatrix3RM = TVMCLMatrix3RMs;   PVMCLMatrix3RM = ^TVMCLMatrix3RM;
  TVMCLMatrix3CM = TVMCLMatrix3CMs;   PVMCLMatrix3CM = ^TVMCLMatrix3CM;
{$ENDIF}
{$IFDEF MatricesColumnMajorIsDefault}
  TVMCLMatrix3s = TVMCLMatrix3CMs;    PVMCLMatrix3s = ^TVMCLMatrix3s;
  TVMCLMatrix3d = TVMCLMatrix3CMd;    PVMCLMatrix3d = ^TVMCLMatrix3d;
  TVMCLMatrix3  = TVMCLMatrix3CM;     PVMCLMatrix3  = ^TVMCLMatrix3;
{$ELSE}
  TVMCLMatrix3s = TVMCLMatrix3RMs;    PVMCLMatrix3s = ^TVMCLMatrix3s;
  TVMCLMatrix3d = TVMCLMatrix3RMd;    PVMCLMatrix3d = ^TVMCLMatrix3d;
  TVMCLMatrix3  = TVMCLMatrix3RM;     PVMCLMatrix3  = ^TVMCLMatrix3;
{$ENDIF}

//- matrices 4 x 4 -------------------------------------------------------------

  TVMCLMatrix4RMs = packed array[0..3,0..3] of Single;    PVMCLMatrix4RMs = ^TVMCLMatrix4RMs;
  TVMCLMatrix4RMd = packed array[0..3,0..3] of Double;    PVMCLMatrix4RMd = ^TVMCLMatrix4RMd;
  TVMCLMatrix4CMs = packed array[0..3,0..3] of Single;    PVMCLMatrix4CMs = ^TVMCLMatrix4CMs;
  TVMCLMatrix4CMd = packed array[0..3,0..3] of Double;    PVMCLMatrix4CMd = ^TVMCLMatrix4CMd;
{$IFDEF MatricesDoubleIsDefault}
  TVMCLMatrix4RM = TVMCLMatrix4RMd;   PVMCLMatrix4RM = ^TVMCLMatrix4RM;
  TVMCLMatrix4CM = TVMCLMatrix4CMd;   PVMCLMatrix4CM = ^TVMCLMatrix4CM;
{$ELSE}
  TVMCLMatrix4RM = TVMCLMatrix4RMs;   PVMCLMatrix4RM = ^TVMCLMatrix4RM;
  TVMCLMatrix4CM = TVMCLMatrix4CMs;   PVMCLMatrix4CM = ^TVMCLMatrix4CM;
{$ENDIF}
{$IFDEF MatricesColumnMajorIsDefault}
  TVMCLMatrix4s = TVMCLMatrix4CMs;    PVMCLMatrix4s = ^TVMCLMatrix4s;
  TVMCLMatrix4d = TVMCLMatrix4CMd;    PVMCLMatrix4d = ^TVMCLMatrix4d;
  TVMCLMatrix4  = TVMCLMatrix4CM;     PVMCLMatrix4  = ^TVMCLMatrix4;
{$ELSE}
  TVMCLMatrix4s = TVMCLMatrix4RMs;    PVMCLMatrix4s = ^TVMCLMatrix4s;
  TVMCLMatrix4d = TVMCLMatrix4RMd;    PVMCLMatrix4d = ^TVMCLMatrix4d;
  TVMCLMatrix4  = TVMCLMatrix4RM;     PVMCLMatrix4  = ^TVMCLMatrix4;
{$ENDIF}

//- 1 dimensional (linear) overlays --------------------------------------------

  TVMCLMatrix2so = packed array[0..3] of Single;        PVMCLMatrix2so = ^TVMCLMatrix2so;
  TVMCLMatrix2do = packed array[0..3] of Double;        PVMCLMatrix2do = ^TVMCLMatrix2do;
{$IFDEF MatricesDoubleIsDefault}
  TVMCLMatrix2o  = TVMCLMatrix2do;                      PVMCLMatrix2o  = PVMCLMatrix2do;
{$ELSE}
  TVMCLMatrix2o  = TVMCLMatrix2so;                      PVMCLMatrix2o  = PVMCLMatrix2so;
{$ENDIF}

  TVMCLMatrix3so = packed array[0..8] of Single;        PVMCLMatrix3so = ^TVMCLMatrix3so;
  TVMCLMatrix3do = packed array[0..8] of Double;        PVMCLMatrix3do = ^TVMCLMatrix3do;
{$IFDEF MatricesDoubleIsDefault}
  TVMCLMatrix3o  = TVMCLMatrix3do;                      PVMCLMatrix3o  = PVMCLMatrix3do;
{$ELSE}
  TVMCLMatrix3o  = TVMCLMatrix3so;                      PVMCLMatrix3o  = PVMCLMatrix3so;
{$ENDIF}

  TVMCLMatrix4so = packed array[0..15] of Single;       PVMCLMatrix4so = ^TVMCLMatrix4so;
  TVMCLMatrix4do = packed array[0..15] of Double;       PVMCLMatrix4do = ^TVMCLMatrix4do;
{$IFDEF MatricesDoubleIsDefault}
  TVMCLMatrix4o  = TVMCLMatrix4do;                      PVMCLMatrix4o  = PVMCLMatrix4do;
{$ELSE}
  TVMCLMatrix4o  = TVMCLMatrix4so;                      PVMCLMatrix4o  = PVMCLMatrix4so;
{$ENDIF}

//- shortened-name types (aliasses for TVMCL* types) ---------------------------

  TMatrix2RMs = TVMCLMatrix2RMs;    PMatrix2RMs = PVMCLMatrix2RMs;
  TMatrix2RMd = TVMCLMatrix2RMd;    PMatrix2RMd = PVMCLMatrix2RMd;
  TMatrix2CMs = TVMCLMatrix2CMs;    PMatrix2CMs = PVMCLMatrix2CMs;
  TMatrix2CMd = TVMCLMatrix2CMd;    PMatrix2CMd = PVMCLMatrix2CMd;
  TMatrix2RM  = TVMCLMatrix2RM;     PMatrix2RM  = PVMCLMatrix2RM;
  TMatrix2CM  = TVMCLMatrix2CM;     PMatrix2CM  = PVMCLMatrix2CM;
  TMatrix2s   = TVMCLMatrix2s;      PMatrix2s   = PVMCLMatrix2s;
  TMatrix2d   = TVMCLMatrix2d;      PMatrix2d   = PVMCLMatrix2d;
  TMatrix2    = TVMCLMatrix2;       PMatrix2    = PVMCLMatrix2;

  TMatrix3RMs = TVMCLMatrix3RMs;    PMatrix3RMs = PVMCLMatrix3RMs;
  TMatrix3RMd = TVMCLMatrix3RMd;    PMatrix3RMd = PVMCLMatrix3RMd;
  TMatrix3CMs = TVMCLMatrix3CMs;    PMatrix3CMs = PVMCLMatrix3CMs;
  TMatrix3CMd = TVMCLMatrix3CMd;    PMatrix3CMd = PVMCLMatrix3CMd;
  TMatrix3RM  = TVMCLMatrix3RM;     PMatrix3RM  = PVMCLMatrix3RM;
  TMatrix3CM  = TVMCLMatrix3CM;     PMatrix3CM  = PVMCLMatrix3CM;
  TMatrix3s   = TVMCLMatrix3s;      PMatrix3s   = PVMCLMatrix3s;
  TMatrix3d   = TVMCLMatrix3d;      PMatrix3d   = PVMCLMatrix3d;
  TMatrix3    = TVMCLMatrix3;       PMatrix3    = PVMCLMatrix3;

  TMatrix4RMs = TVMCLMatrix4RMs;    PMatrix4RMs = PVMCLMatrix4RMs;
  TMatrix4RMd = TVMCLMatrix4RMd;    PMatrix4RMd = PVMCLMatrix4RMd;
  TMatrix4CMs = TVMCLMatrix4CMs;    PMatrix4CMs = PVMCLMatrix4CMs;
  TMatrix4CMd = TVMCLMatrix4CMd;    PMatrix4CMd = PVMCLMatrix4CMd;
  TMatrix4RM  = TVMCLMatrix4RM;     PMatrix4RM  = PVMCLMatrix4RM;
  TMatrix4CM  = TVMCLMatrix4CM;     PMatrix4CM  = PVMCLMatrix4CM;
  TMatrix4s   = TVMCLMatrix4s;      PMatrix4s   = PVMCLMatrix4s;
  TMatrix4d   = TVMCLMatrix4d;      PMatrix4d   = PVMCLMatrix4d;
  TMatrix4    = TVMCLMatrix4;       PMatrix4    = PVMCLMatrix4;

  TMatrix2so = TVMCLMatrix2so;      PMatrix2so = PVMCLMatrix2so;
  TMatrix2do = TVMCLMatrix2do;      PMatrix2do = PVMCLMatrix2do;
  TMatrix2o  = TVMCLMatrix2o;       PMatrix2o  = PVMCLMatrix2o;

  TMatrix3so = TVMCLMatrix3so;      PMatrix3so = PVMCLMatrix3so;
  TMatrix3do = TVMCLMatrix3do;      PMatrix3do = PVMCLMatrix3do;
  TMatrix3o  = TVMCLMatrix3o;       PMatrix3o  = PVMCLMatrix3o;

  TMatrix4so = TVMCLMatrix4so;      PMatrix4so = PVMCLMatrix4so;
  TMatrix4do = TVMCLMatrix4do;      PMatrix4do = PVMCLMatrix4do;
  TMatrix4o  = TVMCLMatrix4o;       PMatrix4o  = PVMCLMatrix4o;

//= Matrix constants ===========================================================

//- null/zero matrices ---------------------------------------------------------
const
  VMCL_ZeroMatrix2RMs:  TVMCLMatrix2RMs = ((0.0, 0.0), (0.0, 0.0));
  VMCL_ZeroMatrix2RMd:  TVMCLMatrix2RMd = ((0.0, 0.0), (0.0, 0.0));
  VMCL_ZeroMatrix2CMs:  TVMCLMatrix2CMs = ((0.0, 0.0), (0.0, 0.0));
  VMCL_ZeroMatrix2CMd:  TVMCLMatrix2CMd = ((0.0, 0.0), (0.0, 0.0));
  VMCL_ZeroMatrix2RM:   TVMCLMatrix2RM  = ((0.0, 0.0), (0.0, 0.0));
  VMCL_ZeroMatrix2CM:   TVMCLMatrix2CM  = ((0.0, 0.0), (0.0, 0.0));
  VMCL_ZeroMatrix2s:    TVMCLMatrix2s   = ((0.0, 0.0), (0.0, 0.0));
  VMCL_ZeroMatrix2d:    TVMCLMatrix2d   = ((0.0, 0.0), (0.0, 0.0));
  VMCL_ZeroMatrix2:     TVMCLMatrix2    = ((0.0, 0.0), (0.0, 0.0));

  VMCL_ZeroMatrix3RMs:  TVMCLMatrix3RMs = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
  VMCL_ZeroMatrix3RMd:  TVMCLMatrix3RMd = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
  VMCL_ZeroMatrix3CMs:  TVMCLMatrix3CMs = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
  VMCL_ZeroMatrix3CMd:  TVMCLMatrix3CMd = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
  VMCL_ZeroMatrix3RM:   TVMCLMatrix3RM  = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
  VMCL_ZeroMatrix3CM:   TVMCLMatrix3CM  = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
  VMCL_ZeroMatrix3s:    TVMCLMatrix3s   = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
  VMCL_ZeroMatrix3d:    TVMCLMatrix3d   = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
  VMCL_ZeroMatrix3:     TVMCLMatrix3    = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));

  VMCL_ZeroMatrix4RMs:  TVMCLMatrix4RMs = ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));
  VMCL_ZeroMatrix4RMd:  TVMCLMatrix4RMd = ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));
  VMCL_ZeroMatrix4CMs:  TVMCLMatrix4CMs = ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));
  VMCL_ZeroMatrix4CMd:  TVMCLMatrix4CMd = ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));
  VMCL_ZeroMatrix4RM:   TVMCLMatrix4RM  = ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));
  VMCL_ZeroMatrix4CM:   TVMCLMatrix4CM  = ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));
  VMCL_ZeroMatrix4s:    TVMCLMatrix4s   = ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));
  VMCL_ZeroMatrix4d:    TVMCLMatrix4d   = ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));
  VMCL_ZeroMatrix4:     TVMCLMatrix4    = ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));

//- identity matrices ----------------------------------------------------------
{
  Identity matrices have all entries set to zero, only main diagonal is filled
  with ones
}
  VMCL_IdentityMatrix2RMs:  TVMCLMatrix2RMs = ((1.0, 0.0), (0.0, 1.0));
  VMCL_IdentityMatrix2RMd:  TVMCLMatrix2RMd = ((1.0, 0.0), (0.0, 1.0));
  VMCL_IdentityMatrix2CMs:  TVMCLMatrix2CMs = ((1.0, 0.0), (0.0, 1.0));
  VMCL_IdentityMatrix2CMd:  TVMCLMatrix2CMd = ((1.0, 0.0), (0.0, 1.0));
  VMCL_IdentityMatrix2RM:   TVMCLMatrix2RM  = ((1.0, 0.0), (0.0, 1.0));
  VMCL_IdentityMatrix2CM:   TVMCLMatrix2CM  = ((1.0, 0.0), (0.0, 1.0));
  VMCL_IdentityMatrix2s:    TVMCLMatrix2s   = ((1.0, 0.0), (0.0, 1.0));
  VMCL_IdentityMatrix2d:    TVMCLMatrix2d   = ((1.0, 0.0), (0.0, 1.0));
  VMCL_IdentityMatrix2:     TVMCLMatrix2    = ((1.0, 0.0), (0.0, 1.0));

  VMCL_IdentityMatrix3RMs:  TVMCLMatrix3RMs = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));
  VMCL_IdentityMatrix3RMd:  TVMCLMatrix3RMd = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));
  VMCL_IdentityMatrix3CMs:  TVMCLMatrix3CMs = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));
  VMCL_IdentityMatrix3CMd:  TVMCLMatrix3CMd = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));
  VMCL_IdentityMatrix3RM:   TVMCLMatrix3RM  = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));
  VMCL_IdentityMatrix3CM:   TVMCLMatrix3CM  = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));
  VMCL_IdentityMatrix3s:    TVMCLMatrix3s   = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));
  VMCL_IdentityMatrix3d:    TVMCLMatrix3d   = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));
  VMCL_IdentityMatrix3:     TVMCLMatrix3    = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));

  VMCL_IdentityMatrix4RMs:  TVMCLMatrix4RMs = ((1.0, 0.0, 0.0, 0.0), (0.0, 1.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0), (0.0, 0.0, 0.0, 1.0));
  VMCL_IdentityMatrix4RMd:  TVMCLMatrix4RMd = ((1.0, 0.0, 0.0, 0.0), (0.0, 1.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0), (0.0, 0.0, 0.0, 1.0));
  VMCL_IdentityMatrix4CMs:  TVMCLMatrix4CMs = ((1.0, 0.0, 0.0, 0.0), (0.0, 1.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0), (0.0, 0.0, 0.0, 1.0));
  VMCL_IdentityMatrix4CMd:  TVMCLMatrix4CMd = ((1.0, 0.0, 0.0, 0.0), (0.0, 1.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0), (0.0, 0.0, 0.0, 1.0));
  VMCL_IdentityMatrix4RM:   TVMCLMatrix4RM  = ((1.0, 0.0, 0.0, 0.0), (0.0, 1.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0), (0.0, 0.0, 0.0, 1.0));
  VMCL_IdentityMatrix4CM:   TVMCLMatrix4CM  = ((1.0, 0.0, 0.0, 0.0), (0.0, 1.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0), (0.0, 0.0, 0.0, 1.0));
  VMCL_IdentityMatrix4s:    TVMCLMatrix4s   = ((1.0, 0.0, 0.0, 0.0), (0.0, 1.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0), (0.0, 0.0, 0.0, 1.0));
  VMCL_IdentityMatrix4d:    TVMCLMatrix4d   = ((1.0, 0.0, 0.0, 0.0), (0.0, 1.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0), (0.0, 0.0, 0.0, 1.0));
  VMCL_IdentityMatrix4:     TVMCLMatrix4    = ((1.0, 0.0, 0.0, 0.0), (0.0, 1.0, 0.0, 0.0), (0.0, 0.0, 1.0, 0.0), (0.0, 0.0, 0.0, 1.0));

{===============================================================================
    Matrix formatting types, constants and functions - declaration
===============================================================================}
type
  TVMCLMatAlignScope = (masMatrix,masColumn,masRow,masNone);
  TVMCLMatAlignType  = (matBack,matFront,matFirstNumber,matDecimalSeparator);

  TVMCLMatrixFormat = record
    CommonFormat:   TVMCLCommonFormat;
    LineBreak:      String;
    AlignmentScope: TVMCLMatAlignScope;
    AlignmentType:  TVMCLMatAlignType;
  end;

const
  VMCL_DefaultMatrixFormat: TVMCLMatrixFormat = (
    CommonFormat: (
      ValueFormat: (
        ThousandSeparator:    #0;
        DecimalSeparator:     '.';
        DecimalPlaces:        -1);
      WhiteSpace:           ' ';
      ComponentsDelimiter:  ',';
      LeadingString:        '[';
      TrailingString:       ']');
    LineBreak:            sLineBreak;
    AlignmentScope:       masMatrix;
    AlignmentType:        matBack);

Function MatrixFormat(CommonFormat:   TVMCLCommonFormat;
                      LineBreak:      String;
                      AlignmentScope: TVMCLMatAlignScope;
                      AlignmentType:  TVMCLMatAlignType): TVMCLMatrixFormat;

{===============================================================================
    General matrix functions - declaration
===============================================================================}

Function GetLinearOverlayIndex_RM(Row,Col,Stride: Integer): Integer;{$IFDEF CanInline} inline;{$ENDIF}
Function GetLinearOverlayIndex_CM(Row,Col,Stride: Integer): Integer;{$IFDEF CanInline} inline;{$ENDIF}
Function GetLinearOverlayIndex(Row,Col,Stride: Integer): Integer;{$IFDEF CanInline} inline;{$ENDIF}

{===============================================================================
    Matrix to string conversion functions - declaration
===============================================================================}

Function MatToStr(const Matrix: TVMCLMatrix2RMs; const MatrixFormat: TVMCLMatrixFormat): String; overload;
Function MatToStr(const Matrix: TVMCLMatrix2RMd; const MatrixFormat: TVMCLMatrixFormat): String; overload;
Function MatToStr(const Matrix: TVMCLMatrix2CMs; const MatrixFormat: TVMCLMatrixFormat): String; overload;
Function MatToStr(const Matrix: TVMCLMatrix2CMd; const MatrixFormat: TVMCLMatrixFormat): String; overload;

Function MatToStr(const Matrix: TVMCLMatrix3RMs; const MatrixFormat: TVMCLMatrixFormat): String; overload;
Function MatToStr(const Matrix: TVMCLMatrix3RMd; const MatrixFormat: TVMCLMatrixFormat): String; overload;
Function MatToStr(const Matrix: TVMCLMatrix3CMs; const MatrixFormat: TVMCLMatrixFormat): String; overload;
Function MatToStr(const Matrix: TVMCLMatrix3CMd; const MatrixFormat: TVMCLMatrixFormat): String; overload;

Function MatToStr(const Matrix: TVMCLMatrix4RMs; const MatrixFormat: TVMCLMatrixFormat): String; overload;
Function MatToStr(const Matrix: TVMCLMatrix4RMd; const MatrixFormat: TVMCLMatrixFormat): String; overload;
Function MatToStr(const Matrix: TVMCLMatrix4CMs; const MatrixFormat: TVMCLMatrixFormat): String; overload;
Function MatToStr(const Matrix: TVMCLMatrix4CMd; const MatrixFormat: TVMCLMatrixFormat): String; overload;

Function MatToStr(const Matrix: TVMCLMatrix2RMs): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function MatToStr(const Matrix: TVMCLMatrix2RMd): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function MatToStr(const Matrix: TVMCLMatrix2CMs): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function MatToStr(const Matrix: TVMCLMatrix2CMd): String; overload;{$IFDEF CanInline} inline;{$ENDIF}

Function MatToStr(const Matrix: TVMCLMatrix3RMs): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function MatToStr(const Matrix: TVMCLMatrix3RMd): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function MatToStr(const Matrix: TVMCLMatrix3CMs): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function MatToStr(const Matrix: TVMCLMatrix3CMd): String; overload;{$IFDEF CanInline} inline;{$ENDIF}

Function MatToStr(const Matrix: TVMCLMatrix4RMs): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function MatToStr(const Matrix: TVMCLMatrix4RMd): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function MatToStr(const Matrix: TVMCLMatrix4CMs): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function MatToStr(const Matrix: TVMCLMatrix4CMd): String; overload;{$IFDEF CanInline} inline;{$ENDIF}

{===============================================================================
    Matrix building - declaration
===============================================================================}

// building matrix from row vectors
Function RMMatrixFromRows(const Row1,Row2: TVMCLVector2s): TVMCLMatrix2RMs; overload;
Function RMMatrixFromRows(const Row1,Row2: TVMCLVector2d): TVMCLMatrix2RMd; overload;
Function CMMatrixFromRows(const Row1,Row2: TVMCLVector2s): TVMCLMatrix2CMs; overload;
Function CMMatrixFromRows(const Row1,Row2: TVMCLVector2d): TVMCLMatrix2CMd; overload;

Function RMMatrixFromRows(const Row1,Row2,Row3: TVMCLVector3s): TVMCLMatrix3RMs; overload;
Function RMMatrixFromRows(const Row1,Row2,Row3: TVMCLVector3d): TVMCLMatrix3RMd; overload;
Function CMMatrixFromRows(const Row1,Row2,Row3: TVMCLVector3s): TVMCLMatrix3CMs; overload;
Function CMMatrixFromRows(const Row1,Row2,Row3: TVMCLVector3d): TVMCLMatrix3CMd; overload;

Function RMMatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4s): TVMCLMatrix4RMs; overload;
Function RMMatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4d): TVMCLMatrix4RMd; overload;
Function CMMatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4s): TVMCLMatrix4CMs; overload;
Function CMMatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4d): TVMCLMatrix4CMd; overload;

Function MatrixFromRows(const Row1,Row2: TVMCLVector2s): TVMCLMatrix2s; overload;
Function MatrixFromRows(const Row1,Row2: TVMCLVector2d): TVMCLMatrix2d; overload;
Function MatrixFromRows(const Row1,Row2,Row3: TVMCLVector3s): TVMCLMatrix3s; overload;
Function MatrixFromRows(const Row1,Row2,Row3: TVMCLVector3d): TVMCLMatrix3d; overload;
Function MatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4s): TVMCLMatrix4s; overload;
Function MatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4d): TVMCLMatrix4d; overload;

// buiding matrix from column vectors
Function RMMatrixFromColumns(const Column1,Column2: TVMCLVector2s): TVMCLMatrix2RMs; overload;
Function RMMatrixFromColumns(const Column1,Column2: TVMCLVector2d): TVMCLMatrix2RMd; overload;
Function CMMatrixFromColumns(const Column1,Column2: TVMCLVector2s): TVMCLMatrix2CMs; overload;
Function CMMatrixFromColumns(const Column1,Column2: TVMCLVector2d): TVMCLMatrix2CMd; overload;

Function RMMatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3s): TVMCLMatrix3RMs; overload;
Function RMMatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3d): TVMCLMatrix3RMd; overload;
Function CMMatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3s): TVMCLMatrix3CMs; overload;
Function CMMatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3d): TVMCLMatrix3CMd; overload;

Function RMMatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4s): TVMCLMatrix4RMs; overload;
Function RMMatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4d): TVMCLMatrix4RMd; overload;
Function CMMatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4s): TVMCLMatrix4CMs; overload;
Function CMMatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4d): TVMCLMatrix4CMd; overload;

Function MatrixFromColumns(const Column1,Column2: TVMCLVector2s): TVMCLMatrix2s; overload;
Function MatrixFromColumns(const Column1,Column2: TVMCLVector2d): TVMCLMatrix2d; overload;
Function MatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3s): TVMCLMatrix3s; overload;
Function MatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3d): TVMCLMatrix3d; overload;
Function MatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4s): TVMCLMatrix4s; overload;
Function MatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4d): TVMCLMatrix4d; overload;

{===============================================================================
    Matrix entries access - declaration
===============================================================================}

// getting entry
Function MatrixGetEntry(const Matrix: TVMCLMatrix2RMs; Row, Column: Integer): Single; overload;
Function MatrixGetEntry(const Matrix: TVMCLMatrix2RMd; Row, Column: Integer): Double; overload;
Function MatrixGetEntry(const Matrix: TVMCLMatrix2CMs; Row, Column: Integer): Single; overload;
Function MatrixGetEntry(const Matrix: TVMCLMatrix2CMd; Row, Column: Integer): Double; overload;

Function MatrixGetEntry(const Matrix: TVMCLMatrix3RMs; Row, Column: Integer): Single; overload;
Function MatrixGetEntry(const Matrix: TVMCLMatrix3RMd; Row, Column: Integer): Double; overload;
Function MatrixGetEntry(const Matrix: TVMCLMatrix3CMs; Row, Column: Integer): Single; overload;
Function MatrixGetEntry(const Matrix: TVMCLMatrix3CMd; Row, Column: Integer): Double; overload;

Function MatrixGetEntry(const Matrix: TVMCLMatrix4RMs; Row, Column: Integer): Single; overload;
Function MatrixGetEntry(const Matrix: TVMCLMatrix4RMd; Row, Column: Integer): Double; overload;
Function MatrixGetEntry(const Matrix: TVMCLMatrix4CMs; Row, Column: Integer): Single; overload;
Function MatrixGetEntry(const Matrix: TVMCLMatrix4CMd; Row, Column: Integer): Double; overload;

// settings entry
procedure MatrixSetEntry(var Matrix: TVMCLMatrix2RMs; Row, Column: Integer; Value: Single); overload;
procedure MatrixSetEntry(var Matrix: TVMCLMatrix2RMd; Row, Column: Integer; Value: Double); overload;
procedure MatrixSetEntry(var Matrix: TVMCLMatrix2CMs; Row, Column: Integer; Value: Single); overload;
procedure MatrixSetEntry(var Matrix: TVMCLMatrix2CMd; Row, Column: Integer; Value: Double); overload;

procedure MatrixSetEntry(var Matrix: TVMCLMatrix3RMs; Row, Column: Integer; Value: Single); overload;
procedure MatrixSetEntry(var Matrix: TVMCLMatrix3RMd; Row, Column: Integer; Value: Double); overload;
procedure MatrixSetEntry(var Matrix: TVMCLMatrix3CMs; Row, Column: Integer; Value: Single); overload;
procedure MatrixSetEntry(var Matrix: TVMCLMatrix3CMd; Row, Column: Integer; Value: Double); overload;

procedure MatrixSetEntry(var Matrix: TVMCLMatrix4RMs; Row, Column: Integer; Value: Single); overload;
procedure MatrixSetEntry(var Matrix: TVMCLMatrix4RMd; Row, Column: Integer; Value: Double); overload;
procedure MatrixSetEntry(var Matrix: TVMCLMatrix4CMs; Row, Column: Integer; Value: Single); overload;
procedure MatrixSetEntry(var Matrix: TVMCLMatrix4CMd; Row, Column: Integer; Value: Double); overload;

{===============================================================================
    Matrix vector extraction - declaration
===============================================================================}

Function MatrixGetRow(const Matrix: TVMCLMatrix2RMs; Row: Integer): TVMCLVector2s; overload;
Function MatrixGetRow(const Matrix: TVMCLMatrix2RMd; Row: Integer): TVMCLVector2d; overload;
Function MatrixGetRow(const Matrix: TVMCLMatrix2CMs; Row: Integer): TVMCLVector2s; overload;
Function MatrixGetRow(const Matrix: TVMCLMatrix2CMd; Row: Integer): TVMCLVector2d; overload;

Function MatrixGetRow(const Matrix: TVMCLMatrix3RMs; Row: Integer): TVMCLVector3s; overload;
Function MatrixGetRow(const Matrix: TVMCLMatrix3RMd; Row: Integer): TVMCLVector3d; overload;
Function MatrixGetRow(const Matrix: TVMCLMatrix3CMs; Row: Integer): TVMCLVector3s; overload;
Function MatrixGetRow(const Matrix: TVMCLMatrix3CMd; Row: Integer): TVMCLVector3d; overload;

Function MatrixGetRow(const Matrix: TVMCLMatrix4RMs; Row: Integer): TVMCLVector4s; overload;
Function MatrixGetRow(const Matrix: TVMCLMatrix4RMd; Row: Integer): TVMCLVector4d; overload;
Function MatrixGetRow(const Matrix: TVMCLMatrix4CMs; Row: Integer): TVMCLVector4s; overload;
Function MatrixGetRow(const Matrix: TVMCLMatrix4CMd; Row: Integer): TVMCLVector4d; overload;

Function MatrixGetColumn(const Matrix: TVMCLMatrix2RMs; Column: Integer): TVMCLVector2s; overload;
Function MatrixGetColumn(const Matrix: TVMCLMatrix2RMd; Column: Integer): TVMCLVector2d; overload;
Function MatrixGetColumn(const Matrix: TVMCLMatrix2CMs; Column: Integer): TVMCLVector2s; overload;
Function MatrixGetColumn(const Matrix: TVMCLMatrix2CMd; Column: Integer): TVMCLVector2d; overload;

Function MatrixGetColumn(const Matrix: TVMCLMatrix3RMs; Column: Integer): TVMCLVector3s; overload;
Function MatrixGetColumn(const Matrix: TVMCLMatrix3RMd; Column: Integer): TVMCLVector3d; overload;
Function MatrixGetColumn(const Matrix: TVMCLMatrix3CMs; Column: Integer): TVMCLVector3s; overload;
Function MatrixGetColumn(const Matrix: TVMCLMatrix3CMd; Column: Integer): TVMCLVector3d; overload;

Function MatrixGetColumn(const Matrix: TVMCLMatrix4RMs; Column: Integer): TVMCLVector4s; overload;
Function MatrixGetColumn(const Matrix: TVMCLMatrix4RMd; Column: Integer): TVMCLVector4d; overload;
Function MatrixGetColumn(const Matrix: TVMCLMatrix4CMs; Column: Integer): TVMCLVector4s; overload;
Function MatrixGetColumn(const Matrix: TVMCLMatrix4CMd; Column: Integer): TVMCLVector4d; overload;

{===============================================================================
   Matrix vector insertion - declaration
===============================================================================}

procedure MatrixSetRow(var Matrix: TVMCLMatrix2RMs; Row: Integer; const Data: TVMCLVector2s); overload;
procedure MatrixSetRow(var Matrix: TVMCLMatrix2RMd; Row: Integer; const Data: TVMCLVector2d); overload;
procedure MatrixSetRow(var Matrix: TVMCLMatrix2CMs; Row: Integer; const Data: TVMCLVector2s); overload;
procedure MatrixSetRow(var Matrix: TVMCLMatrix2CMd; Row: Integer; const Data: TVMCLVector2d); overload;

procedure MatrixSetRow(var Matrix: TVMCLMatrix3RMs; Row: Integer; const Data: TVMCLVector3s); overload;
procedure MatrixSetRow(var Matrix: TVMCLMatrix3RMd; Row: Integer; const Data: TVMCLVector3d); overload;
procedure MatrixSetRow(var Matrix: TVMCLMatrix3CMs; Row: Integer; const Data: TVMCLVector3s); overload;
procedure MatrixSetRow(var Matrix: TVMCLMatrix3CMd; Row: Integer; const Data: TVMCLVector3d); overload;

procedure MatrixSetRow(var Matrix: TVMCLMatrix4RMs; Row: Integer; const Data: TVMCLVector4s); overload;
procedure MatrixSetRow(var Matrix: TVMCLMatrix4RMd; Row: Integer; const Data: TVMCLVector4d); overload;
procedure MatrixSetRow(var Matrix: TVMCLMatrix4CMs; Row: Integer; const Data: TVMCLVector4s); overload;
procedure MatrixSetRow(var Matrix: TVMCLMatrix4CMd; Row: Integer; const Data: TVMCLVector4d); overload;

procedure MatrixSetColumn(var Matrix: TVMCLMatrix2RMs; Column: Integer; const Data: TVMCLVector2s); overload;
procedure MatrixSetColumn(var Matrix: TVMCLMatrix2RMd; Column: Integer; const Data: TVMCLVector2d); overload;
procedure MatrixSetColumn(var Matrix: TVMCLMatrix2CMs; Column: Integer; const Data: TVMCLVector2s); overload;
procedure MatrixSetColumn(var Matrix: TVMCLMatrix2CMd; Column: Integer; const Data: TVMCLVector2d); overload;

procedure MatrixSetColumn(var Matrix: TVMCLMatrix3RMs; Column: Integer; const Data: TVMCLVector3s); overload;
procedure MatrixSetColumn(var Matrix: TVMCLMatrix3RMd; Column: Integer; const Data: TVMCLVector3d); overload;
procedure MatrixSetColumn(var Matrix: TVMCLMatrix3CMs; Column: Integer; const Data: TVMCLVector3s); overload;
procedure MatrixSetColumn(var Matrix: TVMCLMatrix3CMd; Column: Integer; const Data: TVMCLVector3d); overload;

procedure MatrixSetColumn(var Matrix: TVMCLMatrix4RMs; Column: Integer; const Data: TVMCLVector4s); overload;
procedure MatrixSetColumn(var Matrix: TVMCLMatrix4RMd; Column: Integer; const Data: TVMCLVector4d); overload;
procedure MatrixSetColumn(var Matrix: TVMCLMatrix4CMs; Column: Integer; const Data: TVMCLVector4s); overload;
procedure MatrixSetColumn(var Matrix: TVMCLMatrix4CMd; Column: Integer; const Data: TVMCLVector4d); overload;

{===============================================================================
    Matrix filling - declaration
===============================================================================}

procedure MatrixFillRow(var Matrix: TVMCLMatrix2RMs; Row: Integer; Value: Single); overload;
procedure MatrixFillRow(var Matrix: TVMCLMatrix2RMd; Row: Integer; Value: Double); overload;
procedure MatrixFillRow(var Matrix: TVMCLMatrix2CMs; Row: Integer; Value: Single); overload;
procedure MatrixFillRow(var Matrix: TVMCLMatrix2CMd; Row: Integer; Value: Double); overload;

procedure MatrixFillRow(var Matrix: TVMCLMatrix3RMs; Row: Integer; Value: Single); overload;
procedure MatrixFillRow(var Matrix: TVMCLMatrix3RMd; Row: Integer; Value: Double); overload;
procedure MatrixFillRow(var Matrix: TVMCLMatrix3CMs; Row: Integer; Value: Single); overload;
procedure MatrixFillRow(var Matrix: TVMCLMatrix3CMd; Row: Integer; Value: Double); overload;

procedure MatrixFillRow(var Matrix: TVMCLMatrix4RMs; Row: Integer; Value: Single); overload;
procedure MatrixFillRow(var Matrix: TVMCLMatrix4RMd; Row: Integer; Value: Double); overload;
procedure MatrixFillRow(var Matrix: TVMCLMatrix4CMs; Row: Integer; Value: Single); overload;
procedure MatrixFillRow(var Matrix: TVMCLMatrix4CMd; Row: Integer; Value: Double); overload;

procedure MatrixFillColumn(var Matrix: TVMCLMatrix2RMs; Column: Integer; Value: Single); overload;
procedure MatrixFillColumn(var Matrix: TVMCLMatrix2RMd; Column: Integer; Value: Double); overload;
procedure MatrixFillColumn(var Matrix: TVMCLMatrix2CMs; Column: Integer; Value: Single); overload;
procedure MatrixFillColumn(var Matrix: TVMCLMatrix2CMd; Column: Integer; Value: Double); overload;

procedure MatrixFillColumn(var Matrix: TVMCLMatrix3RMs; Column: Integer; Value: Single); overload;
procedure MatrixFillColumn(var Matrix: TVMCLMatrix3RMd; Column: Integer; Value: Double); overload;
procedure MatrixFillColumn(var Matrix: TVMCLMatrix3CMs; Column: Integer; Value: Single); overload;
procedure MatrixFillColumn(var Matrix: TVMCLMatrix3CMd; Column: Integer; Value: Double); overload;

procedure MatrixFillColumn(var Matrix: TVMCLMatrix4RMs; Column: Integer; Value: Single); overload;
procedure MatrixFillColumn(var Matrix: TVMCLMatrix4RMd; Column: Integer; Value: Double); overload;
procedure MatrixFillColumn(var Matrix: TVMCLMatrix4CMs; Column: Integer; Value: Single); overload;
procedure MatrixFillColumn(var Matrix: TVMCLMatrix4CMd; Column: Integer; Value: Double); overload;

procedure MatrixFill(var Matrix: TVMCLMatrix2RMs; Value: Single); overload;
procedure MatrixFill(var Matrix: TVMCLMatrix2RMd; Value: Double); overload;
procedure MatrixFill(var Matrix: TVMCLMatrix2CMs; Value: Single); overload;
procedure MatrixFill(var Matrix: TVMCLMatrix2CMd; Value: Double); overload;

procedure MatrixFill(var Matrix: TVMCLMatrix3RMs; Value: Single); overload;
procedure MatrixFill(var Matrix: TVMCLMatrix3RMd; Value: Double); overload;
procedure MatrixFill(var Matrix: TVMCLMatrix3CMs; Value: Single); overload;
procedure MatrixFill(var Matrix: TVMCLMatrix3CMd; Value: Double); overload;

procedure MatrixFill(var Matrix: TVMCLMatrix4RMs; Value: Single); overload;
procedure MatrixFill(var Matrix: TVMCLMatrix4RMd; Value: Double); overload;
procedure MatrixFill(var Matrix: TVMCLMatrix4CMs; Value: Single); overload;
procedure MatrixFill(var Matrix: TVMCLMatrix4CMd; Value: Double); overload;

{===============================================================================
    Matrix spreading - declaration
===============================================================================}

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix2RMs; Row: Integer); overload;
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix2RMd; Row: Integer); overload;
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix2CMs; Row: Integer); overload;
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix2CMd; Row: Integer); overload;

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix3RMs; Row: Integer); overload;
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix3RMd; Row: Integer); overload;
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix3CMs; Row: Integer); overload;
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix3CMd; Row: Integer); overload;

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix4RMs; Row: Integer); overload;
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix4RMd; Row: Integer); overload;
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix4CMs; Row: Integer); overload;
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix4CMd; Row: Integer); overload;

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix2RMs; Column: Integer); overload;
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix2RMd; Column: Integer); overload;
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix2CMs; Column: Integer); overload;
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix2CMd; Column: Integer); overload;

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix3RMs; Column: Integer); overload;
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix3RMd; Column: Integer); overload;
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix3CMs; Column: Integer); overload;
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix3CMd; Column: Integer); overload;

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix4RMs; Column: Integer); overload;
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix4RMd; Column: Integer); overload;
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix4CMs; Column: Integer); overload;
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix4CMd; Column: Integer); overload;

{===============================================================================
    Submatrix read access - declaration
===============================================================================}

Function GetSubmatrix2(const Matrix: TVMCLMatrix3RMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2RMs; overload;
Function GetSubmatrix2(const Matrix: TVMCLMatrix3RMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2RMd; overload;
Function GetSubmatrix2(const Matrix: TVMCLMatrix3CMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2CMs; overload;
Function GetSubmatrix2(const Matrix: TVMCLMatrix3CMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2CMd; overload;

Function GetSubmatrix2(const Matrix: TVMCLMatrix4RMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2RMs; overload;
Function GetSubmatrix2(const Matrix: TVMCLMatrix4RMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2RMd; overload;
Function GetSubmatrix2(const Matrix: TVMCLMatrix4CMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2CMs; overload;
Function GetSubmatrix2(const Matrix: TVMCLMatrix4CMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2CMd; overload;

Function GetSubmatrix3(const Matrix: TVMCLMatrix4RMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix3RMs; overload;
Function GetSubmatrix3(const Matrix: TVMCLMatrix4RMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix3RMd; overload;
Function GetSubmatrix3(const Matrix: TVMCLMatrix4CMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix3CMs; overload;
Function GetSubmatrix3(const Matrix: TVMCLMatrix4CMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix3CMd; overload;

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix3RMs; Row,Column: Integer): TVMCLMatrix2RMs; overload;
Function ExtractSubmatrix2(const Matrix: TVMCLMatrix3RMd; Row,Column: Integer): TVMCLMatrix2RMd; overload;
Function ExtractSubmatrix2(const Matrix: TVMCLMatrix3CMs; Row,Column: Integer): TVMCLMatrix2CMs; overload;
Function ExtractSubmatrix2(const Matrix: TVMCLMatrix3CMd; Row,Column: Integer): TVMCLMatrix2CMd; overload;

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix4RMs; Row1,Row2,Column1,Column2: Integer): TVMCLMatrix2RMs; overload;
Function ExtractSubmatrix2(const Matrix: TVMCLMatrix4RMd; Row1,Row2,Column1,Column2: Integer): TVMCLMatrix2RMd; overload;
Function ExtractSubmatrix2(const Matrix: TVMCLMatrix4CMs; Row1,Row2,Column1,Column2: Integer): TVMCLMatrix2CMs; overload;
Function ExtractSubmatrix2(const Matrix: TVMCLMatrix4CMd; Row1,Row2,Column1,Column2: Integer): TVMCLMatrix2CMd; overload;

Function ExtractSubmatrix3(const Matrix: TVMCLMatrix4RMs; Row,Column: Integer): TVMCLMatrix3RMs; overload;
Function ExtractSubmatrix3(const Matrix: TVMCLMatrix4RMd; Row,Column: Integer): TVMCLMatrix3RMd; overload;
Function ExtractSubmatrix3(const Matrix: TVMCLMatrix4CMs; Row,Column: Integer): TVMCLMatrix3CMs; overload;
Function ExtractSubmatrix3(const Matrix: TVMCLMatrix4CMd; Row,Column: Integer): TVMCLMatrix3CMd; overload;

{===============================================================================
    Submatrix write access - declaration
===============================================================================}

procedure SetSubmatrix2(var Matrix: TVMCLMatrix3RMs; const Submatrix: TVMCLMatrix2RMs; Row,Column: Integer); overload;
procedure SetSubmatrix2(var Matrix: TVMCLMatrix3RMd; const Submatrix: TVMCLMatrix2RMd; Row,Column: Integer); overload;
procedure SetSubmatrix2(var Matrix: TVMCLMatrix3CMs; const Submatrix: TVMCLMatrix2CMs; Row,Column: Integer); overload;
procedure SetSubmatrix2(var Matrix: TVMCLMatrix3CMd; const Submatrix: TVMCLMatrix2CMd; Row,Column: Integer); overload;

procedure SetSubmatrix2(var Matrix: TVMCLMatrix4RMs; const Submatrix: TVMCLMatrix2RMs; Row,Column: Integer); overload;
procedure SetSubmatrix2(var Matrix: TVMCLMatrix4RMd; const Submatrix: TVMCLMatrix2RMd; Row,Column: Integer); overload;
procedure SetSubmatrix2(var Matrix: TVMCLMatrix4CMs; const Submatrix: TVMCLMatrix2CMs; Row,Column: Integer); overload;
procedure SetSubmatrix2(var Matrix: TVMCLMatrix4CMd; const Submatrix: TVMCLMatrix2CMd; Row,Column: Integer); overload;

procedure SetSubmatrix3(var Matrix: TVMCLMatrix4RMs; const Submatrix: TVMCLMatrix3RMs; Row,Column: Integer); overload;
procedure SetSubmatrix3(var Matrix: TVMCLMatrix4RMd; const Submatrix: TVMCLMatrix3RMd; Row,Column: Integer); overload;
procedure SetSubmatrix3(var Matrix: TVMCLMatrix4CMs; const Submatrix: TVMCLMatrix3CMs; Row,Column: Integer); overload;
procedure SetSubmatrix3(var Matrix: TVMCLMatrix4CMd; const Submatrix: TVMCLMatrix3CMd; Row,Column: Integer); overload;

procedure FillSubmatrix(var Matrix: TVMCLMatrix2RMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single); overload;
procedure FillSubmatrix(var Matrix: TVMCLMatrix2RMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double); overload;
procedure FillSubmatrix(var Matrix: TVMCLMatrix2CMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single); overload;
procedure FillSubmatrix(var Matrix: TVMCLMatrix2CMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double); overload;

procedure FillSubmatrix(var Matrix: TVMCLMatrix3RMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single); overload;
procedure FillSubmatrix(var Matrix: TVMCLMatrix3RMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double); overload;
procedure FillSubmatrix(var Matrix: TVMCLMatrix3CMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single); overload;
procedure FillSubmatrix(var Matrix: TVMCLMatrix3CMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double); overload;

procedure FillSubmatrix(var Matrix: TVMCLMatrix4RMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single); overload;
procedure FillSubmatrix(var Matrix: TVMCLMatrix4RMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double); overload;
procedure FillSubmatrix(var Matrix: TVMCLMatrix4CMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single); overload;
procedure FillSubmatrix(var Matrix: TVMCLMatrix4CMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double); overload;

{===============================================================================
    Matrix exchanges - declaration
===============================================================================}

// matrix entry/column/row exchange

{===============================================================================
    Matrix conversions - declaration
===============================================================================}

// higher to lower dimension
Function Matrix2(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix2RMs; overload;
Function Matrix2(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix2RMd; overload;
Function Matrix2(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix2CMs; overload;
Function Matrix2(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix2CMd; overload;

Function Matrix2(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix2RMs; overload;
Function Matrix2(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix2RMd; overload;
Function Matrix2(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix2CMs; overload;
Function Matrix2(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix2CMd; overload;

Function Matrix3(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix3RMs; overload;
Function Matrix3(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix3RMd; overload;
Function Matrix3(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix3CMs; overload;
Function Matrix3(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix3CMd; overload;
(*
// lower to higher dimension
Function Matrix3(const Matrix: TVMCLMatrix2RMs; IdentityMatrix: Boolean = False): TVMCLMatrix3RMs; overload;
Function Matrix3(const Matrix: TVMCLMatrix2RMd; IdentityMatrix: Boolean = False): TVMCLMatrix3RMd; overload;
Function Matrix3(const Matrix: TVMCLMatrix2CMs; IdentityMatrix: Boolean = False): TVMCLMatrix3CMs; overload;
Function Matrix3(const Matrix: TVMCLMatrix2CMd; IdentityMatrix: Boolean = False): TVMCLMatrix3CMd; overload;

Function Matrix4(const Matrix: TVMCLMatrix2RMs; IdentityMatrix: Boolean = False): TVMCLMatrix4RMs; overload;
Function Matrix4(const Matrix: TVMCLMatrix2RMd; IdentityMatrix: Boolean = False): TVMCLMatrix4RMd; overload;
Function Matrix4(const Matrix: TVMCLMatrix2CMs; IdentityMatrix: Boolean = False): TVMCLMatrix4CMs; overload;
Function Matrix4(const Matrix: TVMCLMatrix2CMd; IdentityMatrix: Boolean = False): TVMCLMatrix4CMd; overload;

Function Matrix4(const Matrix: TVMCLMatrix3RMs; IdentityMatrix: Boolean = False): TVMCLMatrix4RMs; overload;
Function Matrix4(const Matrix: TVMCLMatrix3RMd; IdentityMatrix: Boolean = False): TVMCLMatrix4RMd; overload;
Function Matrix4(const Matrix: TVMCLMatrix3CMs; IdentityMatrix: Boolean = False): TVMCLMatrix4CMs; overload;
Function Matrix4(const Matrix: TVMCLMatrix3CMd; IdentityMatrix: Boolean = False): TVMCLMatrix4CMd; overload;

// precision coversion
Function Matrix2s(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMs; overload;
Function Matrix2d(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMs; overload;
Function Matrix2s(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMs; overload;
Function Matrix2d(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMs; overload;

Function Matrix3s(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMs; overload;
Function Matrix3d(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMs; overload;
Function Matrix3s(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMs; overload;
Function Matrix3d(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMs; overload;

Function Matrix4s(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMs; overload;
Function Matrix4d(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMs; overload;
Function Matrix4s(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMs; overload;
Function Matrix4d(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMs; overload;

// order conversion
Function Matrix2(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2RMs; overload;
Function Matrix2(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2RMd; overload;
Function Matrix2(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2CMs; overload;
Function Matrix2(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2CMd; overload;
*)
implementation

uses
  Math;

{===============================================================================
    Matrix formatting types, constants and functions - implementation
===============================================================================}

Function MatrixFormat(CommonFormat: TVMCLCommonFormat; LineBreak: String; AlignmentScope: TVMCLMatAlignScope; AlignmentType: TVMCLMatAlignType): TVMCLMatrixFormat;
begin
Result.CommonFormat := CommonFormat;
Result.LineBreak := LineBreak;
Result.AlignmentScope := AlignmentScope;
Result.AlignmentType := AlignmentType;
end;

{===============================================================================
    General matrix functions - implementation
===============================================================================}

Function GetLinearOverlayIndex_RM(Row,Col,Stride: Integer): Integer;
begin
Result := (Row * Stride) + Col;
end;

//------------------------------------------------------------------------------

Function GetLinearOverlayIndex_CM(Row,Col,Stride: Integer): Integer;
begin
Result := (Col * Stride) + Row;
end;

//------------------------------------------------------------------------------

Function GetLinearOverlayIndex(Row,Col,Stride: Integer): Integer;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := GetLinearOverlayIndex_RM(Row,Col,Stride);
{$ELSE}
Result := GetLinearOverlayIndex_CM(Row,Col,Stride);
{$ENDIF}
end;

{===============================================================================
    Matrix to string converions internals
===============================================================================}

type
  TVMCLStringMatrixItem = record
    Text:   String;
    Lead:   Integer;
    Trail:  Integer;
  end;

  TVMCLStringMatrix = array of array of TVMCLStringMatrixItem;

//------------------------------------------------------------------------------

procedure AlignStrings(var Strs: TVMCLStringMatrix; const MatrixFormat: TVMCLMatrixFormat);
var
  Col,Row:  Integer;
  Temp:     Integer;
  MaxLead:  Integer;
  MaxTrail: Integer;

  Function FirstNumberPos(const S: String): Integer;
  var
    ii: Integer;
  begin
    Result := 0;
    For ii := 1 to Length(S) do
      If Ord(S[ii]) in [Ord('0')..Ord('9')] then
        begin
          Result := ii;
          Break;
        end;
  end;

  Function DecimalSeparatorPos(const S: String): Integer;
  var
    ii: Integer;
  begin
    Result := 0;
    For ii := 1 to Length(S) do
      If S[ii] = MatrixFormat.CommonFormat.ValueFormat.DecimalSeparator then
        begin
          Result := ii;
          Break;
        end;
  end;

begin
If MatrixFormat.AlignmentScope <> masNone then
  begin
    // calculate individual entries according to alignment type
    For Row := Low(Strs) to High(Strs) do
      For Col := Low(Strs[Row]) to High(Strs[Row]) do
        case MatrixFormat.AlignmentType of
          matFront:
            begin
              Strs[Row,Col].Lead := 0;
              Strs[Row,Col].Trail := Length(Strs[Row,Col].Text);
            end;
          matFirstNumber:
            begin
              Temp := Max(FirstNumberPos(Strs[Row,Col].Text),1);
              Strs[Row,Col].Lead := Temp - 1;
              Strs[Row,Col].Trail := Length(Strs[Row,Col].Text) - Temp;
            end;
          matDecimalSeparator:
            begin
              Temp := DecimalSeparatorPos(Strs[Row,Col].Text);
              If Temp > 0 then
                begin
                  Strs[Row,Col].Lead := Temp - 1;
                  Strs[Row,Col].Trail := Length(Strs[Row,Col].Text) - Temp;
                end
              else
                begin
                  Strs[Row,Col].Lead := Length(Strs[Row,Col].Text);
                  Strs[Row,Col].Trail := -1;
                end;
            end;
        else
         {matBack}
          Strs[Row,Col].Lead := Length(Strs[Row,Col].Text);
          Strs[Row,Col].Trail := 0;
        end;
    // arrange the strings according to alignment scope
    case MatrixFormat.AlignmentScope of
      masMatrix:  // matrix-wide alignment    --  --  --  --  --  --  --  --  --
        begin
          MaxLead := 0; MaxTrail := 0;
          For Row := Low(Strs) to High(Strs) do
            For Col := Low(Strs[Row]) to High(Strs[Row]) do
              begin
                If Strs[Row,Col].Lead > MaxLead then
                  MaxLead := Strs[Row,Col].Lead;
                If Strs[Row,Col].Trail > MaxTrail then
                  MaxTrail := Strs[Row,Col].Trail;
              end;
          For Row := Low(Strs) to High(Strs) do
            For Col := Low(Strs[Row]) to High(Strs[Row]) do
              with MatrixFormat.CommonFormat do
                begin
                  Strs[Row,Col].Text := StringOfChar(WhiteSpace,MaxLead - Strs[Row,Col].Lead) +
                    Strs[Row,Col].Text + StringOfChar(WhiteSpace,MaxTrail - Strs[Row,Col].Trail);
                end;
        end;
      masColumn:  // column-wide alignment    --  --  --  --  --  --  --  --  --
        begin
          For Col := Low(Strs[0]) to High(Strs[0]) do
            begin
              MaxLead := 0; MaxTrail := 0;
              For Row := Low(Strs) to High(Strs) do
                begin
                  If Strs[Row,Col].Lead > MaxLead then
                    MaxLead := Strs[Row,Col].Lead;
                  If Strs[Row,Col].Trail > MaxTrail then
                    MaxTrail := Strs[Row,Col].Trail;
                end;
              For Row := Low(Strs) to High(Strs) do
                with MatrixFormat.CommonFormat do
                  Strs[Row,Col].Text := StringOfChar(WhiteSpace, MaxLead - Strs[Row,Col].Lead) +
                    Strs[Row,Col].Text + StringOfChar(WhiteSpace, MaxTrail - Strs[Row,Col].Trail);
            end;
        end;
      masRow:     // row-wide alignment   --  --  --  --  --  --  --  --  --  --
        begin
          For Row := Low(Strs) to High(Strs) do
            begin
              MaxLead := 0; MaxTrail := 0;
              For Col := Low(Strs[Row]) to High(Strs[Row]) do
                begin
                  If Strs[Row,Col].Lead > MaxLead then
                    MaxLead := Strs[Row,Col].Lead;
                  If Strs[Row,Col].Trail > MaxTrail then
                    MaxTrail := Strs[Row,Col].Trail;
                end;
              For Col := Low(Strs[Row]) to High(Strs[Row]) do
                with MatrixFormat.CommonFormat do
                  Strs[Row,Col].Text := StringOfChar(WhiteSpace, MaxLead - Strs[Row,Col].Lead) +
                    Strs[Row,Col].Text + StringOfChar(WhiteSpace, MaxTrail - Strs[Row,Col].Trail);
            end;
        end;
    end;
  end;
end;

//------------------------------------------------------------------------------

Function ProcessStringMatrix(var Strs: TVMCLStringMatrix; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Col,Row:  Integer;
begin
Result := '';
AlignStrings(Strs,MatrixFormat);
For Row := Low(Strs) to High(Strs) do
  begin
    Result := Result + MatrixFormat.CommonFormat.LeadingString;
    For Col := Low(Strs[Row]) to High(Strs[Row]) do
      with MatrixFormat.CommonFormat do
        begin
          If Col < High(Strs[Row]) then
            Result := Result + Strs[Row,Col].Text + ComponentsDelimiter + WhiteSpace
          else
            Result := Result + Strs[Row,Col].Text;
        end;
    Result := Result + MatrixFormat.CommonFormat.TrailingString;
    If Row < High(Strs) then
      Result := Result + MatrixFormat.LineBreak;
  end;
end;

{===============================================================================
    Matrix to string conversion functions - implementation
===============================================================================}

Function MatToStr(const Matrix: TVMCLMatrix2RMs; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Row,Col],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix2RMd; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Row,Col],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix2CMs; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Col,Row],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix2CMd; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Col,Row],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix3RMs; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Row,Col],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix3RMd; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Row,Col],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix3CMs; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Col,Row],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix3CMd; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Col,Row],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix4RMs; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Row,Col],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix4RMd; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Row,Col],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix4CMs; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Col,Row],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix4CMd; const MatrixFormat: TVMCLMatrixFormat): String;
var
  Strs:     TVMCLStringMatrix;
  Col,Row:  Integer;
begin
SetLength(Strs,Length(Matrix),Length(Matrix[0]));
For Row := Low(Strs) to High(Strs) do
  For Col := Low(Strs[Row]) to High(Strs[Row]) do
    Strs[Row,Col].Text := ValueToStr(Matrix[Col,Row],MatrixFormat.CommonFormat.ValueFormat);
Result := ProcessStringMatrix(Strs,MatrixFormat);
end;

//------------------------------------------------------------------------------

Function MatToStr(const Matrix: TVMCLMatrix2RMs): String; 
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix2RMd): String;
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix2CMs): String; 
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix2CMd): String; 
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix3RMs): String; 
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix3RMd): String;
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix3CMs): String; 
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix3CMd): String;  
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix4RMs): String; 
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix4RMd): String;
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix4CMs): String; 
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatToStr(const Matrix: TVMCLMatrix4CMd): String;
begin
Result := MatToStr(Matrix,VMCL_DefaultMatrixFormat);
end;

{===============================================================================
    Matrix building - implementation
===============================================================================}

Function RMMatrixFromRows(const Row1,Row2: TVMCLVector2s): TVMCLMatrix2RMs;
begin
Move(Row1,Result[0],SizeOf(Row1));
Move(Row2,Result[1],SizeOf(Row2));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromRows(const Row1,Row2: TVMCLVector2d): TVMCLMatrix2RMd;
begin
Move(Row1,Result[0],SizeOf(Row1));
Move(Row2,Result[1],SizeOf(Row2));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromRows(const Row1,Row2: TVMCLVector2s): TVMCLMatrix2CMs;
begin
Result[0,0] := Row1[0]; Result[1,0] := Row1[1];
Result[0,1] := Row2[0]; Result[1,1] := Row2[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromRows(const Row1,Row2: TVMCLVector2d): TVMCLMatrix2CMd;
begin
Result[0,0] := Row1[0]; Result[1,0] := Row1[1];
Result[0,1] := Row2[0]; Result[1,1] := Row2[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromRows(const Row1,Row2,Row3: TVMCLVector3s): TVMCLMatrix3RMs;
begin
Move(Row1,Result[0],SizeOf(Row1));
Move(Row2,Result[1],SizeOf(Row2));
Move(Row3,Result[2],SizeOf(Row3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromRows(const Row1,Row2,Row3: TVMCLVector3d): TVMCLMatrix3RMd;
begin
Move(Row1,Result[0],SizeOf(Row1));
Move(Row2,Result[1],SizeOf(Row2));
Move(Row3,Result[2],SizeOf(Row3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromRows(const Row1,Row2,Row3: TVMCLVector3s): TVMCLMatrix3CMs;
begin
Result[0,0] := Row1[0]; Result[1,0] := Row1[1]; Result[2,0] := Row1[2];
Result[0,1] := Row2[0]; Result[1,1] := Row2[1]; Result[2,1] := Row2[2];
Result[0,2] := Row3[0]; Result[1,2] := Row3[1]; Result[2,2] := Row3[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromRows(const Row1,Row2,Row3: TVMCLVector3d): TVMCLMatrix3CMd;
begin
Result[0,0] := Row1[0]; Result[1,0] := Row1[1]; Result[2,0] := Row1[2];
Result[0,1] := Row2[0]; Result[1,1] := Row2[1]; Result[2,1] := Row2[2];
Result[0,2] := Row3[0]; Result[1,2] := Row3[1]; Result[2,2] := Row3[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4s): TVMCLMatrix4RMs;
begin
Move(Row1,Result[0],SizeOf(Row1));
Move(Row2,Result[1],SizeOf(Row2));
Move(Row3,Result[2],SizeOf(Row3));
Move(Row4,Result[3],SizeOf(Row4));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4d): TVMCLMatrix4RMd;
begin
Move(Row1,Result[0],SizeOf(Row1));
Move(Row2,Result[1],SizeOf(Row2));
Move(Row3,Result[2],SizeOf(Row3));
Move(Row4,Result[3],SizeOf(Row4));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4s): TVMCLMatrix4CMs;
begin
Result[0,0] := Row1[0]; Result[1,0] := Row1[1]; Result[2,0] := Row1[2]; Result[3,0] := Row1[3];
Result[0,1] := Row2[0]; Result[1,1] := Row2[1]; Result[2,1] := Row2[2]; Result[3,1] := Row2[3];
Result[0,2] := Row3[0]; Result[1,2] := Row3[1]; Result[2,2] := Row3[2]; Result[3,2] := Row3[3];
Result[0,3] := Row4[0]; Result[1,3] := Row4[1]; Result[2,3] := Row4[2]; Result[3,3] := Row4[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4d): TVMCLMatrix4CMd;
begin
Result[0,0] := Row1[0]; Result[1,0] := Row1[1]; Result[2,0] := Row1[2]; Result[3,0] := Row1[3];
Result[0,1] := Row2[0]; Result[1,1] := Row2[1]; Result[2,1] := Row2[2]; Result[3,1] := Row2[3];
Result[0,2] := Row3[0]; Result[1,2] := Row3[1]; Result[2,2] := Row3[2]; Result[3,2] := Row3[3];
Result[0,3] := Row4[0]; Result[1,3] := Row4[1]; Result[2,3] := Row4[2]; Result[3,3] := Row4[3];
end;

//------------------------------------------------------------------------------

Function MatrixFromRows(const Row1,Row2: TVMCLVector2s): TVMCLMatrix2s;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromRows(Row1,Row2);
{$ELSE}
Result := RMMatrixFromRows(Row1,Row2);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromRows(const Row1,Row2: TVMCLVector2d): TVMCLMatrix2d;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromRows(Row1,Row2);
{$ELSE}
Result := RMMatrixFromRows(Row1,Row2);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromRows(const Row1,Row2,Row3: TVMCLVector3s): TVMCLMatrix3s;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromRows(Row1,Row2,Row3);
{$ELSE}
Result := RMMatrixFromRows(Row1,Row2,Row3);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromRows(const Row1,Row2,Row3: TVMCLVector3d): TVMCLMatrix3d;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromRows(Row1,Row2,Row3);
{$ELSE}
Result := RMMatrixFromRows(Row1,Row2,Row3);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4s): TVMCLMatrix4s;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromRows(Row1,Row2,Row3,Row4);
{$ELSE}
Result := RMMatrixFromRows(Row1,Row2,Row3,Row4);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromRows(const Row1,Row2,Row3,Row4: TVMCLVector4d): TVMCLMatrix4d;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromRows(Row1,Row2,Row3,Row4);
{$ELSE}
Result := RMMatrixFromRows(Row1,Row2,Row3,Row4);
{$ENDIF}
end;

//==============================================================================

Function RMMatrixFromColumns(const Column1,Column2: TVMCLVector2s): TVMCLMatrix2RMs;
begin
Result[0,0] := Column1[0]; Result[0,1] := Column2[0];
Result[1,0] := Column1[1]; Result[1,1] := Column2[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromColumns(const Column1,Column2: TVMCLVector2d): TVMCLMatrix2RMd;
begin
Result[0,0] := Column1[0]; Result[0,1] := Column2[0];
Result[1,0] := Column1[1]; Result[1,1] := Column2[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromColumns(const Column1,Column2: TVMCLVector2s): TVMCLMatrix2CMs;
begin
Move(Column1,Result[0],SizeOf(Column1));
Move(Column2,Result[1],SizeOf(Column2));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromColumns(const Column1,Column2: TVMCLVector2d): TVMCLMatrix2CMd;
begin
Move(Column1,Result[0],SizeOf(Column1));
Move(Column2,Result[1],SizeOf(Column2));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3s): TVMCLMatrix3RMs;
begin
Result[0,0] := Column1[0]; Result[0,1] := Column2[0]; Result[0,2] := Column3[0];
Result[1,0] := Column1[1]; Result[1,1] := Column2[1]; Result[1,2] := Column3[1];
Result[2,0] := Column1[2]; Result[2,1] := Column2[2]; Result[2,2] := Column3[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3d): TVMCLMatrix3RMd;
begin
Result[0,0] := Column1[0]; Result[0,1] := Column2[0]; Result[0,2] := Column3[0];
Result[1,0] := Column1[1]; Result[1,1] := Column2[1]; Result[1,2] := Column3[1];
Result[2,0] := Column1[2]; Result[2,1] := Column2[2]; Result[2,2] := Column3[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3s): TVMCLMatrix3CMs;
begin
Move(Column1,Result[0],SizeOf(Column1));
Move(Column2,Result[1],SizeOf(Column2));
Move(Column3,Result[2],SizeOf(Column3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3d): TVMCLMatrix3CMd;
begin
Move(Column1,Result[0],SizeOf(Column1));
Move(Column2,Result[1],SizeOf(Column2));
Move(Column3,Result[2],SizeOf(Column3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4s): TVMCLMatrix4RMs;
begin
Result[0,0] := Column1[0]; Result[0,1] := Column2[0]; Result[0,2] := Column3[0]; Result[0,3] := Column4[0];
Result[1,0] := Column1[1]; Result[1,1] := Column2[1]; Result[1,2] := Column3[1]; Result[1,3] := Column4[1];
Result[2,0] := Column1[2]; Result[2,1] := Column2[2]; Result[2,2] := Column3[2]; Result[2,3] := Column4[2];
Result[3,0] := Column1[3]; Result[3,1] := Column2[3]; Result[3,2] := Column3[3]; Result[3,3] := Column4[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function RMMatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4d): TVMCLMatrix4RMd;
begin
Result[0,0] := Column1[0]; Result[0,1] := Column2[0]; Result[0,2] := Column3[0]; Result[0,3] := Column4[0];
Result[1,0] := Column1[1]; Result[1,1] := Column2[1]; Result[1,2] := Column3[1]; Result[1,3] := Column4[1];
Result[2,0] := Column1[2]; Result[2,1] := Column2[2]; Result[2,2] := Column3[2]; Result[2,3] := Column4[2];
Result[3,0] := Column1[3]; Result[3,1] := Column2[3]; Result[3,2] := Column3[3]; Result[3,3] := Column4[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4s): TVMCLMatrix4CMs;
begin
Move(Column1,Result[0],SizeOf(Column1));
Move(Column2,Result[1],SizeOf(Column2));
Move(Column3,Result[2],SizeOf(Column3));
Move(Column4,Result[3],SizeOf(Column4));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CMMatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4d): TVMCLMatrix4CMd;
begin
Move(Column1,Result[0],SizeOf(Column1));
Move(Column2,Result[1],SizeOf(Column2));
Move(Column3,Result[2],SizeOf(Column3));
Move(Column4,Result[3],SizeOf(Column4));
end;

//------------------------------------------------------------------------------

Function MatrixFromColumns(const Column1,Column2: TVMCLVector2s): TVMCLMatrix2s;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromColumns(Column1,Column2);
{$ELSE}
Result := RMMatrixFromColumns(Column1,Column2);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromColumns(const Column1,Column2: TVMCLVector2d): TVMCLMatrix2d;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromColumns(Column1,Column2);
{$ELSE}
Result := RMMatrixFromColumns(Column1,Column2);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3s): TVMCLMatrix3s;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromColumns(Column1,Column2,Column3);
{$ELSE}
Result := RMMatrixFromColumns(Column1,Column2,Column3);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromColumns(const Column1,Column2,Column3: TVMCLVector3d): TVMCLMatrix3d;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromColumns(Column1,Column2,Column3);
{$ELSE}
Result := RMMatrixFromColumns(Column1,Column2,Column3);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4s): TVMCLMatrix4s;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromColumns(Column1,Column2,Column3,Column4);
{$ELSE}
Result := RMMatrixFromColumns(Column1,Column2,Column3,Column4);
{$ENDIF}
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixFromColumns(const Column1,Column2,Column3,Column4: TVMCLVector4d): TVMCLMatrix4d;
begin
{$IFDEF MatricesColumnMajorIsDefault}
Result := CMMatrixFromColumns(Column1,Column2,Column3,Column4);
{$ELSE}
Result := RMMatrixFromColumns(Column1,Column2,Column3,Column4);
{$ENDIF}
end;

{===============================================================================
    Matrix entries access - implementation
===============================================================================}

// getting entry
Function MatrixGetEntry(const Matrix: TVMCLMatrix2RMs; Row, Column: Integer): Single;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Matrix[Row,Column]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix2RMd; Row, Column: Integer): Double;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Matrix[Row,Column]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix2CMs; Row, Column: Integer): Single;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Result := Matrix[Column,Row]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix2CMd; Row, Column: Integer): Double;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Result := Matrix[Column,Row]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix3RMs; Row, Column: Integer): Single;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Matrix[Row,Column]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix3RMd; Row, Column: Integer): Double;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Matrix[Row,Column]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix3CMs; Row, Column: Integer): Single;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Result := Matrix[Column,Row]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix3CMd; Row, Column: Integer): Double;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Result := Matrix[Column,Row]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix4RMs; Row, Column: Integer): Single;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Matrix[Row,Column]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix4RMd; Row, Column: Integer): Double;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Matrix[Row,Column]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix4CMs; Row, Column: Integer): Single;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Result := Matrix[Column,Row]
else
  Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetEntry(const Matrix: TVMCLMatrix4CMd; Row, Column: Integer): Double;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Result := Matrix[Column,Row]
else
  Result := 0.0;
end;

//==============================================================================

procedure MatrixSetEntry(var Matrix: TVMCLMatrix2RMs; Row, Column: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Matrix[Row,Column] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix2RMd; Row, Column: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Matrix[Row,Column] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix2CMs; Row, Column: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Matrix[Column,Row] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix2CMd; Row, Column: Integer; Value: Double); 
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Matrix[Column,Row] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix3RMs; Row, Column: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Matrix[Row,Column] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix3RMd; Row, Column: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Matrix[Row,Column] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix3CMs; Row, Column: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Matrix[Column,Row] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix3CMd; Row, Column: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Matrix[Column,Row] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix4RMs; Row, Column: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Matrix[Row,Column] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix4RMd; Row, Column: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) and
   CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Matrix[Row,Column] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix4CMs; Row, Column: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Matrix[Column,Row] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetEntry(var Matrix: TVMCLMatrix4CMd; Row, Column: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(Column,Low(Matrix),High(Matrix)) then
  Matrix[Column,Row] := Value;
end;

{===============================================================================
    Matrix vector extraction - implementation
===============================================================================}

Function MatrixGetRow(const Matrix: TVMCLMatrix2RMs; Row: Integer): TVMCLVector2s;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Matrix[Row],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector2S;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix2RMd; Row: Integer): TVMCLVector2d;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Matrix[Row],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector2d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix2CMs; Row: Integer): TVMCLVector2s;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector2s(Matrix[0,Row],Matrix[1,Row])
else
  Result := VMCL_ZeroVector2s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix2CMd; Row: Integer): TVMCLVector2d;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector2d(Matrix[0,Row],Matrix[1,Row])
else
  Result := VMCL_ZeroVector2d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix3RMs; Row: Integer): TVMCLVector3s;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Matrix[Row],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector3s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix3RMd; Row: Integer): TVMCLVector3d;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Matrix[Row],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector3d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix3CMs; Row: Integer): TVMCLVector3s;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector3s(Matrix[0,Row],Matrix[1,Row],Matrix[2,Row])
else
  Result := VMCL_ZeroVector3s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix3CMd; Row: Integer): TVMCLVector3d;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector3d(Matrix[0,Row],Matrix[1,Row],Matrix[2,Row])
else
  Result := VMCL_ZeroVector3d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix4RMs; Row: Integer): TVMCLVector4s;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Matrix[Row],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector4s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix4RMd; Row: Integer): TVMCLVector4d;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Matrix[Row],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector4d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix4CMs; Row: Integer): TVMCLVector4s;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector4s(Matrix[0,Row],Matrix[1,Row],Matrix[2,Row],Matrix[3,Row])
else
  Result := VMCL_ZeroVector4s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetRow(const Matrix: TVMCLMatrix4CMd; Row: Integer): TVMCLVector4d;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector4d(Matrix[0,Row],Matrix[1,Row],Matrix[2,Row],Matrix[3,Row])
else
  Result := VMCL_ZeroVector4d;
end;

//==============================================================================

Function MatrixGetColumn(const Matrix: TVMCLMatrix2RMs; Column: Integer): TVMCLVector2s;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector2s(Matrix[0,Column],Matrix[1,Column])
else
  Result := VMCL_ZeroVector2s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix2RMd; Column: Integer): TVMCLVector2d;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector2d(Matrix[0,Column],Matrix[1,Column])
else
  Result := VMCL_ZeroVector2d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix2CMs; Column: Integer): TVMCLVector2s;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Matrix[Column],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector2s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix2CMd; Column: Integer): TVMCLVector2d; 
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Matrix[Column],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector2d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix3RMs; Column: Integer): TVMCLVector3s;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector3s(Matrix[0,Column],Matrix[1,Column],Matrix[2,Column])
else
  Result := VMCL_ZeroVector3s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix3RMd; Column: Integer): TVMCLVector3d;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector3d(Matrix[0,Column],Matrix[1,Column],Matrix[2,Column])
else
  Result := VMCL_ZeroVector3d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix3CMs; Column: Integer): TVMCLVector3s;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Matrix[Column],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector3s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix3CMd; Column: Integer): TVMCLVector3d;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Matrix[Column],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector3d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix4RMs; Column: Integer): TVMCLVector4s;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector4s(Matrix[0,Column],Matrix[1,Column],Matrix[2,Column],Matrix[3,Column])
else
  Result := VMCL_ZeroVector4s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix4RMd; Column: Integer): TVMCLVector4d;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  Result := Vector4d(Matrix[0,Column],Matrix[1,Column],Matrix[2,Column],Matrix[3,Column])
else
  Result := VMCL_ZeroVector4d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix4CMs; Column: Integer): TVMCLVector4s;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Matrix[Column],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector4s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatrixGetColumn(const Matrix: TVMCLMatrix4CMd; Column: Integer): TVMCLVector4d;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Matrix[Column],Result,SizeOf(Result))
else
  Result := VMCL_ZeroVector4d;
end;

{===============================================================================
   Matrix vector insertion - implementation
===============================================================================}

procedure MatrixSetRow(var Matrix: TVMCLMatrix2RMs; Row: Integer; const Data: TVMCLVector2s);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Row],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix2RMd; Row: Integer; const Data: TVMCLVector2d);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Row],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix2CMs; Row: Integer; const Data: TVMCLVector2s);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Data[0];
    Matrix[1,Row] := Data[1];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix2CMd; Row: Integer; const Data: TVMCLVector2d); 
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Data[0];
    Matrix[1,Row] := Data[1];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix3RMs; Row: Integer; const Data: TVMCLVector3s);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Row],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix3RMd; Row: Integer; const Data: TVMCLVector3d);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Row],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix3CMs; Row: Integer; const Data: TVMCLVector3s);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Data[0];
    Matrix[1,Row] := Data[1];
    Matrix[2,Row] := Data[2];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix3CMd; Row: Integer; const Data: TVMCLVector3d); 
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Data[0];
    Matrix[1,Row] := Data[1];
    Matrix[2,Row] := Data[2];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix4RMs; Row: Integer; const Data: TVMCLVector4s);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Row],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix4RMd; Row: Integer; const Data: TVMCLVector4d);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Row],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix4CMs; Row: Integer; const Data: TVMCLVector4s);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Data[0];
    Matrix[1,Row] := Data[1];
    Matrix[2,Row] := Data[2];
    Matrix[3,Row] := Data[3];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetRow(var Matrix: TVMCLMatrix4CMd; Row: Integer; const Data: TVMCLVector4d);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Data[0];
    Matrix[1,Row] := Data[1];
    Matrix[2,Row] := Data[2];
    Matrix[3,Row] := Data[3];
  end;
end;

//==============================================================================

procedure MatrixSetColumn(var Matrix: TVMCLMatrix2RMs; Column: Integer; const Data: TVMCLVector2s);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Data[0];
    Matrix[1,Column] := Data[1];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix2RMd; Column: Integer; const Data: TVMCLVector2d);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Data[0];
    Matrix[1,Column] := Data[1];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix2CMs; Column: Integer; const Data: TVMCLVector2s);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Column],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix2CMd; Column: Integer; const Data: TVMCLVector2d);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Column],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix3RMs; Column: Integer; const Data: TVMCLVector3s);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Data[0];
    Matrix[1,Column] := Data[1];
    Matrix[2,Column] := Data[2];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix3RMd; Column: Integer; const Data: TVMCLVector3d);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Data[0];
    Matrix[1,Column] := Data[1];
    Matrix[2,Column] := Data[2];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix3CMs; Column: Integer; const Data: TVMCLVector3s);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Column],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix3CMd; Column: Integer; const Data: TVMCLVector3d);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Column],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix4RMs; Column: Integer; const Data: TVMCLVector4s);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Data[0];
    Matrix[1,Column] := Data[1];
    Matrix[2,Column] := Data[2];
    Matrix[3,Column] := Data[3];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix4RMd; Column: Integer; const Data: TVMCLVector4d);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Data[0];
    Matrix[1,Column] := Data[1];
    Matrix[2,Column] := Data[2];
    Matrix[3,Column] := Data[3];
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix4CMs; Column: Integer; const Data: TVMCLVector4s);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Column],SizeOf(Data));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSetColumn(var Matrix: TVMCLMatrix4CMd; Column: Integer; const Data: TVMCLVector4d);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  Move(Data,Matrix[Column],SizeOf(Data));
end;

{===============================================================================
    Matrix filling - implementation
===============================================================================}

procedure MatrixFillRow(var Matrix: TVMCLMatrix2RMs; Row: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Row,0] := Value;
    Matrix[Row,1] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix2RMd; Row: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Row,0] := Value;
    Matrix[Row,1] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix2CMs; Row: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Value;
    Matrix[1,Row] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix2CMd; Row: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Value;
    Matrix[1,Row] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix3RMs; Row: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Row,0] := Value;
    Matrix[Row,1] := Value;
    Matrix[Row,2] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix3RMd; Row: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Row,0] := Value;
    Matrix[Row,1] := Value;
    Matrix[Row,2] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix3CMs; Row: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Value;
    Matrix[1,Row] := Value;
    Matrix[2,Row] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix3CMd; Row: Integer; Value: Double); 
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Value;
    Matrix[1,Row] := Value;
    Matrix[2,Row] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix4RMs; Row: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Row,0] := Value;
    Matrix[Row,1] := Value;
    Matrix[Row,2] := Value;
    Matrix[Row,3] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix4RMd; Row: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Row,0] := Value;
    Matrix[Row,1] := Value;
    Matrix[Row,2] := Value;
    Matrix[Row,3] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---
 
procedure MatrixFillRow(var Matrix: TVMCLMatrix4CMs; Row: Integer; Value: Single);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Value;
    Matrix[1,Row] := Value;
    Matrix[2,Row] := Value;
    Matrix[3,Row] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillRow(var Matrix: TVMCLMatrix4CMd; Row: Integer; Value: Double);
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Row] := Value;
    Matrix[1,Row] := Value;
    Matrix[2,Row] := Value;
    Matrix[3,Row] := Value;
  end;
end;

//==============================================================================

procedure MatrixFillColumn(var Matrix: TVMCLMatrix2RMs; Column: Integer; Value: Single);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Value;
    Matrix[1,Column] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix2RMd; Column: Integer; Value: Double);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Value;
    Matrix[1,Column] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix2CMs; Column: Integer; Value: Single);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Column,0] := Value;
    Matrix[Column,1] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix2CMd; Column: Integer; Value: Double);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Column,0] := Value;
    Matrix[Column,1] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix3RMs; Column: Integer; Value: Single);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Value;
    Matrix[1,Column] := Value;
    Matrix[2,Column] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix3RMd; Column: Integer; Value: Double);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Value;
    Matrix[1,Column] := Value;
    Matrix[2,Column] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix3CMs; Column: Integer; Value: Single);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Column,0] := Value;
    Matrix[Column,1] := Value;
    Matrix[Column,2] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix3CMd; Column: Integer; Value: Double);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Column,0] := Value;
    Matrix[Column,1] := Value;
    Matrix[Column,2] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix4RMs; Column: Integer; Value: Single);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Value;
    Matrix[1,Column] := Value;
    Matrix[2,Column] := Value;
    Matrix[3,Column] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix4RMd; Column: Integer; Value: Double);
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Matrix[0,Column] := Value;
    Matrix[1,Column] := Value;
    Matrix[2,Column] := Value;
    Matrix[3,Column] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix4CMs; Column: Integer; Value: Single);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Column,0] := Value;
    Matrix[Column,1] := Value;
    Matrix[Column,2] := Value;
    Matrix[Column,3] := Value;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFillColumn(var Matrix: TVMCLMatrix4CMd; Column: Integer; Value: Double);
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  begin
    Matrix[Column,0] := Value;
    Matrix[Column,1] := Value;
    Matrix[Column,2] := Value;
    Matrix[Column,3] := Value;
  end;
end;

//==============================================================================

procedure MatrixFill(var Matrix: TVMCLMatrix2RMs; Value: Single);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix2RMd; Value: Double);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix2CMs; Value: Single);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix2CMd; Value: Double);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix3RMs; Value: Single);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix3RMd; Value: Double);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix3CMs; Value: Single);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix3CMd; Value: Double);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix4RMs; Value: Single);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix4RMd; Value: Double);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix4CMs; Value: Single);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Matrix)[i] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixFill(var Matrix: TVMCLMatrix4CMd; Value: Double);
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Matrix)[i] := Value;
end;

{===============================================================================
    Matrix spreading - implementation
===============================================================================}

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix2RMs; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Row then
      begin
        Matrix[i,0] := Matrix[Row,0];
        Matrix[i,1] := Matrix[Row,1];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix2RMd; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Row then
      begin
        Matrix[i,0] := Matrix[Row,0];
        Matrix[i,1] := Matrix[Row,1];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix2CMs; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Row then
      begin
        Matrix[0,i] := Matrix[0,Row];
        Matrix[1,i] := Matrix[1,Row];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix2CMd; Row: Integer); 
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Row then
      begin
        Matrix[0,i] := Matrix[0,Row];
        Matrix[1,i] := Matrix[1,Row];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix3RMs; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Row then
      begin
        Matrix[i,0] := Matrix[Row,0];
        Matrix[i,1] := Matrix[Row,1];
        Matrix[i,2] := Matrix[Row,2];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix3RMd; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Row then
      begin
        Matrix[i,0] := Matrix[Row,0];
        Matrix[i,1] := Matrix[Row,1];
        Matrix[i,2] := Matrix[Row,2];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix3CMs; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Row then
      begin
        Matrix[0,i] := Matrix[0,Row];
        Matrix[1,i] := Matrix[1,Row];
        Matrix[2,i] := Matrix[2,Row];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix3CMd; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Row then
      begin
        Matrix[0,i] := Matrix[0,Row];
        Matrix[1,i] := Matrix[1,Row];
        Matrix[2,i] := Matrix[2,Row];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix4RMs; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Row then
      begin
        Matrix[i,0] := Matrix[Row,0];
        Matrix[i,1] := Matrix[Row,1];
        Matrix[i,2] := Matrix[Row,2];
        Matrix[i,3] := Matrix[Row,3];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix4RMd; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Row then
      begin
        Matrix[i,0] := Matrix[Row,0];
        Matrix[i,1] := Matrix[Row,1];
        Matrix[i,2] := Matrix[Row,2];
        Matrix[i,3] := Matrix[Row,3];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---
 
procedure MatrixSpreadRow(var Matrix: TVMCLMatrix4CMs; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Row then
      begin
        Matrix[0,i] := Matrix[0,Row];
        Matrix[1,i] := Matrix[1,Row];
        Matrix[2,i] := Matrix[2,Row];
        Matrix[3,i] := Matrix[3,Row];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadRow(var Matrix: TVMCLMatrix4CMd; Row: Integer);
var
  i:  Integer;
begin
If CheckRange(Row,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Row then
      begin
        Matrix[0,i] := Matrix[0,Row];
        Matrix[1,i] := Matrix[1,Row];
        Matrix[2,i] := Matrix[2,Row];
        Matrix[3,i] := Matrix[3,Row];
      end;
end;

//==============================================================================

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix2RMs; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Column then
      begin
        Matrix[0,i] := Matrix[0,Column];
        Matrix[1,i] := Matrix[1,Column];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix2RMd; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Column then
      begin
        Matrix[0,i] := Matrix[0,Column];
        Matrix[1,i] := Matrix[1,Column];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix2CMs; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Column then
      begin
        Matrix[i,0] := Matrix[Column,0];
        Matrix[i,1] := Matrix[Column,1];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix2CMd; Column: Integer); 
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Column then
      begin
        Matrix[i,0] := Matrix[Column,0];
        Matrix[i,1] := Matrix[Column,1];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix3RMs; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Column then
      begin
        Matrix[0,i] := Matrix[0,Column];
        Matrix[1,i] := Matrix[1,Column];
        Matrix[2,i] := Matrix[2,Column];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix3RMd; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Column then
      begin
        Matrix[0,i] := Matrix[0,Column];
        Matrix[1,i] := Matrix[1,Column];
        Matrix[2,i] := Matrix[2,Column];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix3CMs; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Column then
      begin
        Matrix[i,0] := Matrix[Column,0];
        Matrix[i,1] := Matrix[Column,1];
        Matrix[i,2] := Matrix[Column,2];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix3CMd; Column: Integer); 
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Column then
      begin
        Matrix[i,0] := Matrix[Column,0];
        Matrix[i,1] := Matrix[Column,1];
        Matrix[i,2] := Matrix[Column,2];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix4RMs; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Column then
      begin
        Matrix[0,i] := Matrix[0,Column];
        Matrix[1,i] := Matrix[1,Column];
        Matrix[2,i] := Matrix[2,Column];
        Matrix[3,i] := Matrix[3,Column];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix4RMd; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix[0]),High(Matrix[0])) then
  For i := Low(Matrix[0]) to High(Matrix[0]) do
    If i <> Column then
      begin
        Matrix[0,i] := Matrix[0,Column];
        Matrix[1,i] := Matrix[1,Column];
        Matrix[2,i] := Matrix[2,Column];
        Matrix[3,i] := Matrix[3,Column];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---
 
procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix4CMs; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Column then
      begin
        Matrix[i,0] := Matrix[Column,0];
        Matrix[i,1] := Matrix[Column,1];
        Matrix[i,2] := Matrix[Column,2];
        Matrix[i,3] := Matrix[Column,3];
      end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixSpreadColumn(var Matrix: TVMCLMatrix4CMd; Column: Integer);
var
  i:  Integer;
begin
If CheckRange(Column,Low(Matrix),High(Matrix)) then
  For i := Low(Matrix) to High(Matrix) do
    If i <> Column then
      begin
        Matrix[i,0] := Matrix[Column,0];
        Matrix[i,1] := Matrix[Column,1];
        Matrix[i,2] := Matrix[Column,2];
        Matrix[i,3] := Matrix[Column,3];
      end;
end;

{===============================================================================
    Submatrix read access - implementation
===============================================================================}

Function GetSubmatrix2(const Matrix: TVMCLMatrix3RMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2RMs;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix2RMs
else
  Result := VMCL_ZeroMatrix2RMs;
For R := Low(Result) to High(Result) do
  For C := Low(Result[0]) to High(Result[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Result[R,C] := Matrix[Row + R,Column + C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix2(const Matrix: TVMCLMatrix3RMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2RMd;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix2RMd
else
  Result := VMCL_ZeroMatrix2RMd;
For R := Low(Result) to High(Result) do
  For C := Low(Result[0]) to High(Result[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Result[R,C] := Matrix[Row + R,Column + C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix2(const Matrix: TVMCLMatrix3CMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2CMs;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix2CMs
else
  Result := VMCL_ZeroMatrix2CMs;
For R := Low(Result[0]) to High(Result[0]) do
  For C := Low(Result) to High(Result) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Result[C,R] := Matrix[Column + C,Row + R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix2(const Matrix: TVMCLMatrix3CMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2CMd;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix2CMd
else
  Result := VMCL_ZeroMatrix2CMd;
For R := Low(Result[0]) to High(Result[0]) do
  For C := Low(Result) to High(Result) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Result[C,R] := Matrix[Column + C,Row + R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix2(const Matrix: TVMCLMatrix4RMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2RMs;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix2RMs
else
  Result := VMCL_ZeroMatrix2RMs;
For R := Low(Result) to High(Result) do
  For C := Low(Result[0]) to High(Result[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Result[R,C] := Matrix[Row + R,Column + C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix2(const Matrix: TVMCLMatrix4RMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2RMd;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix2RMd
else
  Result := VMCL_ZeroMatrix2RMd;
For R := Low(Result) to High(Result) do
  For C := Low(Result[0]) to High(Result[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Result[R,C] := Matrix[Row + R,Column + C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix2(const Matrix: TVMCLMatrix4CMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2CMs;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix2CMs
else
  Result := VMCL_ZeroMatrix2CMs;
For R := Low(Result[0]) to High(Result[0]) do
  For C := Low(Result) to High(Result) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Result[C,R] := Matrix[Column + C,Row + R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix2(const Matrix: TVMCLMatrix4CMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix2CMd;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix2CMd
else
  Result := VMCL_ZeroMatrix2CMd;
For R := Low(Result[0]) to High(Result[0]) do
  For C := Low(Result) to High(Result) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Result[C,R] := Matrix[Column + C,Row + R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix3(const Matrix: TVMCLMatrix4RMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix3RMs;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix3RMs
else
  Result := VMCL_ZeroMatrix3RMs;
For R := Low(Result) to High(Result) do
  For C := Low(Result[0]) to High(Result[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Result[R,C] := Matrix[Row + R,Column + C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix3(const Matrix: TVMCLMatrix4RMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix3RMd;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix3RMd
else
  Result := VMCL_ZeroMatrix3RMd;
For R := Low(Result) to High(Result) do
  For C := Low(Result[0]) to High(Result[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Result[R,C] := Matrix[Row + R,Column + C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix3(const Matrix: TVMCLMatrix4CMs; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix3CMs;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix3CMs
else
  Result := VMCL_ZeroMatrix3CMs;
For R := Low(Result[0]) to High(Result[0]) do
  For C := Low(Result) to High(Result) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Result[C,R] := Matrix[Column + C,Row + R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function GetSubmatrix3(const Matrix: TVMCLMatrix4CMd; Row,Column: Integer; IdentityMatrix: Boolean = False): TVMCLMatrix3CMd;
var
  R,C:  Integer;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix3CMd
else
  Result := VMCL_ZeroMatrix3CMd;
For R := Low(Result[0]) to High(Result[0]) do
  For C := Low(Result) to High(Result) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Result[C,R] := Matrix[Column + C,Row + R];
end;

//==============================================================================

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix3RMs; Row,Column: Integer): TVMCLMatrix2RMs;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix) to High(Matrix) do
  If InRow <> Row then
    begin
      OutCol := 0;
      For InCol := Low(Matrix[0]) to High(Matrix[0]) do
        If InCol <> Column then
          begin
            Result[OutRow,OutCol] := Matrix[InRow,InCol];
            Inc(OutCol);
            If OutCol > High(Result[0]) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix3RMd; Row,Column: Integer): TVMCLMatrix2RMd;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix) to High(Matrix) do
  If InRow <> Row then
    begin
      OutCol := 0;
      For InCol := Low(Matrix[0]) to High(Matrix[0]) do
        If InCol <> Column then
          begin
            Result[OutRow,OutCol] := Matrix[InRow,InCol];
            Inc(OutCol);
            If OutCol > High(Result[0]) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix3CMs; Row,Column: Integer): TVMCLMatrix2CMs;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix[0]) to High(Matrix[0]) do
  If InRow <> Row then
    begin
      OutCol := 0;
      For InCol := Low(Matrix) to High(Matrix) do
        If InCol <> Column then
          begin
            Result[OutCol,OutRow] := Matrix[InCol,InRow];
            Inc(OutCol);
            If OutCol > High(Result) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result[0]) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix3CMd; Row,Column: Integer): TVMCLMatrix2CMd;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix[0]) to High(Matrix[0]) do
  If InRow <> Row then
    begin
      OutCol := 0;
      For InCol := Low(Matrix) to High(Matrix) do
        If InCol <> Column then
          begin
            Result[OutCol,OutRow] := Matrix[InCol,InRow];
            Inc(OutCol);
            If OutCol > High(Result) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result[0]) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix4RMs; Row1,Row2,Column1,Column2: Integer): TVMCLMatrix2RMs;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix) to High(Matrix) do
  If not(InRow in [Row1,Row2]) then
    begin
      OutCol := 0;
      For InCol := Low(Matrix[0]) to High(Matrix[0]) do
        If not(InCol in [Column1,Column2]) then
          begin
            Result[OutRow,OutCol] := Matrix[InRow,InCol];
            Inc(OutCol);
            If OutCol > High(Result[0]) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix4RMd; Row1,Row2,Column1,Column2: Integer): TVMCLMatrix2RMd;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix) to High(Matrix) do
  If not(InRow in [Row1,Row2]) then
    begin
      OutCol := 0;
      For InCol := Low(Matrix[0]) to High(Matrix[0]) do
        If not(InCol in [Column1,Column2]) then
          begin
            Result[OutRow,OutCol] := Matrix[InRow,InCol];
            Inc(OutCol);
            If OutCol > High(Result[0]) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix4CMs; Row1,Row2,Column1,Column2: Integer): TVMCLMatrix2CMs;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix[0]) to High(Matrix[0]) do
  If not(InRow in [Row1,Row2]) then
    begin
      OutCol := 0;
      For InCol := Low(Matrix) to High(Matrix) do
        If not(InCol in [Column1,Column2]) then
          begin
            Result[OutRow,OutCol] := Matrix[InRow,InCol];
            Inc(OutCol);
            If OutCol > High(Result) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result[0]) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix2(const Matrix: TVMCLMatrix4CMd; Row1,Row2,Column1,Column2: Integer): TVMCLMatrix2CMd; 
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix[0]) to High(Matrix[0]) do
  If not(InRow in [Row1,Row2]) then
    begin
      OutCol := 0;
      For InCol := Low(Matrix) to High(Matrix) do
        If not(InCol in [Column1,Column2]) then
          begin
            Result[OutRow,OutCol] := Matrix[InRow,InCol];
            Inc(OutCol);
            If OutCol > High(Result) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result[0]) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix3(const Matrix: TVMCLMatrix4RMs; Row,Column: Integer): TVMCLMatrix3RMs;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix) to High(Matrix) do
  If InRow <> Row then
    begin
      OutCol := 0;
      For InCol := Low(Matrix[0]) to High(Matrix[0]) do
        If InCol <> Column then
          begin
            Result[OutRow,OutCol] := Matrix[InRow,InCol];
            Inc(OutCol);
            If OutCol > High(Result[0]) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix3(const Matrix: TVMCLMatrix4RMd; Row,Column: Integer): TVMCLMatrix3RMd;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix) to High(Matrix) do
  If InRow <> Row then
    begin
      OutCol := 0;
      For InCol := Low(Matrix[0]) to High(Matrix[0]) do
        If InCol <> Column then
          begin
            Result[OutRow,OutCol] := Matrix[InRow,InCol];
            Inc(OutCol);
            If OutCol > High(Result[0]) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix3(const Matrix: TVMCLMatrix4CMs; Row,Column: Integer): TVMCLMatrix3CMs;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix[0]) to High(Matrix[0]) do
  If InRow <> Row then
    begin
      OutCol := 0;
      For InCol := Low(Matrix) to High(Matrix) do
        If InCol <> Column then
          begin
            Result[OutCol,OutRow] := Matrix[InCol,InRow];
            Inc(OutCol);
            If OutCol > High(Result) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result[0]) then
        Break{For InRow};
    end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ExtractSubmatrix3(const Matrix: TVMCLMatrix4CMd; Row,Column: Integer): TVMCLMatrix3CMd;
var
  InRow,InCol:    Integer;
  OutRow,OutCol:  Integer;
begin
OutRow := 0;
For InRow := Low(Matrix[0]) to High(Matrix[0]) do
  If InRow <> Row then
    begin
      OutCol := 0;
      For InCol := Low(Matrix) to High(Matrix) do
        If InCol <> Column then
          begin
            Result[OutCol,OutRow] := Matrix[InCol,InRow];
            Inc(OutCol);
            If OutCol > High(Result) then
              Break{For InCol};
          end;
      Inc(OutRow);
      If OutRow > High(Result[0]) then
        Break{For InRow};
    end;
end;

{===============================================================================
    Submatrix write access - implementation
===============================================================================}

procedure SetSubmatrix2(var Matrix: TVMCLMatrix3RMs; const Submatrix: TVMCLMatrix2RMs; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix) to High(Submatrix) do
  For C := Low(Submatrix[0]) to High(Submatrix[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Matrix[Row + R,Column + C] := Submatrix[R,C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix2(var Matrix: TVMCLMatrix3RMd; const Submatrix: TVMCLMatrix2RMd; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix) to High(Submatrix) do
  For C := Low(Submatrix[0]) to High(Submatrix[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Matrix[Row + R,Column + C] := Submatrix[R,C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix2(var Matrix: TVMCLMatrix3CMs; const Submatrix: TVMCLMatrix2CMs; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix[0]) to High(Submatrix[0]) do
  For C := Low(Submatrix) to High(Submatrix) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Matrix[Column + C,Row + R] := Submatrix[C,R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---
 
procedure SetSubmatrix2(var Matrix: TVMCLMatrix3CMd; const Submatrix: TVMCLMatrix2CMd; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix[0]) to High(Submatrix[0]) do
  For C := Low(Submatrix) to High(Submatrix) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Matrix[Column + C,Row + R] := Submatrix[C,R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix2(var Matrix: TVMCLMatrix4RMs; const Submatrix: TVMCLMatrix2RMs; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix) to High(Submatrix) do
  For C := Low(Submatrix[0]) to High(Submatrix[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Matrix[Row + R,Column + C] := Submatrix[R,C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix2(var Matrix: TVMCLMatrix4RMd; const Submatrix: TVMCLMatrix2RMd; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix) to High(Submatrix) do
  For C := Low(Submatrix[0]) to High(Submatrix[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Matrix[Row + R,Column + C] := Submatrix[R,C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix2(var Matrix: TVMCLMatrix4CMs; const Submatrix: TVMCLMatrix2CMs; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix[0]) to High(Submatrix[0]) do
  For C := Low(Submatrix) to High(Submatrix) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Matrix[Column + C,Row + R] := Submatrix[C,R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix2(var Matrix: TVMCLMatrix4CMd; const Submatrix: TVMCLMatrix2CMd; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix[0]) to High(Submatrix[0]) do
  For C := Low(Submatrix) to High(Submatrix) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Matrix[Column + C,Row + R] := Submatrix[C,R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix3(var Matrix: TVMCLMatrix4RMs; const Submatrix: TVMCLMatrix3RMs; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix) to High(Submatrix) do
  For C := Low(Submatrix[0]) to High(Submatrix[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Matrix[Row + R,Column + C] := Submatrix[R,C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix3(var Matrix: TVMCLMatrix4RMd; const Submatrix: TVMCLMatrix3RMd; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix) to High(Submatrix) do
  For C := Low(Submatrix[0]) to High(Submatrix[0]) do
    If CheckRange(Row + R,Low(Matrix),High(Matrix)) and
       CheckRange(Column + C,Low(Matrix[0]),High(Matrix[0])) then
      Matrix[Row + R,Column + C] := Submatrix[R,C];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix3(var Matrix: TVMCLMatrix4CMs; const Submatrix: TVMCLMatrix3CMs; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix[0]) to High(Submatrix[0]) do
  For C := Low(Submatrix) to High(Submatrix) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Matrix[Column + C,Row + R] := Submatrix[C,R];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure SetSubmatrix3(var Matrix: TVMCLMatrix4CMd; const Submatrix: TVMCLMatrix3CMd; Row,Column: Integer);
var
  R,C:  Integer;
begin
For R := Low(Submatrix[0]) to High(Submatrix[0]) do
  For C := Low(Submatrix) to High(Submatrix) do
    If CheckRange(Row + R,Low(Matrix[0]),High(Matrix[0])) and
       CheckRange(Column + C,Low(Matrix),High(Matrix)) then
      Matrix[Column + C,Row + R] := Submatrix[C,R];
end;

//==============================================================================

procedure FillSubmatrix(var Matrix: TVMCLMatrix2RMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix)) to Min(FromRow + Pred(Rows),High(Matrix)) do
    For C := Max(FromColumn,Low(Matrix[0])) to Min(FromColumn + Pred(Columns),High(Matrix[0])) do
      Matrix[R,C] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix2RMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix)) to Min(FromRow + Pred(Rows),High(Matrix)) do
    For C := Max(FromColumn,Low(Matrix[0])) to Min(FromColumn + Pred(Columns),High(Matrix[0])) do
      Matrix[R,C] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix2CMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix[0])) to Min(FromRow + Pred(Rows),High(Matrix[0])) do
    For C := Max(FromColumn,Low(Matrix)) to Min(FromColumn + Pred(Columns),High(Matrix)) do
      Matrix[C,R] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix2CMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix[0])) to Min(FromRow + Pred(Rows),High(Matrix[0])) do
    For C := Max(FromColumn,Low(Matrix)) to Min(FromColumn + Pred(Columns),High(Matrix)) do
      Matrix[C,R] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix3RMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix)) to Min(FromRow + Pred(Rows),High(Matrix)) do
    For C := Max(FromColumn,Low(Matrix[0])) to Min(FromColumn + Pred(Columns),High(Matrix[0])) do
      Matrix[R,C] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix3RMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix)) to Min(FromRow + Pred(Rows),High(Matrix)) do
    For C := Max(FromColumn,Low(Matrix[0])) to Min(FromColumn + Pred(Columns),High(Matrix[0])) do
      Matrix[R,C] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix3CMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix[0])) to Min(FromRow + Pred(Rows),High(Matrix[0])) do
    For C := Max(FromColumn,Low(Matrix)) to Min(FromColumn + Pred(Columns),High(Matrix)) do
      Matrix[C,R] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix3CMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix[0])) to Min(FromRow + Pred(Rows),High(Matrix[0])) do
    For C := Max(FromColumn,Low(Matrix)) to Min(FromColumn + Pred(Columns),High(Matrix)) do
      Matrix[C,R] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix4RMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix)) to Min(FromRow + Pred(Rows),High(Matrix)) do
    For C := Max(FromColumn,Low(Matrix[0])) to Min(FromColumn + Pred(Columns),High(Matrix[0])) do
      Matrix[R,C] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix4RMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix)) to Min(FromRow + Pred(Rows),High(Matrix)) do
    For C := Max(FromColumn,Low(Matrix[0])) to Min(FromColumn + Pred(Columns),High(Matrix[0])) do
      Matrix[R,C] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix4CMs; FromRow,FromColumn,Rows,Columns: Integer; Value: Single);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix[0])) to Min(FromRow + Pred(Rows),High(Matrix[0])) do
    For C := Max(FromColumn,Low(Matrix)) to Min(FromColumn + Pred(Columns),High(Matrix)) do
      Matrix[C,R] := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure FillSubmatrix(var Matrix: TVMCLMatrix4CMd; FromRow,FromColumn,Rows,Columns: Integer; Value: Double);
var
  R,C:  Integer;
begin
If (Rows > 0) and (Columns > 0) then
  For R := Max(FromRow,Low(Matrix[0])) to Min(FromRow + Pred(Rows),High(Matrix[0])) do
    For C := Max(FromColumn,Low(Matrix)) to Min(FromColumn + Pred(Columns),High(Matrix)) do
      Matrix[C,R] := Value;
end;

{===============================================================================
    Matrix exchanges - implementation
===============================================================================}

{===============================================================================
    Matrix conversions - implementation
===============================================================================}

Function Matrix2(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix2RMs;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix2RMd;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix2CMs;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix2CMd;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix2RMs;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix2RMd;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix2CMs;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix2CMd;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix3RMs;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
Move(Matrix[2],Result[2],SizeOf(Result[2]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix3RMd;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
Move(Matrix[2],Result[2],SizeOf(Result[2]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix3CMs;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
Move(Matrix[2],Result[2],SizeOf(Result[2]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix3CMd;
begin
Move(Matrix[0],Result[0],SizeOf(Result[0]));
Move(Matrix[1],Result[1],SizeOf(Result[1]));
Move(Matrix[2],Result[2],SizeOf(Result[2]));
end;

//==============================================================================



end.
