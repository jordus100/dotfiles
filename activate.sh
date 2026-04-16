#!/bin/env zsh

if [ -z "$TMUX"  ]; then 
  tmux attach-session -t "jordan" 
else
  exec tmux new-session -s "jordan" "~/.config/jordan_dotfiles/zshi.sh 'source ~/.config/jordan_dotfiles/.zshrc'"
fi

