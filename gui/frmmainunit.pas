unit frmMainUnit;

{$mode objfpc}{$H+}
{$I blinkyboink.inc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ActnList, Menus, StdActns, ComCtrls, VirtualStringTree,
  frmComputersFrameUnit, BinkyBoinkUnit;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    actFileTest: TAction;
    actTrayIconShowHide: TAction;
    actViewComputers: TAction;
    actlMain: TActionList;
    actFileExit: TFileExit;
    grbLogMessages: TGroupBox;
    mnuTrayIconShowHide: TMenuItem;
    mnuViewComputers: TMenuItem;
    mnuSep1: TMenuItem;
    mnuFileTest: TMenuItem;
    mnuSep2: TMenuItem;
    mnuFileExit: TMenuItem;
    mnuHelp: TMenuItem;
    mnuView: TMenuItem;
    mnuFile: TMenuItem;
    mmnuMain: TMainMenu;
    memLog: TMemo;
    panButtons: TPanel;
    panContent: TPanel;
    panTree: TPanel;
    pmnTrayIcon: TPopupMenu;
    splSplit2: TSplitter;
    splSplit1: TSplitter;
    stbMain: TStatusBar;
    triMain: TTrayIcon;
    vstTree: TVirtualStringTree;
    procedure actFileTestExecute(Sender: TObject);
    procedure actViewComputersExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    FBinkyBoink: TBinkyBoink;
    FComputersFrame: TfrmComputersFrame;
  public
    { public declarations }
  end; 

var
  frmMain: TfrmMain;

implementation

uses
  BinkyBoinkClassesUnit
  //, BinkyBoinkRPCUnit
  ;

procedure Log(aMessage: String);
begin
  frmMain.memLog.Lines.Add(aMessage);
  Application.ProcessMessages;
end;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.actFileTestExecute(Sender: TObject);
var
  Computer: TBinkyBoinkComputer;
  Project: TBinkyBoinkProject;
  WorkUnit: TBinkyBoinkUnit;
  Index, Index1, Index2: Integer;
begin
  if Sender is TAction then
  begin
    TAction(Sender).Enabled:= false;
    Application.ProcessMessages;
  end;

  FBinkyBoink:= TBinkyBoink.Create;

  Log('Adding BatchAMD(localhost).');
  Computer:= TBinkyBoinkComputer.Create;
  Computer.Name:= 'BatchAMD';
  Computer.Host:= 'localhost';
  FBinkyBoink.Computers.Add(Computer);
    Log(#9'Adding project SETI@Home.');
    Project:= TBinkyBoinkProject.Create;
    Project.Name:='SETI@Home';
    Computer.Projects.Add(Project);
      Log(#9#9'Adding Unit test1.');
      WorkUnit:= TBinkyBoinkUnit.Create;
      WorkUnit.Name:= 'test1';
      Project.Units.Add(WorkUnit);

  Log('Adding BatchManor(10.0.0.104).');
  Computer:= TBinkyBoinkComputer.Create;
  Computer.Name:= 'BatchManor';
  Computer.Host:= '10.0.0.104';
  FBinkyBoink.Computers.Add(Computer);

  Log('Adding BatchServer(10.0.0.254).');
  Computer:= TBinkyBoinkComputer.Create;
  Computer.Name:= 'BatchServer';
  Computer.Host:= '10.0.0.254';
  FBinkyBoink.Computers.Add(Computer);

  Log('');

  Log('Computers returned:');
  for Index:= 0 to 3-1 do
  begin
    Log(Format('Computer: %s(%s:%s)',
               [FBinkyBoink.Computers[Index].Name,
               FBinkyBoink.Computers[Index].Host,
               FBinkyBoink.Computers[Index].Port]
               ));

    if FBinkyBoink.Computers[Index].Projects.Count>0 then
    begin
      for Index1:= 0 to FBinkyBoink.Computers[Index].Projects.Count-1 do
      begin
        Log(Format(#9'Project: %s',
                   [FBinkyBoink.Computers[Index].Projects[Index1].Name]
        ));
      end;

      if FBinkyBoink.Computers[Index].Projects[Index1].Units.Count>0 then
      begin
        for Index2:= 0 to FBinkyBoink.Computers[Index].Projects[Index1].Units.Count-1 do
        begin
          Log(Format(#9#9'Unit: %s',
                     [FBinkyBoink.Computers[Index].Projects[Index1].Units[Index2].Name]
          ));
        end;
      end;
    end;
    Log('');
  end;

  FreeAndNil(FBinkyBoink);

  if Sender is TAction then
  begin
    TAction(Sender).Enabled:= true;
    Application.ProcessMessages;
  end;
end;

procedure TfrmMain.actViewComputersExecute(Sender: TObject);
begin
  FComputersFrame.Visible:= true;
  FComputersFrame.BringToFront;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FComputersFrame:= TfrmComputersFrame.Create(panContent);
  FComputersFrame.Parent:= panContent;
end;

end.

