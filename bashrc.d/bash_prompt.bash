#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

git_behind_ahead() {
	local behind_ahead=" "
	IFS=$'\t' read -r commits_behind commits_ahead <<< "$(_git-upstream-behind-ahead)"
	[[ "${commits_ahead}" -gt 0 ]] && behind_ahead+=" ${SCM_GIT_AHEAD_CHAR}${commits_ahead}"
	[[ "${commits_behind}" -gt 0 ]] && behind_ahead+=" ${SCM_GIT_BEHIND_CHAR}${commits_behind}"
	echo $behind_ahead
}

suspended_jobs() {
	local sj
	sj=$(jobs 2>/dev/null | tail -n 1)
	if [[ $sj == "" ]]; then
		echo ""
	else
		echo "✱ "
	fi
}

prompt_command() {
	PS1="\n${blue}\h:$(virtualenv_prompt) ${reset_color} \
${yellow}\w \
${green}$(scm_prompt_info)${reset_color} \
${cyan}$(git_behind_ahead)${reset_color}\n\
${red}❯${reset_color} ${orange}$(suspended_jobs)${reset_color}"
}

safe_append_prompt_command prompt_command
