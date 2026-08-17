#NoEnv
#SingleInstance Off
#NoTrayIcon
SetBatchLines, -1

GetWinProccess(_winId) {
    return "test"
}

LogInfo(_message, _flags := "") {
    return
}

#Include %A_ScriptDir%\..\Lib\ManagerMessages.ahk
#Include %A_ScriptDir%\..\Lib\ManagerClasses.ahk

output := A_Args.Length() > 0 ? A_Args[1] : A_Temp "\QuickSwitch-UNCPathFlow.log"
FileDelete, % output

unc := "\\10.0.99.201\QuickSwitch-main"
quotedUnc := """" unc """"
uncWithTrailingSeparator := """" unc "\" """"
drive := "C:\QuickSwitch-main\"
relative := "/QuickSwitch-main/"

tests := []
tests.Push({Name: "quoted UNC for Explorer", Input: quotedUnc, Expected: unc, Actual: NormalizeExplorerPath(quotedUnc)})
tests.Push({Name: "UNC with trailing separator", Input: uncWithTrailingSeparator, Expected: unc, Actual: NormalizeExplorerPath(uncWithTrailingSeparator)})
tests.Push({Name: "drive path", Input: drive, Expected: "C:\QuickSwitch-main", Actual: NormalizeExplorerPath(drive)})
tests.Push({Name: "relative path", Input: relative, Expected: "QuickSwitch-main", Actual: NormalizeExplorerPath(relative)})
tests.Push({Name: "UNC file URL", Input: "file://10.0.99.201/QuickSwitch-main", Expected: unc, Actual: DecodeLocationURL("file://10.0.99.201/QuickSwitch-main")})
tests.Push({Name: "drive file URL", Input: "file:///C:/QuickSwitch-main", Expected: "C:\QuickSwitch-main", Actual: DecodeLocationURL("file:///C:/QuickSwitch-main")})

failed := 0
for _, test in tests {
    if (test.Actual != test.Expected) {
        FileAppend, % "FAIL: " test.Name " => " test.Actual " (expected " test.Expected ")", % output
        FileAppend, % Chr(10), % output
        failed++
    } else {
        FileAppend, % "PASS: " test.Name " => " test.Actual, % output
        FileAppend, % Chr(10), % output
    }
}

ExitApp, failed ? 1 : 0
