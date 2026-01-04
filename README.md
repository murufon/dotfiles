# dotfiles

開発環境のセットアップ手順と設定ファイル。

## セットアップ

### 0. このリポジトリのクローン (WSL)

このリポジトリをWSL側にクローンする

```bash
cd ~
git clone https://github.com/murufon/dotfiles.git
```

### 1. フォント (Windows)

<a href="https://github.com/yuru7/HackGen" target="_blank" rel="noopener noreferrer">HackGen</a>のNerd Fonts版をインストール。

1. <a href="https://github.com/yuru7/HackGen/releases" target="_blank" rel="noopener noreferrer">HackGen Releases</a>から`HackGen_NF_vX.X.X.zip`をダウンロード
2. 展開して`HackGenConsoleNF-Regular.ttf`等をインストール

### 2. WezTerm (Windows)

WSL2用ターミナルとして<a href="https://wezterm.org/" target="_blank" rel="noopener noreferrer">WezTerm</a>のnightly版をインストール。

stable版は2024年2月から約2年間更新されておらず、<a href="https://wezterm.org/changelog.html" target="_blank" rel="noopener noreferrer">開発者自身がnightly版をdaily driverとして使用している</a>。

1. <a href="https://github.com/wez/wezterm/releases/nightly" target="_blank" rel="noopener noreferrer">WezTerm Nightly Releases</a>からWindows用インストーラをダウンロード
2. インストーラを実行
3. 設定ファイルをコピー（PowerShell）:
   ```powershell
   cp \\wsl$\Ubuntu\home\murufon\dotfiles\wezterm\wezterm.lua $HOME\.wezterm.lua
   ```

### 3. AutoHotkey (Windows)

WezTermをグローバルホットキー（Win+I）で呼び出すためのスクリプト。

1. <a href="https://www.autohotkey.com/" target="_blank" rel="noopener noreferrer">AutoHotkey v2</a>をインストール
2. スクリプトをスタートアップにコピー（PowerShell）:
   ```powershell
   cp \\wsl$\Ubuntu\home\murufon\dotfiles\autohotkey\wezterm-toggle.ahk "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\"
   ```
3. スクリプトをダブルクリックで起動（次回ログインからは自動起動）

※ Win+I は Windows設定のデフォルトショートカットを上書きします

### 4. WSL環境

```bash
# zsh
sudo apt update
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting
chsh -s /usr/bin/zsh

# Starship (<a href="https://starship.rs/" target="_blank" rel="noopener noreferrer">https://starship.rs/</a>)
curl -sS https://starship.rs/install.sh | sh

# シンボリックリンク作成
cd ~/dotfiles
./symlink.sh
```

## 構成

```
dotfiles/
├── autohotkey/
│   └── wezterm-toggle.ahk  # Windows側に手動コピー
├── claude/                 # Claude Code設定
│   ├── CLAUDE.md           # グローバル指示
│   ├── settings.json
│   ├── mcp_servers.json
│   └── commands/           # カスタムスラッシュコマンド
├── wezterm/
│   └── wezterm.lua         # Windows側に手動コピー
├── zsh/
│   ├── .zshrc
│   └── starship.toml       # Starship設定
├── vim/
│   └── .vimrc
├── symlink.sh              # シンボリックリンク作成（WSL用）
└── README.md
```

## メモ

### カラーテーマの仕組み

1. **zsh/プラグイン**: ANSIエスケープコードで「ここは赤」「ここは青」と指定
2. **WezTerm**: ANSIカラーパレット（16色）で「赤 = #e27878」のように実際のRGB値を定義

zsh-syntax-highlightingが「存在しないコマンドは赤」と指定し、WezTermのカラースキーム（iceberg-dark等）が「赤」の実際の色を決める。スキームを変えると同じ「赤」でも異なる色になる。
