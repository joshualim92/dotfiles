#!/usr/bin/env bash

set -o vi

shopt -s expand_aliases
shopt -s globstar
shopt -s histappend

HISTCONTROL=ignoreboth
HISTFILESIZE=1000000
HISTSIZE=1000000

BREW_PREFIX=$(brew --prefix)

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export PATH=$HOME/dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:$BREW_PREFIX/opt/coreutils/libexec/gnubin:$BREW_PREFIX/opt/findutils/libexec/gnubin:$BREW_PREFIX/opt/gnu-sed/libexec/gnubin:/usr/local/opt/go/libexec/bin:$PATH

export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:$MANPATH

export ERL_AFLAGS="-kernel shell_history enabled"

export FZF_DEFAULT_COMMAND="fd --hidden ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

for config in "$HOME"/dotfiles/bashrc.d/*.bash ; do
	source "$config"
done
unset -v config

[ -f $BREW_PREFIX/etc/profile.d/z.sh ] && source $BREW_PREFIX/etc/profile.d/z.sh
[[ -r "$BREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$BREW_PREFIX/etc/profile.d/bash_completion.sh"
