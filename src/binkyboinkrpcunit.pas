{**
  Remote Procedure Call (RPC) helper unit.
}
unit BinkyBoinkRPCUnit;

{$mode objfpc}{$H+}
{$I blinkyboink.inc}

interface

uses
  Classes, SysUtils, BlckSock;

type
  TBinkyBoinkGUIRequest = class;
  TBinkyBoinkGUIResult  = class;

{**
  TBinkyBoinkRPC

  RPC Helper object
}

  { TBinkyBoinkRPC }

  TBinkyBoinkRPC = class
  private
    FHost,
    FPort: String;
    FSockect: TTCPBlockSocket;
    FRequest: TBinkyBoinkGUIRequest;
    FResult: TBinkyBoinkGUIResult;
  protected
  public
    constructor Create;
    destructor Destroy; override;

    function Get(aContent: String): String;
  published
    property Host: String read FHost write FHost;
    property Port: String read FPort write FPort;
    property Request: TBinkyBoinkGUIRequest read FRequest;
    property Result: TBinkyBoinkGUIResult read FResult;
  end;

{**
  TBinkyBoinkGUIRequest

  RPC Request Object
}

  { TBinkyBoinkGUIRequest }

  TBinkyBoinkGUIRequest = class
  private
    FContent: String;
  protected
  public
    constructor Create;
  published
    property Content: String read FContent write FContent;
  end;

{**
  TBinkyBoinkGUIResult

  RPC Result Object
}

  { TBinkyBoinkGUIResult }

  TBinkyBoinkGUIResult = class
  private
    FContent: String;
  protected
  public
    constructor Create;
  published
    property Content: String read FContent write FContent;
  end;

implementation

const
  RPCWrapper = '<boinc_gui_rpc_request>'#13'%s</boinc_gui_rpc_request>'#13#3;

{ TBinkyBoinkRPC }

constructor TBinkyBoinkRPC.Create;
begin
  inherited Create;
  FHost:= 'localhost';
  FPort:= '31416';
  FRequest:= TBinkyBoinkGUIRequest.Create;
  FResult:= TBinkyBoinkGUIResult.Create;
  FSockect:= TTCPBlockSocket.Create;
end;

destructor TBinkyBoinkRPC.Destroy;
begin
  FreeAndNil(FRequest);
  FreeAndNil(FResult);
  FreeAndNil(FSockect);
  inherited Destroy;
end;

function TBinkyBoinkRPC.Get(aContent: String): String;
var
  OneByte: Byte;
begin
  FRequest.Content:= Format(RPCWrapper, [aContent]);
  try
    FSockect.Connect(FSockect.ResolveIPToName(FHost), FPort);
    FSockect.SendString(FRequest.Content);
    if FSockect.CanRead(100) then
    begin
      OneByte:= FSockect.RecvByte(100);
      repeat
        FResult.Content := FResult.Content + chr(OneByte);
        OneByte:= FSockect.RecvByte(100);
      until OneByte=3;
    end;
  finally
    Result:= FResult.Content;
  end;
end;

{ TBinkyBoinkGUIRequest }

constructor TBinkyBoinkGUIRequest.Create;
begin
  FContent:= '';
end;

{ TBinkyBoinkGUIResult }

constructor TBinkyBoinkGUIResult.Create;
begin
  FContent:= '';
end;

initialization

finalization

end.
