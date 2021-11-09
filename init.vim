let mapleader=" "				
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

map s <nop>
map S :w<CR>
map Q :q<CR>					' exit
map D :source $MYVIMRC<CR>			' use the init.vim

noremap i k
noremap k j
noremap j h
noremap h i
noremap H I
inoremap jk <Esc>
noremap I 5k
noremap K 5j
noremap J 7h
noremap L 7l
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>		' no more highlight

" Copy to system clipboard
vnoremap Y "+y


map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

map <up> :res +5<CR>				' resize
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map ta :tabe<CR>				' create and switch tabs
map tl :tabnext<CR>
map tj :-tabnext<CR>

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'junegunn/vim-peekaboo'
call plug#end()

let g:SnazzyTransparent = 1
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }

colorscheme snazzy

