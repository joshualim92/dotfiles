alias ctags="`brew --prefix`/bin/ctags" # call correct ctags

alias cl="clear"

alias ls="ls --color=auto"

alias bm="base16-manager"
alias bms="setbase16theme"

# Emacs
alias emac="emacsclient"
alias es="emacsclient -c"

# Source
alias -g so="source"
alias -g zr="~/.zshrc"

# Tmux
alias t="tmux"
alias ta="tmux a"
alias tat="tmux a -t"
alias td="tmux detach"
alias tks="tmux kill-session -t"
alias tl="tmux ls"
alias tn="tmux new -s"
alias ts="tmux switchc -t"
alias tsl="tmux switchc -l"

# Vim
alias v="vim"
alias swpl="find . -name \"*.swp\""
alias swpr="find . -name \"*.swp\" -exec rm -i {} +"
