# dotfiles

開発環境のセットアップ手順と設定ファイル。

## セットアップ

### 1. WezTerm (Windows)

WSL2用ターミナルとして[WezTerm](https://wezterm.org/)のnightly版をインストール。

stable版は2024年2月から約2年間更新されておらず、[開発者自身がnightly版をdaily driverとして使用している](https://wezterm.org/changelog.html)。

1. [WezTerm Nightly Releases](https://github.com/wez/wezterm/releases/nightly)からWindows用インストーラをダウンロード
2. インストーラを実行

### 2. WSL環境

```bash
# zshインストール
sudo apt update
sudo apt install -y zsh
chsh -s /usr/bin/zsh

# dotfilesをクローンしてシンボリックリンク作成
cd ~
git clone https://github.com/YOUR_USERNAME/dotfiles.git
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
├── zsh/
│   └── .zshrc
├── vim/
│   └── .vimrc
├── symlink.sh              # シンボリックリンク作成
└── README.md
```
