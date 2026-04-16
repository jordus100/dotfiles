#!/bin/env zsh

if [ -z "$TMUX"  ]; then 
  exec tmux new-session -s "jordan" "~/.config/jordan_dotfiles/zshi.sh 'source ~/.config/jordan_dotfiles/.zshrc'"
else
  tmux attach-session -t "jordan" 
fi

