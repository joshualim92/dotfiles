set nocompatible
filetype plugin indent on
syntax enable
let mapleader=' ' " Map leader key to be space
set autoread autowriteall
set backspace=indent,eol,start
set encoding=utf-8
set foldcolumn=1 nofoldenable
set guifont=Fira\ Code\ Retina:h12
set hidden
set history=1000
set ignorecase smartcase incsearch
set list listchars=tab:▸\ ,extends:›,precedes:‹,nbsp:·,trail:␣ showbreak=↪\
set mouse=a ttymouse=xterm2 " Allows for mouse mode inside tmux
set number relativenumber
set path+=**
set showcmd " display incomplete commands
set textwidth=78 colorcolumn=+1
set timeoutlen=1000 ttimeoutlen=0
set wildignore+=*node_modules/*
set wildmenu wildmode=list:longest

source ~/dotfiles/vim/vimrc/cursors.vim
source ~/dotfiles/vim/vimrc/functions.vim
source ~/dotfiles/vim/vimrc/plugins.vim
