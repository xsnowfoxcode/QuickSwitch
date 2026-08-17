#NoEnv
#SingleInstance Off
#NoTrayIcon
SetBatchLines, -1

; Values.ahk also contains unrelated settings validators. Keep this harness
; focused on ValidateDirectory without loading the rest of the application.
GetUniqPaths(_paths) {
    return _paths
}

#Include %A_ScriptDir%\..\Lib\Log.ahk
#Include %A_ScriptDir%\..\Lib\DarkTheme.ahk
#Include %A_ScriptDir%\..\Lib\SettingsMouse.ahk
#Include %A_ScriptDir%\..\Lib\Values.ahk

if (A_Args.Length() < 1) {
    FileAppend, % "FAIL: pass an existing UNC directory as the first argument.`n", % A_Temp "\QuickSwitch-ValidateDirectory.log"
    ExitApp, 1
}

uncPath := A_Args[1]
output := A_Args.Length() > 1 ? A_Args[2] : A_Temp "\QuickSwitch-ValidateDirectory.log"
FileDelete, % output
uncExpected := RTrim(uncPath, "\")
uncWithTrailingSeparator := uncExpected "\"

tests := []
tests.Push({Name: "UNC", Input: uncPath, Expected: uncExpected})
tests.Push({Name: "UNC with trailing separator", Input: uncWithTrailingSeparator, Expected: uncExpected})
tests.Push({Name: "drive path", Input: A_WinDir "\", Expected: RTrim(A_WinDir, "\")})
tests.Push({Name: "relative directory", Input: "Fixtures", Expected: A_ScriptDir "\Fixtures"})
tests.Push({Name: "forward slash input", Input: "Fixtures/", Expected: A_ScriptDir "\Fixtures"})

failed := 0
for _, test in tests {
    path := test.Input
    ValidateDirectory("", path)

    if (path != test.Expected) {
        FileAppend, % "FAIL: " test.Name " => " path " (expected " test.Expected ")`n", % output
        failed++
    } else {
        FileAppend, % "PASS: " test.Name " => " path "`n", % output
    }
}

ExitApp, failed ? 1 : 0
