# .zshrc
#
# Zsh configuration with Starship prompt and plugins.
# Plugins: zsh-autosuggestions, zsh-syntax-highlighting
#
# Structure:
#   1. Environment variables
#   2. Completion settings
#   3. Plugins
#   4. OSC 7 (directory notification for WezTerm)
#   5. Starship prompt
#   6. Aliases
#   7. Local settings (.zshrc.local)

# ============================================================
# 1. Environment variables
# ============================================================

export PATH="$HOME/.local/bin:$PATH"

# ============================================================
# 2. Completion settings
# ============================================================

# Enable completion system
autoload -Uz compinit && compinit

# Menu selection: highlight current selection
zstyle ':completion:*' menu select

# Use LS_COLORS for file completion colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ============================================================
# 3. Plugins (installed via apt)
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
# 4. OSC 7 - Tell terminal the current directory
# ============================================================

# WezTerm uses this to open new tabs in the same directory
_osc7_cwd() {
    printf '\e]7;file://%s%s\e\\' "$HOST" "$PWD"
}
add-zsh-hook chpwd _osc7_cwd
_osc7_cwd  # Run once at startup

# ============================================================
# 5. Starship prompt
# ============================================================

# Starship: cross-shell prompt (https://starship.rs/)
# Config: ~/.config/starship.toml
eval "$(starship init zsh)"

# ============================================================
# 6. Aliases
# ============================================================

# Claude Code
alias cc='claude --dangerously-skip-permissions'

# ============================================================
# 7. Local settings (not tracked in git)
# ============================================================

# Load machine-specific settings (proxy, credentials, etc.)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
