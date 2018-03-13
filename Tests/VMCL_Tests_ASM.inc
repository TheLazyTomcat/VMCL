{.$DEFINE SpeedTestCaller}

{-------------------------------------------------------------------------------

  SpeedTestCaller

  Obtains timestamps before and after call to a provided function using TSC
  register. When symbol EmptyCall is defined, no function call is done.

  Input:

    Function pointer has to be stored in variable PrecisionTest of type
    TVMCLPrecisionTests (field FunctionAddr). Possible parameters for the
    called function must be prepared outside of this code.

  Output:

    Timestamps before and after the call are stored in variable PrecisionTest.

-------------------------------------------------------------------------------}
{$IFDEF SpeedTestCaller}
  {$IFDEF x64}
    PUSH  RAX
    PUSH  RDX

    MFENCE
    LFENCE
    RDTSC
    MFENCE
    LFENCE

    MOV   [RIP + PrecisionTest.Counters.StartLo], EAX
    MOV   [RIP + PrecisionTest.Counters.StartHi], EDX

    POP   RDX
    POP   RAX

  {$IFNDEF EmptyCall}
    CALL [RIP + PrecisionTest.FunctionAddr]
  {$ENDIF}

    MFENCE
    LFENCE
    RDTSC
    MFENCE
    LFENCE

    MOV   [RIP + PrecisionTest.Counters.StopLo], EAX
    MOV   [RIP + PrecisionTest.Counters.StopHi], EDX
  {$ELSE}
    PUSH  EAX
    PUSH  EDX

    MFENCE
    LFENCE
    RDTSC
    MFENCE
    LFENCE

    MOV   PrecisionTest.Counters.StartLo, EAX
    MOV   PrecisionTest.Counters.StartHi, EDX

    POP   EDX
    POP   EAX
    
  {$IFNDEF EmptyCall}
    CALL PrecisionTest.FunctionAddr
  {$ENDIF}

    MFENCE
    LFENCE
    RDTSC
    MFENCE
    LFENCE

    MOV   PrecisionTest.Counters.StopLo, EAX
    MOV   PrecisionTest.Counters.StopHi, EDX
  {$ENDIF}
{$ENDIF}  
