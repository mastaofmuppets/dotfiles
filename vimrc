" Select your Leader key
let mapleader = "\<Space>"


"---------------------
" Plugins
"---------------------

call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
map <leader>d :execute 'NERDTreeToggle ' .getcwd()<CR>

Plug 'altercation/vim-colors-solarized'

Plug 'terryma/vim-expand-region'

Plug 'ervandew/supertab'

Plug 'bling/vim-airline'
let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Navitate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Airline style of tmux status line
" Plug 'edkolev/tmuxline.vim'
" let g:tmuxline_powerline_separators = 0

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

set tabstop=4 shiftwidth=4 expandtab    "Tab settings (tabs as spaces)
set list                                "Display whitespaces as characters

set background=dark
colorscheme solarized


"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
source $LOCALFILE
endif
