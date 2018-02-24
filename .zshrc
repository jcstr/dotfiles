export EDITOR=vim

# set DE to gnome for chromium
export DE=gnome

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

# Dircolors
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

# keybindings
bindkey -v
typeset -g -A key

bindkey '^[[3~' delete-char

# Up/Down line history arrow up/down
bindkey '^[[B' down-line-or-history
bindkey '^[[A' up-line-or-search

# Beginning of line also ctrl+e/a ctrl+up/down
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line
bindkey "^[^?" backward-kill-word

# Ctrl+r history search
bindkey "^R" history-incremental-search-backward

# history search (usually up/down key)
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

bindkey "^[[1;5D" emacs-backward-word
bindkey "^[[1;5C" emacs-forward-word

# history
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

# alias 
alias ls="ls --color -F"
alias l="ls --color -Flh"
alias ll="ls --color -lh"
alias la="ls --color -alh"
alias grep="grep --color=always"

alias Syu='sudo pacman -Syu '
alias Ss='pacman -Ss'
alias Rs='sudo pacman -Rs'

alias pactree='pactree -c'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# dir colors
eval $(dircolors -b $HOME/.dircolors)

# comp
zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

hist_dedup() {
  sort ~/.histfile > ~/.histfile.old
  uniq ~/.histfile.old > ~/.histfile
}

# prompt
setprompt () {
       	# set the prompt
		PS1=$'%_>'
}
setprompt

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

