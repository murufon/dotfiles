# .zshrc

# Claude Code
export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias cc='claude --dangerously-skip-permissions'

# Load local settings (proxy, credentials, etc.)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
