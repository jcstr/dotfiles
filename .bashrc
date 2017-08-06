#
# ~/.bashrc
#

# x.org
setxkbmap latam

# 256 color
export TERM=xterm-256color

# default editor
export EDITOR=vim

# ignore from history repeat commands, and some other unimportant ones
export HISTIGNORE="&:[bf]g:c:exit"
export HISTCONTROL="ignoreboth"
export HISTTIMEFORMAT='%F %T '

source ~/.profile 
source ~/.bash_aliases

PS1='\[\033[00;36m\] \W \[\033[0;32m\]>\[\033[0m\]'

# tmux
[ -n "$TMUX" ] && export TERM=screen-256color

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make sure terminal wraps lines correctly after resize
shopt -s checkwinsize

dbus-update-activation-environment --all

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

