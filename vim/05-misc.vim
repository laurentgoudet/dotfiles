" Allow saving of files as sudo when I forgot to start vim using sudo.
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" show git diff in vsplit with git commit
autocmd FileType gitcommit DiffGitCached | wincmd L | wincmd p

" strip trailing whitespace on save, in python
autocmd FileType c,cpp,python,ruby,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

" Autocorrect words / spelling mistakes
iab teh the
iab Teh The

" Move a file within Vim
" Still need to be fixed
function! MoveFile(newspec)
     let old = expand('%')
     if (old == a:newspec)
	 return 0
     endif
     exe 'sav' fnameescape(a:newspec)
     call delete(old)
endfunction
command! -nargs=1 -complete=file -bar M call MoveFile('<args>')

if has("mouse")
  set mouse=a
endif

