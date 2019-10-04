set nocompatible

set nobackup
set nowritebackup
set hidden

set ruler
set showcmd
set laststatus=2
set title

set autoread

set tabstop=4
set softtabstop=4
set shiftwidth=0                                    " Use whatever tabstop is set to
set shiftround
set expandtab
set autoindent
set backspace=indent,eol,start
set scrolloff=10

set nowrap

set number
set numberwidth=5
set nocursorline

set incsearch
set hlsearch

set mouse=a

set ignorecase
set smartcase

set splitright
set splitbelow

set noshowmode

set termguicolors

colorscheme nord

" Settings based on https://github.com/neoclide/coc.nvim
set cmdheight=2
set updatetime=300
set shortmess+=c
set relativenumber
set signcolumn=yes

let loaded_matchparen = 1

set wildignore+=*.o,*.so,a.out,*.class

call plug#begin('~/.vim/plugged')
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-surround'
    Plug 'derekwyatt/vim-fswitch'
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'conradirwin/vim-bracketed-paste'
    Plug 'tpope/vim-repeat'
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:ctrlp_custom_ignore = { 'dir': 'node_modules$' }

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'gitbranch', 'readonly', 'filename', 'modified' ]
        \ ]
    \ },
    \ 'component_function': {
        \ 'gitbranch': 'gitbranch#name'
    \}
\}

let g:plug_url_format = 'ssh://git@github.com/%s'

filetype plugin indent on

" Write current buffer (normal and insert modes)
nnoremap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>

" Insert standard header for source files (normal and insert modes)
nnoremap <F3> :call header#add()<CR>
inoremap <F3> <ESC>:call header#add()<CR>

" Switch to previous and next buffers
nnoremap <Leader>, :bp!<CR>
nnoremap <Leader>. :bn!<CR>

" Switch between headers and sources (FSwitch plugin)
nnoremap <Leader>s :FSHere<CR>

" Open or move focus to NERDTree
nnoremap <Leader>n :NERDTreeFocus<CR>

" New line in normal mode
nnoremap <Enter> i<Enter><Esc>

" Space in normal mode
nnoremap <Space> i<Space><Esc>l

" Backspace in normal mode
nnoremap <Backspace> X

" Clear search match highlights
nnoremap <Leader><Space> :nohl<CR>

" Remove trailing whitespace
nnoremap <Leader>ws :%s/\s\+$//e<CR><bar>:nohl<CR>

" Copy visual selection to system clipboard
vnoremap <Leader>y "+y

" Paste from system clipboard over visual selection
vnoremap <Leader>p "+P

" Paste from system clipboard
nnoremap <Leader>p "+P

" Format current paragraph
nnoremap <Leader>f gqip

" Ctrl-space triggers completion
inoremap <silent><expr> <C-Space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd BufRead,BufNewFile *.txt set textwidth=72   " Set maximum line length for text files
autocmd BufRead,BufNewFile *.md  set textwidth=72   " Set maximum line length for markdown files
autocmd TabLeave * stopinsert                       " Returns to normal mode upon leaving a tab

