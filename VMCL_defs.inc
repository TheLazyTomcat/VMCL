//= Common defines =============================================================

//- CPU ------------------------------------------------------------------------

{$IF defined(CPU64) or defined(CPU64BITS)}
  {$DEFINE CPU64bit}
{$ELSEIF defined(CPU16)}
  {$DEFINE CPU16bit}
{$ELSE}
  {$DEFINE CPU32bit}
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

  FPC_DisableWarns

    When defined, allows suppressing of out-of-place or nonsensical warnings
    and hints.
}
{$IFDEF FPC}
  {$MODE ObjFPC}{$H+}
  {$MODESWITCH CLASSICPROCVARS+}
  {$ASMMODE Intel}
  {$INLINE ON}
  {$DEFINE CanInline}
  {$DEFINE ASMSuppressSizeWarnings}
  {$DEFINE FPC_DisableWarns}
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

//- User defined ---------------------------------------------------------------

{
  EnablePerformanceWarnings

    When defined, functions that may perform badly in currently compiled mode
    and/or platform will be marked by a hint messages.

  Not defined by default.
}
{.$DEFINE EnablePerformanceWarnings}

{
  EnableDevelopmentMessages

    When defined, development messages will be shown for all build modes.
    When not defined, these messages are shown only when compiling Debug builds.

  Not defined by default.
}
{.$DEFINE EnableDevelopmentMessages}

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

{
  VectorsDoubleIsDefault

    When defined, default vector type (the one with no specified precision) is
    set to be of double (64bit) precision. Otherwise it is set to be of single
    (32bit) precision.

  Not defined by default.
}
{.$DEFINE VectorsDoubleIsDefault}

//- VMCL_Matrices --------------------------------------------------------------

{
  MatricesColumnMajorIsDefault

    When defined, default matrix type (the one with no specified order) is
    set to be of column-major order. Otherwise it is set to be of row-major
    order.

  Not defined by default.
}
{.$DEFINE MatricesColumnMajorIsDefault}

{
  MatricesDoubleIsDefault

    When defined, default matrix type (the one with no specified precision) is
    set to be of double (64bit) precision. Otherwise it is set to be of single
    (32bit) precision.

  Not defined by default.
}
{.$DEFINE MatricesDoubleIsDefault}

{
  MatricesUnwindLoops

    When defined, some calculations on matrices are done by immediate code (all
    matrix entries are accessed explicitly). Otherwise these calculations are
    done using loop(s).
    It might bring performance boost, but since some calculations are rather
    complex and the immediate code is large and badly mantainable, there might
    be some errors in the code.

  Not defined by default.
}
{.$DEFINE MatricesUnwindLoops}

//- VMCL_Tests_Main ------------------------------------------------------------

{
  DeterministicRnd

    When defined, the RandSeed for pascal random number generator is set to 0 at
    the start of test suite. Otherwise it is initialized using standard function
    Randomize.
    This can be used eg. for test result comparison.

  Not defined by default.
}
{.$DEFINE DeterministicRnd}

//= Do not touch following =====================================================

{$IFDEF Windows}
  {$IFDEF x64}
    {$DEFINE Win64}
  {$ELSE}
    {$DEFINE Win32}
  {$ENDIF}
{$ELSE}
  {$IFDEF x64}
    {$DEFINE Lin64}
  {$ELSE}
    {$DEFINE Lin32}
  {$ENDIF}
{$ENDIF}

//- Compilation messages -------------------------------------------------------

{$IF Defined(Debug) or Defined(EnableDevelopmentMessages)}
  {$DEFINE DevelMsgs}
{$IFEND}

{$IF Defined(EnablePerformanceWarnings) and Defined(x64)}
  {$DEFINE PerfWarn_x64}
{$IFEND}

//- Inclusion selectors --------------------------------------------------------

{$UNDEF CheckMemAlign16_1}
{$UNDEF CheckMemAlign16_2}
{$UNDEF CheckMemAlign16_3}

{$UNDEF Load_XMM0_to_ST0_1s}
{$UNDEF Load_XMM0_to_ST0_1d}

{$UNDEF Save_XMM6_SSE}
{$UNDEF Save_XMM6_to_XMM9_SSE}
{$UNDEF Save_XMM6_to_XMM13_SSE}
{$UNDEF Restore_XMM6_SSE}
{$UNDEF Restore_XMM6_to_XMM9_SSE}
{$UNDEF Restore_XMM6_to_XMM13_SSE}

{$UNDEF AlignStack_16B_Entry}
{$UNDEF AlignStack_16B_Leave}

{$UNDEF CrossProduct_4s_SSE}
{$UNDEF CrossProduct_4d_SSE}

{$UNDEF DotProduct_4s3_SSE}
{$UNDEF DotProduct_4d3_SSE}

{$UNDEF Magnitude_4s_r2_SSE}
{$UNDEF Magnitude_4d_r4_SSE}

{$UNDEF Normalize_2s_SSE}
{$UNDEF Normalize_4s_SSE}
{$UNDEF Normalize_2d_SSE}
{$UNDEF Normalize_4d_SSE}

{$UNDEF Negate_4s_SSE}
{$UNDEF Negate_4d_SSE}

{$UNDEF ArcCosRad_1_x87}
{$UNDEF ArcCosDeg_1_x87}

{$UNDEF VectorsProjection_2s_SSE}
{$UNDEF VectorsProjection_4s_SSE}
{$UNDEF VectorsProjection_2d_SSE}
{$UNDEF VectorsProjection_3d_SSE}
{$UNDEF VectorsProjection_4d_SSE}

{$UNDEF MatricesMultiply_2s_Round_SSE}
{$UNDEF MatricesMultiply_3s_Round_SSE}
{$UNDEF MatricesMultiply_4s_Round_SSE}
{$UNDEF MatricesMultiply_2d_Round_SSE}
{$UNDEF MatricesMultiply_3d_Round_SSE}
{$UNDEF MatricesMultiply_4d_Round_SSE}

{$UNDEF FunctionVariantXYZ}
{$UNDEF AlignedMemoryAccess}
{$UNDEF FirstRound}
{$UNDEF LastRound}
{$UNDEF OddRound}

{$UNDEF SpeedTestCaller}


