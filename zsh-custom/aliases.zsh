alias ctags="`brew --prefix`/bin/ctags" # call correct ctags

alias sb16t="setbase16theme"

# Emacs
alias emac="emacsclient"
alias es="emacsclient -c"

# Tmux
alias ta="tmux a"
alias tat="tmux a -t"
alias td="tmux detach"
alias tks="tmux kill-session -t"
alias tl="tmux ls"
alias tn="tmux new -s"

# Vim
alias swpl="find . -name \"*.swp\""
alias swpr="find . -name \"*.swp\" -exec rm -i {} +"
