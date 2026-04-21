#!/bin/env zsh

if [ -z "$TMUX"  ]; then 
  exec tmux -f ~/.config/jordan_dotfiles/.tmux.conf new-session -A -s "jordan" "~/.config/jordan_dotfiles/zshi.sh 'source ~/.config/jordan_dotfiles/.zshrc'"
else
  tmux source ~/.config/jordan_dotfiles/.tmux.conf 
  tmux attach-session -t "jordan" 
fi

