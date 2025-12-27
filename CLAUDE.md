# CLAUDE.md

このリポジトリは開発環境のセットアップ手順と設定ファイルを管理する。

## 方針

- 完全自動化は目指さない。「次にPCセットアップするとき迷わない」が目標
- Windows側はセットアップMD + wingetスクリプト、WSL側は従来のdotfiles管理で分ける
- 年1回あるかないかのセットアップのために完璧なスクリプトを維持するのは割に合わない

## 構造（予定）

```
dotfiles/
├── CLAUDE.md
├── README.md              # 全体の流れ
├── windows/
│   ├── SETUP.md           # 手動手順（Office, ドライバ等）
│   ├── install-apps.ps1   # wingetで入るもの
│   └── settings/          # エクスポートした設定ファイル
├── wsl/
│   ├── install.sh         # apt, pip等
│   └── dotfiles/          # .zshrc, .vimrc等
└── vscode/
    └── settings.json      # Settings Sync使うなら不要
```

## 書くべきこと

- インストールしたものリスト（wingetコマンド形式だとコピペで使える）
- 手動設定が必要な箇所のスクショ or 手順メモ
- ハマったポイントの備忘録

## 開発時の注意

- 実際にセットアップするときに足りなかった部分を追記していく
- 生きたドキュメントとして育てる
