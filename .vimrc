call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'osajimura/nxlog'
Plug 'morhetz/gruvbox'
Plug 't9md/vim-quickhl'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'

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

"Enable mouse on vim
set mouse=a
set ttymouse=xterm2


filetype on
syntax on
colorscheme gruvbox

"cscope settings
set csre			"basename of cscope.out location will be used as the prefix to construct an absolute path.
set csprg=/usr/local/bin/cscope	"cscope binary path

"NERDTree key mappings
nnoremap <C-l> :NERDTreeToggle<CR>
let NERDTreeWinSize = 60
let NERDTreeNodeDelimiter = "\t"
let NERDTreeShowHidden = 1

"Airline Theme
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

"Use ripgrep (rg) for grep.
if executable('rg')
    let &grepprg = 'rg --vimgrep --hidden'
    set grepformat=%f:%l:%c:%m
endif

"Use quickfix window (size 30) for any grep commands output
augroup AutoQuickfix
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow 30
augroup END

" fzf default command
let $FZF_DEFAULT_COMMAND='rg --files --follow'

" fzf Rg command option
" Change from default
" 1. Added --follow, --hidden and binary option
command! -bang -complete=file -nargs=* Rg
            \ call fzf#vim#grep('rg --column --follow --search-zip --line-number --no-heading --color=always --smart-case ' 
            \ . <q-args>, 1, fzf#vim#with_preview(), <bang>0)

"Key mappings
"1. cscope
nnoremap <C-s> :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-c> :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"nnoremap <C-t> :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"nnoremap <C-g> :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-s>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-g>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-t>t :cs find t <C-R>=expand("<cword>")<CR><CR>

"2. buffer control
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>

"3. fzf and ripgrep
nnoremap <C-t> :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-q> :Rg<space>
nnoremap <C-h> :History: <CR> 
nnoremap s :Files <CR> 


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
       execute 'h '.expand('<cword>')
   else
       call CocAction('doHover')
   endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"keymaps for quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
