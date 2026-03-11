#!/bin/bash
# ~/.claude/scripts/log-command.sh
# 実行されたBashコマンドをログに記録する（オプション機能）

# フックから渡されるJSON入力を読み込む
INPUT=$(cat)

# コマンドと説明を抽出
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // "No description"')

# ログディレクトリを確保
mkdir -p ~/.claude/logs

# コマンド実行履歴をログに追記
if [ -n "$COMMAND" ]; then
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $COMMAND - $DESCRIPTION" >> ~/.claude/logs/bash-commands.log
fi
