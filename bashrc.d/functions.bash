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
