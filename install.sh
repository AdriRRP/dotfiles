#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# 1. Install base packages
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if command -v apt >/dev/null; then
    sudo apt update && sudo apt install -y zsh tmux neovim git curl
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  if ! command -v brew >/dev/null; then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew install zsh tmux neovim git
  brew install --cask ghostty
fi

# 2. Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi

# 3. Zsh plugins/themes
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ] && \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# 4. NvChad
if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/NvChad/NvChad "$HOME/.config/nvim" --depth 1
fi

# 5. Symlinks
ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/p10k.zsh" "$HOME/.p10k.zsh"
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$HOME/.config/ghostty"
ln -sf "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
ln -sf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
# (We might copy .oh-my-zsh custom config or others if needed)

# 6. Change default shell to zsh
if [[ "$SHELL" != *"zsh" ]]; then
  chsh -s "$(command -v zsh)"
fi

echo "Instalación completada. Por favor, inicia una nueva sesión de terminal o ejecuta 'exec zsh'."
