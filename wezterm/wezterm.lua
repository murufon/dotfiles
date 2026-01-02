local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ドメイン設定（WSLのディストリビューション名を自動検出）
local function get_wsl_domain()
  local success, stdout = wezterm.run_child_process({ 'wsl', '-l', '-q' })
  if success and stdout:find('Ubuntu%-22%.04') then
    return 'WSL:Ubuntu-22.04'
  end
  return 'WSL:Ubuntu'
end
config.default_domain = get_wsl_domain()

-- 外観設定
config.color_scheme = 'iceberg-dark'
config.font = wezterm.font("HackGen Console NF")
config.font_size = 11.0
config.window_background_opacity = 0.9
config.default_cursor_style = 'BlinkingBar'
config.enable_scroll_bar = true

-- 入力設定
config.use_ime = true
config.hide_mouse_cursor_when_typing = false

-- タブバー設定
-- config.use_fancy_tab_bar = false

-- サウンド設定（Claude Codeのタスク完了通知用）
config.audible_bell = "SystemBeep"

-- 最初からフルスクリーンで起動
-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--    local tab, pane, window = mux.spawn_window(cmd or {})
--    window:gui_window():toggle_fullscreen()
-- end)

-- ショートカットキー設定
config.keys = {
  -- Shift+Enterで改行を送信
  {
    key = 'Enter',
    mods = 'SHIFT',
    action = wezterm.action.SendString('\n'),
  },
  -- Ctrl+Nで新しいタブ
  {
    key = 'n',
    mods = 'CTRL',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl+Wでペインを閉じる
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Ctrl+Vで貼り付け
  {
    key = 'v',
    mods = 'CTRL',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}

-- マウス設定
config.mouse_bindings = {
  -- 右クリックで貼り付け
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}

-- ランチャーメニュー（タブの「+」を右クリックまたは長押し）
config.launch_menu = {
  { label = 'PowerShell', args = { 'powershell.exe' } },
  { label = 'CMD', args = { 'cmd.exe' } },
}

return config
