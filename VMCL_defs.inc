//= Common defines =============================================================

//- CPU ------------------------------------------------------------------------

{$IF defined(CPU64) or defined(CPU64BITS)}
  {$DEFINE 64bit}
{$ELSEIF defined(CPU16)}
  {$DEFINE 16bit}
{$ELSE}
  {$DEFINE 32bit}
{$IFEND}

{$IF defined(CPUX86_64) or defined(CPUX64)}
  {$DEFINE x64}
{$ELSEIF defined(CPU386)}
  {$DEFINE x86}
{$ELSE}
  {$DEFINE PurePascal}
{$IFEND}

//- Operating system -----------------------------------------------------------

{$IF Defined(WINDOWS) or Defined(MSWINDOWS)}
  {$DEFINE Windows}
{$ELSE}
  {$IF Defined(UNIX) or Defined(POSIX)}
    {$DEFINE Unix}
  {$ELSE}
    {$MESSAGE FATAL 'Unsupported operating system.'}
  {$IFEND}
{$IFEND}

//- Compiler -------------------------------------------------------------------

{
  ASMSuppressSizeWarnings

    Supresses some nonsensical warnings about operand size in ASM code.

  ASMDirectOPCodes

    When defined, some instructions in ASM code are inserted directly as an
    OP-codes. It is done for instructions that are not supported by a used
    compiler.

  CanInline

    Indicates that functions can be inlined (inline directive can be used).
}
{$IFDEF FPC}
  {$MODE ObjFPC}{$H+}
  {$MODESWITCH CLASSICPROCVARS+}
  {$ASMMODE Intel}
  {$INLINE ON}
  {$DEFINE CanInline}
  {$DEFINE ASMSuppressSizeWarnings}
{$ELSE}
  {$DEFINE Delphi}
  {$IFNDEF x64}
    // let's assume all 64bit compilers support SSE3
    {$DEFINE ASMDirectOPCodes}
  {$ENDIF}
  {$IF Declared(CompilerVersion)}
    {$IF CompilerVersion >= 17 then}  // Delphi 2005+
      {$DEFINE CanInline}
    {$IFEND}
  {$IFEND}
{$ENDIF}

//= Individual VMCL units defines ==============================================

//- VMCL_Common ----------------------------------------------------------------

//- VMCL_Alloc -----------------------------------------------------------------

{
  AllocLargeMemSegment

    When defined, memory manager allocates segments of memory that are 1MiB
    large, instead of 32KiB when the symbol is not defined.

  Not defined by default.
}
{.$DEFINE AllocLargeMemSegment}

{
  AllocOptimizeForSpeed

    When defined, allocation using the memory manager is sligthly faster in
    exchange for slightly worse memory utilization.

  Defined by default.
}
{$DEFINE AllocOptimizeForSpeed}

{
  AllocAutoInit

    When defined, internal memory manager object is automatically created and
    freed. Must be defined if any of the allocation function is to be used.

  Defined by default.
}
{$DEFINE AllocAutoInit}

{
  AllocGrowOnly

    Internal memory manager is created in grow-only mode when defined. This
    prevents freeing of unused memory segments, resulting in larger memory
    use, but might lower the memory fragmentation.
    When not defined, the manager is created in dynamic mode.

  Not defined by default.
}
{.$DEFINE AllocGrowOnly}

//- VMCL_Vectors ---------------------------------------------------------------

{.$DEFINE VectorsDoubleIsDefault}

//- VMCL_Matrices --------------------------------------------------------------

{.$DEFINE MatricesColumnMajorIsDefault}
{.$DEFINE MatricesDoubleIsDefault}

//= Do not touch following =====================================================


