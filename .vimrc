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

Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

Plug 'AndrewRadev/quickpeek.vim'
Plug 'majutsushi/tagbar'

call plug#end()

set encoding=utf-8
set fileencodings=utf-8,cp932
set fileformats=unix
set incsearch 			    "Iincremental search
set laststatus=2 		    "Always enable status line
set nobackup
set noswapfile
set autoread
set smartindent
set wildmode=list:longest 	"command-line completion
set clipboard+=unnamed		"Using system clipboard
set background=dark		    "Setting dard mode for gruvbox color theme
set nohlsearch              "No highlight search"

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

"vim-lsp configuration
"let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:lsp_diagnostics_enabled = 0
let g:lsp_highlight_references_enabled = 1
highlight lspReference cterm = underline ctermfg = 109 ctermbg = 239

"To turn preview popup on automatically (quickpeek.vim)
let g:quickpeek_auto = v:true
let g:quickpeek_popup_options = {'title': ' Preview '}
let g:quickpeek_window_settings = ['cursorline', 'number']

"Tagbar window size
let g:tagbar_width = 130

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

nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gr :LspReferences<CR>

"keymaps for quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
