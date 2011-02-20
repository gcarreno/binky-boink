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

  { TBinkyBoink }

  TBinkyBoink = class
  private
    FRPC: TBinkyBoinkRPC;
    FComputers: TBinkyBoinkComputers;
  protected
  public
    constructor Create;
    destructor Destroy; override;
  published

  end;

implementation

{ TBinkyBoink }

constructor TBinkyBoink.Create;
begin
  inherited Create;
  FRPC:= TBinkyBoinkRPC.Create;
  FComputers:= TBinkyBoinkComputers.Create;
end;

destructor TBinkyBoink.Destroy;
begin
  FreeAndNil(FComputers);
  FreeAndNil(FRPC);
  inherited Destroy;
end;

initialization

finalization

end.
