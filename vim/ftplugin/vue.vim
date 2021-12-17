runtime! ftplugin/javascript.vim

nnoremap <buffer> <LocalLeader>class ^idiv(class="<Esc>A")<Esc>:s/\./ /g<CR>:s/\" /"/<CR>
