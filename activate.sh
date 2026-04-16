#!/bin/env zsh

if [ -z "$TMUX"  ]; then 
  tmux attach-session -t "jordan" 
else
  tmux new-session -d -s "jordan" 'source ~/.config/jordan_dotfiles/.zshrc'
  exec tmux attach -t "jordan"
fi

