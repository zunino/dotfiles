set nocompatible

set nobackup
set nowritebackup

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
set cursorline

set incsearch
set hlsearch

set mouse=a

set ignorecase
set smartcase

set splitright
set splitbelow

let loaded_matchparen = 1

set t_Co=256
colorscheme ambient
set nocursorline

set wildignore+=*.o,*.so

call plug#begin('~/.vim/plugged')
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-surround'
    Plug 'derekwyatt/vim-fswitch'
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
call plug#end()

let g:ctrlp_custom_ignore = { 'dir': 'node_modules$' }

filetype plugin indent on

nnoremap <Leader>, :bp!<CR>                         " Switch to previous buffer
nnoremap <Leader>. :bn!<CR>                         " Switch to next buffer

nnoremap <Leader>s :FSHere<cr>                      " FSwitch: switch between headers and sources
nnoremap <Leader>n :NERDTree<cr>                    " Open NERDTree

autocmd BufRead,BufNewFile *.txt set textwidth=72   " Set maximum line length for text files
autocmd BufRead,BufNewFile *.md  set textwidth=72   " Set maximum line length for markdown files
autocmd BufWritePre * :%s/\s\+$//e                  " Remove trailing spaces upon saving

