#!/bin/env bash
set -x

DOTFILES_DIR=~/.config/jordan_dotfiles
REPO_URL=https://github.com/jordus100/dotfiles
declare -a Programs=('git' 'tmux')

for prog in "${Programs[@]}"; do
  if ! command -v ${prog} >/dev/null 2>&1
  then
      echo "Instaling ${prog}"
      sudo apt install -y ${prog}
  fi
done

if [ -d "$DOTFILES_DIR/.git" ]; then
  git -C "$DOTFILES_DIR" pull origin main --quiet
else
  git clone --quiet --depth 1 "$REPO_URL" "$DOTFILES_DIR"
fi

if [[ ! $(which zsh) ]]; then
    echo "Instaling zsh"
    sudo apt install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s /usr/bin/zsh
fi
git clone https://github.com/jeffreytse/zsh-vi-mode \
  ~/.oh-my-zsh/plugins/zsh-vi-mode
if [[ ! $(grep "alias 'jordan" ~/.zshrc) ]]; then
  echo "alias 'jordan=source ${DOTFILES_DIR}/activate.sh'" >> ~/.zshrc
fi

zsh -i
