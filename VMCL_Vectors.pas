{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  VMCL - Vectors & Matrices calculation library

  Vectors

  ©František Milt 2018-02-26

  Version 1.0 dev

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    BitVector   - github.com/ncs-sniper/Lib.BitVector
    BitOps      - github.com/ncs-sniper/Lib.BitOps
    StrRect     - github.com/ncs-sniper/Lib.StrRect
    SimpleCPUID - github.com/ncs-sniper/Lib.SimpleCPUID

===============================================================================}
unit VMCL_Vectors;

{$INCLUDE 'VMCL_defs.inc'}

interface

uses
  VMCL_Common;

{===============================================================================
    Vector types and constants
===============================================================================}
type
  TVMCLVectorField = (X = 0,Y,Z,W); //used for swizzling

  TVMCLVector2s = packed array[0..1] of Single;     PVMCLVector2s = ^TVMCLVector2s;
  TVMCLVector2d = packed array[0..1] of Double;     PVMCLVector2d = ^TVMCLVector2d;
{$IFDEF VectorsDoubleIsDefault}
  TVMCLVector2  = TVMCLVector2d;                    PVMCLVector2  = ^TVMCLVector2;
{$ELSE}
  TVMCLVector2  = TVMCLVector2s;                    PVMCLVector2  = ^TVMCLVector2;
{$ENDIF}

  TVMCLVector3s = packed array[0..2] of Single;     PVMCLVector3s = ^TVMCLVector3s;
  TVMCLVector3d = packed array[0..2] of Double;     PVMCLVector3d = ^TVMCLVector3d;
{$IFDEF VectorsDoubleIsDefault}
  TVMCLVector3  = TVMCLVector3d;                    PVMCLVector3  = ^TVMCLVector3;
{$ELSE}
  TVMCLVector3  = TVMCLVector3s;                    PVMCLVector3  = ^TVMCLVector3;
{$ENDIF}

  TVMCLVector4s = packed array[0..3] of Single;     PVMCLVector4s = ^TVMCLVector4s;
  TVMCLVector4d = packed array[0..3] of Double;     PVMCLVector4d = ^TVMCLVector4d;
{$IFDEF VectorsDoubleIsDefault}
  TVMCLVector4  = TVMCLVector4d;                    PVMCLVector4  = ^TVMCLVector4;
{$ELSE}
  TVMCLVector4  = TVMCLVector4s;                    PVMCLVector4  = ^TVMCLVector4;
{$ENDIF}

  TVMCLVector2sr = packed record
    X,Y:  Single;
  end;
  PVMCLVector2sr = ^TVMCLVector2sr;

  TVMCLVector2dr = packed record
    X,Y:  Double;
  end;
  PVMCLVector2dr = ^TVMCLVector2dr;

{$IFDEF VectorsDoubleIsDefault}
  TVMCLVector2r = TVMCLVector2dr;   PVMCLVector2r = ^TVMCLVector2r;
{$ELSE}
  TVMCLVector2r = TVMCLVector2sr;   PVMCLVector2r = ^TVMCLVector2r;
{$ENDIF}

  TVMCLVector3sr = packed record
    X,Y,Z:  Single;
  end;
  PVMCLVector3sr = ^TVMCLVector3sr;

  TVMCLVector3dr = packed record
    X,Y,Z:  Double;
  end;
  PVMCLVector3dr = ^TVMCLVector3dr;

{$IFDEF VectorsDoubleIsDefault}
  TVMCLVector3r = TVMCLVector3dr;   PVMCLVector3r = ^TVMCLVector3r;
{$ELSE}
  TVMCLVector3r = TVMCLVector3sr;   PVMCLVector3r = ^TVMCLVector3r;
{$ENDIF}

  TVMCLVector4sr = packed record
    X,Y,Z,W:  Single;
  end;
  PVMCLVector4sr = ^TVMCLVector4sr;

  TVMCLVector4dr = packed record
    X,Y,Z,W:  Double;
  end;
  PVMCLVector4dr = ^TVMCLVector4dr;

{$IFDEF VectorsDoubleIsDefault}
  TVMCLVector4r = TVMCLVector4dr;   PVMCLVector4r = ^TVMCLVector4r;
{$ELSE}
  TVMCLVector4r = TVMCLVector4sr;   PVMCLVector4r = ^TVMCLVector4r;
{$ENDIF}

//- shortened-name types (aliasses for TVMCL* types) ---------------------------

  TVectorField = TVMCLVectorField;

  TVector2s = TVMCLVector2s;    PVector2s = PVMCLVector2s;
  TVector2d = TVMCLVector2d;    PVector2d = PVMCLVector2d;
  TVector2  = TVMCLVector2;     PVector2  = PVMCLVector2;

  TVector3s = TVMCLVector3s;    PVector3s = PVMCLVector3s;
  TVector3d = TVMCLVector3d;    PVector3d = PVMCLVector3d;
  TVector3  = TVMCLVector3;     PVector3  = PVMCLVector3;

  TVector4s = TVMCLVector4s;    PVector4s = PVMCLVector4s;
  TVector4d = TVMCLVector4d;    PVector4d = PVMCLVector4d;
  TVector4  = TVMCLVector4;     PVector4  = PVMCLVector4;

  TVector2sr = TVMCLVector2sr;    PVector2sr = PVMCLVector2sr;
  TVector2dr = TVMCLVector2dr;    PVector2dr = PVMCLVector2dr;
  TVector2r  = TVMCLVector2r;     PVector2r  = PVMCLVector2r;

  TVector3sr = TVMCLVector3sr;    PVector3sr = PVMCLVector3sr;
  TVector3dr = TVMCLVector3dr;    PVector3dr = PVMCLVector3dr;
  TVector3r  = TVMCLVector3r;     PVector3r  = PVMCLVector3r;

  TVector4sr = TVMCLVector4sr;    PVector4sr = PVMCLVector4sr;
  TVector4dr = TVMCLVector4dr;    PVector4dr = PVMCLVector4dr;
  TVector4r  = TVMCLVector4r;     PVector4r  = PVMCLVector4r;

//- Vector constants -----------------------------------------------------------
const
  // empty/zero vectors
  VMCL_ZeroVector2s: TVMCLVector2s = (0.0, 0.0);
  VMCL_ZeroVector2d: TVMCLVector2d = (0.0, 0.0);

  VMCL_ZeroVector3s: TVMCLVector3s = (0.0, 0.0, 0.0);
  VMCL_ZeroVector3d: TVMCLVector3d = (0.0, 0.0, 0.0);

  VMCL_ZeroVector4s: TVMCLVector4s = (0.0, 0.0, 0.0, 0.0);
  VMCL_ZeroVector4d: TVMCLVector4d = (0.0, 0.0, 0.0, 0.0);

  // special 4-dim unit vectors
  VMCL_PositionXs: TVMCLVector4s = (1.0, 0.0, 0.0, 1.0);  // point on X axis, 1.0 distant from origin
  VMCL_PositionYs: TVMCLVector4s = (0.0, 1.0, 0.0, 1.0);  // point on Y axis, 1.0 distant from origin
  VMCL_PositionZs: TVMCLVector4s = (0.0, 0.0, 1.0, 1.0);  // point on Z axis, 1.0 distant from origin

  VMCL_PositionXd: TVMCLVector4d = (1.0, 0.0, 0.0, 1.0);
  VMCL_PositionYd: TVMCLVector4d = (0.0, 1.0, 0.0, 1.0);
  VMCL_PositionZd: TVMCLVector4d = (0.0, 0.0, 1.0, 1.0);

  VMCL_DirectionXs: TVMCLVector4s = (1.0, 0.0, 0.0, 0.0);
  VMCL_DirectionYs: TVMCLVector4s = (0.0, 1.0, 0.0, 0.0);
  VMCL_DirectionZs: TVMCLVector4s = (0.0, 0.0, 1.0, 0.0);

  VMCL_DirectionXd: TVMCLVector4d = (1.0, 0.0, 0.0, 0.0);
  VMCL_DirectionYd: TVMCLVector4d = (0.0, 1.0, 0.0, 0.0);
  VMCL_DirectionZd: TVMCLVector4d = (0.0, 0.0, 1.0, 0.0);

{===============================================================================
    Vector formatting types, constants and functions - declaration
===============================================================================}

type
  TVMCLVecCmpDescr = array[0..3] of String; // vector component descriptors

  TVMCLVectorFormat = record
    CommonFormat:             TVMCLCommonFormat;
    ShowComponentDescriptors: Boolean;
    ComponentDescriptors:     TVMCLVecCmpDescr;
  end;

const
  VMCL_DefaultVectorFormat: TVMCLVectorFormat = (
    CommonFormat: (
      ValueFormat: (
        ThousandSeparator:    #0;
        DecimalSeparator:     '.';
        DecimalPlaces:        -1);
      WhiteSpace:           ' ';
      ComponentsDelimiter:  ',';
      LeadingString:        '[';
      TrailingString:       ']');
    ShowComponentDescriptors: False;
    ComponentDescriptors:     ('X: ','Y: ','Z: ','W: '));

  VMCL_EmptyComponentDescriptors:   TVMCLVecCmpDescr = ('','','','');
  VMCL_DefaultComponentDescriptors: TVMCLVecCmpDescr = ('X: ','Y: ','Z: ','W: ');

Function VectorFormat(CommonFormat: TVMCLCommonFormat; ShowComponentDescriptors: Boolean; ComponentDescriptors: TVMCLVecCmpDescr): TVMCLVectorFormat; overload;
Function VectorFormat(CommonFormat: TVMCLCommonFormat; ShowComponentDescriptors: Boolean; ComponentDescriptors: array of String): TVMCLVectorFormat; overload;

{===============================================================================
    Vector to string conversion functions - declaration
===============================================================================}

Function VecToStr(const Vector: TVMCLVector2s; const VectorFormat: TVMCLVectorFormat): String; overload;
Function VecToStr(const Vector: TVMCLVector3s; const VectorFormat: TVMCLVectorFormat): String; overload;
Function VecToStr(const Vector: TVMCLVector4s; const VectorFormat: TVMCLVectorFormat): String; overload;
Function VecToStr(const Vector: TVMCLVector2d; const VectorFormat: TVMCLVectorFormat): String; overload;
Function VecToStr(const Vector: TVMCLVector3d; const VectorFormat: TVMCLVectorFormat): String; overload;
Function VecToStr(const Vector: TVMCLVector4d; const VectorFormat: TVMCLVectorFormat): String; overload;

Function VecToStr(const Vector: TVMCLVector2s): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector3s): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector4s): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector2d): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector3d): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector4d): String; overload;{$IFDEF CanInline} inline;{$ENDIF}

Function VecToStr(const Vector: TVMCLVector2sr): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector3sr): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector4sr): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector2dr): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector3dr): String; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function VecToStr(const Vector: TVMCLVector4dr): String; overload;{$IFDEF CanInline} inline;{$ENDIF}

{===============================================================================
    Vector building
===============================================================================}

Function Vector2s(const X, Y: Single): TVMCLVector2s; overload;
Function Vector3s(const X, Y, Z: Single): TVMCLVector3s; overload;
Function Vector3s(const Vector: TVMCLVector2s; const Z: Single): TVMCLVector3s; overload;
Function Vector3s(const X: Single; const Vector: TVMCLVector2s): TVMCLVector3s; overload;
Function Vector4s(const X, Y, Z, W: Single): TVMCLVector4s; overload;
Function Vector4s(const aVector, bVector: TVMCLVector2s): TVMCLVector4s; overload;
Function Vector4s(const Vector: TVMCLVector2s; const Z, W: Single): TVMCLVector4s; overload;
Function Vector4s(const X: Single; const Vector: TVMCLVector2s; const W: Single): TVMCLVector4s; overload;
Function Vector4s(const X, Y: Single; const Vector: TVMCLVector2s): TVMCLVector4s; overload;
Function Vector4s(const X: Single; const Vector: TVMCLVector3s): TVMCLVector4s; overload;
Function Vector4s(const Vector: TVMCLVector3s; const W: Single): TVMCLVector4s; overload;

Function Vector2d(const X, Y: Double): TVMCLVector2d; overload;
Function Vector3d(const X, Y, Z: Double): TVMCLVector3d; overload;
Function Vector3d(const Vector: TVMCLVector2d; const Z: Double): TVMCLVector3d; overload;
Function Vector3d(const X: Double; const Vector: TVMCLVector2d): TVMCLVector3d; overload;
Function Vector4d(const X, Y, Z, W: Double): TVMCLVector4d; overload;
Function Vector4d(const aVector, bVector: TVMCLVector2d): TVMCLVector4d; overload;
Function Vector4d(const Vector: TVMCLVector2d; const Z, W: Double): TVMCLVector4d; overload;
Function Vector4d(const X: Double; const Vector: TVMCLVector2d; const W: Double): TVMCLVector4d; overload;
Function Vector4d(const X, Y: Double; const Vector: TVMCLVector2d): TVMCLVector4d; overload;
Function Vector4d(const X: Double; const Vector: TVMCLVector3d): TVMCLVector4d; overload;
Function Vector4d(const Vector: TVMCLVector3d; const W: Double): TVMCLVector4d; overload;

{===============================================================================
    Vector swizzling
===============================================================================}

Function Swizzle(const Vector: TVMCLVector2s; f0: TVMCLVectorField): TVMCLVector2s; overload;
Function Swizzle(const Vector: TVMCLVector2s; f0,f1: TVMCLVectorField): TVMCLVector2s; overload;
Function Swizzle(const Vector: TVMCLVector3s; f0: TVMCLVectorField): TVMCLVector3s; overload;
Function Swizzle(const Vector: TVMCLVector3s; f0,f1: TVMCLVectorField): TVMCLVector3s; overload;
Function Swizzle(const Vector: TVMCLVector3s; f0,f1,f2: TVMCLVectorField): TVMCLVector3s; overload;
Function Swizzle(const Vector: TVMCLVector4s; f0: TVMCLVectorField): TVMCLVector4s; overload;
Function Swizzle(const Vector: TVMCLVector4s; f0,f1: TVMCLVectorField): TVMCLVector4s; overload;
Function Swizzle(const Vector: TVMCLVector4s; f0,f1,f2: TVMCLVectorField): TVMCLVector4s; overload;
Function Swizzle(const Vector: TVMCLVector4s; f0,f1,f2,f3: TVMCLVectorField): TVMCLVector4s; overload;

Function Swizzle(const Vector: TVMCLVector2d; f0: TVMCLVectorField): TVMCLVector2d; overload;
Function Swizzle(const Vector: TVMCLVector2d; f0,f1: TVMCLVectorField): TVMCLVector2d; overload;
Function Swizzle(const Vector: TVMCLVector3d; f0: TVMCLVectorField): TVMCLVector3d; overload;
Function Swizzle(const Vector: TVMCLVector3d; f0,f1: TVMCLVectorField): TVMCLVector3d; overload;
Function Swizzle(const Vector: TVMCLVector3d; f0,f1,f2: TVMCLVectorField): TVMCLVector3d; overload;
Function Swizzle(const Vector: TVMCLVector4d; f0: TVMCLVectorField): TVMCLVector4d; overload;
Function Swizzle(const Vector: TVMCLVector4d; f0,f1: TVMCLVectorField): TVMCLVector4d; overload;
Function Swizzle(const Vector: TVMCLVector4d; f0,f1,f2: TVMCLVectorField): TVMCLVector4d; overload;
Function Swizzle(const Vector: TVMCLVector4d; f0,f1,f2,f3: TVMCLVectorField): TVMCLVector4d; overload;

{===============================================================================
    Vector conversion
===============================================================================}

// higher to lower dimension
Function Vector2s(const Vector: TVMCLVector3s): TVMCLVector2s; overload;
Function Vector2s(const Vector: TVMCLVector4s): TVMCLVector2s; overload;
Function Vector3s(const Vector: TVMCLVector4s): TVMCLVector3s; overload;
Function Vector2d(const Vector: TVMCLVector3d): TVMCLVector2d; overload;
Function Vector2d(const Vector: TVMCLVector4d): TVMCLVector2d; overload;
Function Vector3d(const Vector: TVMCLVector4d): TVMCLVector3d; overload;

// lower to higher dimension
Function Vector3s(const Vector: TVMCLVector2s): TVMCLVector3; overload;
Function Vector4s(const Vector: TVMCLVector2s; PositionVector: Boolean = True): TVMCLVector4s; overload;
Function Vector4s(const Vector: TVMCLVector3s; PositionVector: Boolean = True): TVMCLVector4s; overload;
Function Vector3d(const Vector: TVMCLVector2d): TVMCLVector3d; overload;
Function Vector4d(const Vector: TVMCLVector2d; PositionVector: Boolean = True): TVMCLVector4d; overload;
Function Vector4d(const Vector: TVMCLVector3d; PositionVector: Boolean = True): TVMCLVector4d; overload;

// array type to record type
Function Vector2sr(const Vector: TVMCLVector2s): TVMCLVector2sr; overload;
Function Vector3sr(const Vector: TVMCLVector3s): TVMCLVector3sr; overload;
Function Vector4sr(const Vector: TVMCLVector4s): TVMCLVector4sr; overload;
Function Vector2dr(const Vector: TVMCLVector2d): TVMCLVector2dr; overload;
Function Vector3dr(const Vector: TVMCLVector3d): TVMCLVector3dr; overload;
Function Vector4dr(const Vector: TVMCLVector4d): TVMCLVector4dr; overload;

// record type to array type
Function Vector2s(const Vector: TVMCLVector2sr): TVMCLVector2s; overload;
Function Vector3s(const Vector: TVMCLVector3sr): TVMCLVector3s; overload;
Function Vector4s(const Vector: TVMCLVector4sr): TVMCLVector4s; overload;
Function Vector2d(const Vector: TVMCLVector2dr): TVMCLVector2d; overload;
Function Vector3d(const Vector: TVMCLVector3dr): TVMCLVector3d; overload;
Function Vector4d(const Vector: TVMCLVector4dr): TVMCLVector4d; overload;

// to different precision (array type)
Function Vector2s(const Vector: TVMCLVector2d): TVMCLVector2s; overload;
Function Vector3s(const Vector: TVMCLVector3d): TVMCLVector3s; overload;
Function Vector4s(const Vector: TVMCLVector4d): TVMCLVector4s; overload;
Function Vector2d(const Vector: TVMCLVector2s): TVMCLVector2d; overload;
Function Vector3d(const Vector: TVMCLVector3s): TVMCLVector3d; overload;
Function Vector4d(const Vector: TVMCLVector4s): TVMCLVector4d; overload;

// to different precision (record type)
Function Vector2sr(const Vector: TVMCLVector2dr): TVMCLVector2sr; overload;
Function Vector3sr(const Vector: TVMCLVector3dr): TVMCLVector3sr; overload;
Function Vector4sr(const Vector: TVMCLVector4dr): TVMCLVector4sr; overload;
Function Vector2dr(const Vector: TVMCLVector2sr): TVMCLVector2dr; overload;
Function Vector3dr(const Vector: TVMCLVector3sr): TVMCLVector3dr; overload;
Function Vector4dr(const Vector: TVMCLVector4sr): TVMCLVector4dr; overload;

{===============================================================================
    Basic vector functions (zeroing, comparison, etc.)
===============================================================================}

procedure LoadZeroVector(var Vector: TVMCLVector2s); overload;
procedure LoadZeroVector(var Vector: TVMCLVector3s); overload;
procedure LoadZeroVectorXYZ(var Vector: TVMCLVector4s); overload;
procedure LoadZeroVector(var Vector: TVMCLVector4s; PositionVector: Boolean = False); overload;
procedure LoadZeroVector(var Vector: TVMCLVector2d); overload;
procedure LoadZeroVector(var Vector: TVMCLVector3d); overload;
procedure LoadZeroVectorXYZ(var Vector: TVMCLVector4d); overload;
procedure LoadZeroVector(var Vector: TVMCLVector4d; PositionVector: Boolean = False); overload;

Function IsZeroVector(const Vector: TVMCLVector2s): Boolean; overload;
Function IsZeroVector(const Vector: TVMCLVector3s): Boolean; overload;
Function IsZeroVector(const Vector: TVMCLVector4s): Boolean; overload;
Function IsZeroVectorXYZ(const Vector: TVMCLVector4s): Boolean; overload;
Function IsZeroVector(const Vector: TVMCLVector2d): Boolean; overload;
Function IsZeroVector(const Vector: TVMCLVector3d): Boolean; overload;
Function IsZeroVector(const Vector: TVMCLVector4d): Boolean; overload;
Function IsZeroVectorXYZ(const Vector: TVMCLVector4d): Boolean; overload;

procedure CopyVector(const Src: TVMCLVector2s; out Dest: TVMCLVector2s); overload;
procedure CopyVector(const Src: TVMCLVector3s; out Dest: TVMCLVector3s); overload;
procedure CopyVector(const Src: TVMCLVector4s; out Dest: TVMCLVector4s); overload;
procedure CopyVectorXYZ(const Src: TVMCLVector4s; out Dest: TVMCLVector4s); overload;
procedure CopyVector(const Src: TVMCLVector2d; out Dest: TVMCLVector2d); overload;
procedure CopyVector(const Src: TVMCLVector3d; out Dest: TVMCLVector3d); overload;
procedure CopyVector(const Src: TVMCLVector4d; out Dest: TVMCLVector4d); overload;
procedure CopyVectorXYZ(const Src: TVMCLVector4d; out Dest: TVMCLVector4d); overload;

Function EqualVectors(const aVector, bVector: TVMCLVector2s): Boolean; overload;
Function EqualVectors(const aVector, bVector: TVMCLVector3s): Boolean; overload;
Function EqualVectors(const aVector, bVector: TVMCLVector4s): Boolean; overload;
Function EqualVectorsXYZ(const aVector, bVector: TVMCLVector4s): Boolean; overload;
Function EqualVectors(const aVector, bVector: TVMCLVector2d): Boolean; overload;
Function EqualVectors(const aVector, bVector: TVMCLVector3d): Boolean; overload;
Function EqualVectors(const aVector, bVector: TVMCLVector4d): Boolean; overload;
Function EqualVectorsXYZ(const aVector, bVector: TVMCLVector4d): Boolean; overload;

Function SameVectors(const aVector, bVector: TVMCLVector2s; Epsilon: Single = 0): Boolean; overload;
Function SameVectors(const aVector, bVector: TVMCLVector3s; Epsilon: Single = 0): Boolean; overload;
Function SameVectors(const aVector, bVector: TVMCLVector4s; Epsilon: Single = 0): Boolean; overload;
Function SameVectorsXYZ(const aVector, bVector: TVMCLVector4s; Epsilon: Single = 0): Boolean; overload;
Function SameVectors(const aVector, bVector: TVMCLVector2d; Epsilon: Double = 0): Boolean; overload;
Function SameVectors(const aVector, bVector: TVMCLVector3d; Epsilon: Double = 0): Boolean; overload;
Function SameVectors(const aVector, bVector: TVMCLVector4d; Epsilon: Double = 0): Boolean; overload;
Function SameVectorsXYZ(const aVector, bVector: TVMCLVector4d; Epsilon: Double = 0): Boolean; overload;

{===============================================================================
    Basic vector calculations
===============================================================================}

Function Opposite(const Vector: TVMCLVector2s): TVMCLVector2s; overload;
Function Opposite(const Vector: TVMCLVector3s): TVMCLVector3s; overload;
Function Opposite(const Vector: TVMCLVector4s): TVMCLVector4s; overload;
Function OppositeXYZ(const Vector: TVMCLVector4s): TVMCLVector4s; overload;
Function Opposite(const Vector: TVMCLVector2d): TVMCLVector2d; overload;
Function Opposite(const Vector: TVMCLVector3d): TVMCLVector3d; overload;
Function Opposite(const Vector: TVMCLVector4d): TVMCLVector4d; overload;
Function OppositeXYZ(const Vector: TVMCLVector4d): TVMCLVector4d; overload;

Function Magnitude(const Vector: TVMCLVector2s): Single; overload;
Function Magnitude(const Vector: TVMCLVector3s): Single; overload;
Function Magnitude(const Vector: TVMCLVector4s): Single; overload;
Function MagnitudeXYZ(const Vector: TVMCLVector4s): Single; overload;
Function Magnitude(const Vector: TVMCLVector2d): Double; overload;
Function Magnitude(const Vector: TVMCLVector3d): Double; overload;
Function Magnitude(const Vector: TVMCLVector4d): Double; overload;
Function MagnitudeXYZ(const Vector: TVMCLVector4d): Double; overload;

procedure Normalize(var X, Y: Single); overload;
procedure Normalize(var X, Y, Z: Single); overload;
procedure Normalize(var X, Y, Z, W: Single); overload;
procedure Normalize(var X, Y: Double); overload;
procedure Normalize(var X, Y, Z: Double); overload;
procedure Normalize(var X, Y, Z, W: Double); overload;

procedure Normalize(var Vector: TVMCLVector2s); overload;
procedure Normalize(var Vector: TVMCLVector3s); overload;
procedure Normalize(var Vector: TVMCLVector4s); overload;
procedure NormalizeXYZ(var Vector: TVMCLVector4s); overload;
procedure Normalize(var Vector: TVMCLVector2d); overload;
procedure Normalize(var Vector: TVMCLVector3d); overload;
procedure Normalize(var Vector: TVMCLVector4d); overload;
procedure NormalizeXYZ(var Vector: TVMCLVector4d); overload;

Function Normalized(const Vector: TVMCLVector2s): TVMCLVector2s; overload;
Function Normalized(const Vector: TVMCLVector3s): TVMCLVector3s; overload;
Function Normalized(const Vector: TVMCLVector4s): TVMCLVector4s; overload;
Function NormalizedXYZ(const Vector: TVMCLVector4s): TVMCLVector4s; overload;
Function Normalized(const Vector: TVMCLVector2d): TVMCLVector2d; overload;
Function Normalized(const Vector: TVMCLVector3d): TVMCLVector3d; overload;
Function Normalized(const Vector: TVMCLVector4d): TVMCLVector4d; overload;
Function NormalizedXYZ(const Vector: TVMCLVector4d): TVMCLVector4d; overload;

{===============================================================================
    Calculations with one vector
===============================================================================}

Function ScalarMultiply(const Vector: TVMCLVector2s; Scalar: Single): TVMCLVector2s; overload;
Function ScalarMultiply(const Vector: TVMCLVector3s; Scalar: Single): TVMCLVector3s; overload;
Function ScalarMultiply(const Vector: TVMCLVector4s; Scalar: Single): TVMCLVector4s; overload;
Function ScalarMultiplyXYZ(const Vector: TVMCLVector4s; Scalar: Single): TVMCLVector4s; overload;
Function ScalarMultiply(const Vector: TVMCLVector2d; Scalar: Double): TVMCLVector2d; overload;
Function ScalarMultiply(const Vector: TVMCLVector3d; Scalar: Double): TVMCLVector3d; overload;
Function ScalarMultiply(const Vector: TVMCLVector4d; Scalar: Double): TVMCLVector4d; overload;
Function ScalarMultiplyXYZ(const Vector: TVMCLVector4d; Scalar: Double): TVMCLVector4d; overload;

{===============================================================================
    Calculations with multiple vectors
===============================================================================}

Function VectorsAdd(const aVector,bVector: TVMCLVector2s): TVMCLVector2s; overload;
Function VectorsAdd(const aVector,bVector: TVMCLVector3s): TVMCLVector3s; overload;
Function VectorsAdd(const aVector,bVector: TVMCLVector4s): TVMCLVector4s; overload;
Function VectorsAddXYZ(const aVector,bVector: TVMCLVector4s): TVMCLVector4s; overload;
Function VectorsAdd(const aVector,bVector: TVMCLVector2d): TVMCLVector2d; overload;
Function VectorsAdd(const aVector,bVector: TVMCLVector3d): TVMCLVector3d; overload;
Function VectorsAdd(const aVector,bVector: TVMCLVector4d): TVMCLVector4d; overload;
Function VectorsAddXYZ(const aVector,bVector: TVMCLVector4d): TVMCLVector4d; overload;

Function VectorsSubtract(const aVector,bVector: TVMCLVector2s): TVMCLVector2s; overload;
Function VectorsSubtract(const aVector,bVector: TVMCLVector3s): TVMCLVector3s; overload;
Function VectorsSubtract(const aVector,bVector: TVMCLVector4s): TVMCLVector4s; overload;
Function VectorsSubtractXYZ(const aVector,bVector: TVMCLVector4s): TVMCLVector4s; overload;
Function VectorsSubtract(const aVector,bVector: TVMCLVector2d): TVMCLVector2d; overload;
Function VectorsSubtract(const aVector,bVector: TVMCLVector3d): TVMCLVector3d; overload;
Function VectorsSubtract(const aVector,bVector: TVMCLVector4d): TVMCLVector4d; overload;
Function VectorsSubtractXYZ(const aVector,bVector: TVMCLVector4d): TVMCLVector4d; overload;

Function VectorsDotProduct(const aVector,bVector: TVMCLVector2s): Single; overload;
Function VectorsDotProduct(const aVector,bVector: TVMCLVector3s): Single; overload;
Function VectorsDotProduct(const aVector,bVector: TVMCLVector4s): Single; overload;
Function VectorsDotProductXYZ(const aVector,bVector: TVMCLVector4s): Single; overload;
Function VectorsDotProduct(const aVector,bVector: TVMCLVector2d): Double; overload;
Function VectorsDotProduct(const aVector,bVector: TVMCLVector3d): Double; overload;
Function VectorsDotProduct(const aVector,bVector: TVMCLVector4d): Double; overload;
Function VectorsDotProductXYZ(const aVector,bVector: TVMCLVector4d): Double; overload;

Function VectorsCrossProduct(const aVector,bVector: TVMCLVector3s): TVMCLVector3s; overload;
Function VectorsCrossProduct(const aVector,bVector: TVMCLVector4s): TVMCLVector4s; overload;
Function VectorsCrossProduct(const aVector,bVector: TVMCLVector3d): TVMCLVector3d; overload;
Function VectorsCrossProduct(const aVector,bVector: TVMCLVector4d): TVMCLVector4d; overload;

// also known as scalar triple product or mixed product
Function VectorsBoxProduct(const aVector,bVector,cVector: TVMCLVector3s): Single; overload;
Function VectorsBoxProduct(const aVector,bVector,cVector: TVMCLVector4s): Single; overload;
Function VectorsBoxProduct(const aVector,bVector,cVector: TVMCLVector3d): Double; overload;
Function VectorsBoxProduct(const aVector,bVector,cVector: TVMCLVector4d): Double; overload;

// calculated according to right-hand rule
Function VectorsNormal(const aVector,bVector: TVMCLVector3s): TVMCLVector3s; overload;
Function VectorsNormal(const aVector,bVector: TVMCLVector4s): TVMCLVector4s; overload;
Function VectorsNormal(const aVector,bVector: TVMCLVector3d): TVMCLVector3d; overload;
Function VectorsNormal(const aVector,bVector: TVMCLVector4d): TVMCLVector4d; overload;

// opposite vector to normal vector
Function VectorsAntinormal(const aVector,bVector: TVMCLVector3s): TVMCLVector3s; overload;
Function VectorsAntinormal(const aVector,bVector: TVMCLVector4s): TVMCLVector4s; overload;
Function VectorsAntinormal(const aVector,bVector: TVMCLVector3d): TVMCLVector3d; overload;
Function VectorsAntinormal(const aVector,bVector: TVMCLVector4d): TVMCLVector4d; overload;

// angle between two vectors, in radians
Function VectorsAngleRad(const aVector,bVector: TVMCLVector2s): Single; overload;
Function VectorsAngleRad(const aVector,bVector: TVMCLVector3s): Single; overload;
Function VectorsAngleRad(const aVector,bVector: TVMCLVector4s): Single; overload;
Function VectorsAngleRad(const aVector,bVector: TVMCLVector2d): Double; overload;
Function VectorsAngleRad(const aVector,bVector: TVMCLVector3d): Double; overload;
Function VectorsAngleRad(const aVector,bVector: TVMCLVector4d): Double; overload;

// angle between two vectors, in degrees
Function VectorsAngleDeg(const aVector,bVector: TVMCLVector2s): Single; overload;
Function VectorsAngleDeg(const aVector,bVector: TVMCLVector3s): Single; overload;
Function VectorsAngleDeg(const aVector,bVector: TVMCLVector4s): Single; overload;
Function VectorsAngleDeg(const aVector,bVector: TVMCLVector2d): Double; overload;
Function VectorsAngleDeg(const aVector,bVector: TVMCLVector3d): Double; overload;
Function VectorsAngleDeg(const aVector,bVector: TVMCLVector4d): Double; overload;

implementation

uses
  Math;

{===============================================================================
    Vector formatting types, constants and functions - implementation
===============================================================================}

Function VectorFormat(CommonFormat: TVMCLCommonFormat; ShowComponentDescriptors: Boolean; ComponentDescriptors: TVMCLVecCmpDescr): TVMCLVectorFormat;
begin
Result.CommonFormat := CommonFormat;
Result.ShowComponentDescriptors := ShowComponentDescriptors;
Result.ComponentDescriptors := ComponentDescriptors;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorFormat(CommonFormat: TVMCLCommonFormat; ShowComponentDescriptors: Boolean; ComponentDescriptors: array of String): TVMCLVectorFormat;
var
  Descriptors:  TVMCLVecCmpDescr;
  i:            Integer;
begin
Descriptors := VMCL_DefaultComponentDescriptors;
For i := Low(ComponentDescriptors) to Min(High(ComponentDescriptors),High(TVMCLVecCmpDescr)) do
  Descriptors[i] := ComponentDescriptors[i];
Result := VectorFormat(CommonFormat,ShowComponentDescriptors,Descriptors);
end;

{===============================================================================
    Vector to string conversion functions - implementation
===============================================================================}

Function VecToStr(const Vector: TVMCLVector2s; const VectorFormat: TVMCLVectorFormat): String;
var
  Descriptors:  TVMCLVecCmpDescr;
begin
If VectorFormat.ShowComponentDescriptors then
  Descriptors := VectorFormat.ComponentDescriptors
else
  Descriptors := VMCL_EmptyComponentDescriptors;
with VectorFormat.CommonFormat do
  Result := LeadingString +
              Descriptors[0] + ValueToStr(Vector[0],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[1] + ValueToStr(Vector[1],ValueFormat) +
            TrailingString;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector3s; const VectorFormat: TVMCLVectorFormat): String;
var
  Descriptors:  TVMCLVecCmpDescr;
begin
If VectorFormat.ShowComponentDescriptors then
  Descriptors := VectorFormat.ComponentDescriptors
else
  Descriptors := VMCL_EmptyComponentDescriptors;
with VectorFormat.CommonFormat do
  Result := LeadingString +
              Descriptors[0] + ValueToStr(Vector[0],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[1] + ValueToStr(Vector[1],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[2] + ValueToStr(Vector[2],ValueFormat) +
            TrailingString;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector4s; const VectorFormat: TVMCLVectorFormat): String;
var
  Descriptors:  TVMCLVecCmpDescr;
begin
If VectorFormat.ShowComponentDescriptors then
  Descriptors := VectorFormat.ComponentDescriptors
else
  Descriptors := VMCL_EmptyComponentDescriptors;
with VectorFormat.CommonFormat do
  Result := LeadingString +
              Descriptors[0] + ValueToStr(Vector[0],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[1] + ValueToStr(Vector[1],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[2] + ValueToStr(Vector[2],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[3] + ValueToStr(Vector[3],ValueFormat) +
            TrailingString;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector2d; const VectorFormat: TVMCLVectorFormat): String;
var
  Descriptors:  TVMCLVecCmpDescr;
begin
If VectorFormat.ShowComponentDescriptors then
  Descriptors := VectorFormat.ComponentDescriptors
else
  Descriptors := VMCL_EmptyComponentDescriptors;
with VectorFormat.CommonFormat do
  Result := LeadingString +
              Descriptors[0] + ValueToStr(Vector[0],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[1] + ValueToStr(Vector[1],ValueFormat) +
            TrailingString;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector3d; const VectorFormat: TVMCLVectorFormat): String;
var
  Descriptors:  TVMCLVecCmpDescr;
begin
If VectorFormat.ShowComponentDescriptors then
  Descriptors := VectorFormat.ComponentDescriptors
else
  Descriptors := VMCL_EmptyComponentDescriptors;
with VectorFormat.CommonFormat do
  Result := LeadingString +
              Descriptors[0] + ValueToStr(Vector[0],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[1] + ValueToStr(Vector[1],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[2] + ValueToStr(Vector[2],ValueFormat) +
            TrailingString;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector4d; const VectorFormat: TVMCLVectorFormat): String;
var
  Descriptors:  TVMCLVecCmpDescr;
begin
If VectorFormat.ShowComponentDescriptors then
  Descriptors := VectorFormat.ComponentDescriptors
else
  Descriptors := VMCL_EmptyComponentDescriptors;
with VectorFormat.CommonFormat do
  Result := LeadingString +
              Descriptors[0] + ValueToStr(Vector[0],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[1] + ValueToStr(Vector[1],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[2] + ValueToStr(Vector[2],ValueFormat) + ComponentsDelimiter + WhiteSpace +
              Descriptors[3] + ValueToStr(Vector[3],ValueFormat) +
            TrailingString;
end;

//------------------------------------------------------------------------------

Function VecToStr(const Vector: TVMCLVector2s): String;
begin
Result := VecToStr(Vector,VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector3s): String;
begin
Result := VecToStr(Vector,VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector4s): String;
begin
Result := VecToStr(Vector,VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector2d): String;
begin
Result := VecToStr(Vector,VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector3d): String;
begin
Result := VecToStr(Vector,VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector4d): String;
begin
Result := VecToStr(Vector,VMCL_DefaultVectorFormat);
end;

//------------------------------------------------------------------------------

Function VecToStr(const Vector: TVMCLVector2sr): String;
begin
Result := VecToStr(TVMCLVector2s(Vector),VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector3sr): String;
begin
Result := VecToStr(TVMCLVector3s(Vector),VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector4sr): String;
begin
Result := VecToStr(TVMCLVector4s(Vector),VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector2dr): String;
begin
Result := VecToStr(TVMCLVector2d(Vector),VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector3dr): String;
begin
Result := VecToStr(TVMCLVector3d(Vector),VMCL_DefaultVectorFormat);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VecToStr(const Vector: TVMCLVector4dr): String;
begin
Result := VecToStr(TVMCLVector4d(Vector),VMCL_DefaultVectorFormat);
end;

{===============================================================================
    Vector building
===============================================================================}

Function Vector2s(const X, Y: Single): TVMCLVector2s;
begin
Result[0] := X;
Result[1] := Y;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3s(const X, Y, Z: Single): TVMCLVector3s;
begin
Result[0] := X;
Result[1] := Y;
Result[2] := Z;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3s(const Vector: TVMCLVector2s; const Z: Single): TVMCLVector3s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Z;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3s(const X: Single; const Vector: TVMCLVector2s): TVMCLVector3s;
begin
Result[0] := X;
Result[1] := Vector[0];
Result[2] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const X, Y, Z, W: Single): TVMCLVector4s;
begin
Result[0] := X;
Result[1] := Y;
Result[2] := Z;
Result[3] := W;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const aVector, bVector: TVMCLVector2s): TVMCLVector4s;
begin
Result[0] := aVector[0];
Result[1] := aVector[1];
Result[2] := bVector[0];
Result[3] := bVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const Vector: TVMCLVector2s; const Z, W: Single): TVMCLVector4s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Z;
Result[3] := W;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const X: Single; const Vector: TVMCLVector2s; const W: Single): TVMCLVector4s;
begin
Result[0] := X;
Result[1] := Vector[0];
Result[2] := Vector[1];
Result[3] := W;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const X, Y: Single; const Vector: TVMCLVector2s): TVMCLVector4s;
begin
Result[0] := X;
Result[1] := Y;
Result[2] := Vector[0];
Result[3] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const X: Single; const Vector: TVMCLVector3s): TVMCLVector4s;
begin
Result[0] := X;
Result[1] := Vector[0];
Result[2] := Vector[1];
Result[3] := Vector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const Vector: TVMCLVector3s; const W: Single): TVMCLVector4s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
Result[3] := W;
end;

//------------------------------------------------------------------------------

Function Vector2d(const X, Y: Double): TVMCLVector2d;
begin
Result[0] := X;
Result[1] := Y;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3d(const X, Y, Z: Double): TVMCLVector3d;
begin
Result[0] := X;
Result[1] := Y;
Result[2] := Z;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3d(const Vector: TVMCLVector2d; const Z: Double): TVMCLVector3d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Z;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3d(const X: Double; const Vector: TVMCLVector2d): TVMCLVector3d;
begin
Result[0] := X;
Result[1] := Vector[0];
Result[2] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const X, Y, Z, W: Double): TVMCLVector4d;
begin
Result[0] := X;
Result[1] := Y;
Result[2] := Z;
Result[3] := W;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const aVector, bVector: TVMCLVector2d): TVMCLVector4d;
begin
Result[0] := aVector[0];
Result[1] := aVector[1];
Result[2] := bVector[0];
Result[3] := bVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const Vector: TVMCLVector2d; const Z, W: Double): TVMCLVector4d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Z;
Result[3] := W;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const X: Double; const Vector: TVMCLVector2d; const W: Double): TVMCLVector4d;
begin
Result[0] := X;
Result[1] := Vector[0];
Result[2] := Vector[1];
Result[3] := W;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const X, Y: Double; const Vector: TVMCLVector2d): TVMCLVector4d;
begin
Result[0] := X;
Result[1] := Y;
Result[2] := Vector[0];
Result[3] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const X: Double; const Vector: TVMCLVector3d): TVMCLVector4d;
begin
Result[0] := X;
Result[1] := Vector[0];
Result[2] := Vector[1];
Result[3] := Vector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const Vector: TVMCLVector3d; const W: Double): TVMCLVector4d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
Result[3] := W;
end;

{===============================================================================
    Vector swizzling
===============================================================================}

Function Swizzle(const Vector: TVMCLVector2s; f0: TVMCLVectorField): TVMCLVector2s;
begin
Result := Swizzle(Vector,f0,f0);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector2s; f0,f1: TVMCLVectorField): TVMCLVector2s;
begin
Result[0] := Vector[Clipped(Ord(f0),0,1)];
Result[1] := Vector[Clipped(Ord(f1),0,1)];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector3s; f0: TVMCLVectorField): TVMCLVector3s;
begin
Result := Swizzle(Vector,f0,f0,f0);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector3s; f0,f1: TVMCLVectorField): TVMCLVector3s;
begin
Result := Swizzle(Vector,f0,f1,f1);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector3s; f0,f1,f2: TVMCLVectorField): TVMCLVector3s;
begin
Result[0] := Vector[Clipped(Ord(f0),0,2)];
Result[1] := Vector[Clipped(Ord(f1),0,2)];
Result[2] := Vector[Clipped(Ord(f2),0,2)];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector4s; f0: TVMCLVectorField): TVMCLVector4s;
begin
Result := Swizzle(Vector,f0,f0,f0,f0);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector4s; f0,f1: TVMCLVectorField): TVMCLVector4s;
begin
Result := Swizzle(Vector,f0,f1,f1,f1);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector4s; f0,f1,f2: TVMCLVectorField): TVMCLVector4s;
begin
Result := Swizzle(Vector,f0,f1,f2,f2);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector4s; f0,f1,f2,f3: TVMCLVectorField): TVMCLVector4s;
begin
Result[0] := Vector[Clipped(Ord(f0),0,3)];
Result[1] := Vector[Clipped(Ord(f1),0,3)];
Result[2] := Vector[Clipped(Ord(f2),0,3)];
Result[3] := Vector[Clipped(Ord(f3),0,3)];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector2d; f0: TVMCLVectorField): TVMCLVector2d;
begin
Result := Swizzle(Vector,f0,f0);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector2d; f0,f1: TVMCLVectorField): TVMCLVector2d;
begin
Result[0] := Vector[Clipped(Ord(f0),0,1)];
Result[1] := Vector[Clipped(Ord(f1),0,1)];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector3d; f0: TVMCLVectorField): TVMCLVector3d;
begin
Result := Swizzle(Vector,f0,f0,f0);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector3d; f0,f1: TVMCLVectorField): TVMCLVector3d;
begin
Result := Swizzle(Vector,f0,f1,f1);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector3d; f0,f1,f2: TVMCLVectorField): TVMCLVector3d;
begin
Result[0] := Vector[Clipped(Ord(f0),0,2)];
Result[1] := Vector[Clipped(Ord(f1),0,2)];
Result[2] := Vector[Clipped(Ord(f2),0,2)];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector4d; f0: TVMCLVectorField): TVMCLVector4d;
begin
Result := Swizzle(Vector,f0,f0,f0,f0);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector4d; f0,f1: TVMCLVectorField): TVMCLVector4d;
begin
Result := Swizzle(Vector,f0,f1,f1,f1);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector4d; f0,f1,f2: TVMCLVectorField): TVMCLVector4d;
begin
Result := Swizzle(Vector,f0,f1,f2,f2);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Swizzle(const Vector: TVMCLVector4d; f0,f1,f2,f3: TVMCLVectorField): TVMCLVector4d;
begin
Result[0] := Vector[Clipped(Ord(f0),0,1)];
Result[1] := Vector[Clipped(Ord(f1),0,1)];
Result[2] := Vector[Clipped(Ord(f2),0,1)];
Result[3] := Vector[Clipped(Ord(f3),0,1)];
end;

{===============================================================================
    Vector conversion
===============================================================================}

Function Vector2s(const Vector: TVMCLVector3s): TVMCLVector2s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector2s(const Vector: TVMCLVector4s): TVMCLVector2s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3s(const Vector: TVMCLVector4s): TVMCLVector3s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector2d(const Vector: TVMCLVector3d): TVMCLVector2d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector2d(const Vector: TVMCLVector4d): TVMCLVector2d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3d(const Vector: TVMCLVector4d): TVMCLVector3d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
end;

//------------------------------------------------------------------------------

Function Vector3s(const Vector: TVMCLVector2s): TVMCLVector3;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const Vector: TVMCLVector2s; PositionVector: Boolean = True): TVMCLVector4s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := 0.0;
If PositionVector then Result[3] := 1.0
  else Result[3] := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const Vector: TVMCLVector3s; PositionVector: Boolean = True): TVMCLVector4s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
If PositionVector then Result[3] := 1.0
  else Result[3] := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3d(const Vector: TVMCLVector2d): TVMCLVector3d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const Vector: TVMCLVector2d; PositionVector: Boolean = True): TVMCLVector4d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := 0.0;
If PositionVector then Result[3] := 1.0
  else Result[3] := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const Vector: TVMCLVector3d; PositionVector: Boolean = True): TVMCLVector4d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
If PositionVector then Result[3] := 1.0
  else Result[3] := 0.0;
end;

//------------------------------------------------------------------------------

Function Vector2sr(const Vector: TVMCLVector2s): TVMCLVector2sr;
begin
Result.X := Vector[0];
Result.Y := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3sr(const Vector: TVMCLVector3s): TVMCLVector3sr;
begin
Result.X := Vector[0];
Result.Y := Vector[1];
Result.Z := Vector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4sr(const Vector: TVMCLVector4s): TVMCLVector4sr;
begin
Result.X := Vector[0];
Result.Y := Vector[1];
Result.Z := Vector[2];
Result.W := Vector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector2dr(const Vector: TVMCLVector2d): TVMCLVector2dr;
begin
Result.X := Vector[0];
Result.Y := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3dr(const Vector: TVMCLVector3d): TVMCLVector3dr;
begin
Result.X := Vector[0];
Result.Y := Vector[1];
Result.Z := Vector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4dr(const Vector: TVMCLVector4d): TVMCLVector4dr;
begin
Result.X := Vector[0];
Result.Y := Vector[1];
Result.Z := Vector[2];
Result.W := Vector[3];
end;

//------------------------------------------------------------------------------

Function Vector2s(const Vector: TVMCLVector2sr): TVMCLVector2s;
begin
Result[0] := Vector.X;
Result[1] := Vector.Y;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3s(const Vector: TVMCLVector3sr): TVMCLVector3s;
begin
Result[0] := Vector.X;
Result[1] := Vector.Y;
Result[2] := Vector.Z;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const Vector: TVMCLVector4sr): TVMCLVector4s;
begin
Result[0] := Vector.X;
Result[1] := Vector.Y;
Result[2] := Vector.Z;
Result[3] := Vector.W;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector2d(const Vector: TVMCLVector2dr): TVMCLVector2d;
begin
Result[0] := Vector.X;
Result[1] := Vector.Y;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3d(const Vector: TVMCLVector3dr): TVMCLVector3d;
begin
Result[0] := Vector.X;
Result[1] := Vector.Y;
Result[2] := Vector.Z;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const Vector: TVMCLVector4dr): TVMCLVector4d;
begin
Result[0] := Vector.X;
Result[1] := Vector.Y;
Result[2] := Vector.Z;
Result[3] := Vector.W;
end;

//------------------------------------------------------------------------------

Function Vector2s(const Vector: TVMCLVector2d): TVMCLVector2s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3s(const Vector: TVMCLVector3d): TVMCLVector3s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4s(const Vector: TVMCLVector4d): TVMCLVector4s;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
Result[3] := Vector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector2d(const Vector: TVMCLVector2s): TVMCLVector2d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3d(const Vector: TVMCLVector3s): TVMCLVector3d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4d(const Vector: TVMCLVector4s): TVMCLVector4d;
begin
Result[0] := Vector[0];
Result[1] := Vector[1];
Result[2] := Vector[2];
Result[3] := Vector[3];
end;

//------------------------------------------------------------------------------

Function Vector2sr(const Vector: TVMCLVector2dr): TVMCLVector2sr;
begin
Result.X := Vector.X;
Result.Y := Vector.Y;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3sr(const Vector: TVMCLVector3dr): TVMCLVector3sr;
begin
Result.X := Vector.X;
Result.Y := Vector.Y;
Result.Z := Vector.Z;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4sr(const Vector: TVMCLVector4dr): TVMCLVector4sr;
begin
Result.X := Vector.X;
Result.Y := Vector.Y;
Result.Z := Vector.Z;
Result.W := Vector.W;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector2dr(const Vector: TVMCLVector2sr): TVMCLVector2dr;
begin
Result.X := Vector.X;
Result.Y := Vector.Y;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector3dr(const Vector: TVMCLVector3sr): TVMCLVector3dr;
begin
Result.X := Vector.X;
Result.Y := Vector.Y;
Result.Z := Vector.Z;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Vector4dr(const Vector: TVMCLVector4sr): TVMCLVector4dr;
begin
Result.X := Vector.X;
Result.Y := Vector.Y;
Result.Z := Vector.Z;
Result.W := Vector.W;
end;

{===============================================================================
    Basic vector functions (zeroing, comparison, etc.)
===============================================================================}

procedure LoadZeroVector(var Vector: TVMCLVector2s);
begin
Vector := VMCL_ZeroVector2s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroVector(var Vector: TVMCLVector3s);
begin
Vector := VMCL_ZeroVector3s;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroVectorXYZ(var Vector: TVMCLVector4s);
begin
Vector[0] := VMCL_ZeroVector4s[0];
Vector[1] := VMCL_ZeroVector4s[1];
Vector[2] := VMCL_ZeroVector4s[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroVector(var Vector: TVMCLVector4s; PositionVector: Boolean = False);
begin
Vector := VMCL_ZeroVector4s;
If PositionVector then Vector[3] := 1.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroVector(var Vector: TVMCLVector2d);
begin
Vector := VMCL_ZeroVector2d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroVector(var Vector: TVMCLVector3d);
begin
Vector := VMCL_ZeroVector3d;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroVectorXYZ(var Vector: TVMCLVector4d);
begin
Vector[0] := VMCL_ZeroVector4d[0];
Vector[1] := VMCL_ZeroVector4d[1];
Vector[2] := VMCL_ZeroVector4d[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure LoadZeroVector(var Vector: TVMCLVector4d; PositionVector: Boolean = False);
begin
Vector := VMCL_ZeroVector4d;
If PositionVector then Vector[3] := 1.0;
end;

//==============================================================================

Function IsZeroVector(const Vector: TVMCLVector2s): Boolean;
begin
Result := EqualVectors(Vector,VMCL_ZeroVector2s);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroVector(const Vector: TVMCLVector3s): Boolean;
begin
Result := EqualVectors(Vector,VMCL_ZeroVector3s);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroVector(const Vector: TVMCLVector4s): Boolean;
begin
Result := EqualVectors(Vector,VMCL_ZeroVector4s);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroVectorXYZ(const Vector: TVMCLVector4s): Boolean;
begin
Result := EqualVectorsXYZ(Vector,VMCL_ZeroVector4s);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroVector(const Vector: TVMCLVector2d): Boolean;
begin
Result := EqualVectors(Vector,VMCL_ZeroVector2d);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroVector(const Vector: TVMCLVector3d): Boolean;
begin
Result := EqualVectors(Vector,VMCL_ZeroVector3d);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroVector(const Vector: TVMCLVector4d): Boolean;
begin
Result := EqualVectors(Vector,VMCL_ZeroVector4d);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function IsZeroVectorXYZ(const Vector: TVMCLVector4d): Boolean;
begin
Result := EqualVectorsXYZ(Vector,VMCL_ZeroVector4d);
end;

//==============================================================================

procedure CopyVector(const Src: TVMCLVector2s; out Dest: TVMCLVector2s);
begin
Move(Src,Dest{%H-},SizeOf(TVMCLVector2s));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyVector(const Src: TVMCLVector3s; out Dest: TVMCLVector3s);
begin
Move(Src,Dest{%H-},SizeOf(TVMCLVector3s));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyVector(const Src: TVMCLVector4s; out Dest: TVMCLVector4s);
begin
Move(Src,Dest{%H-},SizeOf(TVMCLVector4s));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyVectorXYZ(const Src: TVMCLVector4s; out Dest: TVMCLVector4s);
begin
Move(Src,Dest{%H-},SizeOf(TVMCLVector4s) - SizeOf(Single));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyVector(const Src: TVMCLVector2d; out Dest: TVMCLVector2d);
begin
Move(Src,Dest{%H-},SizeOf(TVMCLVector2d));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyVector(const Src: TVMCLVector3d; out Dest: TVMCLVector3d);
begin
Move(Src,Dest{%H-},SizeOf(TVMCLVector3d));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyVector(const Src: TVMCLVector4d; out Dest: TVMCLVector4d);
begin
Move(Src,Dest{%H-},SizeOf(TVMCLVector4d));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure CopyVectorXYZ(const Src: TVMCLVector4d; out Dest: TVMCLVector4d);
begin
Move(Src,Dest{%H-},SizeOf(TVMCLVector4d) - SizeOf(Double));
end;

//==============================================================================

Function EqualVectors(const aVector, bVector: TVMCLVector2s): Boolean;
begin
Result := (aVector[0] = bVector[0]) and (aVector[1] = bVector[1]);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualVectors(const aVector, bVector: TVMCLVector3s): Boolean;
begin
Result := (aVector[0] = bVector[0]) and (aVector[1] = bVector[1]) and
          (aVector[2] = bVector[2]);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualVectors(const aVector, bVector: TVMCLVector4s): Boolean;
begin
Result := (aVector[0] = bVector[0]) and (aVector[1] = bVector[1]) and
          (aVector[2] = bVector[2]) and (aVector[3] = bVector[3]);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualVectorsXYZ(const aVector, bVector: TVMCLVector4s): Boolean;
begin
Result := (aVector[0] = bVector[0]) and (aVector[1] = bVector[1]) and
          (aVector[2] = bVector[2]);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualVectors(const aVector, bVector: TVMCLVector2d): Boolean;
begin
Result := (aVector[0] = bVector[0]) and (aVector[1] = bVector[1]);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualVectors(const aVector, bVector: TVMCLVector3d): Boolean;
begin
Result := (aVector[0] = bVector[0]) and (aVector[1] = bVector[1]) and
          (aVector[2] = bVector[2]);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualVectors(const aVector, bVector: TVMCLVector4d): Boolean;
begin
Result := (aVector[0] = bVector[0]) and (aVector[1] = bVector[1]) and
          (aVector[2] = bVector[2]) and (aVector[3] = bVector[3]);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function EqualVectorsXYZ(const aVector, bVector: TVMCLVector4d): Boolean;
begin
Result := (aVector[0] = bVector[0]) and (aVector[1] = bVector[1]) and
          (aVector[2] = bVector[2]);
end;

//==============================================================================

Function SameVectors(const aVector, bVector: TVMCLVector2s; Epsilon: Single = 0): Boolean;
begin
Result := SameValue(aVector[0],bVector[0],Epsilon) and
          SameValue(aVector[1],bVector[1],Epsilon);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameVectors(const aVector, bVector: TVMCLVector3s; Epsilon: Single = 0): Boolean;
begin
Result := SameValue(aVector[0],bVector[0],Epsilon) and
          SameValue(aVector[1],bVector[1],Epsilon) and
          SameValue(aVector[2],bVector[2],Epsilon);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameVectors(const aVector, bVector: TVMCLVector4s; Epsilon: Single = 0): Boolean;
begin
Result := SameValue(aVector[0],bVector[0],Epsilon) and
          SameValue(aVector[1],bVector[1],Epsilon) and
          SameValue(aVector[2],bVector[2],Epsilon) and
          SameValue(aVector[3],bVector[3],Epsilon);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameVectorsXYZ(const aVector, bVector: TVMCLVector4s; Epsilon: Single = 0): Boolean;
begin
Result := SameValue(aVector[0],bVector[0],Epsilon) and
          SameValue(aVector[1],bVector[1],Epsilon) and
          SameValue(aVector[2],bVector[2],Epsilon);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameVectors(const aVector, bVector: TVMCLVector2d; Epsilon: Double = 0): Boolean;
begin
Result := SameValue(aVector[0],bVector[0],Epsilon) and
          SameValue(aVector[1],bVector[1],Epsilon);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameVectors(const aVector, bVector: TVMCLVector3d; Epsilon: Double = 0): Boolean;
begin
Result := SameValue(aVector[0],bVector[0],Epsilon) and
          SameValue(aVector[1],bVector[1],Epsilon) and
          SameValue(aVector[2],bVector[2],Epsilon);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameVectors(const aVector, bVector: TVMCLVector4d; Epsilon: Double = 0): Boolean;
begin
Result := SameValue(aVector[0],bVector[0],Epsilon) and
          SameValue(aVector[1],bVector[1],Epsilon) and
          SameValue(aVector[2],bVector[2],Epsilon) and
          SameValue(aVector[3],bVector[3],Epsilon);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function SameVectorsXYZ(const aVector, bVector: TVMCLVector4d; Epsilon: Double = 0): Boolean;
begin
Result := SameValue(aVector[0],bVector[0],Epsilon) and
          SameValue(aVector[1],bVector[1],Epsilon) and
          SameValue(aVector[2],bVector[2],Epsilon);
end;

{===============================================================================
    Basic vector calculations
===============================================================================}

Function Opposite(const Vector: TVMCLVector2s): TVMCLVector2s;
begin
Result[0] := -Vector[0];
Result[1] := -Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Opposite(const Vector: TVMCLVector3s): TVMCLVector3s;
begin
Result[0] := -Vector[0];
Result[1] := -Vector[1];
Result[2] := -Vector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Opposite(const Vector: TVMCLVector4s): TVMCLVector4s;
begin
Result[0] := -Vector[0];
Result[1] := -Vector[1];
Result[2] := -Vector[2];
Result[3] := -Vector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function OppositeXYZ(const Vector: TVMCLVector4s): TVMCLVector4s;
begin
Result[0] := -Vector[0];
Result[1] := -Vector[1];
Result[2] := -Vector[2];
Result[3] := Vector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Opposite(const Vector: TVMCLVector2d): TVMCLVector2d;
begin
Result[0] := -Vector[0];
Result[1] := -Vector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Opposite(const Vector: TVMCLVector3d): TVMCLVector3d;
begin
Result[0] := -Vector[0];
Result[1] := -Vector[1];
Result[2] := -Vector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Opposite(const Vector: TVMCLVector4d): TVMCLVector4d;
begin
Result[0] := -Vector[0];
Result[1] := -Vector[1];
Result[2] := -Vector[2];
Result[3] := -Vector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function OppositeXYZ(const Vector: TVMCLVector4d): TVMCLVector4d;
begin
Result[0] := -Vector[0];
Result[1] := -Vector[1];
Result[2] := -Vector[2];
Result[3] := Vector[3];
end;

//==============================================================================

Function Magnitude(const Vector: TVMCLVector2s): Single;
begin
Result := Sqrt(Sqr(Vector[0]) + Sqr(Vector[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Magnitude(const Vector: TVMCLVector3s): Single;
begin
Result := Sqrt(Sqr(Vector[0]) + Sqr(Vector[1]) + Sqr(Vector[2]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Magnitude(const Vector: TVMCLVector4s): Single;
begin
Result := Sqrt(Sqr(Vector[0]) + Sqr(Vector[1]) + Sqr(Vector[2]) + Sqr(Vector[3]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MagnitudeXYZ(const Vector: TVMCLVector4s): Single;
begin
Result := Sqrt(Sqr(Vector[0]) + Sqr(Vector[1]) + Sqr(Vector[2]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Magnitude(const Vector: TVMCLVector2d): Double;
begin
Result := Sqrt(Sqr(Vector[0]) + Sqr(Vector[1]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Magnitude(const Vector: TVMCLVector3d): Double;
begin
Result := Sqrt(Sqr(Vector[0]) + Sqr(Vector[1]) + Sqr(Vector[2]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Magnitude(const Vector: TVMCLVector4d): Double;
begin
Result := Sqrt(Sqr(Vector[0]) + Sqr(Vector[1]) + Sqr(Vector[2]) + Sqr(Vector[3]));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function MagnitudeXYZ(const Vector: TVMCLVector4d): Double;
begin
Result := Sqrt(Sqr(Vector[0]) + Sqr(Vector[1]) + Sqr(Vector[2]));
end;

//==============================================================================

procedure Normalize(var X, Y: Single);
var
  TempVector: TVMCLVector2s;
begin
TempVector := Vector2s(X,Y);
Normalize(TempVector);
X := TempVector[0];
Y := TempVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var X, Y, Z: Single);
var
  TempVector: TVMCLVector3s;
begin
TempVector := Vector3s(X,Y,Z);
Normalize(TempVector);
X := TempVector[0];
Y := TempVector[1];
Z := TempVector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var X, Y, Z, W: Single);
var
  TempVector: TVMCLVector4s;
begin
TempVector := Vector4s(X,Y,Z,W);
Normalize(TempVector);
X := TempVector[0];
Y := TempVector[1];
Z := TempVector[2];
W := TempVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var X, Y: Double);
var
  TempVector: TVMCLVector2d;
begin
TempVector := Vector2d(X,Y);
Normalize(TempVector);
X := TempVector[0];
Y := TempVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var X, Y, Z: Double);
var
  TempVector: TVMCLVector3d;
begin
TempVector := Vector3d(X,Y,Z);
Normalize(TempVector);
X := TempVector[0];
Y := TempVector[1];
Z := TempVector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var X, Y, Z, W: Double);
var
  TempVector: TVMCLVector4d;
begin
TempVector := Vector4d(X,Y,Z,W);
Normalize(TempVector);
X := TempVector[0];
Y := TempVector[1];
Z := TempVector[2];
W := TempVector[3];
end;

//------------------------------------------------------------------------------

procedure Normalize(var Vector: TVMCLVector2s);
var
  VectorMagnitudeRcp: Extended;
begin
If not IsZeroVector(Vector) then
  begin
    VectorMagnitudeRcp := 1 / Magnitude(Vector);
    Vector[0] := Vector[0] * VectorMagnitudeRcp;
    Vector[1] := Vector[1] * VectorMagnitudeRcp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var Vector: TVMCLVector3s);
var
  VectorMagnitudeRcp: Extended;
begin
If not IsZeroVector(Vector) then
  begin
    VectorMagnitudeRcp := 1 / Magnitude(Vector);
    Vector[0] := Vector[0] * VectorMagnitudeRcp;
    Vector[1] := Vector[1] * VectorMagnitudeRcp;
    Vector[2] := Vector[2] * VectorMagnitudeRcp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var Vector: TVMCLVector4s);
var
  VectorMagnitudeRcp: Extended;
begin
If not IsZeroVector(Vector) then
  begin
    VectorMagnitudeRcp := 1 / Magnitude(Vector);
    Vector[0] := Vector[0] * VectorMagnitudeRcp;
    Vector[1] := Vector[1] * VectorMagnitudeRcp;
    Vector[2] := Vector[2] * VectorMagnitudeRcp;
    Vector[3] := Vector[3] * VectorMagnitudeRcp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure NormalizeXYZ(var Vector: TVMCLVector4s);
var
  VectorMagnitudeRcp: Extended;
begin
If not IsZeroVector(Vector) then
  begin
    VectorMagnitudeRcp := 1 / MagnitudeXYZ(Vector);
    Vector[0] := Vector[0] * VectorMagnitudeRcp;
    Vector[1] := Vector[1] * VectorMagnitudeRcp;
    Vector[2] := Vector[2] * VectorMagnitudeRcp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var Vector: TVMCLVector2d);
var
  VectorMagnitudeRcp: Extended;
begin
If not IsZeroVector(Vector) then
  begin
    VectorMagnitudeRcp := 1 / Magnitude(Vector);
    Vector[0] := Vector[0] * VectorMagnitudeRcp;
    Vector[1] := Vector[1] * VectorMagnitudeRcp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var Vector: TVMCLVector3d);
var
  VectorMagnitudeRcp: Extended;
begin
If not IsZeroVector(Vector) then
  begin
    VectorMagnitudeRcp := 1 / Magnitude(Vector);
    Vector[0] := Vector[0] * VectorMagnitudeRcp;
    Vector[1] := Vector[1] * VectorMagnitudeRcp;
    Vector[2] := Vector[2] * VectorMagnitudeRcp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Normalize(var Vector: TVMCLVector4d);
var
  VectorMagnitudeRcp: Extended;
begin
If not IsZeroVector(Vector) then
  begin
    VectorMagnitudeRcp := 1 / Magnitude(Vector);
    Vector[0] := Vector[0] * VectorMagnitudeRcp;
    Vector[1] := Vector[1] * VectorMagnitudeRcp;
    Vector[2] := Vector[2] * VectorMagnitudeRcp;
    Vector[3] := Vector[3] * VectorMagnitudeRcp;
  end;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure NormalizeXYZ(var Vector: TVMCLVector4d);
var
  VectorMagnitudeRcp: Extended;
begin
If not IsZeroVector(Vector) then
  begin
    VectorMagnitudeRcp := 1 / MagnitudeXYZ(Vector);
    Vector[0] := Vector[0] * VectorMagnitudeRcp;
    Vector[1] := Vector[1] * VectorMagnitudeRcp;
    Vector[2] := Vector[2] * VectorMagnitudeRcp;
  end;
end;

//==============================================================================

Function Normalized(const Vector: TVMCLVector2s): TVMCLVector2s;
begin
Result := Vector;
Normalize(Result);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Normalized(const Vector: TVMCLVector3s): TVMCLVector3s;
begin
Result := Vector;
Normalize(Result);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Normalized(const Vector: TVMCLVector4s): TVMCLVector4s;
begin
Result := Vector;
Normalize(Result);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function NormalizedXYZ(const Vector: TVMCLVector4s): TVMCLVector4s;
begin
Result := Vector;
NormalizeXYZ(Result);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Normalized(const Vector: TVMCLVector2d): TVMCLVector2d;
begin
Result := Vector;
Normalize(Result);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Normalized(const Vector: TVMCLVector3d): TVMCLVector3d;
begin
Result := Vector;
Normalize(Result);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Normalized(const Vector: TVMCLVector4d): TVMCLVector4d;
begin
Result := Vector;
Normalize(Result);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function NormalizedXYZ(const Vector: TVMCLVector4d): TVMCLVector4d;
begin
Result := Vector;
NormalizeXYZ(Result);
end;

{===============================================================================
    Calculations with one vector
===============================================================================}

Function ScalarMultiply(const Vector: TVMCLVector2s; Scalar: Single): TVMCLVector2s;
begin
Result[0] := Vector[0] * Scalar;
Result[1] := Vector[1] * Scalar;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Vector: TVMCLVector3s; Scalar: Single): TVMCLVector3s;
begin
Result[0] := Vector[0] * Scalar;
Result[1] := Vector[1] * Scalar;
Result[2] := Vector[2] * Scalar;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Vector: TVMCLVector4s; Scalar: Single): TVMCLVector4s;
begin
Result[0] := Vector[0] * Scalar;
Result[1] := Vector[1] * Scalar;
Result[2] := Vector[2] * Scalar;
Result[3] := Vector[3] * Scalar;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiplyXYZ(const Vector: TVMCLVector4s; Scalar: Single): TVMCLVector4s;
begin
Result[0] := Vector[0] * Scalar;
Result[1] := Vector[1] * Scalar;
Result[2] := Vector[2] * Scalar;
Result[3] := Vector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Vector: TVMCLVector2d; Scalar: Double): TVMCLVector2d;
begin
Result[0] := Vector[0] * Scalar;
Result[1] := Vector[1] * Scalar;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Vector: TVMCLVector3d; Scalar: Double): TVMCLVector3d;
begin
Result[0] := Vector[0] * Scalar;
Result[1] := Vector[1] * Scalar;
Result[2] := Vector[2] * Scalar;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiply(const Vector: TVMCLVector4d; Scalar: Double): TVMCLVector4d;
begin
Result[0] := Vector[0] * Scalar;
Result[1] := Vector[1] * Scalar;
Result[2] := Vector[2] * Scalar;
Result[3] := Vector[3] * Scalar;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ScalarMultiplyXYZ(const Vector: TVMCLVector4d; Scalar: Double): TVMCLVector4d;
begin
Result[0] := Vector[0] * Scalar;
Result[1] := Vector[1] * Scalar;
Result[2] := Vector[2] * Scalar;
Result[3] := Vector[3];
end;

{===============================================================================
    Calculations with multiple vectors
===============================================================================}

Function VectorsAdd(const aVector,bVector: TVMCLVector2s): TVMCLVector2s;
begin
Result[0] := aVector[0] + bVector[0];
Result[1] := aVector[1] + bVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAdd(const aVector,bVector: TVMCLVector3s): TVMCLVector3s;
begin
Result[0] := aVector[0] + bVector[0];
Result[1] := aVector[1] + bVector[1];
Result[2] := aVector[2] + bVector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAdd(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
begin
Result[0] := aVector[0] + bVector[0];
Result[1] := aVector[1] + bVector[1];
Result[2] := aVector[2] + bVector[2];
Result[3] := aVector[3] + bVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAddXYZ(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
begin
Result[0] := aVector[0] + bVector[0];
Result[1] := aVector[1] + bVector[1];
Result[2] := aVector[2] + bVector[2];
Result[3] := aVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAdd(const aVector,bVector: TVMCLVector2d): TVMCLVector2d;
begin
Result[0] := aVector[0] + bVector[0];
Result[1] := aVector[1] + bVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAdd(const aVector,bVector: TVMCLVector3d): TVMCLVector3d;
begin
Result[0] := aVector[0] + bVector[0];
Result[1] := aVector[1] + bVector[1];
Result[2] := aVector[2] + bVector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAdd(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
begin
Result[0] := aVector[0] + bVector[0];
Result[1] := aVector[1] + bVector[1];
Result[2] := aVector[2] + bVector[2];
Result[3] := aVector[3] + bVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAddXYZ(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
begin
Result[0] := aVector[0] + bVector[0];
Result[1] := aVector[1] + bVector[1];
Result[2] := aVector[2] + bVector[2];
Result[3] := aVector[3];
end;

//==============================================================================

Function VectorsSubtract(const aVector,bVector: TVMCLVector2s): TVMCLVector2s;
begin
Result[0] := aVector[0] - bVector[0];
Result[1] := aVector[1] - bVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsSubtract(const aVector,bVector: TVMCLVector3s): TVMCLVector3s;
begin
Result[0] := aVector[0] - bVector[0];
Result[1] := aVector[1] - bVector[1];
Result[2] := aVector[2] - bVector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsSubtract(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
begin
Result[0] := aVector[0] - bVector[0];
Result[1] := aVector[1] - bVector[1];
Result[2] := aVector[2] - bVector[2];
Result[3] := aVector[3] - bVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsSubtractXYZ(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
begin
Result[0] := aVector[0] - bVector[0];
Result[1] := aVector[1] - bVector[1];
Result[2] := aVector[2] - bVector[2];
Result[3] := aVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsSubtract(const aVector,bVector: TVMCLVector2d): TVMCLVector2d;
begin
Result[0] := aVector[0] - bVector[0];
Result[1] := aVector[1] - bVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsSubtract(const aVector,bVector: TVMCLVector3d): TVMCLVector3d;
begin
Result[0] := aVector[0] - bVector[0];
Result[1] := aVector[1] - bVector[1];
Result[2] := aVector[2] - bVector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsSubtract(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
begin
Result[0] := aVector[0] - bVector[0];
Result[1] := aVector[1] - bVector[1];
Result[2] := aVector[2] - bVector[2];
Result[3] := aVector[3] - bVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsSubtractXYZ(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
begin
Result[0] := aVector[0] - bVector[0];
Result[1] := aVector[1] - bVector[1];
Result[2] := aVector[2] - bVector[2];
Result[3] := aVector[3];
end;

//==============================================================================

Function VectorsDotProduct(const aVector,bVector: TVMCLVector2s): Single;
begin
Result := aVector[0] * bVector[0] + aVector[1] * bVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsDotProduct(const aVector,bVector: TVMCLVector3s): Single;
begin
Result := aVector[0] * bVector[0] + aVector[1] * bVector[1] +
          aVector[2] * bVector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsDotProduct(const aVector,bVector: TVMCLVector4s): Single;
begin
Result := aVector[0] * bVector[0] + aVector[1] * bVector[1] +
          aVector[2] * bVector[2] + aVector[3] * bVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsDotProductXYZ(const aVector,bVector: TVMCLVector4s): Single;
begin
Result := aVector[0] * bVector[0] + aVector[1] * bVector[1] +
          aVector[2] * bVector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsDotProduct(const aVector,bVector: TVMCLVector2d): Double;
begin
Result := aVector[0] * bVector[0] + aVector[1] * bVector[1];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsDotProduct(const aVector,bVector: TVMCLVector3d): Double;
begin
Result := aVector[0] * bVector[0] + aVector[1] * bVector[1] +
          aVector[2] * bVector[2];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsDotProduct(const aVector,bVector: TVMCLVector4d): Double;
begin
Result := aVector[0] * bVector[0] + aVector[1] * bVector[1] +
          aVector[2] * bVector[2] + aVector[3] * bVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsDotProductXYZ(const aVector,bVector: TVMCLVector4d): Double;
begin
Result := aVector[0] * bVector[0] + aVector[1] * bVector[1] +
          aVector[2] * bVector[2];
end;

//==============================================================================

Function VectorsCrossProduct(const aVector,bVector: TVMCLVector3s): TVMCLVector3s;
begin
Result[0] := aVector[1] * bVector[2] - aVector[2] * bVector[1];
Result[1] := aVector[2] * bVector[0] - aVector[0] * bVector[2];
Result[2] := aVector[0] * bVector[1] - aVector[1] * bVector[0];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsCrossProduct(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
begin
Result[0] := aVector[1] * bVector[2] - aVector[2] * bVector[1];
Result[1] := aVector[2] * bVector[0] - aVector[0] * bVector[2];
Result[2] := aVector[0] * bVector[1] - aVector[1] * bVector[0];
Result[3] := aVector[3];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsCrossProduct(const aVector,bVector: TVMCLVector3d): TVMCLVector3d;
begin
Result[0] := aVector[1] * bVector[2] - aVector[2] * bVector[1];
Result[1] := aVector[2] * bVector[0] - aVector[0] * bVector[2];
Result[2] := aVector[0] * bVector[1] - aVector[1] * bVector[0];
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsCrossProduct(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
begin
Result[0] := aVector[1] * bVector[2] - aVector[2] * bVector[1];
Result[1] := aVector[2] * bVector[0] - aVector[0] * bVector[2];
Result[2] := aVector[0] * bVector[1] - aVector[1] * bVector[0];
Result[3] := aVector[3];
end;

//==============================================================================

Function VectorsBoxProduct(const aVector,bVector,cVector: TVMCLVector3s): Single;
begin
Result := VectorsDotProduct(aVector,VectorsCrossProduct(bVector,cVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsBoxProduct(const aVector,bVector,cVector: TVMCLVector4s): Single;
begin
Result := VectorsDotProductXYZ(aVector,VectorsCrossProduct(bVector,cVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsBoxProduct(const aVector,bVector,cVector: TVMCLVector3d): Double;
begin
Result := VectorsDotProduct(aVector,VectorsCrossProduct(bVector,cVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsBoxProduct(const aVector,bVector,cVector: TVMCLVector4d): Double;
begin
Result := VectorsDotProductXYZ(aVector,VectorsCrossProduct(bVector,cVector));
end;

//==============================================================================-

Function VectorsNormal(const aVector,bVector: TVMCLVector3s): TVMCLVector3s;
begin
Result := Normalized(VectorsCrossProduct(aVector,bVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsNormal(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
begin
Result := NormalizedXYZ(VectorsCrossProduct(aVector,bVector));
Result[3] := 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsNormal(const aVector,bVector: TVMCLVector3d): TVMCLVector3d;
begin
Result := Normalized(VectorsCrossProduct(aVector,bVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsNormal(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
begin
Result := NormalizedXYZ(VectorsCrossProduct(aVector,bVector));
Result[3] := 0;
end;

//==============================================================================

Function VectorsAntinormal(const aVector,bVector: TVMCLVector3s): TVMCLVector3s;
begin
Result := Opposite(VectorsNormal(aVector,bVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAntinormal(const aVector,bVector: TVMCLVector4s): TVMCLVector4s;
begin
Result := OppositeXYZ(VectorsNormal(aVector,bVector));
Result[3] := 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAntinormal(const aVector,bVector: TVMCLVector3d): TVMCLVector3d;
begin
Result := Opposite(VectorsNormal(aVector,bVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAntinormal(const aVector,bVector: TVMCLVector4d): TVMCLVector4d;
begin
Result := OppositeXYZ(VectorsNormal(aVector,bVector));
Result[3] := 0;
end;

//==============================================================================

Function VectorsAngleRad(const aVector,bVector: TVMCLVector2s): Single;
var
  Ma,Mb,Cos:  Extended;
begin
Ma := Magnitude(aVector);
Mb := Magnitude(bVector);
If (Ma <> 0.0) and (Mb <> 0.0) then
  begin
    Cos := VectorsDotProduct(aVector,bVector) / (Ma * Mb);
    If SameValue(Cos,1.0,1e-6) then
      Result := 0.0
    else
      Result := ArcCos(Cos);
  end
else Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleRad(const aVector,bVector: TVMCLVector3s): Single;
var
  Ma,Mb,Cos:  Extended;
begin
Ma := Magnitude(aVector);
Mb := Magnitude(bVector);
If (Ma <> 0.0) and (Mb <> 0.0) then
  begin
    Cos := VectorsDotProduct(aVector,bVector) / (Ma * Mb);
    If SameValue(Cos,1.0,1e-6) then
      Result := 0.0
    else
      Result := ArcCos(Cos);
  end
else Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleRad(const aVector,bVector: TVMCLVector4s): Single;
var
  Ma,Mb,Cos:  Extended;
begin
Ma := MagnitudeXYZ(aVector);
Mb := MagnitudeXYZ(bVector);
If (Ma <> 0.0) and (Mb <> 0.0) then
  begin
    Cos := VectorsDotProductXYZ(aVector,bVector) / (Ma * Mb);
    If SameValue(Cos,1.0,1e-6) then
      Result := 0.0
    else
      Result := ArcCos(Cos);
  end
else Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleRad(const aVector,bVector: TVMCLVector2d): Double;
var
  Ma,Mb,Cos:  Extended;
begin
Ma := Magnitude(aVector);
Mb := Magnitude(bVector);
If (Ma <> 0.0) and (Mb <> 0.0) then
  begin
    Cos := VectorsDotProduct(aVector,bVector) / (Ma * Mb);
    If SameValue(Cos,1.0,1e-13) then
      Result := 0.0
    else
      Result := ArcCos(Cos);
  end
else Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleRad(const aVector,bVector: TVMCLVector3d): Double;
var
  Ma,Mb,Cos:  Extended;
begin
Ma := Magnitude(aVector);
Mb := Magnitude(bVector);
If (Ma <> 0.0) and (Mb <> 0.0) then
  begin
    Cos := VectorsDotProduct(aVector,bVector) / (Ma * Mb);
    If SameValue(Cos,1.0,1e-13) then
      Result := 0.0
    else
      Result := ArcCos(Cos);
  end
else Result := 0.0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleRad(const aVector,bVector: TVMCLVector4d): Double;
var
  Ma,Mb,Cos:  Extended;
begin
Ma := MagnitudeXYZ(aVector);
Mb := MagnitudeXYZ(bVector);
If (Ma <> 0.0) and (Mb <> 0.0) then
  begin
    Cos := VectorsDotProductXYZ(aVector,bVector) / (Ma * Mb);
    If SameValue(Cos,1.0,1e-13) then
      Result := 0.0
    else
      Result := ArcCos(Cos);
  end
else Result := 0.0;
end;

//==============================================================================

Function VectorsAngleDeg(const aVector,bVector: TVMCLVector2s): Single;
begin
Result := RadToDeg(VectorsAngleRad(aVector,bVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleDeg(const aVector,bVector: TVMCLVector3s): Single;
begin
Result:= RadToDeg(VectorsAngleRad(aVector,bVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleDeg(const aVector,bVector: TVMCLVector4s): Single;
begin
Result := RadToDeg(VectorsAngleRad(aVector,bVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleDeg(const aVector,bVector: TVMCLVector2d): Double;
begin
Result := RadToDeg(VectorsAngleRad(aVector,bVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleDeg(const aVector,bVector: TVMCLVector3d): Double;
begin
Result := RadToDeg(VectorsAngleRad(aVector,bVector));
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function VectorsAngleDeg(const aVector,bVector: TVMCLVector4d): Double;
begin
Result := RadToDeg(VectorsAngleRad(aVector,bVector));
end;


end.
