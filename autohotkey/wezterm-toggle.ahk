; WezTerm Toggle Script for AutoHotkey v2
; Win+I でWezTermを表示/非表示をトグル
;
; 配置先: %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\
; ※ Win+I は Windows設定のデフォルトショートカットを上書きします

#Requires AutoHotkey v2.0

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
