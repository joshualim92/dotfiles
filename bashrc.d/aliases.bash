alias l='ls -lah'
alias la='ls -A'
alias ll='ls -lh'
alias ls='ls --color=auto'

# Cat
alias cat='ccat'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"

alias bm='base16-manager'
alias bms='setbase16theme'

# Emacs
alias emac='emacsclient'
alias es='emacsclient -c'

# Git
alias g='git'

# Source
alias so='source'
alias bp='source ~/.bash_profile'
alias bashrc='source ~/.bashrc'

# Tmux
alias t='tmux'
alias ta='tmux a'
alias tat='tmux a -t'
alias td='tmux detach'
alias tks='tmux kill-session -t'
alias tl='tmux ls'
alias tn='tmux new -s'
alias ts='tmux switchc -t'
alias tsl='tmux switchc -l'

# Vim
alias v='vim'
alias swpl='find . -name "*.swp"'
alias swpr='find . -name "*.swp" -exec rm -i {} +'
