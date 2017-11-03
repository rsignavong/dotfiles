
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
call minpac#add('junegunn/fzf')
call minpac#add('mileszs/ack.vim')

" language plugin
call minpac#add('vim-syntastic/syntastic')
call minpac#add('sbdchd/neoformat')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('slashmili/alchemist.vim')
call minpac#add('ElmCast/elm-vim')
call minpac#add('StanAngeloff/php.vim')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Fzf
set rtp+=/usr/local/opt/fzf

" Ag
let g:ackprg = 'ag --vimgrep'

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
