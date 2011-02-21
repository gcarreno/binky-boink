{**
  Main Binky Boink Unit.
}
unit BinkyBoinkUnit;

{$mode objfpc}{$H+}
{$I blinkyboink.inc}

interface

uses
  Classes, SysUtils, BinkyBoinkClassesUnit, BinkyBoinkRPCUnit;

type
{**
  Object.TBinkyBoink

  Main object of the Binky Boink lib.
}
  TBinkyBoink = class
  private
    FRPC: TBinkyBoinkRPC;
    FComputers: TBinkyBoinkComputers;
  protected
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Computers: TBinkyBoinkComputers read FComputers;
  end;

implementation

{**
  Object.TBinkyBoink.Create

  Main Binky Boink Object Creator
}
constructor TBinkyBoink.Create;
begin
  inherited Create;
  FRPC:= TBinkyBoinkRPC.Create;
  FComputers:= TBinkyBoinkComputers.Create;
end;

{**
  Object.TBinkyBoink.Destroy

  Main Binky Boink Object Destructor
}
destructor TBinkyBoink.Destroy;
begin
  FreeAndNil(FComputers);
  FreeAndNil(FRPC);
  inherited Destroy;
end;

initialization

finalization

end.
