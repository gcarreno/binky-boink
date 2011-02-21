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
  TBinkyBoinkProjects = class;
  TBinkyBoinkUnits = class;
{**
  Object.TBinkyBoinkComputer

  Container for a single computer
}
  TBinkyBoinkComputer = class
  private
    FName,
    FHost,
    FPort,
    FVersion,
    FPlatform,
    FStatus,
    FPassword: String;
    FProjects: TBinkyBoinkProjects;
  protected
  public
    constructor Create;
    destructor Destroy; override;
  published
    {** Name of Computer }
    property Name: String read FName write FName;
    {** Host/Address of Computer }
    property Host: String read FHost write FHost;
    {** Port of Computer }
    property Port: String read FPort write FPort;
    {** BOINC Version }
    property Version: String read FVersion write FVersion;
    {** OS platform }
    property Platform: String read FPlatform write FPlatform;
    {** Password for Computer }
    property Password: String read FPassword write FPassword;
    {** Current status of Computer }
    property Status: String read FStatus;
    {** This computer's projects }
    property Projects: TBinkyBoinkProjects read FProjects;
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
  TBinkyBoinkProject = class
  private
    FName: String;
    FUnits: TBinkyBoinkUnits;
  protected
  public
    constructor Create;
    destructor Destroy; override;
  published
    {** The name of the project }
    property Name: String read FName write FName;
    {** This project units }
    property Units: TBinkyBoinkUnits read FUnits;
  end;

{**
  Object.TBinkyBoinkProjects

  Container for a list of Projects.
}
  TBinkyBoinkProjects = class(TObjectList)
  private
    function GetItem(Index: Integer): TBinkyBoinkProject;
    procedure SetItem(Index: Integer; const AValue: TBinkyBoinkProject);
  protected
  public
    {** Overriding the default indexer to return the appropriate Type }
    property Items[Index: Integer]: TBinkyBoinkProject read GetItem write SetItem; default;
  published
  end;

{**
  Object.TBinkyBoinkUnit

  Container for a single work unit.
}
  TBinkyBoinkUnit = class
  private
    FName: String;
  protected
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Name: String read FName write FName;
  end;

{**
  Object.TBinkyBoinkUnits

  Container for a list of working units.
}
  TBinkyBoinkUnits = class(TObjectList)
  private
    function GetItem(Index: Integer): TBinkyBoinkUnit;
    procedure SetItem(Index: Integer; const AValue: TBinkyBoinkUnit);
  protected
  public
    {** Overriding the default indexer to return the appropriate Type }
    property Items[Index: Integer]: TBinkyBoinkUnit read GetItem write SetItem; default;
  published
  end;

implementation

{**
  Object.TBinkyBoinkComputer.Create

  Computer container object creator
}
constructor TBinkyBoinkComputer.Create;
begin
  inherited Create;
  FHost:='localhost';
  FPort:='31416';
  FProjects:= TBinkyBoinkProjects.Create;
end;

{**
  Object.TBinkyBoinkComputer.Destroy

  Computer container object destructor
}
destructor TBinkyBoinkComputer.Destroy;
begin
  FProjects.Free;
  inherited Destroy;
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

{**
  Object.TBinkyBoinkProjects.GetItem

  Overriding ancestor GetItem to return appropriate type
}
function TBinkyBoinkProjects.GetItem(Index: Integer): TBinkyBoinkProject;
begin
  Result:= TBinkyBoinkProject(inherited Items[Index]);
end;

{**
  Object.TBinkyBoinkProject.Create

  Project container object creator
}
constructor TBinkyBoinkProject.Create;
begin
  inherited Create;
  FUnits:= TBinkyBoinkUnits.Create;
end;

{**
  Object.TBinkyBoinkProject.Create

  Project container object destructor
}
destructor TBinkyBoinkProject.Destroy;
begin
  FUnits.Free;
  inherited Destroy;
end;

{**
  Object.TBinkyBoinkProjects.SetItem

  Overriding ancestor SetItem with appropriate type
}
procedure TBinkyBoinkProjects.SetItem(Index: Integer;
  const AValue: TBinkyBoinkProject);
begin
  inherited SetItem(Index, AValue);
end;

{**
  Object.TBinkyBoinkUnit.Create

  Unit container object creator
}
constructor TBinkyBoinkUnit.Create;
begin
  inherited Create;
end;

{**
  Object.TBinkyBoinkUnit.Destroy

  Unit container object destructor
}
destructor TBinkyBoinkUnit.Destroy;
begin
  inherited Destroy;
end;

{**
  Object.TBinkyBoinkUnits.GetItem

  Overriding ancestor GetItem to return appropriate type
}
function TBinkyBoinkUnits.GetItem(Index: Integer): TBinkyBoinkUnit;
begin
  Result:= TBinkyBoinkUnit(inherited Items[Index]);
end;

{**
  Object.TBinkyBoinkUnits.SetItem

  Overriding ancestor SetItem with appropriate type
}
procedure TBinkyBoinkUnits.SetItem(Index: Integer; const AValue: TBinkyBoinkUnit);
begin
  inherited SetItem(Index, AValue);
end;

initialization

finalization

end.
