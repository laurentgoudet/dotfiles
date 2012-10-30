" My VIM config
" Vrygoud <vrygoud@gmail.com>
set nocompatible

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
runtime bundle/vim-pathogen/autoload/pathogen.vim " allow Pathogen to be a submodule
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on       " enable detection, plugins and indenting in one step
syntax on

" Change the mapleader from \ to , (AZERTY keyboard!)
let mapleader=","

set viminfo='20,\"500,h
set history=500

" set backspace to be able to delete previous characters???Enable line numbering, taking up 6 spaces
set bs=2
set number
"set numberwidth=1
set tabpagemax=20
set wildmode=longest,list
set wildignore+=*.o,*.obj,*.git,*.class,*.png,*.dex,*.apk,*.dex,*.d,*.ap_,*.jar,*.pcap

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
set ignorecase    " use case-insensitive search by default
set smartcase     " case-sensitive search if at least one capital letter

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

" Enable indent folding
" set foldenable
" set fdm=indent

" Set space to toggle a fold
nnoremap <space> za

" Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

" Have 3 lines of offset (or buffer) when scrolling
set scrolloff=5
set sidescrolloff=6
"set scrolljump=3

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

" Windows's style copy-and-paste
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" X Window paste at mouse position and not cursor position
nnoremap <MiddleMouse> <LeftMouse><MiddleMouse>

" NERDTree settings {{{
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" No cursor line
let NERDTreeHighlightCursorline=0

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Use old-school look of directory nodes
let NERDTreeDirArrows=0

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' , '^\.svn$' ]

" }}}

" Solarise settings {{{
"colorscheme solarized-white
call togglebg#map("")          " Load the ToggleBG pluggin with default mapping (<F5>)
if !has("gui_running")
  set t_Co=256
else
  set background=light         " Default to light theme with GUI
endif
"let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized-white
"}}}

" SuperTab settings {{{
"let g:SuperTabDefaultCompletionType = "context"
"}}}

" DirDiff settings {{{
if &diff
  call DirDiff("A","B")
endif
let g:DirDiffExcludes = ".svn,.git,*.class,*.exe,.*.swp"
let g:DirDiffWindowSize = 10 
"}}}

" Disable arrow keys to stay on the home row {{{
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
"}}}

" Write a file as root from non-root Vim
cmap W w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Taglist
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1    " exit if taglist is last window open
let Tlist_Show_One_File = 1      " Only show tags for current buffer
let Tlist_Use_Right_Window = 0   " Open on right side
let Tlist_Enable_Fold_Column = 0 " no fold column (only showing one file)
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'
if !has("gui_running")
  let Tlist_Inc_Winwidth=0       " for konsole
endif
