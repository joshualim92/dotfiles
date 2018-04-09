#!/usr/bin/env bash

branch_dirty_info() {
	local scminfo=`git branch 2> /dev/null \
		| sed -n "s/* \(.*$\)/\1/p"`

	[[ ! -z `git status --porcelain --ignore-submodules -unormal \
		2> /dev/null` ]] && scminfo+="*"
	echo "$scminfo"
}

branch_ahead_behind_info() {
	local branch_status=`git status --porcelain --branch 2> /dev/null`
	local ahead=`echo "$branch_status" \
		| sed -n "s/^.*\[.*ahead \([[:digit:]]\+\).*\]/\1/p"`
	local behind=`echo "$branch_status" \
		| sed -n "s/^.*\[.*behind \([[:digit:]]\+\).*\]/\1/p"`

	local ahead_behind=""
	[[ ! -z "$ahead" ]] && ahead_behind+=" ⇡$ahead"
	[[ ! -z "$behind" ]] && ahead_behind+=" ⇣$behind"
	echo $ahead_behind
}

suspended_jobs() {
	local sj=$(jobs 2> /dev/null | grep "^\[.*\].*Stopped\|Running")

	if [[ -z "$sj" ]]; then
		echo ""
	else
		echo " ✱"
	fi
}

PS1='\n\[\e[0;34m\]\w \[\e[2;39m\]$(branch_dirty_info) \
\[\e[0;36m\]$(branch_ahead_behind_info)\

\[\e[0;91m\]❯\[\e[0;33m\]$(suspended_jobs)\[\e[0m\] '
