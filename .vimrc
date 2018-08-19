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

set nocursorline
set noshowmode

set t_Co=256

colorscheme feral

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
    Plug 'junegunn/goyo.vim'
    Plug 'reedes/vim-pencil'
    Plug 'tpope/vim-repeat'
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
call plug#end()

let g:ctrlp_custom_ignore = { 'dir': 'node_modules$' }

filetype plugin indent on

" Write current buffer (normal and insert modes)
nnoremap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>

noremap <F3> :TogglePencil<CR>
noremap <F4> :Goyo<CR>

" Switch to previous and next buffers
nnoremap <Leader>, :bp!<CR>
nnoremap <Leader>. :bn!<CR>

" Switch between headers and sources (FSwitch plugin)
nnoremap <Leader>s :FSHere<CR>

" Open or move focus to NERDTree
nnoremap <Leader>n :NERDTreeFocus<CR>

" New line in normal mode
nnoremap <Enter> i<Enter><Esc>

" Tab in normal mode
nnoremap <Tab> i<Tab><Esc>l

" Clear search match highlights
nnoremap <Leader><Space> :nohl<CR>

" Remove trailing whitespace
nnoremap <Leader>ws :%s/\s\+$//e<CR>

" Copy visual selection to system clipboard
vnoremap <Leader>y "+y

" Paste from system clipboard over visual selection
vnoremap <Leader>p "+P

" Paste from system clipboard
nnoremap <Leader>p "+P

" Format current paragraph
nnoremap <Leader>f gqip

autocmd BufRead,BufNewFile *.txt set textwidth=72   " Set maximum line length for text files
autocmd BufRead,BufNewFile *.md  set textwidth=72   " Set maximum line length for markdown files

