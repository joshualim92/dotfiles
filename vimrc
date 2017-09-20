set nocompatible
filetype plugin indent on
syntax enable
colorscheme delek
set encoding=utf-8
set hidden
set history=1000
set autoread

" Map leader key to be space
let mapleader=' '

" Set <C-U> to be undo during insert mode
inoremap <C-U> <C-G>u<C-U>

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
" Set MatchParen to be reverse instead of color=6
hi MatchParen cterm=reverse

" Following highlight changes are because delek doesn't work well with iterm2
" material-design-colors
if g:colors_name == 'delek'
    hi Search cterm=reverse ctermbg=LightBlue
    hi Folded cterm=standout ctermbg=White
    hi ColorColumn ctermbg=237
    " Diff colors
    hi DiffAdd cterm=reverse ctermfg=121 ctermbg=NONE
    hi DiffChange ctermbg=NONE
    hi DiffDelete ctermbg=9
    " Statusline colors
    hi StatusLine ctermfg=NONE ctermbg=234
    hi WildMenu ctermbg=121
endif

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
set foldmethod=indent " fold-method to follow indents
set foldlevel=99 " open with folds open
set foldminlines=0 " allows for folding of single lines
nnoremap <tab> za
nnoremap <S-tab> zA

" Delete whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Set airline theme
let g:airline_theme='base16color'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'

" Set tmuxline preset
let g:tmuxline_preset='full'

" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'

" Ack.vim
if executable('ag')
    let g:ackprg='ag --vimgrep' " Ack default use ag if possible
endif
" Map Ack.vim
nnoremap <Leader>a :Ack!<Space>

" NERDTree
nmap <leader>nt :NERDTreeToggle<CR>

" Tern
let g:tern_map_keys=1 "enable keyboard shortcuts
let g:tern_show_argument_hints='on_hold' "show argument hints

" Better Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle " Load on start
" Load if syntax is enabled
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

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
