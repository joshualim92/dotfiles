fin() {
	command find . \
		-ipath "*$1*" "${@:2}" \
		-not -path "*/.git/*" \
		-not -path "*/node_modules/*" \
		-not -path "*/vim/plugged/*"
}

finev() {
	fd $1 $2 -exec vim {} +
}


newTmuxSessionInPwd() {
	tmux new -s `printf '%s\n' "${PWD##*/}"`
}

gitDeleteGoneBranches() {
	git branch -a -vv \
		| grep ": gone" \
		| awk '{print $1}' \
		| xargs git branch -d
}

dockerPullAllImages() {
	docker images |grep -v REPOSITORY|awk '{print $1}'|xargs -L1 docker pull
}
