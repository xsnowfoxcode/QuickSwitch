GetTotalIni(ByRef winId, ByRef winPid) {
    /*
        Searches for the location of wincmd.ini
        Needed to create usercmd.ini in that directory
        with the "cmd" user command

        Thanks to Dalai for the search steps:
        https://www.ghisler.ch/board/viewtopic.php?p=470238#p470238
    */

    _tcIni := ""

    ; Close the child windows of the current TC instance
    ; to ensure that messages are sent correctly
    WinWaitActive, % "ahk_class #32770 ahk_pid " winPid,, 0.25
    CloseChildWindows(winPid, winId)
    for _, _func in ["GetTotalConsoleIni", "GetTotalLaunchIni", "GetTotalPathIni"] {
        try if (_tcIni := %_func%(winPid))
            break
        catch _ex
            LogException(_ex)
    }

    if _tcIni {
        _tcIni := RTrim(_tcIni, " `r`n\/")
        _tcIni := StrReplace(_tcIni, "/" , "\")
    }

    if !IsFile(_tcIni)
        throw Exception("Unable to find wincmd.ini"
                        , "TotalCmd config"
                        , "File `'" _tcIni "`' not found. Change your TC configuration settings")

    LogInfo("Found TotalCmd config: `'" _tcIni "`'", "NoTraytip")
    return SubStr(_tcIni, 1, InStr(_tcIni, "\",, -1)) . "usercmd.ini"
}
