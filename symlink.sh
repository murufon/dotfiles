#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
DATE=$(date +%Y%m%d)

# Back up existing file if it's not a symlink, then create symlink
link() {
    local src=$1
    local dest=$2

    if [[ -e "$dest" && ! -L "$dest" ]]; then
        echo "Backing up $dest -> ${dest}.${DATE}"
        mv "$dest" "${dest}.${DATE}"
    fi

    ln -sf "$src" "$dest"
    echo "Linked $dest"
}

# Back up existing directory if it's not a symlink, then create symlink
link_dir() {
    local src=$1
    local dest=$2

    if [[ -d "$dest" && ! -L "$dest" ]]; then
        echo "Backing up $dest -> ${dest}.${DATE}"
        mv "$dest" "${dest}.${DATE}"
    fi

    ln -sfn "$src" "$dest"
    echo "Linked $dest"
}

echo "Creating symlinks..."

# Claude Code
mkdir -p ~/.claude
link "$DOTFILES_DIR/claude/CLAUDE.md" ~/.claude/CLAUDE.md
link "$DOTFILES_DIR/claude/settings.json" ~/.claude/settings.json
link "$DOTFILES_DIR/claude/mcp_servers.json" ~/.claude/mcp_servers.json
link_dir "$DOTFILES_DIR/claude/commands" ~/.claude/commands

# zsh
link "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc

# Starship
mkdir -p ~/.config
link "$DOTFILES_DIR/zsh/starship.toml" ~/.config/starship.toml

# vim
link "$DOTFILES_DIR/vim/.vimrc" ~/.vimrc

echo "Done!"
