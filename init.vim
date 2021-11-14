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

set clipboard+=unnamedplus

set tabstop=4
set softtabstop=4
set shiftwidth=4 
set expandtab 
set autoindent

map s <nop>
map S :w<CR>
map Q :q<CR>					' exit
map D :source $MYVIMRC<CR>			' use the init.vim

" noremap i k
" noremap k j
" noremap j h
" noremap h i
" noremap H I
inoremap jk <Esc>
noremap K 5k
noremap J 5j
noremap H 7h
noremap L 7l
noremap n nzz
noremap N Nzz
noremap <LEADER><CR> :nohlsearch<CR>		' no more highlight

" Copy to system clipboard
vnoremap Y "+y


" map sr :set splitright<CR>:vsplit<CR>
" map sl :set nosplitright<CR>:vsplit<CR>
" map su :set nosplitbelow<CR>:split<CR>
" map sd :set splitbelow<CR>:split<CR>
" 
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ZhouXinghi/vim-snippets'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
call plug#end()

"" Coc configuration
"
"
"
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>h to show documentation in preview window.
nnoremap <silent> <LEADER>he :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
map <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" coc-explorer
nmap <space>e <Cmd>CocCommand explorer<CR>
nmap cc :CocCommand<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------
" Vimspector
" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad
"  packadd! vimspector
"  syntax enable
"  filetype plugin indent on
"  
"  coc extensions
let g:coc_global_extensions = [
	\ 'coc-json', 
	\ 'coc-vimlsp',
	\ 'coc-python',
	\ 'coc-marketplace',
    \ 'coc-explorer',
    \ 'coc-translator',
    \ 'coc-snippets',
	\ ]


let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }

colorscheme snazzy

