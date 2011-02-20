{$IFNDEF BLINKYBOINK}
  {$DEFINE BLINKYBOINK}

  {$I fpc_version.inc}

  {$IFDEF UNIX}
    {$DEFINE UseCThreads}
  {$ENDIF}

{$ENDIF}
