
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

set encoding=utf8
set number
set laststatus=2
set modelines=5
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
set listchars=tab:▸\ ,eol:¬
set incsearch
set nojoinspaces
set display+=lastline
set clipboard=unnamed
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//
set timeoutlen=1000 ttimeoutlen=0

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
nnoremap Q :q<CR>
nnoremap QQ :qa<CR>

" Enable completion where available.
" This setting must be set before ALE is loaded.
" let g:ale_completion_enabled = 1

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
call minpac#add('junegunn/fzf')
call minpac#add('lotabout/skim.vim')
call minpac#add('mileszs/ack.vim')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('jremmen/vim-ripgrep')
call minpac#add('spf13/vim-autoclose')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('haya14busa/incsearch.vim')
call minpac#add('haya14busa/incsearch-easymotion.vim')
call minpac#add('haya14busa/incsearch-fuzzy.vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('mhinz/vim-startify')

" language plugin
call minpac#add('Valloric/YouCompleteMe')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('w0rp/ale')

call minpac#add('reasonml-editor/vim-reason-plus')
call minpac#add('rust-lang/rust.vim')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Startify Sessions
" :SLoad    load a session
" :SSave    save a session
" :SDelete  delete a session
" :SClose   close current session
" AutoSave session on quit
let g:startify_session_persistence = 1

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
let g:ctrlp_working_path_mode = 'r'
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
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
    \   'converters': [incsearch#config#fuzzyword#converter()],
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
    \   'is_expr': 0,
    \   'is_stay': 0
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
colorscheme atom
let g:airline_theme='deus'
let g:airline_powerline_fonts=1

" ALE
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}

" YCM
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

" Rust
let g:rustfmt_autosave = 1
