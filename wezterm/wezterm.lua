local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ドメイン設定
-- ディストリビューション変更時はここを書き換える（確認: wsl -l -q）
config.default_domain = 'WSL:Ubuntu-22.04'

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
config.window_frame = {
  font = wezterm.font("HackGen Console NF", { weight = 'Bold' }),
  font_size = 10.0,
  active_titlebar_bg = '#161821',
  inactive_titlebar_bg = '#161821',
}
config.colors = {
  tab_bar = {
    background = '#161821',
    active_tab = {
      bg_color = '#84a0c6',
      fg_color = '#161821',
    },
    inactive_tab = {
      bg_color = '#2a2f3e',
      fg_color = '#6b7089',
    },
    inactive_tab_hover = {
      bg_color = '#3d425b',
      fg_color = '#c6c8d1',
    },
    new_tab = {
      bg_color = '#2a2f3e',
      fg_color = '#6b7089',
    },
    new_tab_hover = {
      bg_color = '#3d425b',
      fg_color = '#c6c8d1',
    },
    inactive_tab_edge = '#c6c8d1',
  },
}

-- タブタイトルのカスタマイズ（Powerlineセパレータ）
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then return title end
  return tab_info.active_pane.title
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local bg = '#2a2f3e'
  local fg = '#6b7089'

  if tab.is_active then
    bg = '#84a0c6'
    fg = '#161821'
  elseif hover then
    bg = '#3d425b'
    fg = '#c6c8d1'
  end

  local edge_bg = '#161821'
  local title = tab_title(tab)
  title = ' ' .. title .. ' '
  title = wezterm.truncate_right(title, max_width - 2)

  return {
    { Background = { Color = edge_bg } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = title },
    { Background = { Color = edge_bg } },
    { Foreground = { Color = bg } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

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
