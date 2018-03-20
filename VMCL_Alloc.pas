{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  VMCL - Vectors & Matrices calculation library

  Memory allocation

    Provides routines for allocation of memory buffers for vectors and matrices
    storage. It is also possible to allocate general memory space, although with
    limited size (32KiB, or 1MiB when symbol AllocLargeMemSegment is defined).
    All returned pointers are guaranteed to be properly aligned for use in fast
    SSE instructions (currently the alignment is set to 128bit boundary, but
    this can be changed). General memory managers might not necessarily
    guarantee this alignment, that is the main reason why this unit exists.

  ©František Milt 2018-**-**

  Version 1.0 dev

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    BitVector   - github.com/ncs-sniper/Lib.BitVector
    BitOps      - github.com/ncs-sniper/Lib.BitOps
    StrRect     - github.com/ncs-sniper/Lib.StrRect
    SimpleCPUID - github.com/ncs-sniper/Lib.SimpleCPUID

===============================================================================}
unit VMCL_Alloc;

{$INCLUDE 'VMCL_defs.inc'}

interface

uses
  SyncObjs, Contnrs, {$IFNDEF FPC}Types, Classes,{$ENDIF}
  BitVector, AuxTypes,
  VMCL_Vectors, VMCL_Matrices;

{===============================================================================
--------------------------------------------------------------------------------
                               TVMCLMemorySegment
--------------------------------------------------------------------------------
===============================================================================}

type
  TVMCLMemoryAlignment = (ma8b,ma32b,ma64b,ma128b,ma256b,ma512b,ma1024b,ma2048b,maNone = ma8b{%H-});

{===============================================================================
    TVMCLMemorySegment - declaration
===============================================================================}
  TVMCLMemorySegment = class(TObject)
  private
    fBlockSize:     TMemSize;
    fAlignment:     TVMCLMemoryAlignment;
    fSize:          TMemSize;
    fMemoryBase:    Pointer;
    fMemory:        Pointer;
    fCount:         Integer;
    fAllocMap:      TBitVectorStatic;
    Function GetAllocated(Index: Integer): Boolean;
    Function GetBlock(Index: Integer): Pointer;
  protected
    Function FindFreeBlocks(BlockCount: Integer): Integer; virtual;
    Function BlocksInBytes(Bytes: TMemSize): Integer; virtual;
  public
    constructor Create(BlockSize, MinSegmentSize: TMemSize; Alignment: TVMCLMemoryAlignment);
    destructor Destroy; override;
    Function UsableBytes: TMemSize; virtual;
    Function WastedBytes: TMemSize; virtual;
    Function AllocCount: Integer; virtual;
    Function FreeCount: Integer; virtual;
    Function IsFull: Boolean; virtual;
    Function IsEmpty: Boolean; virtual;
    Function OwnsMemory(Ptr: Pointer): Boolean; virtual;
    Function IndexOf(Ptr: Pointer): Integer; virtual;
    Function TryAllocateBlocks(Size: TMemSize; out Ptr: Pointer): Boolean; virtual;
    Function AllocateBlocks(Size: TMemSize): Pointer; virtual;
    procedure FreeBlocks(Ptr: Pointer; Size: TMemSize); virtual;
    property MemoryBase: Pointer read fMemoryBase;
    property Memory: Pointer read fMemory;
    property Allocated[Index: Integer]: Boolean read GetAllocated;
    property Blocks[Index: Integer]: Pointer read GetBlock; default;
    property BlockSize: TMemSize read fBlockSize;
    property Alignment: TVMCLMemoryAlignment read fAlignment;
    property Size: TMemSize read fSize;
    property Count: Integer read fCount;
  end;

{===============================================================================
--------------------------------------------------------------------------------
                               TVMCLMemoryManager
--------------------------------------------------------------------------------
===============================================================================}

type
  TVMCLMemoryManagerGrowMode = (gmGrowing,gmDynamic);

{===============================================================================
    TVMCLMemoryManager - declaration                                             
===============================================================================}

  TVMCLMemoryManager = class(TObject)
  private
    fGrowMode:        TVMCLMemoryManagerGrowMode;
    fMinSegmentSize:  TMemSize;
    fAlignment:       TVMCLMemoryAlignment;
    fBaseBlockSize:   TMemSize;
    fSynchronizer:    TCriticalSection;
    fSegmentsAll:     TObjectList;
    fSegmentsBase:    TObjectList;
    fSegmentsDubl:    TObjectList;
    fSegmentsQuad:    TObjectList;
    fSegmentsOcta:    TObjectList;
    Function GetSegmentCount: Integer;
    Function GetSegment(Index: Integer): TVMCLMemorySegment;
    Function GetAllocatedMemory: TMemSize;
  protected
    procedure Lock; virtual;
    procedure Unlock; virtual;
    Function AddSegment(Segments: TObjectList; BaseBlockMultiplicator: TMemSize): Integer; virtual;
    procedure DeleteSegment(Segments: TObjectList; Index: Integer); virtual;
  public
    constructor Create(GrowMode: TVMCLMemoryManagerGrowMode; MinSegmentSize: TMemSize; Alignment: TVMCLMemoryAlignment);
    destructor Destroy; override;
    Function AlignedAllocate(Size: TMemSize): Pointer; virtual;
    procedure AlignedFree(Ptr: Pointer; Size: TMemSize); virtual;
    property Segments[Index: Integer]: TVMCLMemorySegment read GetSegment;
    property GrowMode: TVMCLMemoryManagerGrowMode read fGrowMode;
    property MinSegmentSize: TMemSize read fMinSegmentSize;
    property Alignment: TVMCLMemoryAlignment read fAlignment;
    property BaseBlockSize: TMemSize read fBaseBlockSize;
    property Count: Integer read GetSegmentCount;
    property AllocatedMemory: TMemSize read GetAllocatedMemory;
  end;

{===============================================================================
    Auxiliary functions - declaration
===============================================================================}

Function MemAlignmentBytes(Alignment: TVMCLMemoryAlignment): TMemSize;

{===============================================================================
    Memory manager routines - declaration
===============================================================================}

procedure Initialize;
procedure Finalize;

{===============================================================================
    Allocation functions - declaration
===============================================================================}

Function VMCL_GetMem(Size: TMemSize): Pointer; overload;
procedure VMCL_GetMem(out Ptr: Pointer; Size: TMemSize); overload;{$IFDEF CanInline} inline;{$ENDIF}

Function VMCL_AllocMem(Size: TMemSize): Pointer; overload;
procedure VMCL_AllocMem(out Ptr: Pointer; Size: TMemSize); overload;{$IFDEF CanInline} inline;{$ENDIF}

procedure VMCL_FreeMem(Ptr: Pointer; Size: TMemSize);

//= Vectors allocation =========================================================

procedure VMCL_New(out Vec: PVMCLVector2s; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector3s; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector4s; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector2d; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector3d; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector4d; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

procedure VMCL_New(out Vec: PVMCLVector2sr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector3sr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector4sr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector2dr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector3dr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Vec: PVMCLVector4dr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector2s; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector3s; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector4s; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector2d; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector3d; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector4d; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

procedure VMCL_Dispose(Vec: PVMCLVector2sr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector3sr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector4sr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector2dr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector3dr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Vec: PVMCLVector4dr; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

//= Matrices allocation ========================================================

procedure VMCL_New(out Mat: PVMCLMatrix2RMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Mat: PVMCLMatrix2RMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Mat: PVMCLMatrix2CMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Mat: PVMCLMatrix2CMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

procedure VMCL_New(out Mat: PVMCLMatrix3RMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Mat: PVMCLMatrix3RMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Mat: PVMCLMatrix3CMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Mat: PVMCLMatrix3CMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

procedure VMCL_New(out Mat: PVMCLMatrix4RMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Mat: PVMCLMatrix4RMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Mat: PVMCLMatrix4CMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_New(out Mat: PVMCLMatrix4CMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix2RMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Mat: PVMCLMatrix2RMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Mat: PVMCLMatrix2CMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Mat: PVMCLMatrix2CMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

procedure VMCL_Dispose(Mat: PVMCLMatrix3RMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Mat: PVMCLMatrix3RMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Mat: PVMCLMatrix3CMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Mat: PVMCLMatrix3CMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

procedure VMCL_Dispose(Mat: PVMCLMatrix4RMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Mat: PVMCLMatrix4RMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Mat: PVMCLMatrix4CMs; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}
procedure VMCL_Dispose(Mat: PVMCLMatrix4CMd; Count: UInt32 = 1); overload;{$IFDEF CanInline} inline;{$ENDIF}

implementation

uses
  SysUtils, Math;

{===============================================================================
    Auxiliary functions - implementation
===============================================================================}

Function MemAlignmentBytes(Alignment: TVMCLMemoryAlignment): TMemSize;
begin
case Alignment of
  ma8b:     Result := 1;
  ma32b:    Result := 4;
  ma64b:    Result := 8;
  ma128b:   Result := 16;
  ma256b:   Result := 32;
  ma512b:   Result := 64;
  ma1024b:  Result := 128;
  ma2048b:  Result := 256;
else
  raise Exception.CreateFmt('MemAlignmentBytes: Unknown memory alignment(%d).',[Ord(Alignment)]);
end;
end;

{===============================================================================
    Memory manager routines - implementation
===============================================================================}

var
  VMCL_MemoryManager: TVMCLMemoryManager = nil;

const
{$IFDEF AllocLargeMemSegment}
  VMCL_AllocSegmentSize = 1024 * 1024;  // 1MiB
{$ELSE}
  VMCL_AllocSegmentSize = 32 * 1024;    // 32KiB
{$ENDIF}

//------------------------------------------------------------------------------

procedure Initialize;
begin
If not Assigned(VMCL_MemoryManager) then
  VMCL_MemoryManager := TVMCLMemoryManager.Create({$IFDEF AllocGrowOnly}gmGrowing{$ELSE}gmDynamic{$ENDIF},VMCL_AllocSegmentSize,ma128b);
end;

//------------------------------------------------------------------------------

procedure Finalize;
begin
FreeAndNil(VMCL_MemoryManager);
end;

{===============================================================================
--------------------------------------------------------------------------------
                               TVMCLMemorySegment
--------------------------------------------------------------------------------
===============================================================================}

{===============================================================================
    TVMCLMemorySegment - implementation
===============================================================================}

{-------------------------------------------------------------------------------
    TVMCLMemorySegment - private methods
-------------------------------------------------------------------------------}

Function TVMCLMemorySegment.GetAllocated(Index: Integer): Boolean;
begin
If (Index >= fAllocMap.LowIndex) and (Index <= fAllocMap.HighIndex) then
  Result := fAllocMap[Index]
else
  raise Exception.CreateFmt('TVMCLMemorySegment.GetAllocated: Index (%d) out of bounds.',[Index]);
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.GetBlock(Index: Integer): Pointer;
begin
If (Index >= 0) and (Index < fCount) then
  Result := {%H-}Pointer({%H-}PtrUInt(fMemory) + (PtrUInt(Index) * PtrUInt(fBlockSize)))
else
  raise Exception.CreateFmt('TVMCLMemorySegment.GetBlock: Index (%d) out of bounds.',[Index]);
end;

{-------------------------------------------------------------------------------
    TVMCLMemorySegment - protected methods
-------------------------------------------------------------------------------}

Function TVMCLMemorySegment.FindFreeBlocks(BlockCount: Integer): Integer;
var
  SeqCount,i: Integer;
begin
Result := -1;
If BlockCount > 0 then
  begin
    SeqCount := 0;
    If BlockCount <= FreeCount then
      For i := 0 to Pred(fCount) do
        begin
          If fAllocMap[i] then
            begin
              SeqCount := 0;
              Result := -1;
            end
          else
            begin
              Inc(SeqCount);
              If Result < 0 then
                Result := i;
            end;
          If SeqCount >= BlockCount then
            Break{For i};
        end;
    If SeqCount < BlockCount then
      Result := -1
  end;
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.BlocksInBytes(Bytes: TMemSize): Integer;
begin
Result := Ceil(Bytes / fBlockSize);
end;

{-------------------------------------------------------------------------------
    TVMCLMemorySegment - public methods
-------------------------------------------------------------------------------}

constructor TVMCLMemorySegment.Create(BlockSize, MinSegmentSize: TMemSize; Alignment: TVMCLMemoryAlignment);
begin
inherited Create;
// sanity checks
If BlockSize <= 0 then
  raise Exception.CreateFmt('TVMCLMemorySegment.Create: Block size (%u) too small.',[BlockSize]);
If MinSegmentSize < (BlockSize + MemAlignmentBytes(Alignment)) then
  raise Exception.CreateFmt('TVMCLMemorySegment.Create: Segment size (%u) too small.',[MinSegmentSize]);
If (BlockSize mod MemAlignmentBytes(Alignment)) <> 0 then
  raise Exception.CreateFmt('TVMCLMemorySegment.Create: Blocks cannot be properly aligned (%d).',[Ord(Alignment)]);
fBlockSize := BlockSize;
fAlignment := Alignment;
fSize := MinSegmentSize + Pred(MemAlignmentBytes(Alignment));
GetMem(fMemoryBase,fSize);
// get actual aligned memory
If ({%H-}PtrUInt(fMemoryBase) mod PtrUInt(MemAlignmentBytes(fAlignment))) <> 0 then
  fMemory := {%H-}Pointer({%H-}PtrUInt(fMemoryBase) + (PtrUInt(MemAlignmentBytes(fAlignment)) -
              ({%H-}PtrUInt(fMemoryBase) mod PtrUInt(MemAlignmentBytes(fAlignment)))))
else
  fMemory := fMemoryBase;
// get count according to usable aligned memory
fCount := Integer((PtrUInt(fSize) - ({%H-}PtrUInt(fMemory) - {%H-}PtrUInt(fMemoryBase))) div PtrUInt(fBlockSize));
If fCount <= 0 then
  raise Exception.CreateFmt('TVMCLMemorySegment.Create: Count (%d) too small (small memory segment?).',[fCount]);
If (fCount and 31) <> 0 then
  fAllocMap := TBitVectorStatic.Create(fCount,False)
else
  fAllocMap := TBitVectorStatic32.Create(fCount,False);
end;

//------------------------------------------------------------------------------

destructor TVMCLMemorySegment.Destroy;
begin
fAllocMap.Free;
FreeMem(fMemoryBase,fSize);
inherited;
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.UsableBytes: TMemSize;
begin
Result := fBlockSize * TMemSize(fCount);
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.WastedBytes: TMemSize;
begin
Result := fSize - UsableBytes;
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.AllocCount: Integer;
begin
Result := fAllocMap.PopCount;
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.FreeCount: Integer;
begin
Result := fCount - fAllocMap.PopCount;
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.IsFull: Boolean;
begin
Result := fAllocMap.IsFull;
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.IsEmpty: Boolean;
begin
Result := fAllocMap.IsEmpty;
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.OwnsMemory(Ptr: Pointer): Boolean;
begin
Result := ({%H-}PtrUInt(Ptr) >= {%H-}PtrUInt(GetBlock(0))) and
          ({%H-}PtrUInt(Ptr) <= ({%H-}PtrUInt(GetBlock(Pred(fCount))) + (fBlockSize - 1)));
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.IndexOf(Ptr: Pointer): Integer;
begin
If OwnsMemory(Ptr) then
  Result := Integer(({%H-}PtrUInt(Ptr) - {%H-}PtrUInt(fMemory)) div fBlockSize)
else
  Result := -1;
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.TryAllocateBlocks(Size: TMemSize; out Ptr: Pointer): Boolean;
var
  BlockCount: Integer;
  Index:      Integer;
  i:          Integer;
begin
If not Isfull then
  begin
    BlockCount := BlocksInBytes(Size);
    If BlockCount > 1 then
      Index := FindFreeBlocks(BlockCount)
    else
      Index := fAllocMap.FirstClean;
    If Index >= 0 then
      begin
        Ptr := GetBlock(Index);
        For i := Index to Pred(Index + BlockCount) do
          fAllocMap[i] := True;
        Result := True;
      end
    else Result := False;
  end
else Result := False;
end;

//------------------------------------------------------------------------------

Function TVMCLMemorySegment.AllocateBlocks(Size: TMemSize): Pointer;
begin
If not IsFull then
  begin
    If not TryAllocateBlocks(Size,Result) then
      raise Exception.CreateFmt('TMemorySegment.AllocateBlocks: Not enough free memory (%u).',[Size]);
  end
else raise Exception.Create('TVMCLMemorySegment.AllocateBlocks: Out of resources.');
end;

//------------------------------------------------------------------------------

procedure TVMCLMemorySegment.FreeBlocks(Ptr: Pointer; Size: TMemSize);
var
  Index:  Integer;
  i:      Integer;
begin
Index := IndexOf(Ptr);
If Index >= 0 then
  begin
    For i := Index to Pred(Min(Index + BlocksInBytes(Size),fCount)) do
      fAllocMap[i] := False;
  end
else raise Exception.CreateFmt('TVMCLMemorySegment.FreeBlocks: Pointer (0x%p) out of allowed range.',[Ptr]);
end;


{===============================================================================
--------------------------------------------------------------------------------
                               TVMCLMemoryManager
--------------------------------------------------------------------------------
===============================================================================}

{===============================================================================
    TVMCLMemoryManager - implementation
===============================================================================}

{-------------------------------------------------------------------------------
    TVMCLMemoryManager - private methods
-------------------------------------------------------------------------------}

Function TVMCLMemoryManager.GetSegmentCount: Integer;
begin
Result := fSegmentsAll.Count;
end;

//------------------------------------------------------------------------------

Function TVMCLMemoryManager.GetSegment(Index: Integer): TVMCLMemorySegment;
begin
If (Index >= 0) and (Index < fSegmentsAll.Count) then
  Result := TVMCLMemorySegment(fSegmentsAll[Index])
else
  raise Exception.CreateFmt('TVMCLMemoryManager.GetSegment: Index (%d) out of bounds.',[Index]);
end;

//------------------------------------------------------------------------------

Function TVMCLMemoryManager.GetAllocatedMemory: TMemSize;
var
  i:  Integer;
begin
Result := 0;
For i := 0 to Pred(fSegmentsAll.Count) do
  Result := Result + TVMCLMemorySegment(fSegmentsAll[i]).Size;
end;

{-------------------------------------------------------------------------------
    TVMCLMemoryManager - protected methods
-------------------------------------------------------------------------------}

procedure TVMCLMemoryManager.Lock;
begin
fSynchronizer.Enter;
end;

//------------------------------------------------------------------------------

procedure TVMCLMemoryManager.Unlock;
begin
fSynchronizer.Leave;
end;

//------------------------------------------------------------------------------

Function TVMCLMemoryManager.AddSegment(Segments: TObjectList; BaseBlockMultiplicator: TMemSize): Integer;
var
  TempObj:  TVMCLMemorySegment;
begin
TempObj := TVMCLMemorySegment.Create(BaseBlockMultiplicator * fBaseBlockSize,fMinSegmentSize,fAlignment);
Result := Segments.Add(TempObj);
fSegmentsAll.Add(TempObj);
end;

//------------------------------------------------------------------------------

procedure TVMCLMemoryManager.DeleteSegment(Segments: TObjectList; Index: Integer);
var
  TempObj:  TVMCLMemorySegment;
begin
TempObj := TVMCLMemorySegment(Segments[Index]);
If TempObj.IsEmpty and (fGrowMode = gmDynamic) then
  begin
    Segments.Delete(Index);
    // segment object is freed in the following removal
    If fSegmentsAll.Remove(TempObj) < 0 then
      raise Exception.Create('TVMCLMemoryManager.DeleteSegment: Unable to remove segment object.');
  end;
end;

{-------------------------------------------------------------------------------
    TVMCLMemoryManager - public methods
-------------------------------------------------------------------------------}

constructor TVMCLMemoryManager.Create(GrowMode: TVMCLMemoryManagerGrowMode; MinSegmentSize: TMemSize; Alignment: TVMCLMemoryAlignment);
begin
inherited Create;
fGrowMode := GrowMode;
fMinSegmentSize := MinSegmentSize;
fAlignment := Alignment;
fBaseBlockSize := Max(16,TMemSize(MemAlignmentBytes(fAlignment)));
fSynchronizer := TCriticalSection.Create;
fSegmentsAll := TObjectList.Create(True);
fSegmentsBase := TObjectList.Create(False);
fSegmentsDubl := TObjectList.Create(False);
fSegmentsQuad := TObjectList.Create(False);
fSegmentsOcta := TObjectList.Create(False);
end;

//------------------------------------------------------------------------------

destructor TVMCLMemoryManager.Destroy;
begin
fSegmentsOcta.Free;
fSegmentsQuad.Free;
fSegmentsDubl.Free;
fSegmentsBase.Free;
fSegmentsAll.Free;
fSynchronizer.Free;
inherited;
end;

//------------------------------------------------------------------------------

Function TVMCLMemoryManager.AlignedAllocate(Size: TMemSize): Pointer;

  Function AllocateOne(Segments: TObjectList; BaseBlockMultiplier: TMemSize): Pointer;
  var
    i,Index:  Integer;
  begin
    Index := -1;
    For i := 0 to Pred(Segments.Count) do
      If not TVMCLMemorySegment(Segments[i]).IsFull then
        begin
          Index := i;
          Break {For i};
        end;
    If Index < 0 then
      Index := AddSegment(Segments,BaseBlockMultiplier);
    Result := TVMCLMemorySegment(Segments[Index]).AllocateBlocks(Size);
  end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

  Function AllocateMany(Segments: TObjectList; BaseBlockMultiplier: TMemSize): Pointer;
  var
    i:  Integer;
  begin
    For i := 0 to Pred(Segments.Count) do
      If TVMCLMemorySegment(Segments[i]).TryAllocateBlocks(Size,Result) then Exit;
    // no segment can allocate required number of blocks, create a new one
    Result := TVMCLMemorySegment(Segments[AddSegment(Segments,BaseBlockMultiplier)]).AllocateBlocks(Size);
  end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---
begin
If (Size > 0) and (Size <= fMinSegmentSize) then
  begin
    Lock;
    try
      case Ceil(Size / fBaseBlockSize) of
      {$IFDEF AllocOptimizeForSpeed}
        0..1: Result := AllocateOne(fSegmentsBase,1);
           2: Result := AllocateOne(fSegmentsDubl,2);
        3..4: Result := AllocateOne(fSegmentsQuad,4);
        5..8: Result := AllocateOne(fSegmentsOcta,8);
      {$ELSE}
        0..1: Result := AllocateOne(fSegmentsBase,1);
           2: Result := AllocateOne(fSegmentsDubl,2);
           3: Result := AllocateMany(fSegmentsBase,1);
           4: Result := AllocateOne(fSegmentsQuad,4);
        5..6: Result := AllocateMany(fSegmentsDubl,2);
        7..8: Result := AllocateOne(fSegmentsOcta,8);
      {$ENDIF}
      else
        {9+ * BaseBlockSize}
        Result := AllocateMany(fSegmentsOcta,8);
      end;
    finally
      Unlock;
    end;
  end
else raise Exception.CreateFmt('TVMCLMemoryManager.AlignedAllocate: Cannot allocate memory of requested size (%u).',[Size]);
end;

//------------------------------------------------------------------------------

procedure TVMCLMemoryManager.AlignedFree(Ptr: Pointer; Size: TMemSize);

  Function InnerFree(Segments: TObjectList): Boolean;
  var
    i:  Integer;
  begin
    Result := False;
    For i := 0 to Pred(Segments.Count) do
      If TVMCLMemorySegment(Segments[i]).OwnsMemory(Ptr) then
        begin
          TVMCLMemorySegment(Segments[i]).FreeBlocks(Ptr,Size);
          DeleteSegment(Segments,i);
          Result := True;
          Break {For i};
        end;
  end;

begin
If (Size > 0) and Assigned(Ptr) then
  begin
    Lock;
    try
      // first search in segments with appropriate block size
      case Ceil(Size / fBaseBlockSize) of
      {$IFDEF AllocOptimizeForSpeed}
        0..1: If InnerFree(fSegmentsBase) then Exit;
           2: If InnerFree(fSegmentsDubl) then Exit;
        3..4: If InnerFree(fSegmentsQuad) then Exit;
      {$ELSE}
        0..1, 3:  If InnerFree(fSegmentsBase) then Exit;
        2, 5..6:  If InnerFree(fSegmentsDubl) then Exit;
              4:  If InnerFree(fSegmentsQuad) then Exit;
      {$ENDIF}
      else
        {8+ * BaseBlockSize}
        If InnerFree(fSegmentsOcta) then Exit;
      end;
      // not found in appropriate (for a size) segment list, try all of them
      If InnerFree(fSegmentsBase) then Exit;
      If InnerFree(fSegmentsDubl) then Exit;
      If InnerFree(fSegmentsQuad) then Exit;
      If InnerFree(fSegmentsOcta) then Exit;
      // requested memory is not in any list
      raise Exception.CreateFmt('TVMCLMemoryManager.AlignedFree: Unknown memory (%p).',[Ptr]);
    finally
      Unlock;
    end;
  end
else raise Exception.CreateFmt('TVMCLMemoryManager.AlignedFree: Cannot free requested memory (0x%p, %u).',[Ptr,Size]);
end;


{===============================================================================
    Allocation functions - implementation
===============================================================================}

Function VMCL_GetMem(Size: TMemSize): Pointer;
begin
If Assigned(VMCL_MemoryManager) then
  Result := VMCL_MemoryManager.AlignedAllocate(Size)
else
  raise Exception.Create('VMCL_GetMem: Memory manager object not initialized.');
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_GetMem(out Ptr: Pointer; Size: TMemSize);
begin
Ptr := VMCL_GetMem(Size);
end;

//------------------------------------------------------------------------------

Function VMCL_AllocMem(Size: TMemSize): Pointer;
begin
VMCL_GetMem(Result,Size);
FillChar(Result^,Size,0);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_AllocMem(out Ptr: Pointer; Size: TMemSize);
begin
Ptr := VMCL_AllocMem(Size);
end;

//------------------------------------------------------------------------------

procedure VMCL_FreeMem(Ptr: Pointer; Size: TMemSize);
begin
If Assigned(VMCL_MemoryManager) then
  VMCL_MemoryManager.AlignedFree(Ptr,Size)
else
  raise Exception.Create('VMCL_FreeMem: Memory manager object not initialized.');
end;

//= Vectors allocation =========================================================

procedure VMCL_New(out Vec: PVMCLVector2s; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector3s; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector4s; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector2d; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector3d; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector4d; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector2sr; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector3sr; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector4sr; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector2dr; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector3dr; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Vec: PVMCLVector4dr; Count: UInt32 = 1);
begin
Vec := VMCL_AllocMem(SizeOf({%H-}Vec^) * Count);
end;

//------------------------------------------------------------------------------

procedure VMCL_Dispose(Vec: PVMCLVector2s; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector3s; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector4s; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector2d; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector3d; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector4d; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector2sr; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector3sr; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector4sr; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector2dr; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector3dr; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Vec: PVMCLVector4dr; Count: UInt32 = 1);
begin
VMCL_FreeMem(Vec,SizeOf(Vec^) * Count);
end;

//= Matrices allocation ========================================================

procedure VMCL_New(out Mat: PVMCLMatrix2RMs; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix2RMd; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix2CMs; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix2CMd; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix3RMs; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix3RMd; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix3CMs; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix3CMd; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix4RMs; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix4RMd; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix4CMs; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_New(out Mat: PVMCLMatrix4CMd; Count: UInt32 = 1);
begin
Mat := VMCL_AllocMem(SizeOf({%H-}Mat^) * Count);
end;

//------------------------------------------------------------------------------

procedure VMCL_Dispose(Mat: PVMCLMatrix2RMs; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix2RMd; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix2CMs; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix2CMd; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix3RMs; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix3RMd; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix3CMs; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix3CMd; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix4RMs; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix4RMd; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix4CMs; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

//   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

procedure VMCL_Dispose(Mat: PVMCLMatrix4CMd; Count: UInt32 = 1);
begin
VMCL_FreeMem(Mat,SizeOf(Mat^) * Count);
end;

{===============================================================================
    Unit initialization and finalization
===============================================================================}

{$IFDEF AllocAutoInit}
initialization
  Initialize;

finalization
  Finalize;
{$ENDIF}

end.
