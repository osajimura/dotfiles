call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'osajimura/nxlog'
Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set encoding=utf-8
set fileencodings=utf-8,cp932
set fileformats=unix
set incsearch 			"Iincremental search
set hlsearch 			"Highlighten search result
set laststatus=2 		"Always enable status line
set nobackup
set noswapfile
set autoread
set smartindent
set wildmode=list:longest 	"command-line completion
set clipboard+=unnamed		"Using system clipboard
set background=dark		"Setting dard mode for gruvbox color theme

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

filetype on
syntax on
colorscheme gruvbox

"cscope settings
set csre			"basename of cscope.out location will be used as the prefix to construct an absolute path.
set csprg=/usr/local/bin/cscope	"cscope binary path

"NERDTree key mappings

nmap <C-l> :NERDTreeToggle<CR>
let NERDTreeWinSize = 60
let NERDTreeNodeDelimiter = "\t"
let NERDTreeShowHidden = 1

"Airline Theme
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

" fzf default command
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
" fzf Rg command option
" Change from default
" 1. Added --follow, --hidden and binary option
" 2. Excluded directories which aren't used for code search

command! -bang -nargs=* Rg
            \ call fzf#vim#grep('rg --column --follow --hidden --search-zip --line-number --no-heading --color=always --smart-case 
            \'.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

"Key mappings
"cscope
nnoremap <C-s> :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-c> :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"nnoremap <C-t> :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"nnoremap <C-g> :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-s>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-g>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-t>t :cs find t <C-R>=expand("<cword>")<CR><CR>

"buffer control
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>

"fzf and ripgrep
nnoremap <C-t> :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-q> :Rg<space>
nnoremap f :Files <CR> 
nnoremap b :Buffers <CR> 
nnoremap <C-h> :History: <CR> 

" Temporary setting for testing
" Use `[g` and `]g` to navigate diagnostics
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
