unit VMCL_Tests_Main;

{$INCLUDE '..\VMCL_defs.inc'}

interface

procedure Main;

implementation

uses
  SysUtils;

//= Main procedure implemntation ===============================================

procedure Main;
begin
try
except
  on E: Exception do
    begin
      WriteLn;
      WriteLn('  Error: ',E.Message);
    end;
end;
WriteLn;
Write('Press enter to continue...'); ReadLn;
end;

end.
