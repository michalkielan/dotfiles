export ZSH=/home/michal/.oh-my-zsh

ZSH_THEME="steeef"

plugins=(git mercurial npm sudo)

source $ZSH/oh-my-zsh.sh

eval $(dircolors -b $HOME/.dircolors)

export EDITOR='vim'
export VISUAL=${EDITOR}

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

xset b off
