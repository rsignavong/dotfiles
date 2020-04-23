let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" not working with ctrlp_user_command
" let g:ctrlp_custom_ignore = '\v[\/](target|_build|deps|elm-stuff|node_modules|dist)(\.(git|hg|svn))$'
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
set wildignore+=*/.git/*,*/tmp/*,*.swp
