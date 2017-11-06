alias ctags="`brew --prefix`/bin/ctags" # call correct ctags

alias sb16t="setbase16theme"

# Tmux
alias tl="tmux ls"
alias tn="tmux new -s"
alias tns="tmux new-session -s"
alias tks="tmux kill-session -t"
alias ta="tmux a"
alias tat="tmux a -t"
alias td="tmux detach"

# Vim
alias swpl="find . -name \"*.swp\""
alias swpr="find . -name \"*.swp\" -exec rm -i {} +"

# Emacs
alias es="emacsclient -c"
alias emac="emacsclient"
