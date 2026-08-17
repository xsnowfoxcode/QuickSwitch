/*
    GUI updates global variables after user actions
    and displays their values as checkboxes, options, etc.

    All values are saved to the INI only after clicking OK
*/

T(_key) {
    switch _key
    {
    case "tab_menu":
        return TBuild(33756,21333)
    case "tab_theme":
        return TBuild(22806,35266)
    case "tab_short":
        return TBuild(30701,36335,24452)
    case "tab_app":
        return TBuild(24212,29992)
    case "tab_reset":
        return TBuild(37325,32622)
    case "show_menu_after":
        return TBuild(22312,20197,19979,25805,20316,21518,26174,31034,33756,21333,65306)
    case "after_disable":
        return TBuild(31105,29992,33258,21160,20999,25442,21518)
    case "after_settings":
        return TBuild(20851,38381,35774,32622,30028,38754,21518)
    case "after_select":
        return TBuild(36873,20013,36335,24452,21518)
    case "after_always":
        return TBuild(24635,26159,26174,31034)
    case "auto_switch":
        return TBuild(33258,21160,20999,25442)
    case "path_from":
        return TBuild(36335,24452,26469,28304)
    case "always_auto":
        return TBuild(22987,32456,33258,21160,20999,25442)
    case "blacklist_process":
        return TBuild(23558,25991,20214,23545,35805,26694,25152,23646,36827,31243,21152,20837,40657,21517,21333)
    case "close_legacy":
        return TBuild(20999,25442,36335,24452,21518,20851,38381,26087,24335,25991,20214,23545,35805,26694)
    case "path_numbers":
        return TBuild(26174,31034,36335,24452,32534,21495,65292,24182,21487,29992,32,48,45,57,32,24555,25463,20999,25442)
    case "dedupe":
        return TBuild(21024,38500,37325,22797,36335,24452)
    case "path_limit":
        return TBuild(26174,31034,36335,24452,25968,37327,19978,38480)
    case "dark_theme":
        return TBuild(24212,29992,28145,33394,20027,39064)
    case "menu_color":
        return TBuild(33756,21333,39068,33394,65288,72,69,88,65289)
    case "settings_color":
        return TBuild(35774,32622,30028,38754,39068,33394,65288,72,69,88,65289)
    case "menu_font":
        return TBuild(33756,21333,23383,20307)
    case "settings_font":
        return TBuild(35774,32622,30028,38754,23383,20307)
    case "show_icons":
        return TBuild(26174,31034,22270,26631,65292,26469,28304,20110)
    case "sections":
        return TBuild(22312,33756,21333,20013,26174,31034,20197,19979,20869,23481,65306)
    case "favorites":
        return TBuild(25910,34255,22841,26469,28304)
    case "pinned":
        return TBuild(32622,39030,36335,24452)
    case "clipboard":
        return TBuild(21098,36148,26495,36335,24452)
    case "managers":
        return TBuild(25991,20214,31649,29702,22120,36335,24452)
    case "active_tab":
        return TBuild(20165,24403,21069,27963,21160,26631,31614,39029)
    case "locked_tabs":
        return TBuild(21253,21547,38145,23450,26631,31614,39029)
    case "short_path":
        return TBuild(26174,31034,30701,36335,24452,65292,32553,30053,26631,35760,20026)
    case "separator":
        return TBuild(36335,24452,20998,38548,31526)
    case "dirs_count":
        return TBuild(26174,31034,30446,24405,23618,25968)
    case "dir_length":
        return TBuild(30446,24405,21517,31216,38271,24230)
    case "drive_letter":
        return TBuild(26174,31034,30424,31526)
    case "first_separator":
        return TBuild(26174,31034,39318,20010,20998,38548,31526)
    case "shorten_end":
        return TBuild(20174,26411,23614,24320,22987,32553,30701)
    case "auto_start":
        return TBuild(24320,26426,33258,21160,21551,21160)
    case "pin_path":
        return TBuild(32622,39030,36335,24452,65288,25353,20303,24182,28857,20987,65289)
    case "show_menu_by":
        return TBuild(21628,20986,33756,21333,26041,24335)
    case "mouse":
        return TBuild(40736,26631)
    case "tray_icon":
        return TBuild(25176,30424,22270,26631)
    case "delete_from":
        return TBuild(20174,37197,32622,20013,21024,38500,65306)
    case "delete_dialogs":
        return TBuild(40657,21517,21333,21644,33258,21160,20999,25442,35268,21017)
    case "delete_favorites":
        return TBuild(25910,34255,36335,24452)
    case "delete_pinned":
        return TBuild(32622,39030,36335,24452)
    case "delete_clipboard":
        return TBuild(21098,36148,26495,36335,24452)
    case "delete_keys":
        return TBuild(24555,25463,38190,21644,40736,26631,25353,38190)
    case "nuke":
        return TBuild(24443,24213,28165,31354,37197,32622)
    case "ok":
        return TBuild(30830,23450)
    case "cancel":
        return TBuild(21462,28040)
    case "debug":
        return TBuild(35843,35797)
    case "settings_title":
        return TBuild(35774,32622)
    }
}

TBuild(_codes*) {
    local _text := ""
    for _, _code in _codes
        _text .= Chr(_code)
    return _text
}

ShowSettings() {
    global

    ReadValues()
    FromSettings := true

    Gui, Destroy
    Gui, -E0x200 -SysMenu +DPIScale +AlwaysOnTop +HwndSettingsId
    Gui, Color, % GuiColor, % GuiColor

    local _options := "q5"
    if DarkTheme
        _options .= " c" InvertColor(GuiColor)
    if MainFontSize
        _options .= " s" MainFontSize

    Gui, Font, % _options, % MainFont

    local scale := (MainFontSize != 0) ? (MainFontSize - 8) : 0
    local fieldDefault := "r1 -Wrap -vscroll w"
    local updown := fieldDefault . 4  * (10 + scale) . " Limit2"
    local tiny   := fieldDefault . 5  * (10 + scale)
    local short  := fieldDefault . 10 * (10 + scale)
    local list   := "r4 w"       . 10 * (10 + scale)
    local long   := fieldDefault . 14 * (10 + scale)

    Gui, Add, Tab3, -Wrap +Background +Theme AltSubmit vLastTabSettings Choose%LastTabSettings%, % T("tab_menu") "|" T("tab_theme") "|" T("tab_short") "|" T("tab_app") "|" T("tab_reset")

    Gui, Tab, 1

    Gui, Add, Text,                                         vShowMenuAfterText,                                     % T("show_menu_after")
    Gui, Add, CheckBox,                                     vShowNoSwitch         checked%ShowNoSwitch%,            % T("after_disable")
    Gui, Add, CheckBox,                                     vShowAfterSettings    checked%ShowAfterSettings%,       % T("after_settings")
    Gui, Add, CheckBox,                                     vShowAfterSelect      checked%ShowAfterSelect%,         % T("after_select")
    Gui, Add, CheckBox,     gToggleShowAlways               vShowAlways           checked%ShowAlways%,              % T("after_always")

    GuiControlGet, Margin, pos, ShowMenuAfterText
    Gui, Add, Text,         y+%MarginH%                                           Section,                          % T("auto_switch")
    Gui, Add, Edit,         ys-4  %updown%
    Gui, Add, UpDown,       Range1-99                       vAutoSwitchIndex      Section,                          %AutoSwitchIndex%
    Gui, Add, Text,         ys+4                            vCenteredText         Section,                          % T("path_from")
    Gui, Add, DropDownList, ys-3  w%MarginW%                vAutoSwitchTarget,                                      PinnedPaths|FavoritePaths|ManagersPaths|ClipboardPaths|MenuStack
    GuiControl, % "ChooseString", % "AutoSwitchTarget",   % AutoSwitchTarget

    GuiControlGet, Center, pos, CenteredText
    Gui, Add, CheckBox,     y+%MarginH% x%MarginX%          vAutoSwitch           checked%AutoSwitch%,              % T("always_auto")
    Gui, Add, CheckBox,                                     vBlackListProcess     checked%BlackListProcess%,        % T("blacklist_process")
    Gui, Add, CheckBox,                                     vSendEnter            checked%SendEnter%,               % T("close_legacy")
    Gui, Add, CheckBox,                                     vPathNumbers          checked%PathNumbers%,             % T("path_numbers")
    Gui, Add, CheckBox,                                     vDeleteDuplicates     checked%DeleteDuplicates%,        % T("dedupe")

    Gui, Add, Text,         y+%MarginH%                                           Section,                          % T("path_limit")
    Gui, Add, Edit,         ys-4  %updown%
    Gui, Add, UpDown,       Range1-9999                     vPathLimit,                                             %PathLimit%

    Gui, Tab, 2

    Gui, Add, CheckBox,           gToggleDarkTheme          vDarkTheme            checked%DarkTheme%,               % T("dark_theme")
    Gui, Add, Text,         y+%MarginH%                                           Section,                          % T("menu_color")
    Gui, Add, Text,         y+12,                                                                                   % T("settings_color")
    Gui, Add, Text,         y+12,                                                                                   % T("menu_font")
    Gui, Add, Text,         y+12,                                                                                   % T("settings_font")
    Gui, Add, CheckBox,     y+12  gToggleIcons              vShowIcons            checked%ShowIcons%,               % T("show_icons")

    Gui, Add, Edit,         ys-4  %short% Limit8            vMenuColor            Section,                          %MenuColor%
    Gui, Add, Edit,         y+4   %short% Limit8            vGuiColor,                                              %GuiColor%

    Gui, Add, Edit,         y+4   %short%                   vMenuFont,                                              %MenuFont%
    Gui, Add, Edit,     x+m yp    %updown%
    Gui, Add, UpDown,       Range0-99                       vMenuFontSize,                                          %MenuFontSize%
    Gui, Add, Edit,     xs  y+4   %short%                   vMainFont,                                              %MainFont%
    Gui, Add, Edit,     x+m yp    %updown%
    Gui, Add, UpDown,       Range0-99                       vMainFontSize,                                          %MainFontSize%

    Gui, Add, Edit,      xs y+4   %short%                   vIconsDir             Section,                          %IconsDir%
    Gui, Add, Edit,         ys    %updown%                  vIconsSizePlaceholder
    Gui, Add, UpDown,       Range1-200                      vIconsSize,                                             %IconsSize%

    Gui, Add, Text,         y+%MarginH%  x%MarginX%,                                                                % T("sections")
    Gui, Add, CheckBox,           gToggleFavorites          vShowFavorites        checked%ShowFavorites%,           % T("favorites")
    Gui, Add, Edit,      xs yp-5  %long%                    vFavoritesDir,                                          %FavoritesDir%

    Gui, Add, CheckBox,     y+%scale%    x%MarginX%         vShowPinned           checked%ShowPinned%,              % T("pinned")
    Gui, Add, CheckBox,                                     vShowClipboard        checked%ShowClipboard%,           % T("clipboard")
    Gui, Add, CheckBox,           gToggleManagersTabs       vShowManagers         checked%ShowManagers%,            % T("managers")
    Gui, Add, CheckBox,     y+10         xp+%MarginH%       vActiveTabOnly        checked%ActiveTabOnly%,           % T("active_tab")
    Gui, Add, CheckBox,                                     vShowLockedTabs       checked%ShowLockedTabs%,          % T("locked_tabs")

    Gui, Tab, 3

    Gui, Add, Checkbox,     gToggleShortPath                vShortPath    Section checked%ShortPath%,               % T("short_path")
    Gui, Add, Text,         y+13                            vPathSeparatorText,                                     % T("separator")
    Gui, Add, Text,         y+13                            vDirsCountText,                                         % T("dirs_count")
    Gui, Add, Text,         y+13                            vDirNameLengthText,                                     % T("dir_length")
    Gui, Add, Checkbox,     y+%MarginH%                     vShowDriveLetter        checked%ShowDriveLetter%,       % T("drive_letter")
    Gui, Add, Checkbox,                                     vShowFirstSeparator     checked%ShowFirstSeparator%,    % T("first_separator")
    Gui, Add, Checkbox,                                     vShortenEnd             checked%ShortenEnd%,            % T("shorten_end")

    Gui, Add, Edit,         ys-4 %tiny%                     vShortNameIndicator,                                    %ShortNameIndicator%
    Gui, Add, Edit,         y+4  %tiny%                     vPathSeparator,                                         %PathSeparator%
    Gui, Add, Edit,         y+4  %tiny%     Limit4
    Gui, Add, UpDown,       Range1-9999                     vDirsCount,                                             %DirsCount%
    Gui, Add, Edit,         y+4  %tiny%     Limit4
    Gui, Add, UpDown,       Range1-9999                     vDirNameLength,                                         %DirNameLength%

    Gui, Tab, 4

    Gui, Add, CheckBox,                                     vAutoStartup          checked%AutoStartup%,             % T("auto_start")
    Gui, Add, Text,         y+%MarginH%                                           Section,                          % T("pin_path")
    Gui, Add, Text,         y+%MarginH%,                                                                            % T("show_menu_by")

    local listbox := list  " wp xp yp+" MarginH + 9

    Gui, Add, Edit,         ys-4  %short%    ReadOnly       vPinKey               Section
    Gui, Add, Edit,      xp yp    %short%    ReadOnly       vPinMousePlaceholder,                                 % PinMousePlaceholder
    Gui, Add, ListBox,            %listbox%  gGetMouseKey   vPinMouseListBox,                                     % GetMouseList("pinList")
    Gui, Add, Button,       ys               gTogglePinMouse,                                                       % T("mouse")

    Gui, Add, Hotkey,    xs y+8   %short%                   vMainKey              Section,                        % MainKey
    Gui, Add, Edit,      xp yp    %short%    ReadOnly       vMainMousePlaceholder,                                % MainMousePlaceholder
    Gui, Add, ListBox,            %listbox%  gGetMouseKey   vMainMouseListBox,                                    % GetMouseList("mouseList")
    Gui, Add, Button,    hs   ys           gToggleMainMouse vMainMouseButton,                                       % T("mouse")

;@Ahk2Exe-IgnoreBegin
    Gui, Add, Hotkey,    xs y+8   %short%                   vRestartKey           Section,                        % RestartKey
    Gui, Add, Edit,         xp yp %short%    ReadOnly       vRestartMousePlaceholder,                             % RestartMousePlaceholder
    Gui, Add, ListBox,            %listbox%  gGetMouseKey   vRestartMouseListBox,                                 % GetMouseList("mouseList")
    Gui, Add, Button,       ys          gToggleRestartMouse vRestartMouseButton,                                    mouse
    Gui, Add, Text,    x%MarginX% ys+4,                                                                             &Restart app by
;@Ahk2Exe-IgnoreEnd

    Gui, Add, Edit,xs y+%MarginH% %long%                    vMainIcon             Section,                        % MainIcon
    Gui, Add, Text,    x%MarginX% ys+4,                                                                             % T("tray_icon")

;@Ahk2Exe-IgnoreBegin
    Gui, Add, Edit,        xs y+8 %long%                    vRestartWhere,                                        % RestartWhere
    Gui, Add, Text,    x%MarginX% yp+4,                                                                             &Restart only in
    Gui, Add, CheckBox,y+%MarginH%                          vShowAfterRestart     checked%ShowAfterRestart%,        Show &Menu after restart
    Gui, Add, CheckBox,                                     vShowNearCursor       checked%ShowNearCursor%,          Show Menu near the mouse &cursor
    Gui, Add, CheckBox,                                     vShowUiAfterRestart   checked%ShowUiAfterRestart%,      Show &settings after restart
    Gui, Add, CheckBox,                                     vSaveLastTab          checked%SaveLastTab%,             Open &last settings tab after restart
    Gui, Add, CheckBox,                                     vSaveUiPosition       checked%SaveUiPosition%,          Save settings window position
    Gui, Add, CheckBox,y+%MarginH%                          vShowOpenDialog       checked%ShowOpenDialog%,          Open "Op&en" dialog before Menu
    Gui, Add, CheckBox,                                     vShowSaveAsDialog     checked%ShowSaveAsDialog%,        Open "&Save As" dialog before Menu
;@Ahk2Exe-IgnoreEnd

    Gui, Tab, 5

    Gui, Add, Text,,                                                                                                % T("delete_from")
    Gui, Add, CheckBox,     y+%MarginH%                     vDeleteDialogs,                                         % T("delete_dialogs")
    Gui, Add, CheckBox,                                     vDeleteFavorites,                                       % T("delete_favorites")
    Gui, Add, CheckBox,                                     vDeletePinned,                                          % T("delete_pinned")
    Gui, Add, CheckBox,                                     vDeleteClipboard,                                       % T("delete_clipboard")
    Gui, Add, CheckBox,                                     vDeleteKeys,                                            % T("delete_keys")
    Gui, Add, CheckBox,     y+%MarginH%                     vNukeSettings,                                          % T("nuke")

    Gui, Tab

    local button := NukeSettings ? "Nuke" : "Reset"
        , buttonLabel := NukeSettings ? T("nuke") : T("tab_reset")
    NukeSettings := false

    Gui, Add, Button, % "x" ((CenterX >> 2) - scale) " w" CenterW " gSaveSettings Default",                       % T("ok")
    Gui, Add, Button, % "x+" CenterH " yp wp                gGuiEscape",                                          % T("cancel")
    Gui, Add, Button, % "x+" CenterH " yp wp                g" button "Settings",                                 % buttonLabel
    Gui, Add, Button, % "x+" CenterH " yp wp                gShowDebug",                                          % T("debug")

    ToggleShowAlways()
    ToggleIcons()
    ToggleFavorites()
    ToggleShortPath()

    InitMouseMode("Pin",     true)
    InitMouseMode("Main",    MainMousePlaceholder    != "")
    InitMouseMode("Restart", RestartMousePlaceholder != "")

    if DarkTheme
        SetDarkTheme(T("ok") "|" T("cancel") "|" T("nuke") "|" T("tab_reset") "|" T("debug") "|msctls_hotkey321|msctls_hotkey322")

    local _pos  := ""
        , _posX := ""
        , _posY := ""
;@Ahk2Exe-IgnoreBegin
    if SaveUiPosition && UiPosX && UiPosY
        _pos := "x" UiPosX " y" UiPosY
;@Ahk2Exe-IgnoreEnd
    if !_pos {
        WinGetPos, _posX, _posY,,, % "ahk_id " DialogId
        if (_posX && _posY)
            _pos := "x" _posX " y" _posY + 100
        else
            _pos := "x0 y100"
    }
    Gui, Show, % "AutoSize " _pos, % T("settings_title")
}
