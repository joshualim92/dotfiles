set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Tern
let g:tern_map_keys=1 "enable keyboard shortcuts
let g:tern_show_argument_hints='on_hold' "show argument hints

" Cleanup mocha test file of .only
command! -buffer CleanUpTest %s/\.only(/(/g
" Remove \" in JSON keys and convert \" to \' in values
command! -buffer -range ConvJsonKey :silent
			\ <line1>,<line2>s/"\(\w\+\)":/\1:/g
			\| <line1>,<line2>s/"/'/g

" Split commas into new lines
nnoremap <buffer> <LocalLeader>split :s/, /,\r  /g<CR>

" Add .only to test
nnoremap <buffer> <LocalLeader>only ?^\s\+\(it\\|describe\\|test\)(<CR>f(i.only<ESC><C-O>:w<CR>

" Add async to function
nnoremap <buffer> <LocalLeader>async ?([^(.]*) =><CR>iasync <ESC><C-O>

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
