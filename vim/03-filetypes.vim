" Add spell checking and automatic wrapping at the recommended 72 columns
" to commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72 formatoptions+=t

" Correct JSON file type
autocmd BufRead,BufNewFile *.json set filetype=json

" 80 characters column
autocmd Filetype javascript set colorcolumn=80

" HTML files should have 4 spaces indentation
autocmd FileType html setlocal shiftwidth=4 tabstop=4
