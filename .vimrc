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
set clipboard=unnamedplus

set ignorecase
set smartcase

set splitright
set splitbelow

set noshowmode

set termguicolors

" Settings based on https://github.com/neoclide/coc.nvim
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=auto

let loaded_matchparen = 1

set wildignore+=*.o,*.so,a.out,*.class

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
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:plug_url_format = 'ssh://git@github.com/%s'

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

" Have vim-go use gopls for 'go to definition' and 'info'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

filetype plugin indent on

" Write current buffer (normal and insert modes)
nnoremap <C-S> :update<CR>
inoremap <C-S> <ESC>:update<CR>

" Coc's rename functionality
nmap <F2> <Plug>(coc-rename)
imap <F2> <ESC><Plug>(coc-rename)

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

" Format current paragraph
nnoremap <Leader>f gqip

" ===== BEGIN CoC related

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

autocmd BufRead,BufNewFile *.txt set textwidth=72   " Set maximum line length for text files
autocmd BufRead,BufNewFile *.md  set textwidth=72   " Set maximum line length for markdown files
autocmd TabLeave * stopinsert                       " Returns to normal mode upon leaving a tab

colorscheme volcanic

