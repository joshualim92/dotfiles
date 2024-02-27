#!/usr/bin/env bash

set -o vi

shopt -s expand_aliases
shopt -s globstar
shopt -s histappend

HISTCONTROL=ignoreboth
HISTFILESIZE=1000000
HISTSIZE=1000000

eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh
. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export PATH=$HOME/dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:$(brew --prefix)/opt/coreutils/libexec/gnubin:$(brew --prefix)/opt/findutils/libexec/gnubin:$(brew --prefix)/opt/gnu-sed/libexec/gnubin:/usr/local/opt/go/libexec/bin:$(go env GOPATH)/bin:$PATH

export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:$MANPATH

export GOPATH=$(go env GOPATH)

export ERL_AFLAGS="-kernel shell_history enabled"

export FZF_DEFAULT_COMMAND="fd --hidden ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

for config in "$HOME"/dotfiles/bashrc.d/*.bash ; do
	source "$config"
done
unset -v config

[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
