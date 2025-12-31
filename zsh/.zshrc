# .zshrc
#
# Zsh configuration with Starship prompt and plugins.
# Plugins: zsh-autosuggestions, zsh-syntax-highlighting
#
# Structure:
#   1. Environment variables
#   2. Plugins
#   3. Starship prompt
#   4. Aliases
#   5. Local settings (.zshrc.local)

# ============================================================
# 1. Environment variables
# ============================================================

export PATH="$HOME/.local/bin:$PATH"

# ============================================================
# 2. Plugins (installed via apt)
# ============================================================

# zsh-autosuggestions: suggests commands from history as you type
# Accept suggestion: Right arrow or End key
[[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting: highlights commands as you type
# Must be loaded after other plugins
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ============================================================
# 3. Starship prompt
# ============================================================

# Starship: cross-shell prompt (https://starship.rs/)
# Config: ~/.config/starship.toml
eval "$(starship init zsh)"

# ============================================================
# 4. Aliases
# ============================================================

# Claude Code
alias cc='claude --dangerously-skip-permissions'

# ============================================================
# 5. Local settings (not tracked in git)
# ============================================================

# Load machine-specific settings (proxy, credentials, etc.)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
