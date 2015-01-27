nnoremap <silent> <F7> :NERDTreeFind<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=0

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0

" No cursor line
let NERDTreeHighlightCursorline=0

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=1

" Use old-school look of directory nodes
let NERDTreeDirArrows=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
	  \ '\.o$', '\.so$', '\.egg$', '^\.git$' , '^\.svn$', '^\cscope.files$',
    \ '\cscope.in.out$', '\cscope.out$', '\cscope.po.out$']

