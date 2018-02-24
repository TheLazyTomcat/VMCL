//= Common defines =============================================================

//- CPU ------------------------------------------------------------------------

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

{$IFDEF FPC}
  {$MODE ObjFPC}{$H+}
  {$ASMMODE Intel}
  {$DEFINE ASMSuppressSizeWarnings}
{$ELSE}
  {$DEFINE Delphi}
  {$IFNDEF x64}  // let's assume all 64bit compilers support SSE3
    {$DEFINE ASMDirectOPCodes}
  {$ENDIF}
{$ENDIF}

//= Individual VMCL units defines ==============================================

//- VMCL_Alloc -----------------------------------------------------------------

{.$DEFINE AllocLargeMemSegment}  // 1MiB segments
{$DEFINE AllocOptimizeForSpeed} // Sligtly faster allocation, worse memory utilization
{$DEFINE AllocAutoInit}
{.$DEFINE AllocGrowOnly}