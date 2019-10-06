filetype plugin indent on

call plug#begin('~/.vim/plugged')
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-surround'
    Plug 'derekwyatt/vim-fswitch'
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

