unit frmComputersFrameUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, StdCtrls, ExtCtrls,
  VirtualStringTree,
  BinkyBoinkUnit, BinkyBoinkClassesUnit;

type

  { TfrmComputersFrame }

  TfrmComputersFrame = class(TFrame)
    panTitle: TPanel;
    vstComputers: TVirtualStringTree;
  private
    { private declarations }
  public
    { public declarations }
  end; 

implementation

initialization
  {$I frmcomputersframeunit.lrs}

end.

