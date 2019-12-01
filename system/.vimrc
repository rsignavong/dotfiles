" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Jul 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" custom config
" from vimcast.org/e/70
filetype plugin indent on
syntax on

set fileencodings=utf-8
set encoding=utf-8
set laststatus=2
set modelines=5
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
set listchars=tab:▸\ ,eol:¬
" set autoread
set incsearch
set nojoinspaces
set display+=lastline
set clipboard=unnamed
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//
set timeoutlen=1000 ttimeoutlen=0
" set tags=tags

" Split Bar
set fillchars=vert:│
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=magenta ctermbg=NONE

" SAVE FILES with Ctr-s
" to coninuously edit after saved the file
" inoremap <silent> <C-s> <C-o>:update<CR>
" nnoremap <silent> <C-s> :update<CR>
" inoremap <silent> <C-s> <Esc>:update<CR>
" vnoremap <silent> <C-s> <C-c>:update<CR>gv
" Escape Insert mode
inoremap jj <Esc>
inoremap jss <Esc>:update<CR>
nnoremap s <Nop>
nnoremap <silent> ss :update<CR>
nnoremap W :q<CR>
nnoremap QQ :qa<CR>
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white

" Bubble single lines
nmap <C-s> [e
nmap <C-d> ]e
" Bubble multiple lines
vmap <C-s> [egv
vmap <C-d> ]egv

" Buffer switching
map gh <C-^>
map gn :bn<cr>
map gb :bp<cr>

" hybrid line mode
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Minpac plugin manager
packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('flazz/vim-colorschemes')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('edkolev/tmuxline.vim')
call minpac#add('edkolev/promptline.vim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('webdevel/tabulous')
call minpac#add('kshenoy/vim-signature')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/fzf')
call minpac#add('lotabout/skim.vim')
call minpac#add('mileszs/ack.vim')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('tpope/vim-repeat')
call minpac#add('jremmen/vim-ripgrep')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-surround')
call minpac#add('Raimondi/delimitMate')
call minpac#add('pseewald/vim-anyfold')
call minpac#add('tpope/vim-commentary')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('haya14busa/incsearch.vim')
call minpac#add('haya14busa/incsearch-easymotion.vim')
call minpac#add('haya14busa/incsearch-fuzzy.vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('mhinz/vim-startify')
call minpac#add('majutsushi/tagbar')
call minpac#add('Valloric/ListToggle')

" call minpac#add('autozimu/LanguageClient-neovim')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

" language plugin
" call minpac#add('Valloric/YouCompleteMe')
call minpac#add('sheerun/vim-polyglot')
" call minpac#add('w0rp/ale')

call minpac#add('iamcco/markdown-preview.vim')
call minpac#add('lambdatoast/elm.vim')
call minpac#add('rust-lang/rust.vim')
call minpac#add('derekwyatt/vim-scala')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Startify Sessions
" :SLoad    load a session
" :SSave    save a session
" :SDelete  delete a session
" :SClose   close current session
" AutoSave session on quit
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0

" NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | ene | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 50
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks = 0
" "let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMapOpenSplit = 's'
let NERDTreeMapPreviewSplit = 'gs'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapPreviewVSplit = 'gv'

" NERDTree Git Plugin
let g:NERDTreeShowIgnoredStatus = 0

" CtrlP
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

" Easymotion
" f{char}{char} to move to {char}{char}
nmap f <Plug>(easymotion-overwin-f2)

" Incsearch + Easymotion
" / find exact word and move cursor to first match
map / <Plug>(incsearch-easymotion-/)

" Incsearch + Easymotion + Fuzzy
" ? find fuzzy word and move cursor to better match
" function! s:config_easyfuzzymotion(...) abort
"   return extend(copy({
"     \   'converters': [incsearch#config#fuzzyword#converter()],
"     \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"     \   'keymap': {"\<CR>": '<Over>(easymotion)'},
"     \   'is_expr': 0,
"     \   'is_stay': 0
"     \ }), get(a:, 1, {}))
" endfunction
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> ? incsearch#go(<SID>config_easyfuzzymotion())

" Fzf
" set rtp+=/usr/local/opt/fzf

" Skim
set rtp+=~/.skim

" Ag
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
let g:ackprg = 'rg --vimgrep --no-heading'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Tmux line
let g:tmuxline_preset = 'full'
let g:airline#extensions#tmuxline#enabled = 0

" Promptline
let g:promptline_theme = 'airline_visual'
let g:promptline_preset = 'full'

" Vim Design
colorscheme gruvbox
let g:airline_theme='deus'
let g:airline_powerline_fonts=1
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=Blue ctermbg=NONE gui=NONE guifg=Blue guibg=NONE

" Preview Window
" highlight Pmenu ctermbg=69 gui=bold

" AnyFold
autocmd Filetype * AnyFoldActivate
set foldlevel=99


" ALE
" let g:ale_linters ={
" \   'elixir' : ['elixir-ls'],
" \   'elm' : ['elm_lsp'],
" \   'rust' : ['rls'],
" \}

" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'elixir': ['mix_format'],
" \   'elm': ['elm-format'],
" \   'javascript': ['prettier_eslint', 'importjs'],
" \   'rust': ['rustfmt'],
" \   'stylus': ['stylelint'],
" \   'css': ['stylelint'],
" \}

" let g:ale_elixir_elixir_ls_release='~/elixir-ls/release'
" let g:ale_rust_rls_config = {
" \   'rust': {
" \     'clippy_preference': 'on'
" \   }
" \ }

" " Enable completion where available.
" let g:ale_completion_enabled = 1
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" let g:ale_linters_explicit = 1
" let g:ale_lint_on_save = 1
" let g:ale_fix_on_save = 1

" noremap <Leader>d :ALEGoToDefinition<CR>
" nnoremap <leader>f :ALEFix<cr>
" noremap <Leader>r :ALEFindReferences<CR>

" Move between linting errors
nmap <silent> [[ <Plug>(ale_previous_wrap)
nmap <silent> ]] <Plug>(ale_next_wrap)


" YCM
" let g:ycm_semantic_triggers = {
"      \ 'elm' : ['.'],
"      \}

" let g:ycm_always_populate_location_list = 1

" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

" Tagbar
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

" LanguageClient
" set runtimepath+=~/.vim/pack/minpac/start/LanguageClient-neovim
" set hidden

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
"     \ 'elixir': ['/bin/zsh', '~/elixir-ls/release/language_server.sh'],
"     \ }

"  let g:LanguageClient_rootMarkers = {
" \ 'elixir': ['mix.exs']
" \ }

" nnoremap <silent> T :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>

" CoC
autocmd FileType json syntax match Comment +\/\/.\+$+

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup


" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

autocmd FileType elixir let b:coc_root_patterns = ['mix.exs']

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>cc  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Rust
" let g:rustfmt_autosave = 1

" Scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Json comments highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
