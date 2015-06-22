"---------------------
" Environment
"---------------------

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif


" Select your Leader key
let mapleader = "\<Space>"


"---------------------
" Plugins
"---------------------

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
map <leader>d :execute 'NERDTreeToggle ' .getcwd()<CR>

Plug 'altercation/vim-colors-solarized'

Plug 'terryma/vim-expand-region'

Plug 'ervandew/supertab'

Plug 'bling/vim-airline'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Navitate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

call plug#end()


"---------------------
" Mappings
"---------------------

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>i :CtrlPBuffer<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>b :make<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

noremap Y y$
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

noremap gV `[v`]
nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nnoremap <CR> o<Esc>
nnoremap <Leader><Tab> <C-^>


"---------------------
" Settings
"---------------------

set mouse=a                             "Enable the mouse
set number                              "Show line numbers
set relativenumber

set tabstop=4 shiftwidth=4 expandtab    "Tab settings (tabs as spaces)
set list                                "Display whitespaces as characters

set background=dark
colorscheme solarized


"---------------------
" GUI options
"---------------------

if has('gui_running')
    set guioptions-=T   " Menu options in gVim: no toolbar
    set guioptions-=r   " no right scrollbar
    set guioptions-=L   " no left scrollbar

    set columns=80 lines=50

    if has('gui_win32')
        set guifont=consolas:h10
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
endif

"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
source $LOCALFILE
endif
