; Global Hotkeys for AutoHotkey v2
;
; 配置先: %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\

#Requires AutoHotkey v2.0

; Win+I: WezTerm toggle
#i:: {
    if WinExist("ahk_exe wezterm-gui.exe") {
        if WinActive("ahk_exe wezterm-gui.exe") {
            WinMinimize
        } else {
            WinActivate
        }
    } else {
        Run "wezterm-gui.exe"
    }
}

; Win+C: Claude Desktop toggle
#c:: {
    if WinExist("ahk_exe Claude.exe") {
        if WinActive("ahk_exe Claude.exe") {
            WinMinimize
        } else {
            WinActivate
        }
    } else {
        Run EnvGet("LOCALAPPDATA") . "\Programs\claude-desktop\Claude.exe"
    }
}
