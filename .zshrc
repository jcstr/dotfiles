#export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/jesus/.oh-my-zsh"
export PATH="$PATH:/home/jesus/.local/bin:/usr/local/bin"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

###
#Oh-my-zsh
#
ZSH_THEME="lambda-gitster"
source $ZSH/oh-my-zsh.sh

plugins=(
  git
  git-extras
  gitfast
  django
  virtualenv
  tmux
  history-substring-search
  docker
  docker-compose
  docker-machine
  zsh-completions
  safe-paste
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

CASE_SENSITIVE="false"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEYPATH="~/.ssh"

# default editor
export EDITOR=vim

# vagrant 
export VAGRANT_DISABLE_RESOLV_REPLACE=1

# NPM
#PATH="$HOME/.node_modules/bin:$PATH"
#export PREFIX=~/.local
#export NODE_PATH=~/.local/lib/node_modules/

# go
export GOPATH=$HOME/src/sandbox/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/lib/go/bin:$GOPATH/bin

##
#History
#

HIST_STAMPS="%d/%m/%Y - %T"
HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

##
# Aliases
#

alias ls="ls --color"
alias l="ls --color -lh"
alias la="ls --color -alh"

# pacman
alias Syu='sudo pacman -Syu'
alias Ss='pacman -Ss'
alias pactree='pactree -c'

# yay
alias Ys='yay -Ss'

# moving in dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

##
# Completion system
#

autoload -Uz compinit
compinit

zstyle ":completion:*" auto-description "specify: %d"
zstyle ":completion:*" completer _complete _correct _approximate
zstyle ":completion:*" format "Completing %d"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" menu select=2
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ":completion:*" matcher-list "" "m:{a-z}={A-Z}" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=* l:|=*"
zstyle ":completion:*" menu select=long
zstyle ":completion:*" select-prompt %SScrolling active: current selection at %p%s
zstyle ":completion:*" verbose true

zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
zstyle ":completion:*:kill:*" command "ps -u $USER -o pid,%cpu,tty,cputime,cmd"

##
#GPG
#

# set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# set GPG TTY
GPG_TTY=$(tty)
export GPG_TTY

###
#Colors
#

# color on man pages
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

# color in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# color in grep
alias grep="grep --color=always"

