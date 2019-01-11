call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'osajimura/nulog'

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

filetype on
syntax on
colorscheme desert

"cscope settings
set nocst
set nocsverb
set csre
set csprg=/usr/bin/cscope

nmap <C-s> :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-g><C-g> :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-t> :scs find t <C-R>=expand("<cword>")<CR><CR>

nmap <C-s>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-g>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-t>t :cs find t <C-R>=expand("<cword>")<CR><CR>

"NERDTree key mappings

nmap <C-l> :NERDTreeToggle<CR>
let NERDTreeWinSize = 50
let NERDTreeNodeDelimiter = "\t"

"CtrlP settings

let g:ctrlp_map = '<C-q>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 20

"Airline Theme
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

nmap <C-p> :bp<CR>
nmap <C-n> :bn<CR>

"Use quickfix-window after running vimgrep
autocmd QuickFixCmdPost *grep* cwindow