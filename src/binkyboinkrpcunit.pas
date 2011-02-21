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
  Object.TBinkyBoinkRPC

  RPC Helper object
}
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
    {** Host/IP of the target machine }
    property Host: String read FHost write FHost;
    {** Port of the target machine; defaulted to 31416 }
    property Port: String read FPort write FPort;
    {** Request object }
    property Request: TBinkyBoinkGUIRequest read FRequest;
    {** Result object }
    property Result: TBinkyBoinkGUIResult read FResult;
  end;

{**
  Object.TBinkyBoinkGUIRequest

  RPC Request Object
}
  TBinkyBoinkGUIRequest = class
  private
    FContent: String;
  protected
  public
    constructor Create;
  published
    {** Holds the XML content that will be sent to BOINC }
    property Content: String read FContent write FContent;
  end;

{**
  Object.TBinkyBoinkGUIResult

  RPC Result Object
}
  TBinkyBoinkGUIResult = class
  private
    FContent: String;
  protected
  public
    constructor Create;
  published
    {** Holds the XML content returned from BOINC }
    property Content: String read FContent write FContent;
  end;

implementation

const
  RPCWrapper = '<boinc_gui_rpc_request>'#13'%s</boinc_gui_rpc_request>'#13#3;

{**
  Object.TBinkyBoinkRPC.Create

  RPC helper object creator
}
constructor TBinkyBoinkRPC.Create;
begin
  inherited Create;
  FHost:= 'localhost';
  FPort:= '31416';
  FRequest:= TBinkyBoinkGUIRequest.Create;
  FResult:= TBinkyBoinkGUIResult.Create;
  FSockect:= TTCPBlockSocket.Create;
end;

{**
  Object.TBinkyBoinkRPC.Destroy

  RPC helper object destructor
}
destructor TBinkyBoinkRPC.Destroy;
begin
  FreeAndNil(FRequest);
  FreeAndNil(FResult);
  FreeAndNil(FSockect);
  inherited Destroy;
end;

{**
  Object.TBinkyBoinkRPC.Get

  RPC Call with content
}
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

{**
  Object.TBinkyBoinkGUIRequest.Create

  RPC Request helper object constructor
}
constructor TBinkyBoinkGUIRequest.Create;
begin
  FContent:= '';
end;

{**
  Object.TBinkyBoinkGUIResult.Create

  RPC Result helper object constructor
}
constructor TBinkyBoinkGUIResult.Create;
begin
  FContent:= '';
end;

initialization

finalization

end.
