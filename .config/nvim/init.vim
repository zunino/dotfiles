call plug#begin()
    Plug 'conradirwin/vim-bracketed-paste'
    Plug 'derekwyatt/vim-fswitch'
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'sbdchd/neoformat'
call plug#end()

runtime init-general.vim
runtime init-plugins.vim
runtime init-mappings.vim

let loaded_matchparen = 1

set wildignore+=*.o,*.so,a.out,*.class

filetype plugin indent on

autocmd BufRead,BufNewFile *.txt set textwidth=72   " Set maximum line length for text files
autocmd BufRead,BufNewFile *.md  set textwidth=72   " Set maximum line length for markdown files
autocmd TabLeave * stopinsert                       " Returns to normal mode upon leaving a tab

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="Search", timeout=200})
augroup end

let g:markdown_fenced_languages=['javascript', 'json=javascript', 'go']

" set background=light

" let g:gruvbox_termcolors = '256'
" let g:gruvbox_contrast_dark = 'medium'
" let g:gruvbox_invert_selection = 0
" colorscheme gruvbox

let ayucolor="mirage"
colorscheme ayu
