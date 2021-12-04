let mapleader=" "
syntax on
set number
set scrolloff=5
set relativenumber
set cursorline
set wrap
set showcmd
set spell 
set spelllang=en,de

" autocmd TextChanged,TextChangedI <buffer> silent write

" set foldmethod=syntax 

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
" set mouse=a

set clipboard+=unnamedplus

set tabstop=4
set softtabstop=4
set shiftwidth=4 
set expandtab 
set autoindent

map s <nop>
map S :w<CR>
map Q :q<CR>					' exit
" map D :source $MYVIMRC<CR>			' use the init.vim

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
inoremap <C-h> <left>
inoremap <c-l> <right>
" inoremap ( ()<left>
" inoremap () ()
" inoremap " ""<left>
" inoremap "" ""
" inoremap [ []<left>
" inoremap [] []
" inoremap { {}<left>
" inoremap {} {}
" -----------spell check 
inoremap ;; <C-g>u<Esc>[s1z=`]a<C-g>u
" break chain rule
inoremap <space> <space><C-g>u
inoremap <space> <space><C-g>u
inoremap <space> <space><C-g>u

" Copy to system clipboard
" vnoremap Y "+y


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
map th :tabp<CR>
map tc :tabc<CR>

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'junegunn/vim-peekaboo'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-python'}
Plug 'lervag/vimtex'
" Plug 'SirVer/ultisnips'
Plug 'ZhouXinghi/vim-snippets'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'mhartington/oceanic-next'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode'
Plug 'kevinhwang91/rnvimr'
Plug 'arcticicestudio/nord-vim'
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
set updatetime=100

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
inoremap <silent><expr> <c-space> coc#refresh()

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
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
map <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" 
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
" 
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" 
" coc-explorer
nmap <space>e <Cmd>CocCommand explorer<CR>
nmap cc :CocCommand<CR>

" coc snippets

" Use <C-j> for trigger snippet expand.
imap <C-j> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <tab> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<s-tab>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <tab> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------
" fzf.vim
" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------

nmap <leader>o :Files<CR>

" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------
" Vimspector
" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------
let g:vimspector_enable_mappings = 'HUMAN'
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

" let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"


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
    \ 'coc-vimtex'
	\ ]

" "let g:lightline = {
" "    \ 'colorscheme': 'snazzy'
" "    \ }
" "
" "colorscheme snazzy


" =================================
" =================================
" =================================
" vimtex configuration
" =================================
" =================================
" =================================
" syntax enable
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0
" let g:vimtex_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_automatic = 0

augroup vimtex
  autocmd!
  autocmd User VimtexEventView call b:vimtex.viewer.focus_vim()
augroup END

" default is 'nvr'
" 2021-10-25: Better inverse search~
" Deprecate *g:vimtex_compiler_progname* as it is no longer necessary.
" let g:vimtex_compiler_progname = 'nvr'

" use xdotool to focus on vim when using \lv
" let g:xwindow_id = system('xdotool getactivewindow')
" let g:VimtexEventCompileFailed = 'MyHook'
" let g:VimtexEventCompileSuccess = 'MyHook'
" let g:VimtexEventView = 'MyHook'
" " let g:vimtex_view_zathura_hook_view = 'MyHook'
" " let g:vimtex_view_zathura_hook_callback = 'MyHook'
"
" function! MyHook()
"   silent call system('xdotool windowactivate ' . g:xwindow_id . ' --sync')
" endfunction



set conceallevel=1
let g:tex_conceal='abdmg'
hi clear Conceal
" let g:vimtex_compiler_latexmk_engines = {
"     \ '_'                : '-pdf',
"     \ 'pdflatex'         : '-pdf',
"     \ 'dvipdfex'         : '-pdfdvi',
"     \ 'lualatex'         : '-lualatex',
"     \ 'xelatex'          : '-xelatex',
"     \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
"     \ 'context (luatex)' : '-pdf -pdflatex=context',
"     \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
"     \}
" let g:vimtex_compiler_latexmk = {
"     \ 'build_dir' : '',
"     \ 'callback' : 1,
"     \ 'continuous' : 1,
"     \ 'executable' : 'latexmk',
"     \ 'hooks' : [],
"     \ 'options' : [
"     \   '-verbose',
"     \   '-file-line-error',
"     \   '-shell-escape',
"     \   '-synctex=1',
"     \   '-interaction=nonstopmode',
"     \ ],
"     \}
" let g:vimtex_view_general_options_latexmk = '-reuse-instance'
" let g:vimtex_view_general_options
" \ = '-reuse-instance -forward-search @tex @line @pdf'
" \ . ' -inverse-search "' . exepath(v:progpath)
" \ . ' --servername ' . v:servername
" \ . ' --remote-send \"^<C-\^>^<C-n^>'
" \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
" \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
" \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
" 
" 
" let g:vimtex_toc_config = {
" \ 'name' : 'TOC',
" \ 'layers' : ['content', 'todo', 'include'],
" \ 'split_width' : 25,
" \ 'todo_sorted' : 0,
" \ 'show_help' : 1,
" \ 'show_numbers' : 1,
" \}
" =============================
" =============================
" =============================
" ultiSnips
" =============================
" =============================
" =============================
" =============================
" let g:UltiSnipsExpandTrigger='<s-tab>'
" let g:UltiSnipsJumpForwardTrigger='<tab>'
" let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
" 
"
"=======oceanic-next============
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
" colorscheme nord

" "Transparancy
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
let g:airline_theme='oceanicnext'

" =================================nerdcommenter====================================
filetype plugin on

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


nnoremap <silent> <leader>c} V}:call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call nerdcommenter#Comment('x', 'toggle')<CR>

" =================================markdown-preview====================================
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" keybindings
nmap <C-p> <Plug>MarkdownPreviewToggle


" ==============================vim-table-mode==========================
" in insert mode || enable talbe mode and __ disable table mode
" function! s:isAtStartOfLine(mapping)
"   let text_before_cursor = getline('.')[0 : col('.')-1]
"   let mapping_pattern = '\V' . escape(a:mapping, '\')
"   let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
"   return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
" endfunction
"
" inoreabbrev <expr> <bar><bar>
