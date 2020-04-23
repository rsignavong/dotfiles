if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
let g:ackprg = 'rg --vimgrep --no-heading'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
