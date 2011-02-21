unit frmMainUnit;

{$mode objfpc}{$H+}
{$I blinkyboink.inc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ActnList, BinkyBoinkUnit;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    actTest: TAction;
    actlMain: TActionList;
    btnTest: TButton;
    GroupBox1: TGroupBox;
    memLog: TMemo;
    panButtons: TPanel;
    procedure actTestExecute(Sender: TObject);
  private
    { private declarations }
    FBinkyBoink: TBinkyBoink;
  public
    { public declarations }
  end; 

var
  frmMain: TfrmMain;

implementation

uses
  BinkyBoinkClassesUnit, BinkyBoinkRPCUnit;

procedure Log(aMessage: String);
begin
  frmMain.memLog.Lines.Add(aMessage);
  Application.ProcessMessages;
end;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.actTestExecute(Sender: TObject);
var
  Computer: TBinkyBoinkComputer;
  Index: Integer;
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

  Log('Computers returned:');
  for Index:= 0 to 3-1 do
  begin
    Log(Format('Computer: %s(%s:%s)',
               [FBinkyBoink.Computers[Index].Name,
               FBinkyBoink.Computers[Index].Host,
               FBinkyBoink.Computers[Index].Port]));
  end;

  FreeAndNil(FBinkyBoink);

  if Sender is TAction then
  begin
    TAction(Sender).Enabled:= true;
    Application.ProcessMessages;
  end;
end;

end.

