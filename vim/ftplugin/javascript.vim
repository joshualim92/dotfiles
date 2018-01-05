" Tern
let g:tern_map_keys=1 "enable keyboard shortcuts
let g:tern_show_argument_hints='on_hold' "show argument hints

" vim-jsdoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1

" Cleanup mocha test file of .only
command! -buffer CleanUpTest %s/.only(/(/g
" Remove \" in JSON keys and convert \" to \' in values
command! -buffer -range ConvJsonKey :silent
			\ <line1>,<line2>s/"\(\w\+\)":/\1:/g
			\| <line1>,<line2>s/"/'/g

" Add .only to mocha test
nnoremap <buffer> <LocalLeader>only ?\(it\\|describe\)('<CR>f(i.only<ESC><C-O>:w<CR>

" Run nodemon npm t in vimux
nnoremap <buffer> <LocalLeader>vpnt :VimuxPromptCommand<CR>nodemon -x "npm t"<CR>

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

nnoremap <buffer> <Leader>oae :call OpenAlternateFile("e")<CR>
nnoremap <buffer> <Leader>oas :call OpenAlternateFile("sp")<CR>
nnoremap <buffer> <Leader>oav :call OpenAlternateFile("vs")<CR>
