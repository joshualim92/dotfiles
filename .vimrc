set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'moll/vim-node'
"Plugin 'scrooloose/syntastic'
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-vinegar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set indentation to 2 spaces
"set shiftwidth=2
"set tabstop=2

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number		" show line numbers

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Filetype Plugins enabled so that NERDCommenter works
filetype plugin on

" NetRW Tree Style
let g:netrw_liststyle=3

" Show airline by default
set laststatus=2
