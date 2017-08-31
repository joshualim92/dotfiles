set nocompatible
filetype plugin indent on
syntax enable
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Show matching parenthesis
set showmatch

set encoding=utf-8
set hidden
set history=100
set number
set ignorecase
set incsearch

" Delete whitespace
autocmd BufWritePre * :%s/\s\+$//e
