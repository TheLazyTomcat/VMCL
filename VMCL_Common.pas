{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  VMCL - Vectors & Matrices calculation library

  Common types, constants, functions, ...

  ©František Milt 2018-02-26

  Version 1.0 dev

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    BitVector   - github.com/ncs-sniper/Lib.BitVector
    BitOps      - github.com/ncs-sniper/Lib.BitOps
    StrRect     - github.com/ncs-sniper/Lib.StrRect
    SimpleCPUID - github.com/ncs-sniper/Lib.SimpleCPUID

===============================================================================}
unit VMCL_Common;

{$INCLUDE 'VMCL_defs.inc'}

interface

//= Library informations =======================================================

type
  TVMCLInfo = (
    infSSE,                           // CPU supports SSE instructions
    infSSE2,                          // CPU supports SSE2 instructions
    infSSE3,                          // CPU supports SSE3 instructions
    infSupportsSSE,                   // library provides SSE-based functions
    infPurePascal,                    // PurePascal symbol is defined
    infX86,                           // compiled for x86 instruction set
    infX64,                           // compiled for x86-64 instruction set
    infWindows,                       // compiled for Windows OS
    infUnix,                          // compiled for Unix OS (ie. Linux)
    infFPC,                           // compiled using FPC
    infDelphi,                        // compiled using Delphi
    infASMSuppressSizeWarnings,       // ASMSuppressSizeWarnings symbol is defined
    infASMDirectOPCodes,              // ASMDirectOPCodes symbol is defined
    infAllocLargeMemSegment,          // AllocLargeMemSegment symbol is defined
    infAllocOptimizeForSpeed,         // AllocOptimizeForSpeed symbol is defined
    infAllocAutoInit,                 // AllocAutoInit symbol is defined
    infAllocGrowOnly,                 // AllocGrowOnly symbol is defined
    infVectorsDoubleIsDefault,        // VectorsDoubleIsDefault symbol is defined
    infMatricesColumnMajorIsDefault,  // MatricesColumnMajorIsDefault symbol is defined
    infMatricesDoubleIsDefault,       // MatricesDoubleIsDefault symbol is defined
    infMatricesUnwindLoops);          // MatricesUnwindLoops symbol is defined

  TVMCLInfoSet = set of TVMCLInfo;

var
  VMCL_InfoSet:       TVMCLInfoSet;     // information about the library
  VMCL_SupportsSSE:   Boolean = False;  // true when the library offers SSE-based functions

//= Calculation constants ======================================================

const
  VMCL_RadToDegCoef:  Double = 180 / Pi;
  VMCL_DegToRadCoef:  Double = Pi / 180;

//= Common functions ===========================================================

//- Checking for 128bit pointer alignment --------------------------------------

Function CheckMemAlign16(Ptr: Pointer): Boolean; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function CheckMemAlign16(Ptr1, Ptr2: Pointer): Boolean; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function CheckMemAlign16(Ptr1, Ptr2, Ptr3: Pointer): Boolean; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function CheckMemAlign16(Ptrs: array of Pointer): Boolean; overload;

//- Checking if value is in a given range --------------------------------------

Function CheckRange(Value: Integer; Min,Max: Integer): Boolean; overload;{$IFDEF CanInline} inline;{$ENDIF}
Function CheckRange(Value: Extended; Min,Max: Extended): Boolean; overload;{$IFDEF CanInline} inline;{$ENDIF}

//- Clipping (also known as clamping) value to a range -------------------------

procedure Clip(var Value: Integer; Min,Max: Integer); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure Clip(var Value: Extended; Min,Max: Extended); overload;{$IFDEF CanInline} inline;{$ENDIF}

Function Clipped(Value: Integer; Min,Max: Integer): Integer; overload;//{$IFDEF CanInline} inline;{$ENDIF}
Function Clipped(Value: Extended; Min,Max: Extended): Extended; overload;//{$IFDEF CanInline} inline;{$ENDIF}

//- Formatting types, constants and functions ----------------------------------

type
  TVMCLValueFormat = record
    ThousandSeparator:  Char;
    DecimalSeparator:   Char;
    DecimalPlaces:      Integer;
  end;

  TVMCLCommonFormat = record
    ValueFormat:          TVMCLValueFormat;
    WhiteSpace:           Char;
    ComponentsDelimiter:  Char;
    LeadingString:        String;
    TrailingString:       String;
  end;

const
  VMCL_DefaultValueFormat: TVMCLValueFormat = (
    ThousandSeparator:  #0;
    DecimalSeparator:   '.';
    DecimalPlaces:      -1);

  VMCL_DefaultCommonFormat: TVMCLCommonFormat = (
    ValueFormat: (
      ThousandSeparator:    #0;
      DecimalSeparator:     '.';
      DecimalPlaces:        -1);
    WhiteSpace:           ' ';
    ComponentsDelimiter:  ',';
    LeadingString:        '[';
    TrailingString:       ']');

Function ValueFormat(ThousandSeparator, DecimalSeparator: Char; DecimalPlaces: Integer): TVMCLValueFormat;
Function CommonFormat(ValueFormat: TVMCLValueFormat; WhiteSpace, ComponentsDelimiter: Char; LeadingString, TrailingString: String): TVMCLCommonFormat;

Function ValueToStr(Value: Extended; const ValueFormat: TVMCLValueFormat): String; overload;
Function ValueToStr(Value: Extended): String; overload;{$IFDEF CanInline} inline;{$ENDIF}

implementation

uses
  SysUtils, AuxTypes, SimpleCPUID;

//= Common functions implementation ============================================

Function CheckMemAlign16(Ptr: Pointer): Boolean;
begin
Result := ({%H-}PtrUInt(Ptr) and $F) = 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CheckMemAlign16(Ptr1, Ptr2: Pointer): Boolean;
begin
Result := (({%H-}PtrUInt(Ptr1) or {%H-}PtrUInt(Ptr2)) and PtrUInt($F)) = 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CheckMemAlign16(Ptr1, Ptr2, Ptr3: Pointer): Boolean;
begin
Result := (({%H-}PtrUInt(Ptr1) or {%H-}PtrUInt(Ptr2) or {%H-}PtrUInt(Ptr3)) and PtrUInt($F)) = 0;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CheckMemAlign16(Ptrs: array of Pointer): Boolean;
var
  i:  Integer;
begin
Result := True;
For i := Low(Ptrs) to High(Ptrs) do
  If ({%H-}PtrUInt(Ptrs[i]) and $F) <> 0 then
    begin
      Result := False;
      Break{For i};
    end;
end;

//==============================================================================

Function CheckRange(Value: Integer; Min,Max: Integer): Boolean;
begin
Result := (Value >= Min) and (Value <= Max);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function CheckRange(Value: Extended; Min,Max: Extended): Boolean;
begin
Result := (Value >= Min) and (Value <= Max);
end;

//==============================================================================

procedure Clip(var Value: Integer; Min,Max: Integer);
begin
If Value < Min then Value := Min else
  If Value > Max then Value := Max;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Clip(var Value: Extended; Min,Max: Extended);
begin
If Value < Min then Value := Min else
  If Value > Max then Value := Max;
end;

//------------------------------------------------------------------------------

Function Clipped(Value: Integer; Min,Max: Integer): Integer;
begin
If Value < Min then Result := Min else
  If Value > Max then Result := Max
    else Result := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Clipped(Value: Extended; Min,Max: Extended): Extended;
begin
If Value < Min then Result := Min else
  If Value > Max then Result := Max
    else Result := Value;
end;

//==============================================================================

Function ValueFormat(ThousandSeparator, DecimalSeparator: Char; DecimalPlaces: Integer): TVMCLValueFormat;
begin
Result.ThousandSeparator := ThousandSeparator;
Result.DecimalSeparator := DecimalSeparator;
Result.DecimalPlaces := DecimalPlaces;
end;

//------------------------------------------------------------------------------

Function CommonFormat(ValueFormat: TVMCLValueFormat; WhiteSpace, ComponentsDelimiter: Char; LeadingString, TrailingString: String): TVMCLCommonFormat;
begin
Result.ValueFormat := ValueFormat;
Result.WhiteSpace := WhiteSpace;
Result.ComponentsDelimiter := ComponentsDelimiter;
Result.LeadingString := LeadingString;
Result.TrailingString := TrailingString;
end;

//------------------------------------------------------------------------------

Function ValueToStr(Value: Extended; const ValueFormat: TVMCLValueFormat): String;
var
  FormatSettings: TFormatSettings;
begin
FormatSettings.DecimalSeparator := ValueFormat.DecimalSeparator;
FormatSettings.ThousandSeparator := ValueFormat.ThousandSeparator;
If ValueFormat.DecimalPlaces >= 0 then
  Result := FormatFloat('0.' + StringOfChar('#',ValueFormat.DecimalPlaces),Value,FormatSettings)
else
  Result := FloatToStr(Value,FormatSettings);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function ValueToStr(Value: Extended): String;
begin
Result := ValueToStr(Value,VMCL_DefaultValueFormat);
end;

//= Initialization =============================================================

procedure Initialize;

  procedure InfoSet(Value: TVMCLInfo; Active: Boolean);
  begin
    If Active then
      Include(VMCL_InfoSet,Value)
    else
      Exclude(VMCL_InfoSet,Value);
  end;
  
begin
with TSimpleCPUID.Create do
try
  VMCL_InfoSet := [];
  InfoSet(infSSE,Info.ProcessorFeatures.SSE);
  InfoSet(infSSE2,Info.ProcessorFeatures.SSE2);
  InfoSet(infSSE3,Info.ProcessorFeatures.SSE3);
  InfoSet(infSupportsSSE,[infSSE,infSSE2,infSSE3] <= VMCL_InfoSet);
  InfoSet(infPurePascal,{$IFDEF PurePascal}True{$ELSE}False{$ENDIF});
  InfoSet(infX86,{$IFDEF x86}True{$ELSE}False{$ENDIF});
  InfoSet(infX64,{$IFDEF x64}True{$ELSE}False{$ENDIF});
  InfoSet(infWindows,{$IFDEF Windows}True{$ELSE}False{$ENDIF});
  InfoSet(infUnix,{$IFDEF Unix}True{$ELSE}False{$ENDIF});
  InfoSet(infFPC,{$IFDEF FPC}True{$ELSE}False{$ENDIF});
  InfoSet(infDelphi,{$IFDEF Delphi}True{$ELSE}False{$ENDIF});
  InfoSet(infASMSuppressSizeWarnings,{$IFDEF ASMSuppressSizeWarnings}True{$ELSE}False{$ENDIF});
  InfoSet(infASMDirectOPCodes,{$IFDEF ASMDirectOPCodes}True{$ELSE}False{$ENDIF});
  InfoSet(infAllocLargeMemSegment,{$IFDEF AllocLargeMemSegment}True{$ELSE}False{$ENDIF});
  InfoSet(infAllocOptimizeForSpeed,{$IFDEF AllocOptimizeForSpeed}True{$ELSE}False{$ENDIF});
  InfoSet(infAllocAutoInit,{$IFDEF AllocAutoInit}True{$ELSE}False{$ENDIF});
  InfoSet(infAllocGrowOnly,{$IFDEF AllocGrowOnly}True{$ELSE}False{$ENDIF});
  InfoSet(infVectorsDoubleIsDefault,{$IFDEF VectorsDoubleIsDefault}True{$ELSE}False{$ENDIF});
  InfoSet(infMatricesColumnMajorIsDefault,{$IFDEF MatricesColumnMajorIsDefault}True{$ELSE}False{$ENDIF});
  InfoSet(infMatricesDoubleIsDefault,{$IFDEF MatricesDoubleIsDefault}True{$ELSE}False{$ENDIF});
  InfoSet(infMatricesUnwindLoops,{$IFDEF MatricesUnwindLoops}True{$ELSE}False{$ENDIF});
  VMCL_SupportsSSE := infSupportsSSE in VMCL_InfoSet;
finally
  Free;
end;
end;

//------------------------------------------------------------------------------

initialization
  Initialize;

end.
