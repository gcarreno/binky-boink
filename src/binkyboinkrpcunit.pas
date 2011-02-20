{**
  Remote Procedure Call (RPC) helper unit.
}
unit BinkyBoinkRPCUnit;

interface

uses
  Classes, SysUtils, BinkyBoinkClassesUnit;

{** Sends an RPC to a server }
function sendrpc(aContent: String):Boolean;

{** Receives the answer from an RPC call }
function readrpc:Boolean;

var
  RPCHost:String;
  RPCPort:String;//????? or Integer?

implementation

function sendrpc(aContent: String):Boolean;
begin
  Result:= true;
end;

function readrpc:Boolean;
begin
  Result:= true;
end;

initialization

finalization

end.
