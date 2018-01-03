" ============================================================================
" START VIM-PLUG
" ============================================================================
call plug#begin('~/.vim/plugged')

" Editing
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe',
            \ {'do': './install.py --go-completer --js-completer' }
Plug 'jiangmiao/auto-pairs'
Plug 'roxma/vim-window-resize-easy'
Plug 'terryma/vim-multiple-cursors'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript'], 'do': 'npm install'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth' "{{{
    let g:sleuth_automatic=0
"}}}

Plug 'tpope/vim-surround'

" Linting
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'

" Browsing
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
Plug 'vim-scripts/gitignore'

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

augroup load_sleuth
    autocmd!
    autocmd InsertEnter * :Sleuth | autocmd! load_sleuth
augroup END

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
set shell=/bin/bash\ -l

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
set wildmode=list:full
set scrolloff=5 "Min number of lines to keep above and below cursor
set showcmd " display incomplete commands
set colorcolumn=+1
let g:rainbow_active=1
nnoremap <Leader>rt :RainbowToggle<CR>
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" :find
set path+=**
set wildignore+=*node_modules/*,*.git/*

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
let g:airline_extensions=['ale', 'tabline']
let g:airline_theme='base16'

" Set tmuxline preset
let g:tmuxline_preset='full'

" Ale
let g:ale_fixers = {
            \ 'javascript': ['prettier', 'eslint'],
            \ 'json': ['prettier', 'eslint']
            \ }

" vim-ripgrep
let g:rg_highlight=1
nnoremap <Leader>rg :Rg<Space>

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

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

" Fugitive
nnoremap <silent> <Leader>gs :Gstatus<CR>

" FZF
nnoremap <silent> <Leader>f     :Files<CR>
nnoremap <silent> <Leader>b     :Buffers<CR>
nnoremap <Leader>ag             :Ag<Space>
xnoremap <silent> <Leader>ag    y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`     :Marks<CR>

augroup filetype_javascript
    " Tern
    let g:tern_map_keys=1 "enable keyboard shortcuts
    let g:tern_show_argument_hints='on_hold' "show argument hints

    " vim-jsdoc
    let g:jsdoc_allow_input_prompt = 1
    let g:jsdoc_input_description = 1
    let g:jsdoc_enable_es6 = 1

    " Cleanup mocha test file of .only
    command! CleanUpTest %s/.only(/(/g
    " Remove \" in JSON keys and convert \" to \' in values
    command! -range ConvJsonKey :silent
                \ <line1>,<line2>s/"\(\w\+\)":/\1:/g | <line1>,<line2>s/"/'/g

    " Add .only to mocha test
    au FileType javascript nnoremap <buffer>
                \ <LocalLeader>only
                \ ?\(it\\|describe\)('<CR>f(i.only<ESC><C-O>:w<CR>

    " Run nodemon npm t in vimux
    au FileType javascript nnoremap <buffer>
                \ <LocalLeader>vpnt
                \ :VimuxPromptCommand<CR>nodemon -x "npm t"<CR>

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

    au FileType javascript nnoremap <buffer>
                \ <Leader>oae :call OpenAlternateFile("e")<CR>
    au FileType javascript nnoremap <buffer>
                \ <Leader>oas :call OpenAlternateFile("sp")<CR>
    au FileType javascript nnoremap <buffer>
                \ <Leader>oav :call OpenAlternateFile("vs")<CR>
augroup END
