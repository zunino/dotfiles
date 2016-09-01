set nocompatible

set nobackup
set nowritebackup

set ruler
set showcmd
set laststatus=2
set title

set autoread
autocmd FocusGained,BufEnter * :silent! !

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set backspace=indent,eol,start

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

"set keymap=accents

execute pathogen#infect()
let loaded_matchparen = 1

colorscheme ambient
filetype plugin indent on

nnoremap <Leader>, :bp!<CR>                         " Switch to previous buffer
nnoremap <Leader>. :bn!<CR>                         " Switch to next buffer

autocmd BufRead,BufNewFile *.txt set textwidth=72   " Set maximum line length for text files
autocmd BufWritePre * :%s/\s\+$//e                  " Remove trailing spaces upon saving
