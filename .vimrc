set nocompatible

set nobackup
set nowritebackup

set ruler
set showcmd
set laststatus=2
set title

set autoread
auto FocusGained,BufEnter * :silent! !

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set backspace=indent,eol,start

"set textwidth=108
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

execute pathogen#infect()
let loaded_matchparen = 1

colorscheme ambient
filetype plugin indent on

nnoremap <Leader>, :bp<CR>
nnoremap <Leader>. :bn<CR>
