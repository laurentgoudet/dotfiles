" enable detection, plugins and indenting
filetype plugin indent on
syntax on

if !has("gui_running")
  set t_Co=256
else
  set background=light         " Default to light theme with GUI
  set guifont=Monospace\ 9
endif

" Format text & comments to fit the 80 characters limit with auto reformat
" (no gq needed)
set textwidth=79
set formatoptions=cq

" Soft wrap by default
set wrap linebreak nolist


colorscheme molokai

set history=1000

" set backspace to be able to delete previous characters???Enable line numbering, taking up 6 spaces
set bs=2
"set number
"set numberwidth=1
set tabpagemax=20
set wildmode=longest,list
set wildignore+=*.o,*.obj,*.git,*.class,*.png,*.dex,*.apk,*.dex,*.d,*.ap_,*.jar,*.pcap,*/build/*,tags,*/.tmp/*

" Turn off word wrapping
set wrap!

" Turn on smart indent
set autoindent
"set smartindent
"set cindent
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

" Search
set incsearch     " incremental search
set ignorecase    " use case-insensitive search by default
set smartcase     " case-sensitive search if at least one capital letter
set hlsearch      " highlight search results

set laststatus=2
" Keyboard / Mouse
set backspace=indent,eol,start
set mouse=ar
set selection=inclusive
set virtualedit=block,onemore

" Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

" Have 3 lines of offset (or buffer) when scrolling
set scrolloff=5
set sidescrolloff=6
"set scrolljump=3

" Open / Save
set fileencodings=ucs-bom,utf-8,latin1
set nobackup
set noswapfile
set autowrite
autocmd BufRead * try | cd- | catch | endtry

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

" Load local cscope db if exists
if filereadable( expand("$PWD/tags") )
set tags=tags
elseif filereadable( expand("$ROOT/ctags.out") )
   set tags=$ROOT/ctags.out
endif
set guioptions-=T

