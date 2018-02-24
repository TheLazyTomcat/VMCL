unit VMCL_Vectors;

{$INCLUDE 'VMCL_defs.inc'}

interface

uses
  VMCL_Common;

{==============================================================================}
{   Vector types and constants                                                 }
{==============================================================================}
type
  TVMCLVectorField = (X = 0,Y,Z,W); //used for swizzling

  TVMCLVector2s = packed array[0..1] of Single;     PVMCLVector2s = ^TVMCLVector2s;
  TVMCLVector2d = packed array[0..1] of Double;     PVMCLVector2d = ^TVMCLVector2d;
  TVMCLVector2  = TVMCLVector2s;                    PVMCLVector2  = ^TVMCLVector2;

  TVMCLVector3s = packed array[0..2] of Single;     PVMCLVector3s = ^TVMCLVector3s;
  TVMCLVector3d = packed array[0..2] of Double;     PVMCLVector3d = ^TVMCLVector3d;
  TVMCLVector3  = TVMCLVector3s;                    PVMCLVector3  = ^TVMCLVector3;

  TVMCLVector4s = packed array[0..3] of Single;     PVMCLVector4s = ^TVMCLVector4s;
  TVMCLVector4d = packed array[0..3] of Double;     PVMCLVector4d = ^TVMCLVector4d;
  TVMCLVector4  = TVMCLVector4s;                    PVMCLVector4  = ^TVMCLVector4;

  TVMCLVector2sr = packed record
    X,Y:  Single;
  end;
  PVMCLVector2sr = ^TVMCLVector2sr;

  TVMCLVector2dr = packed record
    X,Y:  Double;
  end;
  PVMCLVector2dr = ^TVMCLVector2dr;

  TVMCLVector2r = TVMCLVector2sr;   PVMCLVector2r = ^TVMCLVector2r;

  TVMCLVector3sr = packed record
    X,Y,Z:  Single;
  end;
  PVMCLVector3sr = ^TVMCLVector3sr;

  TVMCLVector3dr = packed record
    X,Y,Z:  Double;
  end;
  PVMCLVector3dr = ^TVMCLVector3dr;

  TVMCLVector3r = TVMCLVector3sr;   PVMCLVector3r = ^TVMCLVector3r;

  TVMCLVector4sr = packed record
    X,Y,Z,W:  Single;
  end;
  PVMCLVector4sr = ^TVMCLVector4sr;

  TVMCLVector4dr = packed record
    X,Y,Z,W:  Double;
  end;
  PVMCLVector4dr = ^TVMCLVector4dr;

  TVMCLVector4r = TVMCLVector4sr;   PVMCLVector4r = ^TVMCLVector4r;

//- shortened name types (only aliasses for TVMCL* types) ----------------------

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

Function VecToStr(const Vector: TVMCLVector2s): String; overload;
Function VecToStr(const Vector: TVMCLVector3s): String; overload;
Function VecToStr(const Vector: TVMCLVector4s): String; overload;
Function VecToStr(const Vector: TVMCLVector2d): String; overload;
Function VecToStr(const Vector: TVMCLVector3d): String; overload;
Function VecToStr(const Vector: TVMCLVector4d): String; overload;

Function VecToStr(const Vector: TVMCLVector2sr): String; overload;
Function VecToStr(const Vector: TVMCLVector3sr): String; overload;
Function VecToStr(const Vector: TVMCLVector4sr): String; overload;
Function VecToStr(const Vector: TVMCLVector2dr): String; overload;
Function VecToStr(const Vector: TVMCLVector3dr): String; overload;
Function VecToStr(const Vector: TVMCLVector4dr): String; overload;

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



end.