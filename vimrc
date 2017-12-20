" ============================================================================
" START VIM-PLUG
" ============================================================================
call plug#begin('~/.vim/plugged')

" Editing
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'roxma/vim-window-resize-easy'
Plug 'terryma/vim-multiple-cursors'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript'], 'do': 'npm install'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

function! BuildYCM(info)
        if a:info.status == 'installed' || a:info.force
                !./install.py --clang-completer --tern-completer
        endif
endfunction
Plug 'Valloric/YouCompleteMe',
            \ { 'for': ['javascript', 'c', 'cpp'],
            \ 'do': function('BuildYCM')  }

" Linting
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'

" Browsing
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'mbbill/undotree'
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }

" Themes
Plug 'chriskempson/base16-vim'

" UI
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/ZoomWin'

" Syntax
Plug 'heavenshell/vim-jsdoc'
Plug 'jelera/vim-javascript-syntax'
Plug 'sheerun/vim-polyglot'

" Tmux
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()
" ============================================================================
" END VIM-PLUG
" ============================================================================

set nocompatible
filetype plugin indent on
syntax enable
set timeoutlen=1000 ttimeoutlen=0
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark
set encoding=utf-8
set hidden
set history=1000
set autoread
set autowriteall
set guifont=Monaco:h13

" Use up and down for command-line history as they search on partial matches
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" Move backup, swap, and undo files in separate directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Map leader key to be space
let mapleader=' '

" Set <C-U> to be undo during insert mode
inoremap <C-U> <C-G>u<C-U>
nnoremap <Leader>u :UndotreeToggle<CR>

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set mouse mode on
set ttymouse=xterm2 " Allows for mouse mode inside tmux
set mouse=a

" Spaces & Tabs
" tabstop, softabstop, shiftwidth can be configured 'locally'
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set smarttab
set expandtab " tabs are spaces
set smartindent
set autoindent
set textwidth=78

" UI Config
set number " show line numbers
set relativenumber
set wildmenu " visual autocomplete for command menu
set scrolloff=5 "Min number of lines to keep above and below cursor
set showcmd " display incomplete commands
set colorcolumn=+1
hi MatchParen cterm=underline ctermbg=NONE
let g:rainbow_active=1

if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" Following highlight changes are because delek doesn't work well with iterm2
" material-design-colors
" if g:colors_name == 'delek'
"     hi Search cterm=reverse ctermbg=LightBlue
"     hi Folded cterm=standout ctermbg=White
"     hi ColorColumn ctermbg=237
"     " Diff colors
"     hi DiffAdd ctermfg=15 ctermbg=28
"     hi DiffChange ctermfg=15 ctermbg=18
"     hi DiffDelete ctermfg=15 ctermbg=124
"     hi DiffText ctermfg=15 ctermbg=0
"     " Statusline colors
"     hi StatusLine ctermfg=NONE ctermbg=234
"     hi WildMenu ctermbg=121
" endif

" :find
set path+=**

" Searching
set ignorecase
set incsearch
" Set nohlsearch before starting next search
nnoremap / :set nohlsearch<CR>/
" Toggle hlsearch
nnoremap <Leader><space> :set hls!<CR>

" Folding
set foldmethod=indent " fold-method to follow indents
set foldlevel=99 " open with folds open
set foldminlines=0 " allows for folding of single lines

" Delete whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Set airline theme
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'

" Set tmuxline preset
let g:tmuxline_preset='full'

" Ale
let g:ale_fixers = {
            \ 'javascript': ['prettier', 'eslint'],
            \ 'json': ['prettier', 'eslint']
            \ }

" Ack.vim
if executable('ag')
    let g:ackprg='ag --vimgrep' " Ack default use ag if possible
endif
" Map Ack.vim
nnoremap <Leader>ak :Ack!<Space>

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

" Tern
let g:tern_map_keys=1 "enable keyboard shortcuts
let g:tern_show_argument_hints='on_hold' "show argument hints

" Make YouCompleteMe compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion=['<C-N>']
let g:ycm_key_list_previous_completion=['<C-P>']
let g:SuperTabDefaultCompletionType='<C-N>'

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
let g:UltiSnipsEditSplit='vertical' " :UltiSnipsEditSplit vertically

" Vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

" Git
au BufNewFile,BufRead ~/dotfiles/git/* setf gitconfig

" FZF
nnoremap <silent> <Leader>f     :Files<CR>
nnoremap <silent> <Leader>b     :Buffers<CR>
nnoremap <Leader>ag             :Ag<Space>
xnoremap <silent> <Leader>ag    y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`     :Marks<CR>

" Javascript
" Cleanup mocha test file of .only
command! CleanUpTest %s/.only(/(/g
" Remove \" in JSON keys and convert \" to \' in values
command! -range ConvJsonKey :silent
            \ <line1>,<line2>s/"\(\w\+\)":/\1:/g | <line1>,<line2>s/"/'/g
" Add .only to mocha test
nnoremap <LocalLeader>only ?\(it\\|describe\)('<CR>f(i.only<ESC><C-O>:w<CR>
" Run nodemon npm t in vimux
nnoremap <LocalLeader>vpnt :VimuxPromptCommand<CR>nodemon -x "npm t"<CR>

" vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1

" Functions
function! OpenAlternateFile (command)
    let command = a:command . " "
    let file_path = expand("%")
    let file_path_parts = split(file_path, "/")

    if file_path_parts[0] == "test"
        execute command . join(file_path_parts[1:], "/")
    elseif file_path_parts[0] == "src"
        execute command . "test/" . join(file_path_parts[1:], "/")
    else
        execute command . "test/" . file_path
    endif
endfunction
nnoremap <Leader>oae :call OpenAlternateFile("e")<CR>
nnoremap <Leader>oas :call OpenAlternateFile("sp")<CR>
nnoremap <Leader>oav :call OpenAlternateFile("vs")<CR>
