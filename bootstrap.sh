#!/bin/env bash

DOTFILES_DIR=~/.config/jordan_dotfiles
REPO_URL=git@github.com:jordus100/dotfiles.git
declare -a Programs=('git' 'tmux' 'zsh')

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

source ${DOTFILES_DIR}/.zshrc
