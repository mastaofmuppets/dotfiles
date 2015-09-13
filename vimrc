" vim: foldmethod=marker
" ----------------------------------------------------------------------------
"          FILE: .vimrc
"   DESCRIPTION: Vim configuration file
"        AUTHOR: Pawel Dobrowolski
" ----------------------------------------------------------------------------

" Environment ------------------------------------------------------------ {{{

" On Windows, use '.vim' instead of 'vimfiles'
if has('win32') || has('win64')
    set runtimepath=
    \$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif


" }}}
" General settings ------------------------------------------------------- {{{

let mapleader = "\<Space>"              "Space is the leader. Take that!

set encoding=utf8

set mouse=a                             "Enable the mouse

set number                              "Show line numbers
set relativenumber

set tabstop=4 shiftwidth=4 expandtab    "Tab settings (tabs as spaces)
set list                                "Display white spaces as characters

set ignorecase smartcase                "Smartcase for searches
set gdefault                            "Substitutions are global by default

set incsearch showmatch hlsearch        "Highlight search && clear highlight
nnoremap <leader>/ :noh<CR>

set virtualedit=block                   "Stay in column while in visual block mode

" }}}
" General mappings ------------------------------------------------------- {{{

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>i :CtrlPBuffer<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>b :make<CR>

vmap <Leader>y "+y
nmap <Leader>y "+yy
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

nnoremap <Leader><CR> o<Esc>
nnoremap <Leader><Tab> <C-^>

" edit vimrc
noremap <leader>ev :execute 'e ' . resolve(expand($MYVIMRC))<CR>


function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" remove trailing white spaces
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" auto indent all file
nmap _= :call Preserve("normal gg=G")<CR>

" toggle spell check
map <F5> :setlocal spell! spelllang=en_us<CR>

" }}}
" Folding ---------------------------------------------------------------- {{{
"
set foldenable
set foldmethod=syntax

" Focus the current fold.
nnoremap <Leader>z zMzvzz

" }}}
" Plugins ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

" Basic vim settings
Plug 'tpope/vim-sensible'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-commentary'

" Extend netrw - file editor
Plug 'tpope/vim-vinegar'

" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" map <leader>d :execute 'NERDTreeToggle ' .getcwd()<CR>

" Text alignment
Plug 'godlygeek/tabular'

Plug 'kien/ctrlp.vim'

Plug 'altercation/vim-colors-solarized'

Plug 'terryma/vim-expand-region'

Plug 'ervandew/supertab'

Plug 'bling/vim-airline'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Navigate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Right prose in vim
Plug 'junegunn/goyo.vim'

Plug 'reedes/vim-pencil'

call plug#end()

" }}}
" Colorscheme ------------------------------------------------------------ {{{

set background=dark
colorscheme badwolf

" Toggle background highlighting
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" }}}
" GUI -------------------------------------------------------------------- {{{

if has('gui_running')
    set guioptions-=T   " Menu options in gVim: no toolbar
    set guioptions-=r   " no right scrollbar
    set guioptions-=L   " no left scrollbar

    set columns=90 lines=50

    if has('gui_win32')
        set guifont=consolas:h10
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
endif

" }}}
" Local customization ---------------------------------------------------- {{{

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
source $LOCALFILE
endif

" }}}
