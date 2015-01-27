" Change the mapleader from \ to , (AZERTY keyboard!)
let mapleader=","

" Shortcut to auto indent entire file
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

" Press space to clear search highlighting and any message already displayed.
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Windows's style copy-and-paste
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" X Window paste at mouse position and not cursor position
nnoremap <MiddleMouse> <LeftMouse><MiddleMouse>

" Disable arrow keys to stay on the home row
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" Remove all trailing whitespace
nnoremap <silent> <F5> :let w:winview = winsaveview()<Bar>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>call winrestview(w:winview)<CR>
" Toggle Taglist
nnoremap <silent> <F6> :set list!<CR>

" Toggle line numbers
nnoremap <leader>ln :setlocal number!<CR>
" Toggle paste mode
nnoremap <leader>pm :set paste!<CR>
" Toggle wrap mode
nnoremap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" Buffer navigation
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
" :nnoremap <leader>l :ls<cr>:b<space>

" Switch coding style
nnoremap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nnoremap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nnoremap <leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nnoremap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Fix <CTRL-Space> mapping not working
"inoremap <C-@> <C-Space>

