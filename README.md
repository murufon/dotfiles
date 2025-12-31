# dotfiles

開発環境のセットアップ手順と設定ファイル。

## セットアップ

### 1. フォント (Windows)

[HackGen](https://github.com/yuru7/HackGen)のNerd Fonts版をインストール。

1. [HackGen Releases](https://github.com/yuru7/HackGen/releases)から`HackGen_NF_vX.X.X.zip`をダウンロード
2. 展開して`HackGenConsoleNF-Regular.ttf`等をインストール

### 2. WezTerm (Windows)

WSL2用ターミナルとして[WezTerm](https://wezterm.org/)のnightly版をインストール。

stable版は2024年2月から約2年間更新されておらず、[開発者自身がnightly版をdaily driverとして使用している](https://wezterm.org/changelog.html)。

1. [WezTerm Nightly Releases](https://github.com/wez/wezterm/releases/nightly)からWindows用インストーラをダウンロード
2. インストーラを実行
3. 設定ファイルをコピー（PowerShell）:
   ```powershell
   cp \\wsl$\Ubuntu\home\murufon\dotfiles\wezterm\wezterm.lua $HOME\.wezterm.lua
   ```

### 3. WSL環境

```bash
# zsh
sudo apt update
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting
chsh -s /usr/bin/zsh

# Starship (https://starship.rs/)
curl -sS https://starship.rs/install.sh | sh

# dotfiles
cd ~
git clone https://github.com/murufon/dotfiles.git
cd dotfiles
./symlink.sh
```

## 構成

```
dotfiles/
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
