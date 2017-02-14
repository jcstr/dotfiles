# Update: 13/02/2017 20:11
#
# ~/.bashrc
#

# x.org
setxkbmap latam

# 256 color
export TERM=xterm-256color

# tmux
[ -n "$TMUX" ] && export TERM=screen-256color

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[0;32m\]\u\[\033[0;34m\]@\[\033[0;37m\]\h\[\033[0;34m\]\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[\033[00;36m\]\W\[\033[0;33m\] >\[\033[0m\]'

dbus-update-activation-environment --all

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# date & time at history
export HISTTIMEFORMAT='%F %T'

# ruby
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# go
# gvm use go1.7.4 > /dev/null 2>&1
export GOPATH=~/Sandbox/Go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

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

# elixir
export PATH="$PATH:/usr/bin/elixir"

# default editor
export EDITOR=vim;
