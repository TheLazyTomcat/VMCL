unit VMCL_Common;

{$INCLUDE 'VMCL_defs.inc'}

interface

//= Library informations =======================================================

type
  TVMCLInfo = (ftsSSE,                      // CPU supports SSE instructions
               ftsSSE2,                     // CPU supports SSE2 instructions
               ftsSSE3,                     // CPU supports SSE3 instructions
               ftsSupportsSSE,              // library provides SSE-based functions
               ftdPurePascal,               // PurePascal symbol is defined
               ftdX86,                      // compiled for x86 instruction set
               ftdX64,                      // compiled for x86-64 instruction set
               ftdWindows,                  // compiled for Windows OS
               ftdUnix,                     // compiled for Unix OS (ie. Linux)
               ftdFPC,                      // compiled using FPC
               ftdDelphi,                   // compiled using Delphi
               ftdASMSuppressSizeWarnings,  // ASMSuppressSizeWarnings symbol is defined
               ftdASMDirectOPCodes,         // ASMDirectOPCodes symbol is defined
               ftdAllocLargeMemSegment,
               ftdAllocOptimizeForSpeed,
               ftdAllocAutoInit,
               ftdAllocGrowOnly);

  TVMCLInfoSet = set of TVMCLInfo;

var
  VMCL_InfoSet:       TVMCLInfoSet;
  VMCL_SupportsSSE:   Boolean = False;  // true when the library offers SSE-based functions

//= Calculation constants ======================================================

const
  VMCL_RadToDegCoef:  Double = 180 / Pi;
  VMCL_DegToRadCoef:  Double = Pi / 180;

//= Common functions ===========================================================

//- Checking for 128bit pointer alignment --------------------------------------

Function CheckMemAlign16(Ptr: Pointer): Boolean; overload;
Function CheckMemAlign16(Ptr1, Ptr2: Pointer): Boolean; overload;
Function CheckMemAlign16(Ptr1, Ptr2, Ptr3: Pointer): Boolean; overload;
Function CheckMemAlign16(Ptrs: array of Pointer): Boolean; overload;

//- Clipping (also known as clamping) value to a range -------------------------

procedure Clip(var Value: Integer; Min,Max: Integer); overload;
procedure Clip(var Value: Single; Min,Max: Single); overload;
procedure Clip(var Value: Double; Min,Max: Double); overload;

Function Clipped(Value: Integer; Min,Max: Integer): Integer; overload;
Function Clipped(Value: Single; Min,Max: Single): Single; overload;
Function Clipped(Value: Double; Min,Max: Double): Double; overload;

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
Function ValueToStr(Value: Extended): String; overload;

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

procedure Clip(var Value: Integer; Min,Max: Integer);
begin
If Value < Min then Value := Min else
  If Value > Max then Value := Max;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Clip(var Value: Single; Min,Max: Single);
begin
If Value < Min then Value := Min else
  If Value > Max then Value := Max;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure Clip(var Value: Double; Min,Max: Double);
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

Function Clipped(Value: Single; Min,Max: Single): Single;
begin
If Value < Min then Result := Min else
  If Value > Max then Result := Max
    else Result := Value;
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

Function Clipped(Value: Double; Min,Max: Double): Double;
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
  InfoSet(ftsSSE,Info.ProcessorFeatures.SSE);
  InfoSet(ftsSSE2,Info.ProcessorFeatures.SSE2);
  InfoSet(ftsSSE3,Info.ProcessorFeatures.SSE3);
  InfoSet(ftsSupportsSSE,[ftsSSE,ftsSSE2,ftsSSE3] <= VMCL_InfoSet);
  InfoSet(ftdPurePascal,{$IFDEF PurePascal}True{$ELSE}False{$ENDIF});
  InfoSet(ftdX86,{$IFDEF x86}True{$ELSE}False{$ENDIF});
  InfoSet(ftdX64,{$IFDEF x64}True{$ELSE}False{$ENDIF});
  InfoSet(ftdWindows,{$IFDEF Windows}True{$ELSE}False{$ENDIF});
  InfoSet(ftdUnix,{$IFDEF Unix}True{$ELSE}False{$ENDIF});
  InfoSet(ftdFPC,{$IFDEF FPC}True{$ELSE}False{$ENDIF});
  InfoSet(ftdDelphi,{$IFDEF Delphi}True{$ELSE}False{$ENDIF});
  InfoSet(ftdASMSuppressSizeWarnings,{$IFDEF ASMSuppressSizeWarnings}True{$ELSE}False{$ENDIF});
  InfoSet(ftdASMDirectOPCodes,{$IFDEF ASMDirectOPCodes}True{$ELSE}False{$ENDIF});
  InfoSet(ftdAllocLargeMemSegment,{$IFDEF AllocLargeMemSegment}True{$ELSE}False{$ENDIF});
  InfoSet(ftdAllocOptimizeForSpeed,{$IFDEF AllocOptimizeForSpeed}True{$ELSE}False{$ENDIF});
  InfoSet(ftdAllocAutoInit,{$IFDEF AllocAutoInit}True{$ELSE}False{$ENDIF});
  InfoSet(ftdAllocGrowOnly,{$IFDEF AllocGrowOnly}True{$ELSE}False{$ENDIF});
  VMCL_SupportsSSE := ftsSupportsSSE in VMCL_InfoSet;
finally
  Free;
end;
end;

//------------------------------------------------------------------------------

initialization
  Initialize;

end.
