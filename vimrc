" General
set nocompatible

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
runtime bundle/vim-pathogen/autoload/pathogen.vim " Allow Pathogen to be a submodule
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on       " enable detection, plugins and indenting in one step
syntax on

set viminfo='20,\"500,h
set history=500
set shortmess=filnxtToOI

" set backspace to be able to delete previous characters???Enable line numbering, taking up 6 spaces
set bs=2
set number
"set numberwidth=1
set tabpagemax=20
set wildmode=longest,list

" Turn off word wrapping
set wrap!

" Turn on smart indent
set autoindent
set smartindent
set cindent
" set tab character to 2 characters
set tabstop=2
" turn tabs into whitespace
set expandtab
set smarttab
" indent width for autoindent
set shiftwidth=2
set softtabstop=2
" Special chars
" set listchars=nbsp:_,tab:,trail:.
"set list
"set listchars=tab:__,trail:.

" indent depends on filetype
filetype indent on 
filetype plugin indent on 

" Shortcut to auto indent entire file
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

" Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

" Informative status line
set statusline=%-3.3n\ %t\ %h%m%r%w\[%{strlen(&ft)?&ft:'none'},%{&encoding},%{&fileformat}]\ %=%-14.(%l,%c%V%)\ %<%P

" Keyboard / Mouse
set backspace=indent,eol,start
set mouse=ar
set selection=inclusive
set virtualedit=block,onemore

" Open / Save
set fileencodings=ucs-bom,utf-8,latin1
set nobackup
set noswapfile
set autowrite
autocmd BufRead * try | cd- | catch | endtry

" Set color scheme
syntax on
colorscheme default
" Enable indent folding
" set foldenable
" set fdm=indent

" Set space to toggle a fold
nnoremap <space> za

" Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

" Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3
set sidescrolloff=6
set scrolljump=3

" Views / Sessions
set viewoptions=folds,cursor
autocmd BufWinEnter * try | loadview | catch | endtry
set sessionoptions=blank,buffers,curdir,folds,help,options,resize,tabpages,winsize

" Diff
set diffopt=filler,vertical

" Highlight search
set hlsearch
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Clipboard
set clipboard=autoselect
" Misc
set showmatch
set matchtime=15
set startofline
" Shell
set noshelltemp

"Macros
map <C-F5>   :Printcheader<CR><RETURN>
map <C-F6>   :Printfheader<CR><RETURN>
map <C-F7>   :Printhheader<CR><RETURN>
map <C-F8>   :Printmheader<CR><RETURN>

" Defines Tab Hot Key
map <A-up> <ESC>:tabnew<RETURN>
imap <A-up> <ESC>:tabnew<RETURN><INSERT>
map <A-right> <ESC>:tabnext<RETURN>
imap <A-right> <ESC>:tabnext<RETURN><INSERT>
map <A-left> <ESC>:tabprevious<RETURN>
imap <A-left> <ESC>:tabprevious<RETURN><INSERT>
map <A-down> <ESC>:tabclose<RETURN>
imap <A-down> <ESC>:tabclose<RETURN><INSERT>

imap <A-e>      <Esc>:ls<CR>:e#
map  <A-e>       :ls<CR>:e#

imap <M-tab>    <C-V><C-I>
map <M-tab>     <ESC><C-V><C-I><insert>

imap <tab>      <Esc>==<insert>
map  <tab>      <Esc>==

" Load local cscope db if exists
if filereadable( expand("$PWD/tags") )
set tags=tags
elseif filereadable( expand("$ROOT/ctags.out") )
   set tags=$ROOT/ctags.out
endif
set guioptions-=T


" NERDTree settings {{{
" Put focus to the NERD Tree with F3 (tricked by quickly closing it and
" immediately showing it again, since there is no :NERDTreeFocus command)
nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

" }}}




