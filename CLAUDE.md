# CLAUDE.md

このリポジトリは開発環境のセットアップ手順と設定ファイルを管理する。

## 方針

- **公開リポジトリとして運用** - 機密情報（プロキシ、認証情報等）は含めない
- 完全自動化は目指さない。「次にPCセットアップするとき迷わない」が目標
- 実際にセットアップするときに足りなかった部分を追記する、生きたドキュメント
- PC固有の設定は `.zshrc.local` 等のlocalファイルに分離する

## 構造

```
dotfiles/
├── CLAUDE.md               # このファイル（リポジトリの説明）
├── README.md               # セットアップ手順
├── symlink.sh              # シンボリックリンク作成（WSL用）
├── .gitignore
├── claude/
│   ├── CLAUDE.md           # グローバル設定（~/.claude/へリンク）
│   ├── settings.json
│   ├── mcp_servers.json
│   └── commands/
├── wezterm/
│   └── wezterm.lua         # Windows側に手動コピー
├── zsh/
│   └── .zshrc
└── vim/
    └── .vimrc
```

## dotfiles構成

- `~/.zshrc` → `~/dotfiles/zsh/.zshrc` へのシンボリックリンク
- `~/.zshrc.local` → PC固有の設定（プロキシ等）。gitで管理しない

## Git

- commit/push前に機密情報（APIキー、パスワード等）が含まれていないことを確認する
- ユーザー名: `murufon` / メール: `murufon2@gmail.com`（本名を使用しない）

## 開発時の注意

- 設定ファイルを編集したらこのリポジトリにコミット
- 新しいツールを追加したらREADME.mdとsymlink.shを更新
