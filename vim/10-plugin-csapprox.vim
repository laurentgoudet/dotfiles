
" Fix CSApprox not working with old VIM version without gui support (EC2
" Amazin Linux you heard me)
if !has('gui') && v:version < 703
  let g:CSApprox_loaded = 1
endif

