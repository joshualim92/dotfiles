fin() {
    command find . \
        -not -path "*/.git/*" \
        -not -path "*/vim/plugged/*" \
        -not -path "*/node_modules/*" \
        -ipath "*$1*" "${@:2}"
}

finev() {
    fd $1 $2 -exec vim {} +
}
