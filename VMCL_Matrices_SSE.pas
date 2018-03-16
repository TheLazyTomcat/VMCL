unit VMCL_Matrices_SSE;

{$INCLUDE 'VMCL_defs.inc'}

interface

uses
  VMCL_Matrices;

{$IFNDEF PurePascal}
//try: det, inv, orthonorm, scalarmul(/), vectormul, matricesadd/sub/mul

{$ENDIF}

implementation

{$IFNDEF PurePascal}

{$IFDEF ASMSuppressSizeWarnings}
  {$WARN 2087 OFF}  //  Supresses warnings on following two $WARN (FPC 2.X)
  {$WARN 7121 OFF}  //  Warning: Check size of memory operand "op: memory-operand-size is X bits, but expected [Y bits]"
  {$WARN 7122 OFF}  //  Warning: Check size of memory operand "op: memory-operand-size is X bits, but expected [Y bits + Z byte offset]"
  {$WARN 2087 ON}
{$ENDIF}

//==============================================================================

{$IFDEF ASMSuppressSizeWarnings}
  {$WARN 2087 OFF}
  {$WARN 7121 ON}
  {$WARN 7122 ON}
  {$WARN 2087 ON}
{$ENDIF}

{$ENDIF}

end.
