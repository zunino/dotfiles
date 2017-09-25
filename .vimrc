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

set wildignore+=*.o,*.so,a.out

call plug#begin('~/.vim/plugged')
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-surround'
    Plug 'derekwyatt/vim-fswitch'
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'conradirwin/vim-bracketed-paste'
    Plug 'junegunn/goyo.vim'
    Plug 'reedes/vim-pencil'
    Plug 'tpope/vim-repeat'
call plug#end()

let g:ctrlp_custom_ignore = { 'dir': 'node_modules$' }

filetype plugin indent on

" Switch to previous and next buffers
nnoremap <Leader>, :bp!<CR>
nnoremap <Leader>. :bn!<CR>

" Write current buffer (normal and insert modes)
nnoremap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>

" Switch between headers and sources (FSwitch plugin)
nnoremap <Leader>s :FSHere<CR>

" Open or move focus to NERDTree
nnoremap <Leader>n :NERDTreeFocus<CR>

noremap <F3> :TogglePencil<CR>
noremap <F4> :Goyo<CR>

" New line in normal mode
nnoremap <Enter> i<Enter><Esc>

autocmd BufRead,BufNewFile *.txt set textwidth=72   " Set maximum line length for text files
autocmd BufRead,BufNewFile *.md  set textwidth=72   " Set maximum line length for markdown files

