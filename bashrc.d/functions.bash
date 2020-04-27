dockerComposeHardRestart() {
	docker-compose down && docker-compose build --pull --parallel && docker-compose up --force-recreate
}

dockerPullAllImages() {
	docker images |grep -v REPOSITORY|awk '{print $1}'|xargs -L1 docker pull
}

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

gitDeleteGoneBranches() {
	git branch -a -vv \
		| grep ": gone" \
		| awk '{print $1}' \
		| xargs git branch -d
}

goModOutdated() {
	go list -u -m -mod=mod -json all | go-mod-outdated
}

newTmuxSessionInPwd() {
	tmux new -s `printf '%s\n' "${PWD##*/}"`
}
