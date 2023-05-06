set number
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set mouse=a	
set clipboard+=unnamedplus

call plug#begin()
	Plug 'dracula/vim', { 'as': 'dracula' } "Dracula Theme
	Plug 'https://github.com/preservim/nerdtree' " NerdTree at F9
	Plug 'https://github.com/vim-airline/vim-airline' " Status bar
	Plug 'mg979/vim-visual-multi', {'branch': 'master'} " CTRL + N for multiple cursors
	Plug 'matze/vim-move' " Move selections
	Plug 'tpope/vim-surround' " Surround Plugin
	Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
	Plug 'jiangmiao/auto-pairs' " Auto Complete for pairs
	Plug 'ziglang/zig.vim' " Zig Docs
	Plug 'voldikss/vim-floaterm' " Terminal for neovim
	Plug 'tpope/vim-commentary' " Line comments
	Plug 'preservim/tagbar' " TagBar at F8 
call plug#end()

colorscheme dracula

map <C-q> :quit<CR>
nnoremap <C-s> :write<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <A-v> :bn<CR>
nnoremap <A-c> :bp<CR>


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" zig fmt disable
let g:zig_fmt_autosave = 0

" Configuration example
let g:floaterm_keymap_toggle = '<C-j>'
let g:floaterm_keymap_kill   = '<A-n>'
let g:floaterm_keymap_new    = '<F1>'
let g:floaterm_keymap_prev   = '<F2>'
let g:floaterm_keymap_next   = '<F3>'
let g:floaterm_position = 'topright'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

" TagBar
nmap <F9> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'

" COC settings
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
