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

# Make sure terminal wraps lines correctly after resize
shopt -s checkwinsize

# aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

PS1='\[\033[00;36m\] \W \[\033[0;33m\]>\[\033[0m\]'

dbus-update-activation-environment --all

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# path & profile stuff
source ~/.profile 

# default editor
export EDITOR=vim

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

# history stuff
# ignore from history repeat commands, and some other unimportant ones
export HISTIGNORE="&:[bf]g:c:exit"
export HISTCONTROL="ignoreboth"
# date & time at history
export HISTTIMEFORMAT='%F %T '
