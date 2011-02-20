{$IF FPC_VERSION >= 2 }                          // 2.X.X
  {$DEFINE FPC_GTEQ_VER2}

  {$IF FPC_VERSION = 2}
    {$DEFINE FPC_EQ_VER2}

    {$IF FPC_RELEASE >= 0}                       // 2.0.X
      {$DEFINE FPC_GTEQ_VER2_0}

      {$IF FPC_RELEASE = 0}
        {$DEFINE FPC_EQ_VER2_0}

        {$IF FPC_PATCH >= 0}                     // 2.0.0
          {$DEFINE FPC_GTEQ_VER2_0_0}

          {$IF FPC_PATCH = 0}
            {$DEFINE FPC_EQ_VER2_0_0}
            {$SET FPC_FULLVERSION := 20000}
          {$ENDIF}
          {$IF FPC_PATCH > 0}
            {$DEFINE FPC_GT_VER2_0_0}
          {$ENDIF}
        {$ENDIF}

      {$ENDIF}

      {$IF FPC_RELEASE > 0}
        {$DEFINE FPC_GT_VER2_0}
      {$ENDIF}

    {$ENDIF}                                     // 2.0.X

    {$IF FPC_RELEASE >= 5}                       // 2.5.X
      {$DEFINE FPC_GTEQ_VER2_5}

      {$IF FPC_RELEASE = 5}
        {$DEFINE FPC_EQ_VER2_5}

      {$ENDIF}

    {$ENDIF}                                     // 2.5.X

  {$ENDIF}                                       // 2.X.X

  {$IF FPC_VERSION > 2}
    {$DEFINE FPC_GT_VER2}
  {$ENDIF}

{$ENDIF}
