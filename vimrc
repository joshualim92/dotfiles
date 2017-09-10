set nocompatible
filetype plugin indent on
syntax enable
colorscheme delek
set nowrap
set encoding=utf-8
set hidden
set history=100

" Spaces & Tabs
" tabstop, softabstop, shiftwidth can be configured 'locally'
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set expandtab " tabs are spaces
set smartindent
set autoindent

" UI Config
set number " show line numbers
set relativenumber
set wildmenu " visual autocomplete for command menu
set showmatch " Show matching parenthesis

" :find
set path+=**
set wildignore+=*/node_modules/*

" Searching
set ignorecase
set incsearch
set hlsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable " enable folding

" Delete whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Set airline theme
let g:airline_theme='base16color'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Ack.vim
" Ack default use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>

" NERDTree
nmap <leader>ne :NERDTreeToggle<CR>
