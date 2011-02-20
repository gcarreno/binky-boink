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
  RPC: TBinkyBoinkRPC;
  RPCResult: String;
begin
  if Sender is TAction then
  begin
    TAction(Sender).Enabled:= false;
    Application.ProcessMessages;
  end;

  RPC:= TBinkyBoinkRPC.Create;
  Log('Sending: '#13#10'Auth 1.');
  RPCResult:= RPC.Get('<auth1/>');
  Log('Got:'#13#10 + RPC.Result.Content);
  FreeAndNil(RPC);

  if Sender is TAction then
  begin
    TAction(Sender).Enabled:= true;
    Application.ProcessMessages;
  end;
end;

end.

