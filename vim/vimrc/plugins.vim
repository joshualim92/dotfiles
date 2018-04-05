call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " {{{
	let g:snips_author='joshualim'
	let g:UltiSnipsExpandTrigger='<TAB>'
	let g:UltiSnipsJumpForwardTrigger='<TAB>'
	let g:UltiSnipsJumpBackwardTrigger='<S-TAB>'
	let g:UltiSnipsEditSplit='vertical' " :UltiSnipsEditSplit vertically
	let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

	command! UltiSnipsList call UltiSnips#ListSnippets()
" }}}
Plug 'Valloric/YouCompleteMe', {
			\ 'do': './install.py --go-completer --js-completer'
			\} " {{{
	let g:ycm_autoclose_preview_window_after_insertion=1
	let g:ycm_key_list_select_completion=['<C-N>']
	let g:ycm_key_list_previous_completion=['<C-P>']
" }}}
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux' "{{{
	nnoremap <Leader>vp :VimuxPromptCommand<CR>
	nnoremap <Leader>vl :VimuxRunLastCommand<CR>
	nnoremap <Leader>vi :VimuxInspectRunner<CR>
	nnoremap <Leader>vq :VimuxCloseRunner<CR>
	nnoremap <Leader>vx :VimuxInterruptRunner<CR>
	nnoremap <Leader>vz :call VimuxZoomRunner()<CR>
" }}}
Plug 'chriskempson/base16-vim'
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
Plug 'ervandew/supertab' " {{{
	let g:SuperTabDefaultCompletionType='<C-N>'
" }}}
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'joshualim92/vim-colors-off'
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
Plug 'mbbill/undotree' " {{{
	nnoremap <Leader>u :UndotreeToggle<CR>
" }}}
Plug 'octref/RootIgnore'
Plug 'othree/javascript-libraries-syntax.vim' " {{{
	let g:used_javascript_libs='underscore,react,vue'
" }}}
Plug 'posva/vim-vue' " {{{
	let g:vue_disable_pre_processors=1
" }}}
Plug 'qpkorr/vim-bufkill' " {{{
	let g:BufKillCreateMappings=0
" }}}
Plug 'roxma/vim-window-resize-easy'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } " {{{
	let NERDTreeAutoDeleteBuffer=1
	let NERDTreeHijackNetrw=0
	let NERDTreeMapHelp='<LocalLeader>?'

	nnoremap <Leader>nt :NERDTreeToggle<CR>
	nnoremap <Leader>nf :NERDTreeFind<CR>
" }}}
Plug 'sheerun/vim-polyglot'
Plug 'shime/vim-livedown', {
			\ 'for': 'markdown',
			\ 'do': 'npm install -g livedown'
			\}
Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary' " {{{
	command! -range C <line1>,<line2>Commentary
" }}}
Plug 'tpope/vim-fugitive' " {{{
	nnoremap <silent> <Leader>gs :Gstatus<CR>
" }}}
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'w0rp/ale' " {{{
	let g:ale_fixers={
				\ 'javascript': ['prettier', 'eslint'],
				\ 'typescript': ['tslint'],
				\ 'json': ['prettier', 'eslint']
				\}
" }}}

call plug#end()

colorscheme off
