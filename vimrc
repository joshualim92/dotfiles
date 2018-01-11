let mapleader=' ' " Map leader key to be space
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               START VIM-PLUG                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " {{{
	let g:UltiSnipsExpandTrigger='<tab>'
	let g:UltiSnipsJumpForwardTrigger='<tab>'
	let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
	let g:UltiSnipsEditSplit='vertical' " :UltiSnipsEditSplit vertically

	command! UltiSnipsList call UltiSnips#ListSnippets()
" }}}
Plug 'Valloric/YouCompleteMe', {
			\ 'do': './install.py --go-completer --js-completer'
			\} " {{{

	let g:ycm_key_list_select_completion=['<C-N>']
	let g:ycm_key_list_previous_completion=['<C-P>']
" }}}
Plug 'airblade/vim-gitgutter' " {{{
" }}}
Plug 'benmills/vimux' "{{{
	nnoremap <Leader>vp :VimuxPromptCommand<CR>
	nnoremap <Leader>vl :VimuxRunLastCommand<CR>
	nnoremap <Leader>vi :VimuxInspectRunner<CR>
	nnoremap <Leader>vq :VimuxCloseRunner<CR>
	nnoremap <Leader>vx :VimuxInterruptRunner<CR>
	nnoremap <Leader>vz :call VimuxZoomRunner()<CR>
" }}}
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ciaranm/detectindent' " {{{
	autocmd BufReadPost * :DetectIndent
" }}}
Plug 'ervandew/supertab' " {{{
	let g:SuperTabDefaultCompletionType='<C-N>'
" }}}
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep' " {{{
	let g:rg_highlight=1
	nnoremap <Leader>rg :Rg<Space>
" }}}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " {{{
	nnoremap <silent> <Leader>f     :Files<CR>
	nnoremap <silent> <Leader>b     :Buffers<CR>
	nnoremap <Leader>ag             :Ag<Space>
	xnoremap <silent> <Leader>ag    y:Ag <C-R>"<CR>
	nnoremap <silent> <Leader>`     :Marks<CR>
" }}}
Plug 'luochen1990/rainbow' " {{{
	let g:rainbow_active=0
	nnoremap <Leader>rt :RainbowToggle<CR>
" }}}
Plug 'mbbill/undotree' " {{{
	nnoremap <Leader>u :UndotreeToggle<CR>
" }}}
Plug 'octref/RootIgnore'
Plug 'roxma/vim-window-resize-easy'
Plug 'sheerun/vim-polyglot'
Plug 'shime/vim-livedown', {
			\ 'for': 'markdown',
			\ 'do': 'npm install -g livedown'
			\}
Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' " {{{
	nnoremap <silent> <Leader>gs :Gstatus<CR>
" }}}
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/ZoomWin'
Plug 'w0rp/ale' " {{{
	let g:ale_fixers = {
				\ 'javascript': ['prettier', 'eslint'],
				\ 'json': ['prettier', 'eslint']
				\}
" }}}

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                END VIM-PLUG                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               START SETTINGS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on
syntax enable
set autoread autowriteall
set backspace=indent,eol,start
set encoding=utf-8
set foldcolumn=1 nofoldenable
set guifont=Monaco:h13
set hidden
set history=1000
set ignorecase smartcase incsearch
set list listchars=tab:→\ ,extends:›,precedes:‹,nbsp:·,trail:␣ showbreak=↪\
set mouse=a ttymouse=xterm2 " Allows for mouse mode inside tmux
set number relativenumber
set path+=**
set scrolloff=5 "Min number of lines to keep above and below cursor
set showcmd " display incomplete commands
set textwidth=78 colorcolumn=+1
set timeoutlen=1000 ttimeoutlen=0
set wildignore+=*node_modules/*
set wildmenu wildmode=list:longest

if filereadable(expand("~/dotfiles/vim/colorscheme.vim"))
	let base16colorspace=256 " Access colors present in 256 colorspace
	source ~/dotfiles/vim/colorscheme.vim
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                END SETTINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               START MAPPINGS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set nohlsearch before starting next search
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
inoremap <C-U> <C-G>u<C-U>
nnoremap / :set nohlsearch<CR>/
nnoremap <Leader><Space> :set hls!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                END MAPPINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             START CURSOR SHAPE                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty($TMUX)
	let &t_SI="\<Esc>]50;CursorShape=1\x7"
	let &t_EI="\<Esc>]50;CursorShape=0\x7"
	let &t_SR="\<Esc>]50;CursorShape=2\x7"
else
	let &t_SI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	let &t_SR="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" CursorLine
augroup CursorLine
	au!
	nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
	let s:ftToIgnore = ["ruby"]
	au VimEnter,WinEnter,BufWinEnter * if index(s:ftToIgnore, &ft) < 0
				\ | setlocal cursorline cursorcolumn
	au WinLeave * setlocal nocursorline nocursorcolumn
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              END CURSOR SHAPE                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup MakeLoadView
	au!
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
augroup END

" Delete whitespace
autocmd BufWritePre * :%s/\s\+$//e
