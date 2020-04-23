let g:tagbar_width=80
let g:tagbar_type_elm = {
\   'ctagstype':'elm',
\   'kinds':['h:header', 'i:import', 't:type', 'e:exposing', 'f:function'],
\   'sro':'&&&',
\   'kind2scope':{'h':'header', 'i':'import', 't':'type', 'e':'exposing', 'f':'function'},
\   'sort':0,
\   'ctagsbin':'~/.dotfiles/ctags/elmtags.py',
\   'ctagsargs':'',
\}

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

let g:tagbar_type_rust = {
   \ 'ctagstype' : 'rust',
   \ 'kinds' : [
       \'T:types,type definitions',
       \'f:functions,function definitions',
       \'g:enum,enumeration names',
       \'s:structure names',
       \'m:modules,module names',
       \'c:consts,static constants',
       \'t:traits',
       \'i:impls,trait implementations',
   \]
   \}

nmap <silent> <C-\> :TagbarToggle<CR>
