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

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix2RMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;
procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix2RMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;
procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix2CMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;
procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix2CMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix3RMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;
procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix3RMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;
procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix3CMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;
procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix3CMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix4RMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;
procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix4RMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;
procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix4CMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;
procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix4CMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer); overload;

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix2RMs; SrcRow,DstRow: Integer); overload;
procedure MatrixExchangeRows(var Matrix: TVMCLMatrix2RMd; SrcRow,DstRow: Integer); overload;
procedure MatrixExchangeRows(var Matrix: TVMCLMatrix2CMs; SrcRow,DstRow: Integer); overload;
procedure MatrixExchangeRows(var Matrix: TVMCLMatrix2CMd; SrcRow,DstRow: Integer); overload;

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix3RMs; SrcRow,DstRow: Integer); overload;
procedure MatrixExchangeRows(var Matrix: TVMCLMatrix3RMd; SrcRow,DstRow: Integer); overload;
procedure MatrixExchangeRows(var Matrix: TVMCLMatrix3CMs; SrcRow,DstRow: Integer); overload;
procedure MatrixExchangeRows(var Matrix: TVMCLMatrix3CMd; SrcRow,DstRow: Integer); overload;

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix4RMs; SrcRow,DstRow: Integer); overload;
procedure MatrixExchangeRows(var Matrix: TVMCLMatrix4RMd; SrcRow,DstRow: Integer); overload;
procedure MatrixExchangeRows(var Matrix: TVMCLMatrix4CMs; SrcRow,DstRow: Integer); overload;
procedure MatrixExchangeRows(var Matrix: TVMCLMatrix4CMd; SrcRow,DstRow: Integer); overload;

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix2RMs; SrcColumn,DstColumn: Integer); overload;
procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix2RMd; SrcColumn,DstColumn: Integer); overload;
procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix2CMs; SrcColumn,DstColumn: Integer); overload;
procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix2CMd; SrcColumn,DstColumn: Integer); overload;

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix3RMs; SrcColumn,DstColumn: Integer); overload;
procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix3RMd; SrcColumn,DstColumn: Integer); overload;
procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix3CMs; SrcColumn,DstColumn: Integer); overload;
procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix3CMd; SrcColumn,DstColumn: Integer); overload;

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix4RMs; SrcColumn,DstColumn: Integer); overload;
procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix4RMd; SrcColumn,DstColumn: Integer); overload;
procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix4CMs; SrcColumn,DstColumn: Integer); overload;
procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix4CMd; SrcColumn,DstColumn: Integer); overload;

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
Function Matrix2d(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2RMd; overload;
Function Matrix2s(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMs; overload;
Function Matrix2d(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2CMd; overload;

Function Matrix3s(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMs; overload;
Function Matrix3d(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3RMd; overload;
Function Matrix3s(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMs; overload;
Function Matrix3d(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3CMd; overload;

Function Matrix4s(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMs; overload;
Function Matrix4d(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMd; overload;
Function Matrix4s(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMs; overload;
Function Matrix4d(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMd; overload;

// order conversion
Function Matrix2(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2RMs; overload;
Function Matrix2(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2RMd; overload;
Function Matrix2(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2CMs; overload;
Function Matrix2(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2CMd; overload;

Function Matrix3(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3RMs; overload;
Function Matrix3(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3RMd; overload;
Function Matrix3(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3CMs; overload;
Function Matrix3(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3CMd; overload;

Function Matrix4(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4RMs; overload;
Function Matrix4(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4RMd; overload;
Function Matrix4(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4CMs; overload;
Function Matrix4(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4CMd; overload;

{===============================================================================
    Basic matrix functions (zeroing, comparison, etc.) - declaration
===============================================================================}

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix2RMs); overload;
procedure LoadZeroMatrix(var Matrix: TVMCLMatrix2RMd); overload;
procedure LoadZeroMatrix(var Matrix: TVMCLMatrix2CMs); overload;
procedure LoadZeroMatrix(var Matrix: TVMCLMatrix2CMd); overload;

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix3RMs); overload;
procedure LoadZeroMatrix(var Matrix: TVMCLMatrix3RMd); overload;
procedure LoadZeroMatrix(var Matrix: TVMCLMatrix3CMs); overload;
procedure LoadZeroMatrix(var Matrix: TVMCLMatrix3CMd); overload;

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix4RMs); overload;
procedure LoadZeroMatrix(var Matrix: TVMCLMatrix4RMd); overload;
procedure LoadZeroMatrix(var Matrix: TVMCLMatrix4CMs); overload;
procedure LoadZeroMatrix(var Matrix: TVMCLMatrix4CMd); overload;

Function IsZeroMatrix(const Matrix: TVMCLMatrix2RMs): Boolean; overload;
Function IsZeroMatrix(const Matrix: TVMCLMatrix2RMd): Boolean; overload;
Function IsZeroMatrix(const Matrix: TVMCLMatrix2CMs): Boolean; overload;
Function IsZeroMatrix(const Matrix: TVMCLMatrix2CMd): Boolean; overload;

Function IsZeroMatrix(const Matrix: TVMCLMatrix3RMs): Boolean; overload;
Function IsZeroMatrix(const Matrix: TVMCLMatrix3RMd): Boolean; overload;
Function IsZeroMatrix(const Matrix: TVMCLMatrix3CMs): Boolean; overload;
Function IsZeroMatrix(const Matrix: TVMCLMatrix3CMd): Boolean; overload;

Function IsZeroMatrix(const Matrix: TVMCLMatrix4RMs): Boolean; overload;
Function IsZeroMatrix(const Matrix: TVMCLMatrix4RMd): Boolean; overload;
Function IsZeroMatrix(const Matrix: TVMCLMatrix4CMs): Boolean; overload;
Function IsZeroMatrix(const Matrix: TVMCLMatrix4CMd): Boolean; overload;

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix2RMs); overload;
procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix2RMd); overload;
procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix2CMs); overload;
procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix2CMd); overload;

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix3RMs); overload;
procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix3RMd); overload;
procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix3CMs); overload;
procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix3CMd); overload;

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix4RMs); overload;
procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix4RMd); overload;
procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix4CMs); overload;
procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix4CMd); overload;

Function IsIdentityMatrix(const Matrix: TVMCLMatrix2RMs): Boolean; overload;
Function IsIdentityMatrix(const Matrix: TVMCLMatrix2RMd): Boolean; overload;
Function IsIdentityMatrix(const Matrix: TVMCLMatrix2CMs): Boolean; overload;
Function IsIdentityMatrix(const Matrix: TVMCLMatrix2CMd): Boolean; overload;

Function IsIdentityMatrix(const Matrix: TVMCLMatrix3RMs): Boolean; overload;
Function IsIdentityMatrix(const Matrix: TVMCLMatrix3RMd): Boolean; overload;
Function IsIdentityMatrix(const Matrix: TVMCLMatrix3CMs): Boolean; overload;
Function IsIdentityMatrix(const Matrix: TVMCLMatrix3CMd): Boolean; overload;

Function IsIdentityMatrix(const Matrix: TVMCLMatrix4RMs): Boolean; overload;
Function IsIdentityMatrix(const Matrix: TVMCLMatrix4RMd): Boolean; overload;
Function IsIdentityMatrix(const Matrix: TVMCLMatrix4CMs): Boolean; overload;
Function IsIdentityMatrix(const Matrix: TVMCLMatrix4CMd): Boolean; overload;

procedure CopyMatrix(const Src: TVMCLMatrix2RMs; var Dest: TVMCLMatrix2RMs); overload;
procedure CopyMatrix(const Src: TVMCLMatrix2RMd; var Dest: TVMCLMatrix2RMd); overload;
procedure CopyMatrix(const Src: TVMCLMatrix2CMs; var Dest: TVMCLMatrix2CMs); overload;
procedure CopyMatrix(const Src: TVMCLMatrix2CMd; var Dest: TVMCLMatrix2CMd); overload;

procedure CopyMatrix(const Src: TVMCLMatrix3RMs; var Dest: TVMCLMatrix3RMs); overload;
procedure CopyMatrix(const Src: TVMCLMatrix3RMd; var Dest: TVMCLMatrix3RMd); overload;
procedure CopyMatrix(const Src: TVMCLMatrix3CMs; var Dest: TVMCLMatrix3CMs); overload;
procedure CopyMatrix(const Src: TVMCLMatrix3CMd; var Dest: TVMCLMatrix3CMd); overload;

procedure CopyMatrix(const Src: TVMCLMatrix4RMs; var Dest: TVMCLMatrix4RMs); overload;
procedure CopyMatrix(const Src: TVMCLMatrix4RMd; var Dest: TVMCLMatrix4RMd); overload;
procedure CopyMatrix(const Src: TVMCLMatrix4CMs; var Dest: TVMCLMatrix4CMs); overload;
procedure CopyMatrix(const Src: TVMCLMatrix4CMd; var Dest: TVMCLMatrix4CMd); overload;

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix2RMs): Boolean; overload;
Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix2RMd): Boolean; overload;
Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix2CMs): Boolean; overload;
Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix2CMd): Boolean; overload;

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix3RMs): Boolean; overload;
Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix3RMd): Boolean; overload;
Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix3CMs): Boolean; overload;
Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix3CMd): Boolean; overload;

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix4RMs): Boolean; overload;
Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix4RMd): Boolean; overload;
Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix4CMs): Boolean; overload;
Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix4CMd): Boolean; overload;

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix2RMs; Epsilon: Single = 0): Boolean; overload;
Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix2RMd; Epsilon: Double = 0): Boolean; overload;
Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix2CMs; Epsilon: Single = 0): Boolean; overload;
Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix2CMd; Epsilon: Double = 0): Boolean; overload;

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix3RMs; Epsilon: Single = 0): Boolean; overload;
Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix3RMd; Epsilon: Double = 0): Boolean; overload;
Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix3CMs; Epsilon: Single = 0): Boolean; overload;
Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix3CMd; Epsilon: Double = 0): Boolean; overload;

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix4RMs; Epsilon: Single = 0): Boolean; overload;
Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix4RMd; Epsilon: Double = 0): Boolean; overload;
Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix4CMs; Epsilon: Single = 0): Boolean; overload;
Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix4CMd; Epsilon: Double = 0): Boolean; overload;

Function Invertible(const Matrix: TVMCLMatrix2RMs): Boolean; overload;
Function Invertible(const Matrix: TVMCLMatrix2RMd): Boolean; overload;
Function Invertible(const Matrix: TVMCLMatrix2CMs): Boolean; overload;
Function Invertible(const Matrix: TVMCLMatrix2CMd): Boolean; overload;

Function Invertible(const Matrix: TVMCLMatrix3RMs): Boolean; overload;
Function Invertible(const Matrix: TVMCLMatrix3RMd): Boolean; overload;
Function Invertible(const Matrix: TVMCLMatrix3CMs): Boolean; overload;
Function Invertible(const Matrix: TVMCLMatrix3CMd): Boolean; overload;

Function Invertible(const Matrix: TVMCLMatrix4RMs): Boolean; overload;
Function Invertible(const Matrix: TVMCLMatrix4RMd): Boolean; overload;
Function Invertible(const Matrix: TVMCLMatrix4CMs): Boolean; overload;
Function Invertible(const Matrix: TVMCLMatrix4CMd): Boolean; overload;

{===============================================================================
    Basic Matrix calculations - declaration
===============================================================================}

procedure Transpose(var Matrix: TVMCLMatrix2RMs); overload;
procedure Transpose(var Matrix: TVMCLMatrix2RMd); overload;
procedure Transpose(var Matrix: TVMCLMatrix2CMs); overload;
procedure Transpose(var Matrix: TVMCLMatrix2CMd); overload;

procedure Transpose(var Matrix: TVMCLMatrix3RMs); overload;
procedure Transpose(var Matrix: TVMCLMatrix3RMd); overload;
procedure Transpose(var Matrix: TVMCLMatrix3CMs); overload;
procedure Transpose(var Matrix: TVMCLMatrix3CMd); overload;

procedure Transpose(var Matrix: TVMCLMatrix4RMs); overload;
procedure Transpose(var Matrix: TVMCLMatrix4RMd); overload;
procedure Transpose(var Matrix: TVMCLMatrix4CMs); overload;
procedure Transpose(var Matrix: TVMCLMatrix4CMd); overload;

Function Transposed(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs; overload;
Function Transposed(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd; overload;
Function Transposed(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs; overload;
Function Transposed(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; overload;

Function Transposed(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs; overload;
Function Transposed(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd; overload;
Function Transposed(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs; overload;
Function Transposed(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd; overload;

Function Transposed(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs; overload;
Function Transposed(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd; overload;
Function Transposed(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs; overload;
Function Transposed(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd; overload;

Function Negative(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs; overload;
Function Negative(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd; overload;
Function Negative(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs; overload;
Function Negative(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; overload;

Function Negative(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs; overload;
Function Negative(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd; overload;
Function Negative(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs; overload;
Function Negative(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd; overload;

Function Negative(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs; overload;
Function Negative(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd; overload;
Function Negative(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs; overload;
Function Negative(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd; overload;

Function Determinant(const Matrix: TVMCLMatrix2RMs): Single; overload;
Function Determinant(const Matrix: TVMCLMatrix2RMd): Double; overload;
Function Determinant(const Matrix: TVMCLMatrix2CMs): Single; overload;
Function Determinant(const Matrix: TVMCLMatrix2CMd): Double; overload;

Function Determinant(const Matrix: TVMCLMatrix3RMs): Single; overload;
Function Determinant(const Matrix: TVMCLMatrix3RMd): Double; overload;
Function Determinant(const Matrix: TVMCLMatrix3CMs): Single; overload;
Function Determinant(const Matrix: TVMCLMatrix3CMd): Double; overload;

Function Determinant(const Matrix: TVMCLMatrix4RMs): Single; overload;
Function Determinant(const Matrix: TVMCLMatrix4RMd): Double; overload;
Function Determinant(const Matrix: TVMCLMatrix4CMs): Single; overload;
Function Determinant(const Matrix: TVMCLMatrix4CMd): Double; overload;

procedure Orthonormalize(var Matrix: TVMCLMatrix2RMs); overload;
procedure Orthonormalize(var Matrix: TVMCLMatrix2RMd); overload;
procedure Orthonormalize(var Matrix: TVMCLMatrix2CMs); overload;
procedure Orthonormalize(var Matrix: TVMCLMatrix2CMd); overload;

procedure Orthonormalize(var Matrix: TVMCLMatrix3RMs); overload;
procedure Orthonormalize(var Matrix: TVMCLMatrix3RMd); overload;
procedure Orthonormalize(var Matrix: TVMCLMatrix3CMs); overload;
procedure Orthonormalize(var Matrix: TVMCLMatrix3CMd); overload;

procedure Orthonormalize(var Matrix: TVMCLMatrix4RMs); overload;
procedure Orthonormalize(var Matrix: TVMCLMatrix4RMd); overload;
procedure Orthonormalize(var Matrix: TVMCLMatrix4CMs); overload;
procedure Orthonormalize(var Matrix: TVMCLMatrix4CMd); overload;

procedure Inverse(var Matrix: TVMCLMatrix2RMs); overload;
procedure Inverse(var Matrix: TVMCLMatrix2RMd); overload;
procedure Inverse(var Matrix: TVMCLMatrix2CMs); overload;
procedure Inverse(var Matrix: TVMCLMatrix2CMd); overload;

procedure Inverse(var Matrix: TVMCLMatrix3RMs); overload;
procedure Inverse(var Matrix: TVMCLMatrix3RMd); overload;
procedure Inverse(var Matrix: TVMCLMatrix3CMs); overload;
procedure Inverse(var Matrix: TVMCLMatrix3CMd); overload;

procedure Inverse(var Matrix: TVMCLMatrix4RMs); overload;
procedure Inverse(var Matrix: TVMCLMatrix4RMd); overload;
procedure Inverse(var Matrix: TVMCLMatrix4CMs); overload;
procedure Inverse(var Matrix: TVMCLMatrix4CMd); overload;

procedure InverseAffine(var Matrix: TVMCLMatrix4RMs); overload;
procedure InverseAffine(var Matrix: TVMCLMatrix4RMd); overload;
procedure InverseAffine(var Matrix: TVMCLMatrix4CMs); overload;
procedure InverseAffine(var Matrix: TVMCLMatrix4CMd); overload;

Function Inversed(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs; overload;
Function Inversed(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd; overload;
Function Inversed(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs; overload;
Function Inversed(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; overload;

Function Inversed(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs; overload;
Function Inversed(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd; overload;
Function Inversed(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs; overload;
Function Inversed(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd; overload;

Function Inversed(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs; overload;
Function Inversed(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd; overload;
Function Inversed(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs; overload;
Function Inversed(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd; overload;

Function InversedAffine(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs; overload;
Function InversedAffine(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd; overload;
Function InversedAffine(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs; overload;
Function InversedAffine(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd; overload;

{===============================================================================
    Calculations with one matrix - declaration
===============================================================================}

Function ScalarMultiply(const Matrix: TVMCLMatrix2RMs; Scalar: Single): TVMCLMatrix2RMs; overload;
Function ScalarMultiply(const Matrix: TVMCLMatrix2RMd; Scalar: Double): TVMCLMatrix2RMd; overload;
Function ScalarMultiply(const Matrix: TVMCLMatrix2CMs; Scalar: Single): TVMCLMatrix2CMs; overload;
Function ScalarMultiply(const Matrix: TVMCLMatrix2CMd; Scalar: Double): TVMCLMatrix2CMd; overload;

Function ScalarMultiply(const Matrix: TVMCLMatrix3RMs; Scalar: Single): TVMCLMatrix3RMs; overload;
Function ScalarMultiply(const Matrix: TVMCLMatrix3RMd; Scalar: Double): TVMCLMatrix3RMd; overload;
Function ScalarMultiply(const Matrix: TVMCLMatrix3CMs; Scalar: Single): TVMCLMatrix3CMs; overload;
Function ScalarMultiply(const Matrix: TVMCLMatrix3CMd; Scalar: Double): TVMCLMatrix3CMd; overload;

Function ScalarMultiply(const Matrix: TVMCLMatrix4RMs; Scalar: Single): TVMCLMatrix4RMs; overload;
Function ScalarMultiply(const Matrix: TVMCLMatrix4RMd; Scalar: Double): TVMCLMatrix4RMd; overload;
Function ScalarMultiply(const Matrix: TVMCLMatrix4CMs; Scalar: Single): TVMCLMatrix4CMs; overload;
Function ScalarMultiply(const Matrix: TVMCLMatrix4CMd; Scalar: Double): TVMCLMatrix4CMd; overload;

Function VectorMultiply(const Matrix: TVMCLMatrix2RMs; const Vector: TVMCLVector2s): TVMCLVector2s; overload;
Function VectorMultiply(const Matrix: TVMCLMatrix2RMd; const Vector: TVMCLVector2d): TVMCLVector2d; overload;
Function VectorMultiply(const Matrix: TVMCLMatrix2CMs; const Vector: TVMCLVector2s): TVMCLVector2s; overload;
Function VectorMultiply(const Matrix: TVMCLMatrix2CMd; const Vector: TVMCLVector2d): TVMCLVector2d; overload;

Function VectorMultiply(const Matrix: TVMCLMatrix3RMs; const Vector: TVMCLVector3s): TVMCLVector3s; overload;
Function VectorMultiply(const Matrix: TVMCLMatrix3RMd; const Vector: TVMCLVector3d): TVMCLVector3d; overload;
Function VectorMultiply(const Matrix: TVMCLMatrix3CMs; const Vector: TVMCLVector3s): TVMCLVector3s; overload;
Function VectorMultiply(const Matrix: TVMCLMatrix3CMd; const Vector: TVMCLVector3d): TVMCLVector3d; overload;

Function VectorMultiply(const Matrix: TVMCLMatrix4RMs; const Vector: TVMCLVector4s): TVMCLVector4s; overload;
Function VectorMultiply(const Matrix: TVMCLMatrix4RMd; const Vector: TVMCLVector4d): TVMCLVector4d; overload;
Function VectorMultiply(const Matrix: TVMCLMatrix4CMs; const Vector: TVMCLVector4s): TVMCLVector4s; overload;
Function VectorMultiply(const Matrix: TVMCLMatrix4CMd; const Vector: TVMCLVector4d): TVMCLVector4d; overload;

{===============================================================================
    Calculations with multiple matrices - declaration
===============================================================================}

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs; overload;
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd; overload;
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs; overload;
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; overload;

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs; overload;
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd; overload;
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs; overload;
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd; overload;

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs; overload;
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd; overload;
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs; overload;
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd; overload;

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs; overload;
Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd; overload;
Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs; overload;
Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; overload;

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs; overload;
Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd; overload;
Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs; overload;
Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd; overload;

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs; overload;
Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd; overload;
Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs; overload;
Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd; overload;

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs; overload;
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd; overload;
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs; overload;
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; overload;

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs; overload;
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd; overload;
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs; overload;
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd; overload;

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs; overload;
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd; overload;
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs; overload;
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd; overload;

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

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix2RMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Single;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := Matrix[SrcRow,SrcColumn];
    Matrix[SrcRow,SrcColumn] := Matrix[DstRow,DstColumn];
    Matrix[DstRow,DstColumn] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix2RMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Double;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := Matrix[SrcRow,SrcColumn];
    Matrix[SrcRow,SrcColumn] := Matrix[DstRow,DstColumn];
    Matrix[DstRow,DstColumn] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix2CMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Single;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := Matrix[SrcColumn,SrcRow];
    Matrix[SrcColumn,SrcRow] := Matrix[DstColumn,DstRow];
    Matrix[DstColumn,DstRow] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix2CMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Double;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := Matrix[SrcColumn,SrcRow];
    Matrix[SrcColumn,SrcRow] := Matrix[DstColumn,DstRow];
    Matrix[DstColumn,DstRow] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix3RMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Single;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := Matrix[SrcRow,SrcColumn];
    Matrix[SrcRow,SrcColumn] := Matrix[DstRow,DstColumn];
    Matrix[DstRow,DstColumn] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix3RMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Double;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := Matrix[SrcRow,SrcColumn];
    Matrix[SrcRow,SrcColumn] := Matrix[DstRow,DstColumn];
    Matrix[DstRow,DstColumn] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix3CMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Single;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := Matrix[SrcColumn,SrcRow];
    Matrix[SrcColumn,SrcRow] := Matrix[DstColumn,DstRow];
    Matrix[DstColumn,DstRow] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix3CMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
 var
  Temp: Double;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := Matrix[SrcColumn,SrcRow];
    Matrix[SrcColumn,SrcRow] := Matrix[DstColumn,DstRow];
    Matrix[DstColumn,DstRow] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix4RMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Single;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := Matrix[SrcRow,SrcColumn];
    Matrix[SrcRow,SrcColumn] := Matrix[DstRow,DstColumn];
    Matrix[DstRow,DstColumn] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix4RMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Double;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := Matrix[SrcRow,SrcColumn];
    Matrix[SrcRow,SrcColumn] := Matrix[DstRow,DstColumn];
    Matrix[DstRow,DstColumn] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix4CMs; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Single;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := Matrix[SrcColumn,SrcRow];
    Matrix[SrcColumn,SrcRow] := Matrix[DstColumn,DstRow];
    Matrix[DstColumn,DstRow] := Temp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeEntries(var Matrix: TVMCLMatrix4CMd; SrcRow,SrcColumn,DstRow,DstColumn: Integer);
var
  Temp: Double;
begin
If (SrcRow <> DstRow) or (SrcColumn <> DstColumn) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := Matrix[SrcColumn,SrcRow];
    Matrix[SrcColumn,SrcRow] := Matrix[DstColumn,DstRow];
    Matrix[DstColumn,DstRow] := Temp;
  end;
end;

//==============================================================================

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix2RMs; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector2s;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix2RMd; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector2d;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix2CMs; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector2s;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix2CMd; SrcRow,DstRow: Integer); 
var
  Temp: TVMCLVector2d;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix3RMs; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector3s;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix3RMd; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector3d;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix3CMs; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector3s;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix3CMd; SrcRow,DstRow: Integer); 
var
  Temp: TVMCLVector3d;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix4RMs; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector4s;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix4RMd; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector4d;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix),High(Matrix)) and
   CheckRange(DstRow,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix4CMs; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector4s;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeRows(var Matrix: TVMCLMatrix4CMd; SrcRow,DstRow: Integer);
var
  Temp: TVMCLVector4d;
begin
If (SrcRow <> DstRow) and
   CheckRange(SrcRow,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstRow,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetRow(Matrix,DstRow);
    MatrixSetRow(Matrix,DstRow,MatrixGetRow(Matrix,SrcRow));
    MatrixSetRow(Matrix,SrcRow,Temp);
  end;
end;

//==============================================================================

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix2RMs; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector2s;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix2RMd; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector2d;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix2CMs; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector2s;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix2CMd; SrcColumn,DstColumn: Integer); 
var
  Temp: TVMCLVector2d;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix3RMs; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector3s;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix3RMd; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector3d;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix3CMs; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector3s;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix3CMd; SrcColumn,DstColumn: Integer); 
var
  Temp: TVMCLVector3d;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix4RMs; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector4s;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix4RMd; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector4d;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix[0]),High(Matrix[0])) and
   CheckRange(DstColumn,Low(Matrix[0]),High(Matrix[0])) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix4CMs; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector4s;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure MatrixExchangeColumns(var Matrix: TVMCLMatrix4CMd; SrcColumn,DstColumn: Integer);
var
  Temp: TVMCLVector4d;
begin
If (SrcColumn <> DstColumn) and
   CheckRange(SrcColumn,Low(Matrix),High(Matrix)) and
   CheckRange(DstColumn,Low(Matrix),High(Matrix)) then
  begin
    Temp := MatrixGetColumn(Matrix,DstColumn);
    MatrixSetColumn(Matrix,DstColumn,MatrixGetColumn(Matrix,SrcColumn));
    MatrixSetColumn(Matrix,SrcColumn,Temp);
  end;
end;

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

Function Matrix3(const Matrix: TVMCLMatrix2RMs; IdentityMatrix: Boolean = False): TVMCLMatrix3RMs;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix3RMs
else
  Result := VMCL_ZeroMatrix3RMs;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix2RMd; IdentityMatrix: Boolean = False): TVMCLMatrix3RMd;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix3RMd
else
  Result := VMCL_ZeroMatrix3RMd;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix2CMs; IdentityMatrix: Boolean = False): TVMCLMatrix3CMs;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix3CMs
else
  Result := VMCL_ZeroMatrix3CMs;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix2CMd; IdentityMatrix: Boolean = False): TVMCLMatrix3CMd;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix3CMd
else
  Result := VMCL_ZeroMatrix3CMd;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix2RMs; IdentityMatrix: Boolean = False): TVMCLMatrix4RMs;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix4RMs
else
  Result := VMCL_ZeroMatrix4RMs;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix2RMd; IdentityMatrix: Boolean = False): TVMCLMatrix4RMd;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix4RMd
else
  Result := VMCL_ZeroMatrix4RMd;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix2CMs; IdentityMatrix: Boolean = False): TVMCLMatrix4CMs;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix4CMs
else
  Result := VMCL_ZeroMatrix4CMs;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix2CMd; IdentityMatrix: Boolean = False): TVMCLMatrix4CMd; 
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix4CMd
else
  Result := VMCL_ZeroMatrix4CMd;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix3RMs; IdentityMatrix: Boolean = False): TVMCLMatrix4RMs;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix4RMs
else
  Result := VMCL_ZeroMatrix4RMs;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
Move(Matrix[2],Result[2],SizeOf(Matrix[2]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix3RMd; IdentityMatrix: Boolean = False): TVMCLMatrix4RMd;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix4RMd
else
  Result := VMCL_ZeroMatrix4RMd;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
Move(Matrix[2],Result[2],SizeOf(Matrix[2]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix3CMs; IdentityMatrix: Boolean = False): TVMCLMatrix4CMs;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix4CMs
else
  Result := VMCL_ZeroMatrix4CMs;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
Move(Matrix[2],Result[2],SizeOf(Matrix[2]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix3CMd; IdentityMatrix: Boolean = False): TVMCLMatrix4CMd;
begin
If IdentityMatrix then
  Result := VMCL_IdentityMatrix4CMd
else
  Result := VMCL_ZeroMatrix4CMd;
Move(Matrix[0],Result[0],SizeOf(Matrix[0]));
Move(Matrix[1],Result[1],SizeOf(Matrix[1]));
Move(Matrix[2],Result[2],SizeOf(Matrix[2]));
end;

//==============================================================================

Function Matrix2s(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := TVMCLMatrix2do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---
 
Function Matrix2d(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := TVMCLMatrix2so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2s(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := TVMCLMatrix2do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2d(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := TVMCLMatrix2so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3s(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1]; Result[0,2] := Matrix[0,2];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[1,2];
Result[2,0] := Matrix[2,0]; Result[2,1] := Matrix[2,1]; Result[2,2] := Matrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := TVMCLMatrix3do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3d(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1]; Result[0,2] := Matrix[0,2];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[1,2];
Result[2,0] := Matrix[2,0]; Result[2,1] := Matrix[2,1]; Result[2,2] := Matrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := TVMCLMatrix3so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3s(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1]; Result[0,2] := Matrix[0,2];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[1,2];
Result[2,0] := Matrix[2,0]; Result[2,1] := Matrix[2,1]; Result[2,2] := Matrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := TVMCLMatrix3do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3d(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1]; Result[0,2] := Matrix[0,2];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[1,2];
Result[2,0] := Matrix[2,0]; Result[2,1] := Matrix[2,1]; Result[2,2] := Matrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := TVMCLMatrix3so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4s(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1]; Result[0,2] := Matrix[0,2]; Result[0,3] := Matrix[0,3];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[1,2]; Result[1,3] := Matrix[1,3];
Result[2,0] := Matrix[2,0]; Result[2,1] := Matrix[2,1]; Result[2,2] := Matrix[2,2]; Result[2,3] := Matrix[2,3];
Result[3,0] := Matrix[3,0]; Result[3,1] := Matrix[3,1]; Result[3,2] := Matrix[3,2]; Result[3,3] := Matrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := TVMCLMatrix4do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4d(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1]; Result[0,2] := Matrix[0,2]; Result[0,3] := Matrix[0,3];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[1,2]; Result[1,3] := Matrix[1,3];
Result[2,0] := Matrix[2,0]; Result[2,1] := Matrix[2,1]; Result[2,2] := Matrix[2,2]; Result[2,3] := Matrix[2,3];
Result[3,0] := Matrix[3,0]; Result[3,1] := Matrix[3,1]; Result[3,2] := Matrix[3,2]; Result[3,3] := Matrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := TVMCLMatrix4so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4s(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1]; Result[0,2] := Matrix[0,2]; Result[0,3] := Matrix[0,3];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[1,2]; Result[1,3] := Matrix[1,3];
Result[2,0] := Matrix[2,0]; Result[2,1] := Matrix[2,1]; Result[2,2] := Matrix[2,2]; Result[2,3] := Matrix[2,3];
Result[3,0] := Matrix[3,0]; Result[3,1] := Matrix[3,1]; Result[3,2] := Matrix[3,2]; Result[3,3] := Matrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := TVMCLMatrix4do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4d(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[0,1]; Result[0,2] := Matrix[0,2]; Result[0,3] := Matrix[0,3];
Result[1,0] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[1,2]; Result[1,3] := Matrix[1,3];
Result[2,0] := Matrix[2,0]; Result[2,1] := Matrix[2,1]; Result[2,2] := Matrix[2,2]; Result[2,3] := Matrix[2,3];
Result[3,0] := Matrix[3,0]; Result[3,1] := Matrix[3,1]; Result[3,2] := Matrix[3,2]; Result[3,3] := Matrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := TVMCLMatrix4so(Matrix)[i];
end;
{$ENDIF}

//==============================================================================

Function Matrix2(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2RMs;
begin
Result := TVMCLMatrix2RMs(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2RMd;
begin
Result := TVMCLMatrix2RMd(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2CMs;
begin
Result := TVMCLMatrix2CMs(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix2(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2CMd;
begin
Result := TVMCLMatrix2CMd(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3RMs;
begin
Result := TVMCLMatrix3RMs(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3RMd;
begin
Result := TVMCLMatrix3RMd(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3CMs;
begin
Result := TVMCLMatrix3CMs(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix3(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3CMd;
begin
Result := TVMCLMatrix3CMd(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4RMs;
begin
Result := TVMCLMatrix4RMs(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4RMd;
begin
Result := TVMCLMatrix4RMd(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4CMs;
begin
Result := TVMCLMatrix4CMs(Transposed(Matrix));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Matrix4(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4CMd;
begin
Result := TVMCLMatrix4CMd(Transposed(Matrix));
end;

{===============================================================================
    Basic matrix functions (zeroing, comparison, etc.) - implementation
===============================================================================}

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix2RMs);
begin
Matrix := VMCL_ZeroMatrix2RMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix2RMd);
begin
Matrix := VMCL_ZeroMatrix2RMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix2CMs);
begin
Matrix := VMCL_ZeroMatrix2CMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix2CMd);
begin
Matrix := VMCL_ZeroMatrix2CMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix3RMs);
begin
Matrix := VMCL_ZeroMatrix3RMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix3RMd);
begin
Matrix := VMCL_ZeroMatrix3RMd
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix3CMs);
begin
Matrix := VMCL_ZeroMatrix3CMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix3CMd);
begin
Matrix := VMCL_ZeroMatrix3CMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix4RMs);
begin
Matrix := VMCL_ZeroMatrix4RMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix4RMd);
begin
Matrix := VMCL_ZeroMatrix4RMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix4CMs);
begin
Matrix := VMCL_ZeroMatrix4CMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroMatrix(var Matrix: TVMCLMatrix4CMd);
begin
Matrix := VMCL_ZeroMatrix4CMd;
end;

//==============================================================================

Function IsZeroMatrix(const Matrix: TVMCLMatrix2RMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix2RMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix2RMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix2RMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix2CMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix2CMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix2CMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix2CMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix3RMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix3RMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix3RMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix3RMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix3CMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix3CMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix3CMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix3CMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix4RMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix4RMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix4RMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix4RMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix4CMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix4CMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroMatrix(const Matrix: TVMCLMatrix4CMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_ZeroMatrix4CMd);
end;

//==============================================================================

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix2RMs);
begin
Matrix := VMCL_IdentityMatrix2RMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix2RMd);
begin
Matrix := VMCL_IdentityMatrix2RMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix2CMs);
begin
Matrix := VMCL_IdentityMatrix2CMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix2CMd);
begin
Matrix := VMCL_IdentityMatrix2CMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix3RMs);
begin
Matrix := VMCL_IdentityMatrix3RMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix3RMd);
begin
Matrix := VMCL_IdentityMatrix3RMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix3CMs);
begin
Matrix := VMCL_IdentityMatrix3CMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix3CMd);
begin
Matrix := VMCL_IdentityMatrix3CMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix4RMs);
begin
Matrix := VMCL_IdentityMatrix4RMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix4RMd);
begin
Matrix := VMCL_IdentityMatrix4RMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix4CMs);
begin
Matrix := VMCL_IdentityMatrix4CMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadIdentityMatrix(var Matrix: TVMCLMatrix4CMd);
begin
Matrix := VMCL_IdentityMatrix4CMd;
end;

//==============================================================================

Function IsIdentityMatrix(const Matrix: TVMCLMatrix2RMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix2RMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix2RMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix2RMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix2CMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix2CMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix2CMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix2CMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix3RMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix3RMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix3RMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix3RMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix3CMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix3CMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix3CMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix3CMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix4RMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix4RMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix4RMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix4RMd);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix4CMs): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix4CMs);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsIdentityMatrix(const Matrix: TVMCLMatrix4CMd): Boolean;
begin
Result := EqualMatrices(Matrix,VMCL_IdentityMatrix4CMd);
end;

//==============================================================================

procedure CopyMatrix(const Src: TVMCLMatrix2RMs; var Dest: TVMCLMatrix2RMs);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix2RMd; var Dest: TVMCLMatrix2RMd);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix2CMs; var Dest: TVMCLMatrix2CMs);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix2CMd; var Dest: TVMCLMatrix2CMd);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix3RMs; var Dest: TVMCLMatrix3RMs);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix3RMd; var Dest: TVMCLMatrix3RMd);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix3CMs; var Dest: TVMCLMatrix3CMs);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix3CMd; var Dest: TVMCLMatrix3CMd);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix4RMs; var Dest: TVMCLMatrix4RMs);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix4RMd; var Dest: TVMCLMatrix4RMd);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix4CMs; var Dest: TVMCLMatrix4CMs);
begin
Move(Src,Dest,SizeOf(Src));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyMatrix(const Src: TVMCLMatrix4CMd; var Dest: TVMCLMatrix4CMd);
begin
Move(Src,Dest,SizeOf(Src));
end;

//==============================================================================

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix2RMs): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[0,1] = bMatrix[0,1]) and
          (aMatrix[1,0] = bMatrix[1,0]) and (aMatrix[1,1] = bMatrix[1,1]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  If TVMCLMatrix2so(aMatrix)[i] <> TVMCLMatrix2so(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix2RMd): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[0,1] = bMatrix[0,1]) and
          (aMatrix[1,0] = bMatrix[1,0]) and (aMatrix[1,1] = bMatrix[1,1]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  If TVMCLMatrix2do(aMatrix)[i] <> TVMCLMatrix2do(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix2CMs): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[1,0] = bMatrix[1,0]) and
          (aMatrix[0,1] = bMatrix[0,1]) and (aMatrix[1,1] = bMatrix[1,1]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  If TVMCLMatrix2so(aMatrix)[i] <> TVMCLMatrix2so(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix2CMd): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[1,0] = bMatrix[1,0]) and
          (aMatrix[0,1] = bMatrix[0,1]) and (aMatrix[1,1] = bMatrix[1,1]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  If TVMCLMatrix2do(aMatrix)[i] <> TVMCLMatrix2do(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix3RMs): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[0,1] = bMatrix[0,1]) and (aMatrix[0,2] = bMatrix[0,2]) and
          (aMatrix[1,0] = bMatrix[1,0]) and (aMatrix[1,1] = bMatrix[1,1]) and (aMatrix[1,2] = bMatrix[1,2]) and
          (aMatrix[2,0] = bMatrix[2,0]) and (aMatrix[2,1] = bMatrix[2,1]) and (aMatrix[2,2] = bMatrix[2,2]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  If TVMCLMatrix3so(aMatrix)[i] <> TVMCLMatrix3so(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix3RMd): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[0,1] = bMatrix[0,1]) and (aMatrix[0,2] = bMatrix[0,2]) and
          (aMatrix[1,0] = bMatrix[1,0]) and (aMatrix[1,1] = bMatrix[1,1]) and (aMatrix[1,2] = bMatrix[1,2]) and
          (aMatrix[2,0] = bMatrix[2,0]) and (aMatrix[2,1] = bMatrix[2,1]) and (aMatrix[2,2] = bMatrix[2,2]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  If TVMCLMatrix3do(aMatrix)[i] <> TVMCLMatrix3do(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix3CMs): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[1,0] = bMatrix[1,0]) and (aMatrix[2,0] = bMatrix[2,0]) and
          (aMatrix[0,1] = bMatrix[0,1]) and (aMatrix[1,1] = bMatrix[1,1]) and (aMatrix[2,1] = bMatrix[2,1]) and
          (aMatrix[0,2] = bMatrix[0,2]) and (aMatrix[1,2] = bMatrix[1,2]) and (aMatrix[2,2] = bMatrix[2,2]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  If TVMCLMatrix3so(aMatrix)[i] <> TVMCLMatrix3so(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix3CMd): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[1,0] = bMatrix[1,0]) and (aMatrix[2,0] = bMatrix[2,0]) and
          (aMatrix[0,1] = bMatrix[0,1]) and (aMatrix[1,1] = bMatrix[1,1]) and (aMatrix[2,1] = bMatrix[2,1]) and
          (aMatrix[0,2] = bMatrix[0,2]) and (aMatrix[1,2] = bMatrix[1,2]) and (aMatrix[2,2] = bMatrix[2,2]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  If TVMCLMatrix3do(aMatrix)[i] <> TVMCLMatrix3do(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix4RMs): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[0,1] = bMatrix[0,1]) and
          (aMatrix[0,2] = bMatrix[0,2]) and (aMatrix[0,3] = bMatrix[0,3]) and
          (aMatrix[1,0] = bMatrix[1,0]) and (aMatrix[1,1] = bMatrix[1,1]) and
          (aMatrix[1,2] = bMatrix[1,2]) and (aMatrix[1,3] = bMatrix[1,3]) and
          (aMatrix[2,0] = bMatrix[2,0]) and (aMatrix[2,1] = bMatrix[2,1]) and
          (aMatrix[2,2] = bMatrix[2,2]) and (aMatrix[2,3] = bMatrix[2,3]) and
          (aMatrix[3,0] = bMatrix[3,0]) and (aMatrix[3,1] = bMatrix[3,1]) and
          (aMatrix[3,2] = bMatrix[3,2]) and (aMatrix[3,3] = bMatrix[3,3]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  If TVMCLMatrix4so(aMatrix)[i] <> TVMCLMatrix4so(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix4RMd): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[0,1] = bMatrix[0,1]) and
          (aMatrix[0,2] = bMatrix[0,2]) and (aMatrix[0,3] = bMatrix[0,3]) and
          (aMatrix[1,0] = bMatrix[1,0]) and (aMatrix[1,1] = bMatrix[1,1]) and
          (aMatrix[1,2] = bMatrix[1,2]) and (aMatrix[1,3] = bMatrix[1,3]) and
          (aMatrix[2,0] = bMatrix[2,0]) and (aMatrix[2,1] = bMatrix[2,1]) and
          (aMatrix[2,2] = bMatrix[2,2]) and (aMatrix[2,3] = bMatrix[2,3]) and
          (aMatrix[3,0] = bMatrix[3,0]) and (aMatrix[3,1] = bMatrix[3,1]) and
          (aMatrix[3,2] = bMatrix[3,2]) and (aMatrix[3,3] = bMatrix[3,3]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  If TVMCLMatrix4do(aMatrix)[i] <> TVMCLMatrix4do(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix4CMs): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[1,0] = bMatrix[1,0]) and
          (aMatrix[2,0] = bMatrix[2,0]) and (aMatrix[3,0] = bMatrix[3,0]) and
          (aMatrix[0,1] = bMatrix[0,1]) and (aMatrix[1,1] = bMatrix[1,1]) and
          (aMatrix[2,1] = bMatrix[2,1]) and (aMatrix[3,1] = bMatrix[3,1]) and
          (aMatrix[0,2] = bMatrix[0,2]) and (aMatrix[1,2] = bMatrix[1,2]) and
          (aMatrix[2,2] = bMatrix[2,2]) and (aMatrix[3,2] = bMatrix[3,2]) and
          (aMatrix[0,3] = bMatrix[0,3]) and (aMatrix[1,3] = bMatrix[1,3]) and
          (aMatrix[2,3] = bMatrix[2,3]) and (aMatrix[3,3] = bMatrix[3,3]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  If TVMCLMatrix4so(aMatrix)[i] <> TVMCLMatrix4so(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualMatrices(const aMatrix,bMatrix: TVMCLMatrix4CMd): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := (aMatrix[0,0] = bMatrix[0,0]) and (aMatrix[1,0] = bMatrix[1,0]) and
          (aMatrix[2,0] = bMatrix[2,0]) and (aMatrix[3,0] = bMatrix[3,0]) and
          (aMatrix[0,1] = bMatrix[0,1]) and (aMatrix[1,1] = bMatrix[1,1]) and
          (aMatrix[2,1] = bMatrix[2,1]) and (aMatrix[3,1] = bMatrix[3,1]) and
          (aMatrix[0,2] = bMatrix[0,2]) and (aMatrix[1,2] = bMatrix[1,2]) and
          (aMatrix[2,2] = bMatrix[2,2]) and (aMatrix[3,2] = bMatrix[3,2]) and
          (aMatrix[0,3] = bMatrix[0,3]) and (aMatrix[1,3] = bMatrix[1,3]) and
          (aMatrix[2,3] = bMatrix[2,3]) and (aMatrix[3,3] = bMatrix[3,3]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  If TVMCLMatrix4do(aMatrix)[i] <> TVMCLMatrix4do(bMatrix)[i] then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//==============================================================================

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix2RMs; Epsilon: Single = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  If not SameValue(TVMCLMatrix2so(aMatrix)[i],TVMCLMatrix2so(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix2RMd; Epsilon: Double = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  If not SameValue(TVMCLMatrix2do(aMatrix)[i],TVMCLMatrix2do(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix2CMs; Epsilon: Single = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  If not SameValue(TVMCLMatrix2so(aMatrix)[i],TVMCLMatrix2so(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix2CMd; Epsilon: Double = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  If not SameValue(TVMCLMatrix2do(aMatrix)[i],TVMCLMatrix2do(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix3RMs; Epsilon: Single = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[0,2],bMatrix[0,2],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon) and
          SameValue(aMatrix[1,2],bMatrix[1,2],Epsilon) and
          SameValue(aMatrix[2,0],bMatrix[2,0],Epsilon) and
          SameValue(aMatrix[2,1],bMatrix[2,1],Epsilon) and
          SameValue(aMatrix[2,2],bMatrix[2,2],Epsilon) ;
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  If not SameValue(TVMCLMatrix3so(aMatrix)[i],TVMCLMatrix3so(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix3RMd; Epsilon: Double = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[0,2],bMatrix[0,2],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon) and
          SameValue(aMatrix[1,2],bMatrix[1,2],Epsilon) and
          SameValue(aMatrix[2,0],bMatrix[2,0],Epsilon) and
          SameValue(aMatrix[2,1],bMatrix[2,1],Epsilon) and
          SameValue(aMatrix[2,2],bMatrix[2,2],Epsilon) ;
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  If not SameValue(TVMCLMatrix3do(aMatrix)[i],TVMCLMatrix3do(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix3CMs; Epsilon: Single = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[2,0],bMatrix[2,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon) and
          SameValue(aMatrix[2,1],bMatrix[2,1],Epsilon) and
          SameValue(aMatrix[0,2],bMatrix[0,2],Epsilon) and
          SameValue(aMatrix[1,2],bMatrix[1,2],Epsilon) and
          SameValue(aMatrix[2,2],bMatrix[2,2],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  If not SameValue(TVMCLMatrix3so(aMatrix)[i],TVMCLMatrix3so(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix3CMd; Epsilon: Double = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[2,0],bMatrix[2,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon) and
          SameValue(aMatrix[2,1],bMatrix[2,1],Epsilon) and
          SameValue(aMatrix[0,2],bMatrix[0,2],Epsilon) and
          SameValue(aMatrix[1,2],bMatrix[1,2],Epsilon) and
          SameValue(aMatrix[2,2],bMatrix[2,2],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  If not SameValue(TVMCLMatrix3do(aMatrix)[i],TVMCLMatrix3do(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix4RMs; Epsilon: Single = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[0,2],bMatrix[0,2],Epsilon) and SameValue(aMatrix[0,3],bMatrix[0,3],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon) and
          SameValue(aMatrix[1,2],bMatrix[1,2],Epsilon) and SameValue(aMatrix[1,3],bMatrix[1,3],Epsilon) and
          SameValue(aMatrix[2,0],bMatrix[2,0],Epsilon) and SameValue(aMatrix[2,1],bMatrix[2,1],Epsilon) and
          SameValue(aMatrix[2,2],bMatrix[2,2],Epsilon) and SameValue(aMatrix[2,3],bMatrix[2,3],Epsilon) and
          SameValue(aMatrix[3,0],bMatrix[3,0],Epsilon) and SameValue(aMatrix[3,1],bMatrix[3,1],Epsilon) and
          SameValue(aMatrix[3,2],bMatrix[3,2],Epsilon) and SameValue(aMatrix[3,3],bMatrix[3,3],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  If not SameValue(TVMCLMatrix4so(aMatrix)[i],TVMCLMatrix4so(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix4RMd; Epsilon: Double = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and
          SameValue(aMatrix[0,2],bMatrix[0,2],Epsilon) and SameValue(aMatrix[0,3],bMatrix[0,3],Epsilon) and
          SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon) and
          SameValue(aMatrix[1,2],bMatrix[1,2],Epsilon) and SameValue(aMatrix[1,3],bMatrix[1,3],Epsilon) and
          SameValue(aMatrix[2,0],bMatrix[2,0],Epsilon) and SameValue(aMatrix[2,1],bMatrix[2,1],Epsilon) and
          SameValue(aMatrix[2,2],bMatrix[2,2],Epsilon) and SameValue(aMatrix[2,3],bMatrix[2,3],Epsilon) and
          SameValue(aMatrix[3,0],bMatrix[3,0],Epsilon) and SameValue(aMatrix[3,1],bMatrix[3,1],Epsilon) and
          SameValue(aMatrix[3,2],bMatrix[3,2],Epsilon) and SameValue(aMatrix[3,3],bMatrix[3,3],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  If not SameValue(TVMCLMatrix4do(aMatrix)[i],TVMCLMatrix4do(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix4CMs; Epsilon: Single = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[2,0],bMatrix[2,0],Epsilon) and SameValue(aMatrix[3,0],bMatrix[3,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon) and
          SameValue(aMatrix[2,1],bMatrix[2,1],Epsilon) and SameValue(aMatrix[3,1],bMatrix[3,1],Epsilon) and
          SameValue(aMatrix[0,2],bMatrix[0,2],Epsilon) and SameValue(aMatrix[1,2],bMatrix[1,2],Epsilon) and
          SameValue(aMatrix[2,2],bMatrix[2,2],Epsilon) and SameValue(aMatrix[3,2],bMatrix[3,2],Epsilon) and
          SameValue(aMatrix[0,3],bMatrix[0,3],Epsilon) and SameValue(aMatrix[1,3],bMatrix[1,3],Epsilon) and
          SameValue(aMatrix[2,3],bMatrix[2,3],Epsilon) and SameValue(aMatrix[3,3],bMatrix[3,3],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  If not SameValue(TVMCLMatrix4so(aMatrix)[i],TVMCLMatrix4so(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameMatrices(const aMatrix,bMatrix: TVMCLMatrix4CMd; Epsilon: Double = 0): Boolean;
{$IFDEF MatricesUnwindLoops}
begin
Result := SameValue(aMatrix[0,0],bMatrix[0,0],Epsilon) and SameValue(aMatrix[1,0],bMatrix[1,0],Epsilon) and
          SameValue(aMatrix[2,0],bMatrix[2,0],Epsilon) and SameValue(aMatrix[3,0],bMatrix[3,0],Epsilon) and
          SameValue(aMatrix[0,1],bMatrix[0,1],Epsilon) and SameValue(aMatrix[1,1],bMatrix[1,1],Epsilon) and
          SameValue(aMatrix[2,1],bMatrix[2,1],Epsilon) and SameValue(aMatrix[3,1],bMatrix[3,1],Epsilon) and
          SameValue(aMatrix[0,2],bMatrix[0,2],Epsilon) and SameValue(aMatrix[1,2],bMatrix[1,2],Epsilon) and
          SameValue(aMatrix[2,2],bMatrix[2,2],Epsilon) and SameValue(aMatrix[3,2],bMatrix[3,2],Epsilon) and
          SameValue(aMatrix[0,3],bMatrix[0,3],Epsilon) and SameValue(aMatrix[1,3],bMatrix[1,3],Epsilon) and
          SameValue(aMatrix[2,3],bMatrix[2,3],Epsilon) and SameValue(aMatrix[3,3],bMatrix[3,3],Epsilon);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := True;
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  If not SameValue(TVMCLMatrix4do(aMatrix)[i],TVMCLMatrix4do(bMatrix)[i],Epsilon) then
    begin
      Result := False;
      Break {For i};
    end;
end;
{$ENDIF}

//==============================================================================

Function Invertible(const Matrix: TVMCLMatrix2RMs): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix2RMd): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix2CMs): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix2CMd): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix3RMs): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix3RMd): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix3CMs): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix3CMd): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix4RMs): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix4RMd): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix4CMs): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Invertible(const Matrix: TVMCLMatrix4CMd): Boolean;
begin
Result := Determinant(Matrix) <> 0;
end;

{===============================================================================
    Basic Matrix calculations - implementation
===============================================================================}

procedure Transpose(var Matrix: TVMCLMatrix2RMs);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix2RMd);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix2CMs);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix2CMd);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix3RMs);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix3RMd);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix3CMs);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix3CMd);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix4RMs);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix4RMd);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix4CMs);
begin
Matrix := Transposed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Transpose(var Matrix: TVMCLMatrix4CMd);
begin
Matrix := Transposed(Matrix);
end;

//==============================================================================

Function Transposed(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[1,0];
Result[1,0] := Matrix[0,1]; Result[1,1] := Matrix[1,1];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix) to High(Matrix) do
  For C := Low(Matrix[0]) to High(Matrix[0]) do
    Result[R,C] := Matrix[C,R];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[1,0];
Result[1,0] := Matrix[0,1]; Result[1,1] := Matrix[1,1];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix) to High(Matrix) do
  For C := Low(Matrix[0]) to High(Matrix[0]) do
    Result[R,C] := Matrix[C,R];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[1,0] := Matrix[0,1];
Result[0,1] := Matrix[1,0]; Result[1,1] := Matrix[1,1];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix[0]) to High(Matrix[0]) do
  For C := Low(Matrix) to High(Matrix) do
    Result[C,R] := Matrix[R,C];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[1,0] := Matrix[0,1];
Result[0,1] := Matrix[1,0]; Result[1,1] := Matrix[1,1];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix[0]) to High(Matrix[0]) do
  For C := Low(Matrix) to High(Matrix) do
    Result[C,R] := Matrix[R,C];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[1,0]; Result[0,2] := Matrix[2,0];
Result[1,0] := Matrix[0,1]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[2,1];
Result[2,0] := Matrix[0,2]; Result[2,1] := Matrix[1,2]; Result[2,2] := Matrix[2,2];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix) to High(Matrix) do
  For C := Low(Matrix[0]) to High(Matrix[0]) do
    Result[R,C] := Matrix[C,R];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[1,0]; Result[0,2] := Matrix[2,0];
Result[1,0] := Matrix[0,1]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[2,1];
Result[2,0] := Matrix[0,2]; Result[2,1] := Matrix[1,2]; Result[2,2] := Matrix[2,2];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix) to High(Matrix) do
  For C := Low(Matrix[0]) to High(Matrix[0]) do
    Result[R,C] := Matrix[C,R];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[1,0] := Matrix[0,1]; Result[2,0] := Matrix[0,2];
Result[0,1] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[2,1] := Matrix[1,2];
Result[0,2] := Matrix[2,0]; Result[1,2] := Matrix[2,1]; Result[2,2] := Matrix[2,2];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix[0]) to High(Matrix[0]) do
  For C := Low(Matrix) to High(Matrix) do
    Result[C,R] := Matrix[R,C];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[1,0] := Matrix[0,1]; Result[2,0] := Matrix[0,2];
Result[0,1] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[2,1] := Matrix[1,2];
Result[0,2] := Matrix[2,0]; Result[1,2] := Matrix[2,1]; Result[2,2] := Matrix[2,2];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix[0]) to High(Matrix[0]) do
  For C := Low(Matrix) to High(Matrix) do
    Result[C,R] := Matrix[R,C];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[1,0]; Result[0,2] := Matrix[2,0]; Result[0,3] := Matrix[3,0];
Result[1,0] := Matrix[0,1]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[2,1]; Result[1,3] := Matrix[3,1];
Result[2,0] := Matrix[0,2]; Result[2,1] := Matrix[1,2]; Result[2,2] := Matrix[2,2]; Result[2,3] := Matrix[3,2];
Result[3,0] := Matrix[0,3]; Result[3,1] := Matrix[1,3]; Result[3,2] := Matrix[2,3]; Result[3,3] := Matrix[3,3];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix) to High(Matrix) do
  For C := Low(Matrix[0]) to High(Matrix[0]) do
    Result[R,C] := Matrix[C,R];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[0,1] := Matrix[1,0]; Result[0,2] := Matrix[2,0]; Result[0,3] := Matrix[3,0];
Result[1,0] := Matrix[0,1]; Result[1,1] := Matrix[1,1]; Result[1,2] := Matrix[2,1]; Result[1,3] := Matrix[3,1];
Result[2,0] := Matrix[0,2]; Result[2,1] := Matrix[1,2]; Result[2,2] := Matrix[2,2]; Result[2,3] := Matrix[3,2];
Result[3,0] := Matrix[0,3]; Result[3,1] := Matrix[1,3]; Result[3,2] := Matrix[2,3]; Result[3,3] := Matrix[3,3];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix) to High(Matrix) do
  For C := Low(Matrix[0]) to High(Matrix[0]) do
    Result[R,C] := Matrix[C,R];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[1,0] := Matrix[0,1]; Result[2,0] := Matrix[0,2]; Result[3,0] := Matrix[0,3];
Result[0,1] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[2,1] := Matrix[1,2]; Result[3,1] := Matrix[1,3];
Result[0,2] := Matrix[2,0]; Result[1,2] := Matrix[2,1]; Result[2,2] := Matrix[2,2]; Result[3,2] := Matrix[2,3];
Result[0,3] := Matrix[3,0]; Result[1,3] := Matrix[3,1]; Result[2,3] := Matrix[3,2]; Result[3,3] := Matrix[3,3];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix[0]) to High(Matrix[0]) do
  For C := Low(Matrix) to High(Matrix) do
    Result[C,R] := Matrix[R,C];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Transposed(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0]; Result[1,0] := Matrix[0,1]; Result[2,0] := Matrix[0,2]; Result[3,0] := Matrix[0,3];
Result[0,1] := Matrix[1,0]; Result[1,1] := Matrix[1,1]; Result[2,1] := Matrix[1,2]; Result[3,1] := Matrix[1,3];
Result[0,2] := Matrix[2,0]; Result[1,2] := Matrix[2,1]; Result[2,2] := Matrix[2,2]; Result[3,2] := Matrix[2,3];
Result[0,3] := Matrix[3,0]; Result[1,3] := Matrix[3,1]; Result[2,3] := Matrix[3,2]; Result[3,3] := Matrix[3,3];
end;
{$ELSE}
var
  R,C:  Integer;
begin
For R := Low(Matrix[0]) to High(Matrix[0]) do
  For C := Low(Matrix) to High(Matrix) do
    Result[C,R] := Matrix[R,C];
end;
{$ENDIF}

//==============================================================================

Function Negative(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[0,1] := -Matrix[0,1];
Result[1,0] := -Matrix[1,0]; Result[1,1] := -Matrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := -TVMCLMatrix2so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[0,1] := -Matrix[0,1];
Result[1,0] := -Matrix[1,0]; Result[1,1] := -Matrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := -TVMCLMatrix2do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[1,0] := -Matrix[1,0];
Result[0,1] := -Matrix[0,1]; Result[1,1] := -Matrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := -TVMCLMatrix2so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[1,0] := -Matrix[1,0];
Result[0,1] := -Matrix[0,1]; Result[1,1] := -Matrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := -TVMCLMatrix2do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[0,1] := -Matrix[0,1]; Result[0,2] := -Matrix[0,2];
Result[1,0] := -Matrix[1,0]; Result[1,1] := -Matrix[1,1]; Result[1,2] := -Matrix[1,2];
Result[2,0] := -Matrix[2,0]; Result[2,1] := -Matrix[2,1]; Result[2,2] := -Matrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := -TVMCLMatrix3so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[0,1] := -Matrix[0,1]; Result[0,2] := -Matrix[0,2];
Result[1,0] := -Matrix[1,0]; Result[1,1] := -Matrix[1,1]; Result[1,2] := -Matrix[1,2];
Result[2,0] := -Matrix[2,0]; Result[2,1] := -Matrix[2,1]; Result[2,2] := -Matrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := -TVMCLMatrix3do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[1,0] := -Matrix[1,0]; Result[2,0] := -Matrix[2,0];
Result[0,1] := -Matrix[0,1]; Result[1,1] := -Matrix[1,1]; Result[2,1] := -Matrix[2,1];
Result[0,2] := -Matrix[0,2]; Result[1,2] := -Matrix[1,2]; Result[2,2] := -Matrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := -TVMCLMatrix3so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[1,0] := -Matrix[1,0]; Result[2,0] := -Matrix[2,0];
Result[0,1] := -Matrix[0,1]; Result[1,1] := -Matrix[1,1]; Result[2,1] := -Matrix[2,1];
Result[0,2] := -Matrix[0,2]; Result[1,2] := -Matrix[1,2]; Result[2,2] := -Matrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := -TVMCLMatrix3do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[0,1] := -Matrix[0,1]; Result[0,2] := -Matrix[0,2]; Result[0,3] := -Matrix[0,3];
Result[1,0] := -Matrix[1,0]; Result[1,1] := -Matrix[1,1]; Result[1,2] := -Matrix[1,2]; Result[1,3] := -Matrix[1,3];
Result[2,0] := -Matrix[2,0]; Result[2,1] := -Matrix[2,1]; Result[2,2] := -Matrix[2,2]; Result[2,3] := -Matrix[2,3];
Result[3,0] := -Matrix[3,0]; Result[3,1] := -Matrix[3,1]; Result[3,2] := -Matrix[3,2]; Result[3,3] := -Matrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := -TVMCLMatrix4so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[0,1] := -Matrix[0,1]; Result[0,2] := -Matrix[0,2]; Result[0,3] := -Matrix[0,3];
Result[1,0] := -Matrix[1,0]; Result[1,1] := -Matrix[1,1]; Result[1,2] := -Matrix[1,2]; Result[1,3] := -Matrix[1,3];
Result[2,0] := -Matrix[2,0]; Result[2,1] := -Matrix[2,1]; Result[2,2] := -Matrix[2,2]; Result[2,3] := -Matrix[2,3];
Result[3,0] := -Matrix[3,0]; Result[3,1] := -Matrix[3,1]; Result[3,2] := -Matrix[3,2]; Result[3,3] := -Matrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := -TVMCLMatrix4do(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[1,0] := -Matrix[1,0]; Result[2,0] := -Matrix[2,0]; Result[3,0] := -Matrix[3,0];
Result[0,1] := -Matrix[0,1]; Result[1,1] := -Matrix[1,1]; Result[2,1] := -Matrix[2,1]; Result[3,1] := -Matrix[3,1];
Result[0,2] := -Matrix[0,2]; Result[1,2] := -Matrix[1,2]; Result[2,2] := -Matrix[2,2]; Result[3,2] := -Matrix[3,2];
Result[0,3] := -Matrix[0,3]; Result[1,3] := -Matrix[1,3]; Result[2,3] := -Matrix[2,3]; Result[3,3] := -Matrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := -TVMCLMatrix4so(Matrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Negative(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := -Matrix[0,0]; Result[1,0] := -Matrix[1,0]; Result[2,0] := -Matrix[2,0]; Result[3,0] := -Matrix[3,0];
Result[0,1] := -Matrix[0,1]; Result[1,1] := -Matrix[1,1]; Result[2,1] := -Matrix[2,1]; Result[3,1] := -Matrix[3,1];
Result[0,2] := -Matrix[0,2]; Result[1,2] := -Matrix[1,2]; Result[2,2] := -Matrix[2,2]; Result[3,2] := -Matrix[3,2];
Result[0,3] := -Matrix[0,3]; Result[1,3] := -Matrix[1,3]; Result[2,3] := -Matrix[2,3]; Result[3,3] := -Matrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := -TVMCLMatrix4do(Matrix)[i];
end;
{$ENDIF}

//==============================================================================

Function Determinant(const Matrix: TVMCLMatrix2RMs): Single;
begin
Result := Matrix[0,0] * Matrix[1,1] - Matrix[0,1] * Matrix[1,0];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix2RMd): Double;
begin
Result := Matrix[0,0] * Matrix[1,1] - Matrix[0,1] * Matrix[1,0];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---
 
Function Determinant(const Matrix: TVMCLMatrix2CMs): Single;
begin
Result := Matrix[0,0] * Matrix[1,1] - Matrix[1,0] * Matrix[0,1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix2CMd): Double;
begin
Result := Matrix[0,0] * Matrix[1,1] - Matrix[1,0] * Matrix[0,1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix3RMs): Single;
{$IFDEF MatricesUnwindLoops}
begin
Result := Matrix[0,0] * Matrix[1,1] * Matrix[2,2] +
          Matrix[0,1] * Matrix[1,2] * Matrix[2,0] +
          Matrix[0,2] * Matrix[1,0] * Matrix[2,1] -
          Matrix[0,0] * Matrix[1,2] * Matrix[2,1] -
          Matrix[0,1] * Matrix[1,0] * Matrix[2,2] -
          Matrix[0,2] * Matrix[1,1] * Matrix[2,0];
end;
{$ELSE}
var
  i:  Integer;
begin
Result := 0;
For i := Low(Matrix[0]) to High(Matrix[0]) do
  If (i and 1) <> 0 then
    Result := Result - (Matrix[0,i] * Determinant(ExtractSubmatrix2(Matrix,0,i)))
  else
    Result := Result + (Matrix[0,i] * Determinant(ExtractSubmatrix2(Matrix,0,i)))
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix3RMd): Double;
{$IFDEF MatricesUnwindLoops}
begin
Result := Matrix[0,0] * Matrix[1,1] * Matrix[2,2] +
          Matrix[0,1] * Matrix[1,2] * Matrix[2,0] +
          Matrix[0,2] * Matrix[1,0] * Matrix[2,1] -
          Matrix[0,0] * Matrix[1,2] * Matrix[2,1] -
          Matrix[0,1] * Matrix[1,0] * Matrix[2,2] -
          Matrix[0,2] * Matrix[1,1] * Matrix[2,0];
end;
{$ELSE}
var
  i:  Integer;
begin
Result := 0;
For i := Low(Matrix[0]) to High(Matrix[0]) do
  If (i and 1) <> 0 then
    Result := Result - (Matrix[0,i] * Determinant(ExtractSubmatrix2(Matrix,0,i)))
  else
    Result := Result + (Matrix[0,i] * Determinant(ExtractSubmatrix2(Matrix,0,i)))
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix3CMs): Single;
{$IFDEF MatricesUnwindLoops}
begin
Result := Matrix[0,0] * Matrix[1,1] * Matrix[2,2] +
          Matrix[1,0] * Matrix[2,1] * Matrix[0,2] +
          Matrix[2,0] * Matrix[0,1] * Matrix[1,2] -
          Matrix[0,0] * Matrix[2,1] * Matrix[1,2] -
          Matrix[1,0] * Matrix[0,1] * Matrix[2,2] -
          Matrix[2,0] * Matrix[1,1] * Matrix[0,2];
end;
{$ELSE}
var
  i:  Integer;
begin
Result := 0;
For i := Low(Matrix) to High(Matrix) do
  If (i and 1) <> 0 then
    Result := Result - (Matrix[i,0] * Determinant(ExtractSubmatrix2(Matrix,0,i)))
  else
    Result := Result + (Matrix[i,0] * Determinant(ExtractSubmatrix2(Matrix,0,i)))
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix3CMd): Double;
{$IFDEF MatricesUnwindLoops}
begin
Result := Matrix[0,0] * Matrix[1,1] * Matrix[2,2] +
          Matrix[1,0] * Matrix[2,1] * Matrix[0,2] +
          Matrix[2,0] * Matrix[0,1] * Matrix[1,2] -
          Matrix[0,0] * Matrix[2,1] * Matrix[1,2] -
          Matrix[1,0] * Matrix[0,1] * Matrix[2,2] -
          Matrix[2,0] * Matrix[1,1] * Matrix[0,2];
end;
{$ELSE}
var
  i:  Integer;
begin
Result := 0;
For i := Low(Matrix) to High(Matrix) do
  If (i and 1) <> 0 then
    Result := Result - (Matrix[i,0] * Determinant(ExtractSubmatrix2(Matrix,0,i)))
  else
    Result := Result + (Matrix[i,0] * Determinant(ExtractSubmatrix2(Matrix,0,i)))
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix4RMs): Single;
{$IFDEF MatricesUnwindLoops}
begin
Result := ((Matrix[1,1] * Matrix[2,2] * Matrix[3,3] +
            Matrix[1,2] * Matrix[2,3] * Matrix[3,1] +
            Matrix[1,3] * Matrix[2,1] * Matrix[3,2] -
            Matrix[1,1] * Matrix[2,3] * Matrix[3,2] -
            Matrix[1,2] * Matrix[2,1] * Matrix[3,3] -
            Matrix[1,3] * Matrix[2,2] * Matrix[3,1]) * Matrix[0,0]) -
          ((Matrix[1,0] * Matrix[2,2] * Matrix[3,3] +
            Matrix[1,2] * Matrix[2,3] * Matrix[3,0] +
            Matrix[1,3] * Matrix[2,0] * Matrix[3,2] -
            Matrix[1,0] * Matrix[2,3] * Matrix[3,2] -
            Matrix[1,2] * Matrix[2,0] * Matrix[3,3] -
            Matrix[1,3] * Matrix[2,2] * Matrix[3,0]) * Matrix[0,1]) +
          ((Matrix[1,0] * Matrix[2,1] * Matrix[3,3] +
            Matrix[1,1] * Matrix[2,3] * Matrix[3,0] +
            Matrix[1,3] * Matrix[2,0] * Matrix[3,1] -
            Matrix[1,0] * Matrix[2,3] * Matrix[3,1] -
            Matrix[1,1] * Matrix[2,0] * Matrix[3,3] -
            Matrix[1,3] * Matrix[2,1] * Matrix[3,0]) * Matrix[0,2]) -
          ((Matrix[1,0] * Matrix[2,1] * Matrix[3,2] +
            Matrix[1,1] * Matrix[2,2] * Matrix[3,0] +
            Matrix[1,2] * Matrix[2,0] * Matrix[3,1] -
            Matrix[1,0] * Matrix[2,2] * Matrix[3,1] -
            Matrix[1,1] * Matrix[2,0] * Matrix[3,2] -
            Matrix[1,2] * Matrix[2,1] * Matrix[3,0]) * Matrix[0,3]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := 0;
For i := Low(Matrix[0]) to High(Matrix[0]) do
  If (i and 1) <> 0 then
    Result := Result - (Matrix[0,i] * Determinant(ExtractSubmatrix3(Matrix,0,i)))
  else
    Result := Result + (Matrix[0,i] * Determinant(ExtractSubmatrix3(Matrix,0,i)))
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix4RMd): Double;
{$IFDEF MatricesUnwindLoops}
begin
Result := ((Matrix[1,1] * Matrix[2,2] * Matrix[3,3] +
            Matrix[1,2] * Matrix[2,3] * Matrix[3,1] +
            Matrix[1,3] * Matrix[2,1] * Matrix[3,2] -
            Matrix[1,1] * Matrix[2,3] * Matrix[3,2] -
            Matrix[1,2] * Matrix[2,1] * Matrix[3,3] -
            Matrix[1,3] * Matrix[2,2] * Matrix[3,1]) * Matrix[0,0]) -
          ((Matrix[1,0] * Matrix[2,2] * Matrix[3,3] +
            Matrix[1,2] * Matrix[2,3] * Matrix[3,0] +
            Matrix[1,3] * Matrix[2,0] * Matrix[3,2] -
            Matrix[1,0] * Matrix[2,3] * Matrix[3,2] -
            Matrix[1,2] * Matrix[2,0] * Matrix[3,3] -
            Matrix[1,3] * Matrix[2,2] * Matrix[3,0]) * Matrix[0,1]) +
          ((Matrix[1,0] * Matrix[2,1] * Matrix[3,3] +
            Matrix[1,1] * Matrix[2,3] * Matrix[3,0] +
            Matrix[1,3] * Matrix[2,0] * Matrix[3,1] -
            Matrix[1,0] * Matrix[2,3] * Matrix[3,1] -
            Matrix[1,1] * Matrix[2,0] * Matrix[3,3] -
            Matrix[1,3] * Matrix[2,1] * Matrix[3,0]) * Matrix[0,2]) -
          ((Matrix[1,0] * Matrix[2,1] * Matrix[3,2] +
            Matrix[1,1] * Matrix[2,2] * Matrix[3,0] +
            Matrix[1,2] * Matrix[2,0] * Matrix[3,1] -
            Matrix[1,0] * Matrix[2,2] * Matrix[3,1] -
            Matrix[1,1] * Matrix[2,0] * Matrix[3,2] -
            Matrix[1,2] * Matrix[2,1] * Matrix[3,0]) * Matrix[0,3]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := 0;
For i := Low(Matrix[0]) to High(Matrix[0]) do
  If (i and 1) <> 0 then
    Result := Result - (Matrix[0,i] * Determinant(ExtractSubmatrix3(Matrix,0,i)))
  else
    Result := Result + (Matrix[0,i] * Determinant(ExtractSubmatrix3(Matrix,0,i)))
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix4CMs): Single;
{$IFDEF MatricesUnwindLoops}
begin
Result := ((Matrix[1,1] * Matrix[2,2] * Matrix[3,3] +
            Matrix[2,1] * Matrix[3,2] * Matrix[1,3] +
            Matrix[3,1] * Matrix[1,2] * Matrix[2,3] -
            Matrix[1,1] * Matrix[3,2] * Matrix[2,3] -
            Matrix[2,1] * Matrix[1,2] * Matrix[3,3] -
            Matrix[3,1] * Matrix[2,2] * Matrix[1,3]) * Matrix[0,0]) -
          ((Matrix[0,1] * Matrix[2,2] * Matrix[3,3] +
            Matrix[2,1] * Matrix[3,2] * Matrix[0,3] +
            Matrix[3,1] * Matrix[0,2] * Matrix[2,3] -
            Matrix[0,1] * Matrix[3,2] * Matrix[2,3] -
            Matrix[2,1] * Matrix[0,2] * Matrix[3,3] -
            Matrix[3,1] * Matrix[2,2] * Matrix[0,3]) * Matrix[1,0]) +
          ((Matrix[0,1] * Matrix[1,2] * Matrix[3,3] +
            Matrix[1,1] * Matrix[3,2] * Matrix[0,3] +
            Matrix[3,1] * Matrix[0,2] * Matrix[1,3] -
            Matrix[0,1] * Matrix[3,2] * Matrix[1,3] -
            Matrix[1,1] * Matrix[0,2] * Matrix[3,3] -
            Matrix[3,1] * Matrix[1,2] * Matrix[0,3]) * Matrix[2,0]) -
          ((Matrix[0,1] * Matrix[1,2] * Matrix[2,3] +
            Matrix[1,1] * Matrix[2,2] * Matrix[0,3] +
            Matrix[2,1] * Matrix[0,2] * Matrix[1,3] -
            Matrix[0,1] * Matrix[2,2] * Matrix[1,3] -
            Matrix[1,1] * Matrix[0,2] * Matrix[2,3] -
            Matrix[2,1] * Matrix[1,2] * Matrix[0,3]) * Matrix[3,0]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := 0;
For i := Low(Matrix) to High(Matrix) do
  If (i and 1) <> 0 then
    Result := Result - (Matrix[i,0] * Determinant(ExtractSubmatrix3(Matrix,0,i)))
  else
    Result := Result + (Matrix[i,0] * Determinant(ExtractSubmatrix3(Matrix,0,i)))
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Determinant(const Matrix: TVMCLMatrix4CMd): Double;
{$IFDEF MatricesUnwindLoops}
begin
Result := ((Matrix[1,1] * Matrix[2,2] * Matrix[3,3] +
            Matrix[2,1] * Matrix[3,2] * Matrix[1,3] +
            Matrix[3,1] * Matrix[1,2] * Matrix[2,3] -
            Matrix[1,1] * Matrix[3,2] * Matrix[2,3] -
            Matrix[2,1] * Matrix[1,2] * Matrix[3,3] -
            Matrix[3,1] * Matrix[2,2] * Matrix[1,3]) * Matrix[0,0]) -
          ((Matrix[0,1] * Matrix[2,2] * Matrix[3,3] +
            Matrix[2,1] * Matrix[3,2] * Matrix[0,3] +
            Matrix[3,1] * Matrix[0,2] * Matrix[2,3] -
            Matrix[0,1] * Matrix[3,2] * Matrix[2,3] -
            Matrix[2,1] * Matrix[0,2] * Matrix[3,3] -
            Matrix[3,1] * Matrix[2,2] * Matrix[0,3]) * Matrix[1,0]) +
          ((Matrix[0,1] * Matrix[1,2] * Matrix[3,3] +
            Matrix[1,1] * Matrix[3,2] * Matrix[0,3] +
            Matrix[3,1] * Matrix[0,2] * Matrix[1,3] -
            Matrix[0,1] * Matrix[3,2] * Matrix[1,3] -
            Matrix[1,1] * Matrix[0,2] * Matrix[3,3] -
            Matrix[3,1] * Matrix[1,2] * Matrix[0,3]) * Matrix[2,0]) -
          ((Matrix[0,1] * Matrix[1,2] * Matrix[2,3] +
            Matrix[1,1] * Matrix[2,2] * Matrix[0,3] +
            Matrix[2,1] * Matrix[0,2] * Matrix[1,3] -
            Matrix[0,1] * Matrix[2,2] * Matrix[1,3] -
            Matrix[1,1] * Matrix[0,2] * Matrix[2,3] -
            Matrix[2,1] * Matrix[1,2] * Matrix[0,3]) * Matrix[3,0]);
end;
{$ELSE}
var
  i:  Integer;
begin
Result := 0;
For i := Low(Matrix) to High(Matrix) do
  If (i and 1) <> 0 then
    Result := Result - (Matrix[i,0] * Determinant(ExtractSubmatrix3(Matrix,0,i)))
  else
    Result := Result + (Matrix[i,0] * Determinant(ExtractSubmatrix3(Matrix,0,i)))
end;
{$ENDIF}

//==============================================================================
{$message 'check whether columns or rows should be really orthonormalized'}
procedure Orthonormalize(var Matrix: TVMCLMatrix2RMs);
var
  Col1,Col2:  TVMCLVector2s;
begin
Col1 := Normalized(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormal(Col1,MatrixGetColumn(Matrix,1));
Matrix := RMMatrixFromColumns(Col1,Col2);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix2RMd);
var
  Col1,Col2:  TVMCLVector2d;
begin
Col1 := Normalized(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormal(Col1,MatrixGetColumn(Matrix,1));
Matrix := RMMatrixFromColumns(Col1,Col2);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix2CMs);
var
  Col1,Col2:  TVMCLVector2s;
begin
Col1 := Normalized(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormal(Col1,MatrixGetColumn(Matrix,1));
Matrix := CMMatrixFromColumns(Col1,Col2);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix2CMd);
var
  Col1,Col2:  TVMCLVector2d;
begin
Col1 := Normalized(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormal(Col1,MatrixGetColumn(Matrix,1));
Matrix := CMMatrixFromColumns(Col1,Col2);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix3RMs);
var
  Col1,Col2,Col3: TVMCLVector3s;
begin
Col1 := Normalized(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormal(Col1,MatrixGetColumn(Matrix,1));
Col3 := VectorsOrthogonal(Col1,MatrixGetColumn(Matrix,2));
Matrix := RMMatrixFromColumns(Col1,Col2,VectorsOrthonormal(Col2,Col3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix3RMd);
var
  Col1,Col2,Col3: TVMCLVector3d;
begin
Col1 := Normalized(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormal(Col1,MatrixGetColumn(Matrix,1));
Col3 := VectorsOrthogonal(Col1,MatrixGetColumn(Matrix,2));
Matrix := RMMatrixFromColumns(Col1,Col2,VectorsOrthonormal(Col2,Col3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix3CMs);
var
  Col1,Col2,Col3: TVMCLVector3s;
begin
Col1 := Normalized(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormal(Col1,MatrixGetColumn(Matrix,1));
Col3 := VectorsOrthogonal(Col1,MatrixGetColumn(Matrix,2));
Matrix := CMMatrixFromColumns(Col1,Col2,VectorsOrthonormal(Col2,Col3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix3CMd);
var
  Col1,Col2,Col3: TVMCLVector3d;
begin
Col1 := Normalized(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormal(Col1,MatrixGetColumn(Matrix,1));
Col3 := VectorsOrthogonal(Col1,MatrixGetColumn(Matrix,2));
Matrix := CMMatrixFromColumns(Col1,Col2,VectorsOrthonormal(Col2,Col3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix4RMs);
var
  Col1,Col2,Col3: TVMCLVector4s;
begin
Col1 := NormalizedXYZ(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormalXYZ(Col1,MatrixGetColumn(Matrix,1));
Col3 := VectorsOrthogonalXYZ(Col1,MatrixGetColumn(Matrix,2));
Matrix := RMMatrixFromColumns(Col1,Col2,VectorsOrthonormalXYZ(Col2,Col3),MatrixGetColumn(Matrix,3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix4RMd);
var
  Col1,Col2,Col3: TVMCLVector4d;
begin
Col1 := NormalizedXYZ(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormalXYZ(Col1,MatrixGetColumn(Matrix,1));
Col3 := VectorsOrthogonalXYZ(Col1,MatrixGetColumn(Matrix,2));
Matrix := RMMatrixFromColumns(Col1,Col2,VectorsOrthonormalXYZ(Col2,Col3),MatrixGetColumn(Matrix,3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix4CMs);
var
  Col1,Col2,Col3: TVMCLVector4s;
begin
Col1 := NormalizedXYZ(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormalXYZ(Col1,MatrixGetColumn(Matrix,1));
Col3 := VectorsOrthogonalXYZ(Col1,MatrixGetColumn(Matrix,2));
Matrix := CMMatrixFromColumns(Col1,Col2,VectorsOrthonormalXYZ(Col2,Col3),MatrixGetColumn(Matrix,3));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Orthonormalize(var Matrix: TVMCLMatrix4CMd);
var
  Col1,Col2,Col3: TVMCLVector4d;
begin
Col1 := NormalizedXYZ(MatrixGetColumn(Matrix,0));
Col2 := VectorsOrthonormalXYZ(Col1,MatrixGetColumn(Matrix,1));
Col3 := VectorsOrthogonalXYZ(Col1,MatrixGetColumn(Matrix,2));
Matrix := CMMatrixFromColumns(Col1,Col2,VectorsOrthonormalXYZ(Col2,Col3),MatrixGetColumn(Matrix,3));
end;

//==============================================================================

procedure Inverse(var Matrix: TVMCLMatrix2RMs);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix2RMd);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix2CMs);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix2CMd);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix3RMs);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix3RMd);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix3CMs);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix3CMd);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix4RMs);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix4RMd);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix4CMs);
begin
Matrix := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Inverse(var Matrix: TVMCLMatrix4CMd);
begin
Matrix := Inversed(Matrix);
end;

//------------------------------------------------------------------------------

procedure InverseAffine(var Matrix: TVMCLMatrix4RMs);
begin
Matrix := InversedAffine(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure InverseAffine(var Matrix: TVMCLMatrix4RMd);
begin
Matrix := InversedAffine(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure InverseAffine(var Matrix: TVMCLMatrix4CMs);
begin
Matrix := InversedAffine(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure InverseAffine(var Matrix: TVMCLMatrix4CMd);
begin
Matrix := InversedAffine(Matrix);
end;

//==============================================================================
{$message 'unwind'}
Function Inversed(const Matrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs;
var
  Det:  Extended;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Result := ScalarMultiply(RMMatrixFromRows(
                Vector2s(Matrix[1,1],-Matrix[0,1]),
                Vector2s(-Matrix[1,0],Matrix[0,0])),
              1/Det);
  end
else Result := VMCL_ZeroMatrix2RMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd;
var
  Det:  Extended;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Result := ScalarMultiply(RMMatrixFromRows(
                Vector2d(Matrix[1,1],-Matrix[0,1]),
                Vector2d(-Matrix[1,0],Matrix[0,0])),
              1/Det);
  end
else Result := VMCL_ZeroMatrix2RMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs;
var
  Det:  Extended;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Result := ScalarMultiply(CMMatrixFromColumns(
                Vector2s(Matrix[1,1],-Matrix[0,1]),
                Vector2s(-Matrix[1,0],Matrix[0,0])),
              1/Det);
  end
else Result := VMCL_ZeroMatrix2CMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; 
var
  Det:  Extended;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Result := ScalarMultiply(CMMatrixFromColumns(
                Vector2d(Matrix[1,1],-Matrix[0,1]),
                Vector2d(-Matrix[1,0],Matrix[0,0])),
              1/Det);
  end
else Result := VMCL_ZeroMatrix2CMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs;
var
  Det:      Extended;
  Col,Row:  Integer;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Det := 1/Det;
    For Row := Low(Matrix) to High(Matrix) do
      For Col := Low(Matrix[0]) to High(Matrix[0]) do
        If ((Row xor Col) and 1) = 0 then
          Result[Col,Row] := Determinant(ExtractSubmatrix2(Matrix,Row,Col)) * Det
        else
          Result[Col,Row] := -Determinant(ExtractSubmatrix2(Matrix,Row,Col)) * Det;
  end
else Result := VMCL_ZeroMatrix3RMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd;
var
  Det:      Extended;
  Col,Row:  Integer;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Det := 1/Det;
    For Row := Low(Matrix) to High(Matrix) do
      For Col := Low(Matrix[0]) to High(Matrix[0]) do
        If ((Row xor Col) and 1) = 0 then
          Result[Col,Row] := Determinant(ExtractSubmatrix2(Matrix,Row,Col)) * Det
        else
          Result[Col,Row] := -Determinant(ExtractSubmatrix2(Matrix,Row,Col)) * Det;
  end
else Result := VMCL_ZeroMatrix3RMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs;
var
  Det:      Extended;
  Col,Row:  Integer;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Det := 1/Det;
    For Row := Low(Matrix[0]) to High(Matrix[0]) do
      For Col := Low(Matrix) to High(Matrix) do
        If ((Row xor Col) and 1) = 0 then
          Result[Row,Col] := Determinant(ExtractSubmatrix2(Matrix,Row,Col)) * Det
        else
          Result[Row,Col] := -Determinant(ExtractSubmatrix2(Matrix,Row,Col)) * Det;
  end
else Result := VMCL_ZeroMatrix3CMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd;
var
  Det:      Extended;
  Col,Row:  Integer;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Det := 1/Det;
    For Row := Low(Matrix[0]) to High(Matrix[0]) do
      For Col := Low(Matrix) to High(Matrix) do
        If ((Row xor Col) and 1) = 0 then
          Result[Row,Col] := Determinant(ExtractSubmatrix2(Matrix,Row,Col)) * Det
        else
          Result[Row,Col] := -Determinant(ExtractSubmatrix2(Matrix,Row,Col)) * Det;
  end
else Result := VMCL_ZeroMatrix3CMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs;
var
  Det:      Extended;
  Col,Row:  Integer;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Det := 1/Det;
    For Row := Low(Matrix) to High(Matrix) do
      For Col := Low(Matrix[0]) to High(Matrix[0]) do
        If ((Row xor Col) and 1) = 0 then
          Result[Col,Row] := Determinant(ExtractSubmatrix3(Matrix,Row,Col)) * Det
        else
          Result[Col,Row] := -Determinant(ExtractSubmatrix3(Matrix,Row,Col)) * Det;
  end
else Result := VMCL_ZeroMatrix4RMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd;
var
  Det:      Extended;
  Col,Row:  Integer;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Det := 1/Det;
    For Row := Low(Matrix) to High(Matrix) do
      For Col := Low(Matrix[0]) to High(Matrix[0]) do
        If ((Row xor Col) and 1) = 0 then
          Result[Col,Row] := Determinant(ExtractSubmatrix3(Matrix,Row,Col)) * Det
        else
          Result[Col,Row] := -Determinant(ExtractSubmatrix3(Matrix,Row,Col)) * Det;
  end
else Result := VMCL_ZeroMatrix4RMd;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs;
var
  Det:      Extended;
  Col,Row:  Integer;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Det := 1/Det;
    For Row := Low(Matrix[0]) to High(Matrix[0]) do
      For Col := Low(Matrix) to High(Matrix) do
        If ((Row xor Col) and 1) = 0 then
          Result[Row,Col] := Determinant(ExtractSubmatrix3(Matrix,Row,Col)) * Det
        else
          Result[Row,Col] := -Determinant(ExtractSubmatrix3(Matrix,Row,Col)) * Det;
  end
else Result := VMCL_ZeroMatrix4CMs;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Inversed(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd;
var
  Det:      Extended;
  Col,Row:  Integer;
begin
Det := Determinant(Matrix);
If Det <> 0.0 then
  begin
    Det := 1/Det;
    For Row := Low(Matrix[0]) to High(Matrix[0]) do
      For Col := Low(Matrix) to High(Matrix) do
        If ((Row xor Col) and 1) = 0 then
          Result[Row,Col] := Determinant(ExtractSubmatrix3(Matrix,Row,Col)) * Det
        else
          Result[Row,Col] := -Determinant(ExtractSubmatrix3(Matrix,Row,Col)) * Det;
  end
else Result := VMCL_ZeroMatrix4CMd;
end;

//------------------------------------------------------------------------------

Function InversedAffine(const Matrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs;
var
  SubMat: TVMCLMatrix3RMs;
  Vec:    TVMCLVector3s;
begin
If EqualVectors(MatrixGetRow(Matrix,3),Vector4s(0,0,0,1)) then
  begin
    SubMat := Inversed(Matrix3(Matrix));
    Vec := VectorMultiply(Negative(SubMat),Vector3(MatrixGetColumn(Matrix,3)));
    Result := Matrix4(SubMat,True);
    MatrixSetColumn(Result,3,Vector4s(Vec,1));
  end
else Result := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function InversedAffine(const Matrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd;
var
  SubMat: TVMCLMatrix3RMd;
  Vec:    TVMCLVector3d;
begin
If EqualVectors(MatrixGetRow(Matrix,3),Vector4d(0,0,0,1)) then
  begin
    SubMat := Inversed(Matrix3(Matrix));
    Vec := VectorMultiply(Negative(SubMat),Vector3(MatrixGetColumn(Matrix,3)));
    Result := Matrix4(SubMat,True);
    MatrixSetColumn(Result,3,Vector4d(Vec,1));
  end
else Result := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function InversedAffine(const Matrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs;
var
  SubMat: TVMCLMatrix3CMs;
  Vec:    TVMCLVector3s;
begin
If EqualVectors(MatrixGetRow(Matrix,3),Vector4s(0,0,0,1)) then
  begin
    SubMat := Inversed(Matrix3(Matrix));
    Vec := VectorMultiply(Negative(SubMat),Vector3(MatrixGetColumn(Matrix,3)));
    Result := Matrix4(SubMat,True);
    MatrixSetColumn(Result,3,Vector4s(Vec,1));
  end
else Result := Inversed(Matrix);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function InversedAffine(const Matrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd;
var
  SubMat: TVMCLMatrix3CMd;
  Vec:    TVMCLVector3d;
begin
If EqualVectors(MatrixGetRow(Matrix,3),Vector4d(0,0,0,1)) then
  begin
    SubMat := Inversed(Matrix3(Matrix));
    Vec := VectorMultiply(Negative(SubMat),Vector3(MatrixGetColumn(Matrix,3)));
    Result := Matrix4(SubMat,True);
    MatrixSetColumn(Result,3,Vector4d(Vec,1));
  end
else Result := Inversed(Matrix);
end;

{===============================================================================
    Calculations with one matrix - implementation
===============================================================================}

Function ScalarMultiply(const Matrix: TVMCLMatrix2RMs; Scalar: Single): TVMCLMatrix2RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[0,1] := Matrix[0,1] * Scalar;
Result[1,0] := Matrix[1,0] * Scalar; Result[1,1] := Matrix[1,1] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := TVMCLMatrix2so(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix2RMd; Scalar: Double): TVMCLMatrix2RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[0,1] := Matrix[0,1] * Scalar;
Result[1,0] := Matrix[1,0] * Scalar; Result[1,1] := Matrix[1,1] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := TVMCLMatrix2do(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix2CMs; Scalar: Single): TVMCLMatrix2CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[1,0] := Matrix[1,0] * Scalar;
Result[0,1] := Matrix[0,1] * Scalar; Result[1,1] := Matrix[1,1] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := TVMCLMatrix2so(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix2CMd; Scalar: Double): TVMCLMatrix2CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[1,0] := Matrix[1,0] * Scalar;
Result[0,1] := Matrix[0,1] * Scalar; Result[1,1] := Matrix[1,1] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := TVMCLMatrix2do(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix3RMs; Scalar: Single): TVMCLMatrix3RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[0,1] := Matrix[0,1] * Scalar; Result[0,2] := Matrix[0,2] * Scalar;
Result[1,0] := Matrix[1,0] * Scalar; Result[1,1] := Matrix[1,1] * Scalar; Result[1,2] := Matrix[1,2] * Scalar;
Result[2,0] := Matrix[2,0] * Scalar; Result[2,1] := Matrix[2,1] * Scalar; Result[2,2] := Matrix[2,2] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := TVMCLMatrix3so(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix3RMd; Scalar: Double): TVMCLMatrix3RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[0,1] := Matrix[0,1] * Scalar; Result[0,2] := Matrix[0,2] * Scalar;
Result[1,0] := Matrix[1,0] * Scalar; Result[1,1] := Matrix[1,1] * Scalar; Result[1,2] := Matrix[1,2] * Scalar;
Result[2,0] := Matrix[2,0] * Scalar; Result[2,1] := Matrix[2,1] * Scalar; Result[2,2] := Matrix[2,2] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := TVMCLMatrix3do(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix3CMs; Scalar: Single): TVMCLMatrix3CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[1,0] := Matrix[1,0] * Scalar; Result[2,0] := Matrix[2,0] * Scalar;
Result[0,1] := Matrix[0,1] * Scalar; Result[1,1] := Matrix[1,1] * Scalar; Result[2,1] := Matrix[2,1] * Scalar;
Result[0,2] := Matrix[0,2] * Scalar; Result[1,2] := Matrix[1,2] * Scalar; Result[2,2] := Matrix[2,2] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := TVMCLMatrix3so(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix3CMd; Scalar: Double): TVMCLMatrix3CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[1,0] := Matrix[1,0] * Scalar; Result[2,0] := Matrix[2,0] * Scalar;
Result[0,1] := Matrix[0,1] * Scalar; Result[1,1] := Matrix[1,1] * Scalar; Result[2,1] := Matrix[2,1] * Scalar;
Result[0,2] := Matrix[0,2] * Scalar; Result[1,2] := Matrix[1,2] * Scalar; Result[2,2] := Matrix[2,2] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := TVMCLMatrix3do(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix4RMs; Scalar: Single): TVMCLMatrix4RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[0,1] := Matrix[0,1] * Scalar;
Result[0,2] := Matrix[0,2] * Scalar; Result[0,3] := Matrix[0,3] * Scalar;
Result[1,0] := Matrix[1,0] * Scalar; Result[1,1] := Matrix[1,1] * Scalar;
Result[1,2] := Matrix[1,2] * Scalar; Result[1,3] := Matrix[1,3] * Scalar;
Result[2,0] := Matrix[2,0] * Scalar; Result[2,1] := Matrix[2,1] * Scalar;
Result[2,2] := Matrix[2,2] * Scalar; Result[2,3] := Matrix[2,3] * Scalar;
Result[3,0] := Matrix[3,0] * Scalar; Result[3,1] := Matrix[3,1] * Scalar;
Result[3,2] := Matrix[3,2] * Scalar; Result[3,3] := Matrix[3,3] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := TVMCLMatrix4so(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix4RMd; Scalar: Double): TVMCLMatrix4RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[0,1] := Matrix[0,1] * Scalar;
Result[0,2] := Matrix[0,2] * Scalar; Result[0,3] := Matrix[0,3] * Scalar;
Result[1,0] := Matrix[1,0] * Scalar; Result[1,1] := Matrix[1,1] * Scalar;
Result[1,2] := Matrix[1,2] * Scalar; Result[1,3] := Matrix[1,3] * Scalar;
Result[2,0] := Matrix[2,0] * Scalar; Result[2,1] := Matrix[2,1] * Scalar;
Result[2,2] := Matrix[2,2] * Scalar; Result[2,3] := Matrix[2,3] * Scalar;
Result[3,0] := Matrix[3,0] * Scalar; Result[3,1] := Matrix[3,1] * Scalar;
Result[3,2] := Matrix[3,2] * Scalar; Result[3,3] := Matrix[3,3] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := TVMCLMatrix4do(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix4CMs; Scalar: Single): TVMCLMatrix4CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[1,0] := Matrix[1,0] * Scalar;
Result[2,0] := Matrix[2,0] * Scalar; Result[3,0] := Matrix[3,0] * Scalar;
Result[0,1] := Matrix[0,1] * Scalar; Result[1,1] := Matrix[1,1] * Scalar;
Result[2,1] := Matrix[2,1] * Scalar; Result[3,1] := Matrix[3,1] * Scalar;
Result[0,2] := Matrix[0,2] * Scalar; Result[1,2] := Matrix[1,2] * Scalar;
Result[2,2] := Matrix[2,2] * Scalar; Result[3,2] := Matrix[3,2] * Scalar;
Result[0,3] := Matrix[0,3] * Scalar; Result[1,3] := Matrix[1,3] * Scalar;
Result[2,3] := Matrix[2,3] * Scalar; Result[3,3] := Matrix[3,3] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := TVMCLMatrix4so(Matrix)[i] * Scalar;
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Matrix: TVMCLMatrix4CMd; Scalar: Double): TVMCLMatrix4CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := Matrix[0,0] * Scalar; Result[1,0] := Matrix[1,0] * Scalar;
Result[2,0] := Matrix[2,0] * Scalar; Result[3,0] := Matrix[3,0] * Scalar;
Result[0,1] := Matrix[0,1] * Scalar; Result[1,1] := Matrix[1,1] * Scalar;
Result[2,1] := Matrix[2,1] * Scalar; Result[3,1] := Matrix[3,1] * Scalar;
Result[0,2] := Matrix[0,2] * Scalar; Result[1,2] := Matrix[1,2] * Scalar;
Result[2,2] := Matrix[2,2] * Scalar; Result[3,2] := Matrix[3,2] * Scalar;
Result[0,3] := Matrix[0,3] * Scalar; Result[1,3] := Matrix[1,3] * Scalar;
Result[2,3] := Matrix[2,3] * Scalar; Result[3,3] := Matrix[3,3] * Scalar;
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := TVMCLMatrix4do(Matrix)[i] * Scalar;
end;
{$ENDIF}

//==============================================================================

Function VectorMultiply(const Matrix: TVMCLMatrix2RMs; const Vector: TVMCLVector2s): TVMCLVector2s;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[0,1] * Vector[1];
Result[1] := Matrix[1,0] * Vector[0] + Matrix[1,1] * Vector[1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[i,0] * Vector[0] + Matrix[i,1] * Vector[1];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix2RMd; const Vector: TVMCLVector2d): TVMCLVector2d;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[0,1] * Vector[1];
Result[1] := Matrix[1,0] * Vector[0] + Matrix[1,1] * Vector[1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[i,0] * Vector[0] + Matrix[i,1] * Vector[1];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix2CMs; const Vector: TVMCLVector2s): TVMCLVector2s;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[1,0] * Vector[1];
Result[1] := Matrix[0,1] * Vector[0] + Matrix[1,1] * Vector[1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[0,i] * Vector[0] + Matrix[1,i] * Vector[1];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix2CMd; const Vector: TVMCLVector2d): TVMCLVector2d;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[1,0] * Vector[1];
Result[1] := Matrix[0,1] * Vector[0] + Matrix[1,1] * Vector[1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[0,i] * Vector[0] + Matrix[1,i] * Vector[1];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix3RMs; const Vector: TVMCLVector3s): TVMCLVector3s;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[0,1] * Vector[1] + Matrix[0,2] * Vector[2];
Result[1] := Matrix[1,0] * Vector[0] + Matrix[1,1] * Vector[1] + Matrix[1,2] * Vector[2];
Result[2] := Matrix[2,0] * Vector[0] + Matrix[2,1] * Vector[1] + Matrix[2,2] * Vector[2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[i,0] * Vector[0] + Matrix[i,1] * Vector[1] + Matrix[i,2] * Vector[2];
end; 
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix3RMd; const Vector: TVMCLVector3d): TVMCLVector3d;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[0,1] * Vector[1] + Matrix[0,2] * Vector[2];
Result[1] := Matrix[1,0] * Vector[0] + Matrix[1,1] * Vector[1] + Matrix[1,2] * Vector[2];
Result[2] := Matrix[2,0] * Vector[0] + Matrix[2,1] * Vector[1] + Matrix[2,2] * Vector[2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[i,0] * Vector[0] + Matrix[i,1] * Vector[1] + Matrix[i,2] * Vector[2];
end; 
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix3CMs; const Vector: TVMCLVector3s): TVMCLVector3s;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[1,0] * Vector[1] + Matrix[2,0] * Vector[2];
Result[1] := Matrix[0,1] * Vector[0] + Matrix[1,1] * Vector[1] + Matrix[2,1] * Vector[2];
Result[2] := Matrix[0,2] * Vector[0] + Matrix[1,2] * Vector[1] + Matrix[2,2] * Vector[2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[0,i] * Vector[0] + Matrix[1,i] * Vector[1] + Matrix[2,i] * Vector[2];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix3CMd; const Vector: TVMCLVector3d): TVMCLVector3d;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[1,0] * Vector[1] + Matrix[2,0] * Vector[2];
Result[1] := Matrix[0,1] * Vector[0] + Matrix[1,1] * Vector[1] + Matrix[2,1] * Vector[2];
Result[2] := Matrix[0,2] * Vector[0] + Matrix[1,2] * Vector[1] + Matrix[2,2] * Vector[2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[0,i] * Vector[0] + Matrix[1,i] * Vector[1] + Matrix[2,i] * Vector[2];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix4RMs; const Vector: TVMCLVector4s): TVMCLVector4s;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[0,1] * Vector[1] + Matrix[0,2] * Vector[2] + Matrix[0,3] * Vector[3];
Result[1] := Matrix[1,0] * Vector[0] + Matrix[1,1] * Vector[1] + Matrix[1,2] * Vector[2] + Matrix[1,3] * Vector[3];
Result[2] := Matrix[2,0] * Vector[0] + Matrix[2,1] * Vector[1] + Matrix[2,2] * Vector[2] + Matrix[2,3] * Vector[3];
Result[3] := Matrix[3,0] * Vector[0] + Matrix[3,1] * Vector[1] + Matrix[3,2] * Vector[2] + Matrix[3,3] * Vector[3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[i,0] * Vector[0] + Matrix[i,1] * Vector[1] +
               Matrix[i,2] * Vector[2] + Matrix[i,3] * Vector[3];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix4RMd; const Vector: TVMCLVector4d): TVMCLVector4d; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[0,1] * Vector[1] + Matrix[0,2] * Vector[2] + Matrix[0,3] * Vector[3];
Result[1] := Matrix[1,0] * Vector[0] + Matrix[1,1] * Vector[1] + Matrix[1,2] * Vector[2] + Matrix[1,3] * Vector[3];
Result[2] := Matrix[2,0] * Vector[0] + Matrix[2,1] * Vector[1] + Matrix[2,2] * Vector[2] + Matrix[2,3] * Vector[3];
Result[3] := Matrix[3,0] * Vector[0] + Matrix[3,1] * Vector[1] + Matrix[3,2] * Vector[2] + Matrix[3,3] * Vector[3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[i,0] * Vector[0] + Matrix[i,1] * Vector[1] +
               Matrix[i,2] * Vector[2] + Matrix[i,3] * Vector[3];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix4CMs; const Vector: TVMCLVector4s): TVMCLVector4s;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[1,0] * Vector[1] + Matrix[2,0] * Vector[2] + Matrix[3,0] * Vector[3];
Result[1] := Matrix[0,1] * Vector[0] + Matrix[1,1] * Vector[1] + Matrix[2,1] * Vector[2] + Matrix[3,1] * Vector[3];
Result[2] := Matrix[0,2] * Vector[0] + Matrix[1,2] * Vector[1] + Matrix[2,2] * Vector[2] + Matrix[3,2] * Vector[3];
Result[3] := Matrix[0,3] * Vector[0] + Matrix[1,3] * Vector[1] + Matrix[2,3] * Vector[2] + Matrix[3,3] * Vector[3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[0,i] * Vector[0] + Matrix[1,i] * Vector[1] +
               Matrix[2,i] * Vector[2] + Matrix[3,i] * Vector[3];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorMultiply(const Matrix: TVMCLMatrix4CMd; const Vector: TVMCLVector4d): TVMCLVector4d;
{$IFDEF MatricesUnwindLoops}
begin
Result[0] := Matrix[0,0] * Vector[0] + Matrix[1,0] * Vector[1] + Matrix[2,0] * Vector[2] + Matrix[3,0] * Vector[3];
Result[1] := Matrix[0,1] * Vector[0] + Matrix[1,1] * Vector[1] + Matrix[2,1] * Vector[2] + Matrix[3,1] * Vector[3];
Result[2] := Matrix[0,2] * Vector[0] + Matrix[1,2] * Vector[1] + Matrix[2,2] * Vector[2] + Matrix[3,2] * Vector[3];
Result[3] := Matrix[0,3] * Vector[0] + Matrix[1,3] * Vector[1] + Matrix[2,3] * Vector[2] + Matrix[3,3] * Vector[3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(Vector) to High(Vector) do
  Result[i] := Matrix[0,i] * Vector[0] + Matrix[1,i] * Vector[1] +
               Matrix[2,i] * Vector[2] + Matrix[3,i] * Vector[3];
end;
{$ENDIF}

{===============================================================================
    Calculations with multiple matrices - implementation
===============================================================================}

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[0,1] := aMatrix[0,1] + bMatrix[0,1];
Result[1,0] := aMatrix[1,0] + bMatrix[1,0]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := TVMCLMatrix2so(aMatrix)[i] + TVMCLMatrix2so(bMatrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[0,1] := aMatrix[0,1] + bMatrix[0,1];
Result[1,0] := aMatrix[1,0] + bMatrix[1,0]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := TVMCLMatrix2do(aMatrix)[i] + TVMCLMatrix2do(bMatrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[1,0] := aMatrix[1,0] + bMatrix[1,0];
Result[0,1] := aMatrix[0,1] + bMatrix[0,1]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := TVMCLMatrix2so(aMatrix)[i] + TVMCLMatrix2so(bMatrix)[i];
end;  
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[1,0] := aMatrix[1,0] + bMatrix[1,0];
Result[0,1] := aMatrix[0,1] + bMatrix[0,1]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := TVMCLMatrix2do(aMatrix)[i] + TVMCLMatrix2do(bMatrix)[i];
end;  
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[0,1] := aMatrix[0,1] + bMatrix[0,1]; Result[0,2] := aMatrix[0,2] + bMatrix[0,2];
Result[1,0] := aMatrix[1,0] + bMatrix[1,0]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1]; Result[1,2] := aMatrix[1,2] + bMatrix[1,2];
Result[2,0] := aMatrix[2,0] + bMatrix[2,0]; Result[2,1] := aMatrix[2,1] + bMatrix[2,1]; Result[2,2] := aMatrix[2,2] + bMatrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := TVMCLMatrix3so(aMatrix)[i] + TVMCLMatrix3so(bMatrix)[i];
end;  
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[0,1] := aMatrix[0,1] + bMatrix[0,1]; Result[0,2] := aMatrix[0,2] + bMatrix[0,2];
Result[1,0] := aMatrix[1,0] + bMatrix[1,0]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1]; Result[1,2] := aMatrix[1,2] + bMatrix[1,2];
Result[2,0] := aMatrix[2,0] + bMatrix[2,0]; Result[2,1] := aMatrix[2,1] + bMatrix[2,1]; Result[2,2] := aMatrix[2,2] + bMatrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := TVMCLMatrix3do(aMatrix)[i] + TVMCLMatrix3do(bMatrix)[i];
end;  
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[1,0] := aMatrix[1,0] + bMatrix[1,0]; Result[2,0] := aMatrix[2,0] + bMatrix[2,0];
Result[0,1] := aMatrix[0,1] + bMatrix[0,1]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1]; Result[2,1] := aMatrix[2,1] + bMatrix[2,1];
Result[0,2] := aMatrix[0,2] + bMatrix[0,2]; Result[1,2] := aMatrix[1,2] + bMatrix[1,2]; Result[2,2] := aMatrix[2,2] + bMatrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := TVMCLMatrix3so(aMatrix)[i] + TVMCLMatrix3so(bMatrix)[i];
end; 
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[1,0] := aMatrix[1,0] + bMatrix[1,0]; Result[2,0] := aMatrix[2,0] + bMatrix[2,0];
Result[0,1] := aMatrix[0,1] + bMatrix[0,1]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1]; Result[2,1] := aMatrix[2,1] + bMatrix[2,1];
Result[0,2] := aMatrix[0,2] + bMatrix[0,2]; Result[1,2] := aMatrix[1,2] + bMatrix[1,2]; Result[2,2] := aMatrix[2,2] + bMatrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := TVMCLMatrix3do(aMatrix)[i] + TVMCLMatrix3do(bMatrix)[i];
end;  
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[0,1] := aMatrix[0,1] + bMatrix[0,1];
Result[0,2] := aMatrix[0,2] + bMatrix[0,2]; Result[0,3] := aMatrix[0,3] + bMatrix[0,3];
Result[1,0] := aMatrix[1,0] + bMatrix[1,0]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1];
Result[1,2] := aMatrix[1,2] + bMatrix[1,2]; Result[1,3] := aMatrix[1,3] + bMatrix[1,3];
Result[2,0] := aMatrix[2,0] + bMatrix[2,0]; Result[2,1] := aMatrix[2,1] + bMatrix[2,1];
Result[2,2] := aMatrix[2,2] + bMatrix[2,2]; Result[2,3] := aMatrix[2,3] + bMatrix[2,3];
Result[3,0] := aMatrix[3,0] + bMatrix[3,0]; Result[3,1] := aMatrix[3,1] + bMatrix[3,1];
Result[3,2] := aMatrix[3,2] + bMatrix[3,2]; Result[3,3] := aMatrix[3,3] + bMatrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := TVMCLMatrix4so(aMatrix)[i] + TVMCLMatrix4so(bMatrix)[i];
end;  
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[0,1] := aMatrix[0,1] + bMatrix[0,1];
Result[0,2] := aMatrix[0,2] + bMatrix[0,2]; Result[0,3] := aMatrix[0,3] + bMatrix[0,3];
Result[1,0] := aMatrix[1,0] + bMatrix[1,0]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1];
Result[1,2] := aMatrix[1,2] + bMatrix[1,2]; Result[1,3] := aMatrix[1,3] + bMatrix[1,3];
Result[2,0] := aMatrix[2,0] + bMatrix[2,0]; Result[2,1] := aMatrix[2,1] + bMatrix[2,1];
Result[2,2] := aMatrix[2,2] + bMatrix[2,2]; Result[2,3] := aMatrix[2,3] + bMatrix[2,3];
Result[3,0] := aMatrix[3,0] + bMatrix[3,0]; Result[3,1] := aMatrix[3,1] + bMatrix[3,1];
Result[3,2] := aMatrix[3,2] + bMatrix[3,2]; Result[3,3] := aMatrix[3,3] + bMatrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := TVMCLMatrix4do(aMatrix)[i] + TVMCLMatrix4do(bMatrix)[i];
end; 
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[1,0] := aMatrix[1,0] + bMatrix[1,0];
Result[2,0] := aMatrix[2,0] + bMatrix[2,0]; Result[3,0] := aMatrix[3,0] + bMatrix[3,0];
Result[0,1] := aMatrix[0,1] + bMatrix[0,1]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1];
Result[2,1] := aMatrix[2,1] + bMatrix[2,1]; Result[3,1] := aMatrix[3,1] + bMatrix[3,1];
Result[0,2] := aMatrix[0,2] + bMatrix[0,2]; Result[1,2] := aMatrix[1,2] + bMatrix[1,2];
Result[2,2] := aMatrix[2,2] + bMatrix[2,2]; Result[3,2] := aMatrix[3,2] + bMatrix[3,2];
Result[0,3] := aMatrix[0,3] + bMatrix[0,3]; Result[1,3] := aMatrix[1,3] + bMatrix[1,3];
Result[2,3] := aMatrix[2,3] + bMatrix[2,3]; Result[3,3] := aMatrix[3,3] + bMatrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := TVMCLMatrix4so(aMatrix)[i] + TVMCLMatrix4so(bMatrix)[i];
end; 
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---
 
Function MatricesAdd(const aMatrix,bMatrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] + bMatrix[0,0]; Result[1,0] := aMatrix[1,0] + bMatrix[1,0];
Result[2,0] := aMatrix[2,0] + bMatrix[2,0]; Result[3,0] := aMatrix[3,0] + bMatrix[3,0];
Result[0,1] := aMatrix[0,1] + bMatrix[0,1]; Result[1,1] := aMatrix[1,1] + bMatrix[1,1];
Result[2,1] := aMatrix[2,1] + bMatrix[2,1]; Result[3,1] := aMatrix[3,1] + bMatrix[3,1];
Result[0,2] := aMatrix[0,2] + bMatrix[0,2]; Result[1,2] := aMatrix[1,2] + bMatrix[1,2];
Result[2,2] := aMatrix[2,2] + bMatrix[2,2]; Result[3,2] := aMatrix[3,2] + bMatrix[3,2];
Result[0,3] := aMatrix[0,3] + bMatrix[0,3]; Result[1,3] := aMatrix[1,3] + bMatrix[1,3];
Result[2,3] := aMatrix[2,3] + bMatrix[2,3]; Result[3,3] := aMatrix[3,3] + bMatrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := TVMCLMatrix4do(aMatrix)[i] + TVMCLMatrix4do(bMatrix)[i];
end;   
{$ENDIF}

//==============================================================================

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[0,1] := aMatrix[0,1] - bMatrix[0,1];
Result[1,0] := aMatrix[1,0] - bMatrix[1,0]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := TVMCLMatrix2so(aMatrix)[i] - TVMCLMatrix2so(bMatrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd;
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[0,1] := aMatrix[0,1] - bMatrix[0,1];
Result[1,0] := aMatrix[1,0] - bMatrix[1,0]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := TVMCLMatrix2do(aMatrix)[i] - TVMCLMatrix2do(bMatrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[1,0] := aMatrix[1,0] - bMatrix[1,0];
Result[0,1] := aMatrix[0,1] - bMatrix[0,1]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2so) to High(TVMCLMatrix2so) do
  TVMCLMatrix2so(Result)[i] := TVMCLMatrix2so(aMatrix)[i] - TVMCLMatrix2so(bMatrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[1,0] := aMatrix[1,0] - bMatrix[1,0];
Result[0,1] := aMatrix[0,1] - bMatrix[0,1]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix2do) to High(TVMCLMatrix2do) do
  TVMCLMatrix2do(Result)[i] := TVMCLMatrix2do(aMatrix)[i] - TVMCLMatrix2do(bMatrix)[i];
end; 
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[0,1] := aMatrix[0,1] - bMatrix[0,1]; Result[0,2] := aMatrix[0,2] - bMatrix[0,2];
Result[1,0] := aMatrix[1,0] - bMatrix[1,0]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1]; Result[1,2] := aMatrix[1,2] - bMatrix[1,2];
Result[2,0] := aMatrix[2,0] - bMatrix[2,0]; Result[2,1] := aMatrix[2,1] - bMatrix[2,1]; Result[2,2] := aMatrix[2,2] - bMatrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := TVMCLMatrix3so(aMatrix)[i] - TVMCLMatrix3so(bMatrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[0,1] := aMatrix[0,1] - bMatrix[0,1]; Result[0,2] := aMatrix[0,2] - bMatrix[0,2];
Result[1,0] := aMatrix[1,0] - bMatrix[1,0]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1]; Result[1,2] := aMatrix[1,2] - bMatrix[1,2];
Result[2,0] := aMatrix[2,0] - bMatrix[2,0]; Result[2,1] := aMatrix[2,1] - bMatrix[2,1]; Result[2,2] := aMatrix[2,2] - bMatrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := TVMCLMatrix3do(aMatrix)[i] - TVMCLMatrix3do(bMatrix)[i];
end;  
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[1,0] := aMatrix[1,0] - bMatrix[1,0]; Result[2,0] := aMatrix[2,0] - bMatrix[2,0];
Result[0,1] := aMatrix[0,1] - bMatrix[0,1]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1]; Result[2,1] := aMatrix[2,1] - bMatrix[2,1];
Result[0,2] := aMatrix[0,2] - bMatrix[0,2]; Result[1,2] := aMatrix[1,2] - bMatrix[1,2]; Result[2,2] := aMatrix[2,2] - bMatrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3so) to High(TVMCLMatrix3so) do
  TVMCLMatrix3so(Result)[i] := TVMCLMatrix3so(aMatrix)[i] - TVMCLMatrix3so(bMatrix)[i];
end; 
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[1,0] := aMatrix[1,0] - bMatrix[1,0]; Result[2,0] := aMatrix[2,0] - bMatrix[2,0];
Result[0,1] := aMatrix[0,1] - bMatrix[0,1]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1]; Result[2,1] := aMatrix[2,1] - bMatrix[2,1];
Result[0,2] := aMatrix[0,2] - bMatrix[0,2]; Result[1,2] := aMatrix[1,2] - bMatrix[1,2]; Result[2,2] := aMatrix[2,2] - bMatrix[2,2];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix3do) to High(TVMCLMatrix3do) do
  TVMCLMatrix3do(Result)[i] := TVMCLMatrix3do(aMatrix)[i] - TVMCLMatrix3do(bMatrix)[i];
end; 
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[0,1] := aMatrix[0,1] - bMatrix[0,1];
Result[0,2] := aMatrix[0,2] - bMatrix[0,2]; Result[0,3] := aMatrix[0,3] - bMatrix[0,3];
Result[1,0] := aMatrix[1,0] - bMatrix[1,0]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1];
Result[1,2] := aMatrix[1,2] - bMatrix[1,2]; Result[1,3] := aMatrix[1,3] - bMatrix[1,3];
Result[2,0] := aMatrix[2,0] - bMatrix[2,0]; Result[2,1] := aMatrix[2,1] - bMatrix[2,1];
Result[2,2] := aMatrix[2,2] - bMatrix[2,2]; Result[2,3] := aMatrix[2,3] - bMatrix[2,3];
Result[3,0] := aMatrix[3,0] - bMatrix[3,0]; Result[3,1] := aMatrix[3,1] - bMatrix[3,1];
Result[3,2] := aMatrix[3,2] - bMatrix[3,2]; Result[3,3] := aMatrix[3,3] - bMatrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := TVMCLMatrix4so(aMatrix)[i] - TVMCLMatrix4so(bMatrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[0,1] := aMatrix[0,1] - bMatrix[0,1];
Result[0,2] := aMatrix[0,2] - bMatrix[0,2]; Result[0,3] := aMatrix[0,3] - bMatrix[0,3];
Result[1,0] := aMatrix[1,0] - bMatrix[1,0]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1];
Result[1,2] := aMatrix[1,2] - bMatrix[1,2]; Result[1,3] := aMatrix[1,3] - bMatrix[1,3];
Result[2,0] := aMatrix[2,0] - bMatrix[2,0]; Result[2,1] := aMatrix[2,1] - bMatrix[2,1];
Result[2,2] := aMatrix[2,2] - bMatrix[2,2]; Result[2,3] := aMatrix[2,3] - bMatrix[2,3];
Result[3,0] := aMatrix[3,0] - bMatrix[3,0]; Result[3,1] := aMatrix[3,1] - bMatrix[3,1];
Result[3,2] := aMatrix[3,2] - bMatrix[3,2]; Result[3,3] := aMatrix[3,3] - bMatrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := TVMCLMatrix4do(aMatrix)[i] - TVMCLMatrix4do(bMatrix)[i];
end; 
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[1,0] := aMatrix[1,0] - bMatrix[1,0];
Result[2,0] := aMatrix[2,0] - bMatrix[2,0]; Result[3,0] := aMatrix[3,0] - bMatrix[3,0];
Result[0,1] := aMatrix[0,1] - bMatrix[0,1]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1];
Result[2,1] := aMatrix[2,1] - bMatrix[2,1]; Result[3,1] := aMatrix[3,1] - bMatrix[3,1];
Result[0,2] := aMatrix[0,2] - bMatrix[0,2]; Result[1,2] := aMatrix[1,2] - bMatrix[1,2];
Result[2,2] := aMatrix[2,2] - bMatrix[2,2]; Result[3,2] := aMatrix[3,2] - bMatrix[3,2];
Result[0,3] := aMatrix[0,3] - bMatrix[0,3]; Result[1,3] := aMatrix[1,3] - bMatrix[1,3];
Result[2,3] := aMatrix[2,3] - bMatrix[2,3]; Result[3,3] := aMatrix[3,3] - bMatrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4so) to High(TVMCLMatrix4so) do
  TVMCLMatrix4so(Result)[i] := TVMCLMatrix4so(aMatrix)[i] - TVMCLMatrix4so(bMatrix)[i];
end;
{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesSubtract(const aMatrix,bMatrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd; 
{$IFDEF MatricesUnwindLoops}
begin
Result[0,0] := aMatrix[0,0] - bMatrix[0,0]; Result[1,0] := aMatrix[1,0] - bMatrix[1,0];
Result[2,0] := aMatrix[2,0] - bMatrix[2,0]; Result[3,0] := aMatrix[3,0] - bMatrix[3,0];
Result[0,1] := aMatrix[0,1] - bMatrix[0,1]; Result[1,1] := aMatrix[1,1] - bMatrix[1,1];
Result[2,1] := aMatrix[2,1] - bMatrix[2,1]; Result[3,1] := aMatrix[3,1] - bMatrix[3,1];
Result[0,2] := aMatrix[0,2] - bMatrix[0,2]; Result[1,2] := aMatrix[1,2] - bMatrix[1,2];
Result[2,2] := aMatrix[2,2] - bMatrix[2,2]; Result[3,2] := aMatrix[3,2] - bMatrix[3,2];
Result[0,3] := aMatrix[0,3] - bMatrix[0,3]; Result[1,3] := aMatrix[1,3] - bMatrix[1,3];
Result[2,3] := aMatrix[2,3] - bMatrix[2,3]; Result[3,3] := aMatrix[3,3] - bMatrix[3,3];
end;
{$ELSE}
var
  i:  Integer;
begin
For i := Low(TVMCLMatrix4do) to High(TVMCLMatrix4do) do
  TVMCLMatrix4do(Result)[i] := TVMCLMatrix4do(aMatrix)[i] - TVMCLMatrix4do(bMatrix)[i];
end;  
{$ENDIF}

//==============================================================================
{$message 'unwind'}
Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix2RMs): TVMCLMatrix2RMs;
var
  Col,Row:  Integer;
begin
For Row := Low(Result) to High(Result) do
  For Col := Low(Result[0]) to High(Result[0]) do
    Result[Row,Col] := aMatrix[Row,0] * bMatrix[0,Col] +
                       aMatrix[Row,1] * bMatrix[1,Col];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix2RMd): TVMCLMatrix2RMd;
var
  Col,Row:  Integer;
begin
For Row := Low(Result) to High(Result) do
  For Col := Low(Result[0]) to High(Result[0]) do
    Result[Row,Col] := aMatrix[Row,0] * bMatrix[0,Col] +
                       aMatrix[Row,1] * bMatrix[1,Col];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix2CMs): TVMCLMatrix2CMs;
var
  Col,Row:  Integer;
begin
For Row := Low(Result[0]) to High(Result[0]) do
  For Col := Low(Result) to High(Result) do
    Result[Col,Row] := aMatrix[0,Row] * bMatrix[Col,0] +
                       aMatrix[1,Row] * bMatrix[Col,1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix2CMd): TVMCLMatrix2CMd; 
var
  Col,Row:  Integer;
begin
For Row := Low(Result[0]) to High(Result[0]) do
  For Col := Low(Result) to High(Result) do
    Result[Col,Row] := aMatrix[0,Row] * bMatrix[Col,0] +
                       aMatrix[1,Row] * bMatrix[Col,1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix3RMs): TVMCLMatrix3RMs;
var
  Col,Row:  Integer;
begin
For Row := Low(Result) to High(Result) do
  For Col := Low(Result[0]) to High(Result[0]) do
    Result[Row,Col] := aMatrix[Row,0] * bMatrix[0,Col] +
                       aMatrix[Row,1] * bMatrix[1,Col] +
                       aMatrix[Row,2] * bMatrix[2,Col];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix3RMd): TVMCLMatrix3RMd;
var
  Col,Row:  Integer;
begin
For Row := Low(Result) to High(Result) do
  For Col := Low(Result[0]) to High(Result[0]) do
    Result[Row,Col] := aMatrix[Row,0] * bMatrix[0,Col] +
                       aMatrix[Row,1] * bMatrix[1,Col] +
                       aMatrix[Row,2] * bMatrix[2,Col];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix3CMs): TVMCLMatrix3CMs;
var
  Col,Row:  Integer;
begin
For Row := Low(Result[0]) to High(Result[0]) do
  For Col := Low(Result) to High(Result) do
    Result[Col,Row] := aMatrix[0,Row] * bMatrix[Col,0] +
                       aMatrix[1,Row] * bMatrix[Col,1] +
                       aMatrix[2,Row] * bMatrix[Col,2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix3CMd): TVMCLMatrix3CMd;
var
  Col,Row:  Integer;
begin
For Row := Low(Result[0]) to High(Result[0]) do
  For Col := Low(Result) to High(Result) do
    Result[Col,Row] := aMatrix[0,Row] * bMatrix[Col,0] +
                       aMatrix[1,Row] * bMatrix[Col,1] +
                       aMatrix[2,Row] * bMatrix[Col,2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix4RMs): TVMCLMatrix4RMs;
var
  Col,Row:  Integer;
begin
For Row := Low(Result) to High(Result) do
  For Col := Low(Result[0]) to High(Result[0]) do
    Result[Row,Col] := aMatrix[Row,0] * bMatrix[0,Col] +
                       aMatrix[Row,1] * bMatrix[1,Col] +
                       aMatrix[Row,2] * bMatrix[2,Col] +
                       aMatrix[Row,3] * bMatrix[3,Col];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix4RMd): TVMCLMatrix4RMd;
var
  Col,Row:  Integer;
begin
For Row := Low(Result) to High(Result) do
  For Col := Low(Result[0]) to High(Result[0]) do
    Result[Row,Col] := aMatrix[Row,0] * bMatrix[0,Col] +
                       aMatrix[Row,1] * bMatrix[1,Col] +
                       aMatrix[Row,2] * bMatrix[2,Col] +
                       aMatrix[Row,3] * bMatrix[3,Col];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix4CMs): TVMCLMatrix4CMs;
var
  Col,Row:  Integer;
begin
For Row := Low(Result[0]) to High(Result[0]) do
  For Col := Low(Result) to High(Result) do
    Result[Col,Row] := aMatrix[0,Row] * bMatrix[Col,0] +
                       aMatrix[1,Row] * bMatrix[Col,1] +
                       aMatrix[2,Row] * bMatrix[Col,2] +
                       aMatrix[3,Row] * bMatrix[Col,3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MatricesMultiply(const aMatrix,bMatrix: TVMCLMatrix4CMd): TVMCLMatrix4CMd;
var
  Col,Row:  Integer;
begin
For Row := Low(Result[0]) to High(Result[0]) do
  For Col := Low(Result) to High(Result) do
    Result[Col,Row] := aMatrix[0,Row] * bMatrix[Col,0] +
                       aMatrix[1,Row] * bMatrix[Col,1] +
                       aMatrix[2,Row] * bMatrix[Col,2] +
                       aMatrix[3,Row] * bMatrix[Col,3];
end;

end.
