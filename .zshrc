export ZSH="$HOME/.oh-my-zsh"
export DOTFILES_DIR="$HOME/.config/jordan_dotfiles"

ZSH_THEME="myfowler"

HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
COMPLETION_WAITING_DOTS="true"

plugins=(git-auto-fetch cd-ls zsh-autosuggestions zsh-vi-mode fzf web-search)

source $ZSH/oh-my-zsh.sh

# User configuration
export FZF_DEFAULT_OPTS='--walker-root=${HOME}'

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

export EDITOR=nvim
# export MANPATH="/usr/local/man:$MANPATH"
path+=/home/linuxbrew/.linuxbrew/bin
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

alias zrc="vi ~/.zshrc"
alias vi="nvim"
alias stf="mystf local"
alias st="git status"
alias com="git commit"
alias adu="git add -u"
alias g="git"
alias ipb="ip -h -p -c -br"
alias outro="source ~/scripts/outro.sh"
alias lper="stat -c \"%a %n\" *"
alias sude='sudo -E env "PATH=$PATH"'
alias zsr="source ~/.zshrc"
alias dok="docker kill $(docker ps -q)"
alias py="python"
alias l="ls -lah"
alias adb36="ADB_DELAYED_ACK=1 /home/linuxbrew/.linuxbrew/bin/adb"
alias ducks="sudo du -cks --exclude=proc -- * | sort -rn | head"
#unalias ls
#alias lc="ls --color=tty"

# Functions
ssmart() {
   IP=$1
   shift
   ssh -p 2222 -t smartdust@172.22.1.$IP $@
}

ssmart2() {
   IP=$1
   shift
   ssh -p 2222 -t smartdust@172.22.2.$IP $@
}

# Keybinds
bindkey -v
	# History searching
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

if [ -f ~/.config/.zshrc_local ]; then
  source ~/.config/.zshrc_local
fi
