# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=/home/x51v4n/.oh-my-zsh

ZSH_THEME="lambda-gitster"

CASE_SENSITIVE="false"

HIST_STAMPS="dd.mm.yyyy"

export LANG=en_US.UTF-8

# preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nano'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export EDITOR=vim

# history stuff
HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000

# set DE to gnome for chromium
export DE=gnome

# vagrant 
export VAGRANT_DISABLE_RESOLV_REPLACE=1

# NPM
export PREFIX=~/.local
export NODE_PATH=~/.local/lib/node_modules/

# browser
export BROWSER=chromium

# go
export GOPATH=$HOME/src/sandbox/go
export PATH=$GOPATH/bin:$PATH
export GOBIN=$HOME/src/sandbox/go/bin
export PATH=$PATH:$HOME/src/sandbox/go/pkg


# history
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# alias 
alias ls="ls --color -F"
alias l="ls --color -Flh"
alias ll="ls --color -lh"
alias la="ls --color -alh"
alias grep="grep --color=always"

# pacman
alias Syu='sudo pacman -Syu '
alias Ss='pacman -Ss'
alias Rs='sudo pacman -Rs'

alias pactree='pactree -c'

# moving in dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# comp stuff
zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

# start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# set GPG TTY
GPG_TTY=$(tty)
export GPG_TTY

# refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# colors on man pages
man() {
	env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

plugins=(
  git
  git-extras
)

source $ZSH/oh-my-zsh.sh

