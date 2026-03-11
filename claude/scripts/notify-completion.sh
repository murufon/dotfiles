#!/bin/bash
# ~/.claude/scripts/notify-completion.sh
# Claude Codeのタスク完了時にWindows通知を送る

# フックから渡されるJSON入力を読み込む
INPUT=$(cat)

# transcript_pathを抽出
TRANSCRIPT_PATH=$(echo "$INPUT" | jq -r '.transcript_path // empty')

# セッションディレクトリ名を取得
SESSION_DIR=$(basename "$(pwd)")

# デフォルトメッセージ
MESSAGE="タスクが完了しました"
TITLE="Claude Code - $SESSION_DIR"

# transcriptが存在する場合は最終assistantメッセージを抽出
if [ -n "$TRANSCRIPT_PATH" ] && [ -f "$TRANSCRIPT_PATH" ]; then
    # 最後のassistantロールのメッセージを抽出（最大200文字）
    LAST_MESSAGE=$(jq -r 'select(.message.role == "assistant") | .message.content[0].text // empty' "$TRANSCRIPT_PATH" | tail -1 | head -c 200)

    if [ -n "$LAST_MESSAGE" ]; then
        MESSAGE="$LAST_MESSAGE"
    fi
fi

# タイムスタンプをログ出力（デバッグ用）
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Claude Code completed: $SESSION_DIR" >> ~/.claude/logs/completion.log

# Windows PowerShellを経由して通知を送る
# WINDOWS_USERNAME は .zshrc.local 等で設定する
PS_SCRIPT="/mnt/c/Users/${WINDOWS_USERNAME}/scripts/claude-notify.ps1"

if [ -z "$WINDOWS_USERNAME" ]; then
    echo "Warning: WINDOWS_USERNAME is not set. Set it in ~/.zshrc.local" >&2
elif [ -f "$PS_SCRIPT" ]; then
    # PowerShellスクリプトを実行（Windows側のパスに変換）
    WIN_PS_SCRIPT=$(wslpath -w "$PS_SCRIPT")
    /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -File "$WIN_PS_SCRIPT" -Title "$TITLE" -Message "$MESSAGE"
else
    echo "Warning: PowerShell notification script not found at $PS_SCRIPT" >&2
fi
