set nocompatible
filetype plugin indent on
syntax enable
let mapleader=' ' " Map leader key to be space
set autoread autowriteall
set backspace=indent,eol,start
set encoding=utf-8
set foldcolumn=1 nofoldenable
set guifont=Monaco:h12
set hidden
set history=1000
set ignorecase smartcase incsearch
set list listchars=tab:→\ ,extends:›,precedes:‹,nbsp:·,trail:␣ showbreak=↪\
set mouse=a ttymouse=xterm2 " Allows for mouse mode inside tmux
set noswapfile
set number
set path+=**
set showcmd " display incomplete commands
set textwidth=78 colorcolumn=+1
set timeoutlen=1000 ttimeoutlen=0
set wildignore+=*node_modules/*
set wildmenu wildmode=list:longest
set tags^=./.git/tags;
set statusline+=%F

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
			\ | Plug 'honza/vim-snippets'
			\ | Plug 'mlaursen/vim-react-snippets'
			\ " {{{
	let g:snips_author='joshualim'
	let g:UltiSnipsEditSplit='vertical' " :UltiSnipsEditSplit vertically
	let g:UltiSnipsExpandTrigger='<TAB>'
	let g:UltiSnipsJumpBackwardTrigger='<S-TAB>'
	let g:UltiSnipsJumpForwardTrigger='<TAB>'
	let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

	command! UltiSnipsList call UltiSnips#ListSnippets()
" }}}
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benmills/vimux' "{{{
	nnoremap <Leader>vp :VimuxPromptCommand<CR>
	nnoremap <Leader>vl :VimuxRunLastCommand<CR>
	nnoremap <Leader>vi :VimuxInspectRunner<CR>
	nnoremap <Leader>vq :VimuxCloseRunner<CR>
	nnoremap <Leader>vx :VimuxInterruptRunner<CR>
	nnoremap <Leader>vz :call VimuxZoomRunner()<CR>
" }}}
Plug 'christoomey/vim-titlecase' " {{{
	let g:titlecase_map_keys=0
	nmap <Leader>gt  <Plug>Titlecase
	vmap <Leader>gt  <Plug>Titlecase
	nmap <Leader>gtt <Plug>TitlecaseLine
" }}}
Plug 'christoomey/vim-tmux-navigator'
Plug 'ciaranm/detectindent' " {{{
	autocmd BufReadPost * :DetectIndent
" }}}
Plug 'digitaltoad/vim-pug'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " {{{
	let g:go_fmt_command='goimports'
	let g:go_metalinter_autosave=1
" }}}
Plug 'joshualim92/vim-colors-off'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " {{{
	nnoremap <silent> <Leader>f     :Files<CR>
	nnoremap <silent> <Leader>b     :Buffers<CR>

	command! -bang -nargs=* Rgh call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({ 'dir': expand('%:h') }), <bang>0)

	nnoremap <Leader>rgg             :Rg<Space>
	nnoremap <Leader>rgh            :Rgh<Space>
	xnoremap <silent> <Leader>rg    y:Rg <C-R>"<CR>

	nnoremap <silent> <Leader>`     :Marks<CR>
	nnoremap <silent> <Leader>af    :call fzf#vim#files('.', {'options':'--query ' . split(expand("%:t"), '\.')[0]})<CR>
" }}}
Plug 'markonm/traces.vim'
Plug 'mbbill/undotree' " {{{
	nnoremap <Leader>u :UndotreeToggle<CR>
" }}}
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', { 'do': 'npm install -g vls', 'branch': 'release' } " {{{
	nmap <Leader>gd <Plug>(coc-definition)
	nmap <Leader>gi <Plug>(coc-implementation)
	nmap <Leader>gr <Plug>(coc-references)
	nmap <Leader>gy <Plug>(coc-type-definition)
	nmap <Leader>rn <Plug>(coc-rename)

	let g:coc_global_extensions = [
				\ 'coc-css',
				\ 'coc-elixir',
				\ 'coc-eslint',
				\ 'coc-git',
				\ 'coc-go',
				\ 'coc-html',
				\ 'coc-json',
				\ 'coc-prettier',
				\ 'coc-pyright',
				\ 'coc-snippets',
				\ 'coc-solargraph',
				\ 'coc-tsserver',
				\ 'coc-ultisnips',
				\ 'coc-vetur'
				\]
" }}}
Plug 'posva/vim-vue'
Plug 'octref/RootIgnore'
Plug 'robertmeta/nofrils' " {{{
	let g:nofrils_heavycomments=1
	let g:nofrils_strbackgrounds=1
" }}}
Plug 'roxma/vim-window-resize-easy'
Plug 'scrooloose/nerdtree' " {{{
	let NERDTreeAutoDeleteBuffer=1
	let NERDTreeHijackNetrw=0
	let NERDTreeMapHelp='<LocalLeader>?'
	let NERDTreeQuitOnOpen=1

	nnoremap <Leader>nt :NERDTreeToggle<CR>
	nnoremap <Leader>nf :NERDTreeFind<CR>
" }}}
Plug 'sheerun/vim-polyglot'
Plug 'shime/vim-livedown', {
			\ 'for': 'markdown',
			\ 'do': 'npm install -g livedown'
			\}
Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim' " {{{
	command! -range C <line1>,<line2>TComment
" }}}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive' " {{{
	nnoremap <silent> <Leader>gs :Gstatus<CR>
" }}}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/tango.vim'

call plug#end()

colorscheme nofrils-dark
" Show error for git commit messages
hi def link gitcommitOverflow     Error

if g:colors_name == 'nofrils-dark'
	hi Character ctermfg=darkgreen ctermbg=NONE
	hi Comment ctermfg=blue ctermbg=NONE
	hi Constant ctermfg=darkred ctermbg=NONE
	hi Normal ctermbg=NONE
	hi String ctermfg=darkgreen ctermbg=NONE

	hi link diffAdded         DiffAdd
	hi link diffRemoved       DiffDelete
endif
if g:colors_name == 'nofrils-light'
	hi Character ctermfg=darkgreen ctermbg=NONE
	hi Comment ctermfg=blue ctermbg=NONE
	hi Constant ctermfg=darkred ctermbg=NONE
	hi LineNr ctermbg=NONE
	hi Normal ctermbg=NONE
	hi SpecialKey ctermbg=NONE
	hi String ctermfg=darkgreen ctermbg=NONE

	hi link diffAdded         DiffAdd
	hi link diffRemoved       DiffDelete
endif
nnoremap <Leader>tcs :call ToggleColor()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Cursorshape                                 "
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Command-line mode                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" Quickly expand current file name
cnoremap <C-R>fn <C-R>=expand('%')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Search                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader><Space> :set hls!<CR>
nnoremap <silent> # :set hls<CR>#
nnoremap <silent> * :set hls<CR>*
nnoremap <silent> ? :set hls<CR>?
nnoremap <silent> / :set hls<CR>/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  QuickFix                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
	let curqfidx = line('.') - 1
	let qfall = getqflist()
	call remove(qfall, curqfidx)
	call setqflist(qfall, 'r')
	execute curqfidx + 1 . "cfirst"
	:copen
endfunction
command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Defaults                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * :%s/\s\+$//e " Delete whitespace

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Whitespace Width                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! GetWidth call GetWidth()
function! GetWidth ()
	echo 'ts:' &ts 'sts:' &sts 'sw:' &sw 'expandtab:' &et
endfunction

command! -nargs=1 SetWidth call SetWidth(<f-args>)
function! SetWidth (width)
	let &l:ts  = a:width
	let &l:sts = a:width
	let &l:sw  = a:width
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Scripts                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! UpPlug call UpdatePlugins()
function! UpdatePlugins ()
	PlugUpgrade
	PlugClean
	PlugInstall
	PlugUpdate
endfunction

" Delete buffer but leave windows
command! BD bn | bd#

" Map open command
nnoremap <Leader>os :!open -a Safari<CR><CR>
nnoremap <Leader>og :!open https://google.com<CR><CR>

function! ToggleColor ()
	let color_name = g:colors_name == "nofrils-dark" ? "gruvbox" : "nofrils-dark"
	execute "colorscheme " . color_name
endfunction
