export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/csxr/.oh-my-zsh
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

# set DE to gnome for chromium
export DE=gnome

# vagrant 
export VAGRANT_DISABLE_RESOLV_REPLACE=1

# NPM
PATH="$HOME/.node_modules/bin:$PATH"
export PREFIX=~/.local
export NODE_PATH=~/.local/lib/node_modules/

# go
export GOPATH=$HOME/src/sandbox/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/lib/go/bin:$GOPATH/bin

# browser
export BROWSER=chromium

ZSH_THEME="lambda-gitster"
CASE_SENSITIVE="false"
HIST_STAMPS="%d/%m/%y - %T"

source $ZSH/oh-my-zsh.sh


# history stuff
HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000



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
alias Syu='sudo pacman -Syu'
alias Ss='pacman -Ss'
alias Rs='sudo pacman -Rs'

alias pactree='pactree -c'

# yay
alias Ys='yay -Ss'

# moving in dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# comp stuff
zmodload zsh/complist 
#autoload -Uz compinit
#compinit
autoload -U compinit && compinit
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
  gitfast
  django
  virtualenv
  tmux
  history-substring-search
  docker
  zsh-completions
  safe-paste
  zsh-autosuggestions
)

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# explain.sh begins
explain() {
if [ "$#" -eq 0 ]; then
	while read  -p "Command: " cmd; do
		curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
	done
	echo "Bye!"
	elif [ "$#" -eq 1 ]; then
	curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1"
	else
	echo "Usage"
	echo "explain                  interactive mode."
	echo "explain 'cmd -o | ...'   one quoted command to explain it."
fi
}

