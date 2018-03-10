" Delete whitespace
autocmd BufWritePre * :%s/\s\+$//e

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
