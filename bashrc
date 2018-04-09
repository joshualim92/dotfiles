#!/usr/bin/env bash

set -o vi

shopt -s expand_aliases
shopt -s globstar
shopt -s histappend

HISTCONTROL=ignoreboth
HISTFILESIZE=1000000
HISTSIZE=1000000

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export PATH=$HOME/dotfiles/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/bin:$(go env GOPATH)/bin:$PATH
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:$MANPATH

export GOPATH=$(go env GOPATH)

BASE16_SHELL=$HOME/.base16-manager/chriskempson/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case \
	--glob "!.git/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(fasd --init auto)"

for config in "$HOME"/dotfiles/bashrc.d/*.bash ; do
	source "$config"
done
unset -v config

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

generateSshKey() {
	ssh-keygen -t rsa -b 4096 -C "joshua.lim@dominionmarinemedia.com"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
}

setbase16theme() {
	if [[ $1 ]]; then
		base16-manager set $1
	else
		base16-manager set-random
	fi

	source ~/.bash_profile
}
