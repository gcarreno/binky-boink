{**
  Major Classes used by the Binky Boink lib.
}
unit BinkyBoinkClassesUnit;

{$mode objfpc}{$H+}
{$I blinkyboink.inc}

interface

uses
  Classes, SysUtils, Contnrs;

type
{**
  Object.TBinkyBoinkComputer

  Container for a single computer
}
  TBinkyBoinkComputer = class
  private
    FName,
    FHost,
    FPort,
    FStatus,
    FPassword: String;
  protected
  public
    constructor Create;
  published
    {** Name of Computer }
    property Name: String read FName write FName;
    {** Host/Address of Computer }
    property Host: String read FHost write FHost;
    {** Port of Computer }
    property Port: String read FPort write FPort;
    {** Password for Computer }
    property Password: String read FPassword write FPassword;
    {** Current status of Computer }
    property Status: String read FStatus;
  end;

{**
  Object.TBinkyBoinkComputers

  Container for a list of computers
}
  TBinkyBoinkComputers = class(TObjectList)
  private
    function GetItem(Index: Integer): TBinkyBoinkComputer;
    procedure SetItem(Index: Integer; const AValue: TBinkyBoinkComputer);
  protected
  public
    {** Overriding the default indexer to return the appropriate Type }
    property Items[Index: Integer]: TBinkyBoinkComputer read GetItem write SetItem; default;
  published
  end;

{**
  Object.TBinkyBoinkProject

  Container for a single project.
}
  TBinkyBoincProject = class
  end;

{**
  Object.TBinkyBoinkProjects

  Container for a list of Projects.
}
  TBinkyBoinkProjects = class
  end;

{**
  Object.TBinkyBoinkUnit

  Container for a single work unit.
}
  TBinkyBoinkUnit = class
  end;

{**
  Object.TBinkyBoinkUnits

  Container for a list of working units.
}
  TBinkyBoinkUnits = class
  end;

implementation

{**
  Object.TBinkyBoinkComputer.Create

  Computer container object creator
}
constructor TBinkyBoinkComputer.Create;
begin
  FHost:='localhost';
  FPort:='31416';
end;

{**
  Object.TBinkyBoinkComputers.GetItem

  Overriding ancestor GetItem to return appropriate type
}
function TBinkyBoinkComputers.GetItem(Index: Integer): TBinkyBoinkComputer;
begin
  Result:= TBinkyBoinkComputer(inherited Items[index]);
end;

{**
  Object.TBinkyBoinkComputers.SetItem

  Overriding ancestor SetItem with appropriate type
}
procedure TBinkyBoinkComputers.SetItem(Index: Integer; const AValue: TBinkyBoinkComputer);
begin
  inherited SetItem(Index, AValue);
end;

initialization

finalization

end.
