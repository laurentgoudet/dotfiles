" My VIM config
" Chris Goudet <me@chrisgoudet.com>
set nocompatible

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
runtime bundle/pathogen/autoload/pathogen.vim " allow Pathogen to be a submodule
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
set wildignore+=*.o,*.obj,*.git,*.class,*.png,*.dex,*.apk,*.dex,*.d,*.ap_,*.jar,*.pcap,*/i686*

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
" Flag problematic whitespace (trailing and spaces before tabs)
" Use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

" indent depends on filetype
filetype indent on
filetype plugin indent on

" Shortcut to auto indent entire file
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

"""""""""""""""""""""""""""""""
" SEARCH
set incsearch     " incremental search
set ignorecase    " use case-insensitive search by default
set smartcase     " case-sensitive search if at least one capital letter
set hlsearch      " highlight search results

" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

""""""""""""""""""""""""""""""""
" Informative status line
"set statusline=%-3.3n\ %t\ %h%m%r%w\[%{strlen(&ft)?&ft:'none'},%{&encoding},%{&fileformat}]\ %=%-14.(%l,%c%V%)\ %<%P
" Status line now handled by Powerline
set laststatus=2

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
"nmap <C-V> "+gP
"imap <C-V> <ESC><C-V>i
"vmap <C-C> "+y

" X Window paste at mouse position and not cursor position
nnoremap <MiddleMouse> <LeftMouse><MiddleMouse>

" NERDTree settings {{{
nnoremap <silent> <F7> :NERDTreeToggle<CR>

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
	    \ '\.o$', '\.so$', '\.egg$', '^\.git$' , '^\.svn$' ]

" }}}

" Solarise settings {{{
"colorscheme solarized-white
call togglebg#map("")          " Load the ToggleBG pluggin with default mapping (<F5>)
if !has("gui_running")
  set t_Co=256
else
  set background=light         " Default to light theme with GUI
  set guifont=Monospace\ 9
endif
"let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme github
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
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>
"}}}

" Allow saving of files as sudo when I forgot to start vim using sudo.
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Taglist
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1    " exit if taglist is last window open
let Tlist_Show_One_File = 0      " Only show tags for current buffer
let Tlist_Use_Right_Window = 1   " Open on right side
let Tlist_Enable_Fold_Column = 0 " no fold column (only showing one file)
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'
if !has("gui_running")
  let Tlist_Inc_Winwidth=0       " for konsole
endif

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

" Remove all trailing whitespace
nnoremap <silent> <F5> :let w:winview = winsaveview()<Bar>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>call winrestview(w:winview)<CR>
nnoremap <silent> <F6> :set list!<CR>

" Toggle line numbers
nnoremap <leader>ln :setlocal number!<CR>
" Toggle paste mode
nnoremap <leader>pm :set paste!<CR>
" Toggle wrap mode
nnoremap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

"""""""""""""""""""""""""""""""
" BUFFER NAVIGATION
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
 " :nnoremap <leader>l :ls<cr>:b<space>
""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" CODING STYLE
nnoremap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nnoremap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nnoremap <leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nnoremap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

""""""""""""""""""""""""""""""""

" FILE EXPLORER
""
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_dotfiles = 1

