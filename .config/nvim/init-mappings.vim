"==[GENERAL]================================================

" Write current buffer (normal and insert modes)
nnoremap <C-S> :update<CR>
inoremap <C-S> <ESC>:update<CR>

" Switch to previous and next buffers
nnoremap <silent> <Leader>, :bp!<CR>
nnoremap <silent> <Leader>. :bn!<CR>

" Delete current buffer
nnoremap <silent> <Leader>q :bd<CR>

" New line in normal mode
nnoremap <Enter> i<Enter><Esc>

" Space in normal mode
nnoremap <Space> i<Space><Esc>l

" Backspace in normal mode
nnoremap <Backspace> X

" Clear search match highlights
nnoremap <silent> <Leader><Space> :nohl<CR>

" Remove trailing whitespace
nnoremap <Leader>ws :%s/\s\+$//e<CR><bar>:nohl<CR>

" Format current paragraph
nnoremap <Leader>f gqip

" Replace search match in current buffer
" nnoremap <Leader>r :%s///gc<Left><Left><Left>
nnoremap <Leader>r :call replace#prompt()<CR>

" Replace visual selection in current buffer
vnoremap <Leader>v y:/<C-r>"<CR>:call replace#prompt()<CR>


"==[CUSTOM AUTOLOAD]========================================

" Insert standard header for source files
nnoremap <F3> :call header#add()<CR>
inoremap <F3> <ESC>:call header#add()<CR>


"==[VIM-FSWITCH]============================================

" Switch between headers and sources (FSwitch plugin)
nnoremap <Leader>s :FSHere<CR>


"==[VIM-COMMENTARY]=========================================

" Comment current line toggle
nmap <C-_> gcc
imap <C-_> <ESC>gcc

" Comment visual selection toggle
vmap <C-_> gc


"==[NETRW]==================================================

" Open explorer
noremap <C-E> :Explore %:p:h<CR>


"==[NEOFORMAT]==============================================

" Reformat buffer
noremap <C-F> :Neoformat<CR>


"==[NVIM-LSPCONFIG]=========================================

" Rename symbol
nnoremap <F2> :lua vim.lsp.buf.rename()<CR>

" Go to definition
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>


"==[COMPLETION-NVIM]========================================

" Tab for triggering completion
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)


"==[FZF]====================================================

" File search
noremap <silent> <C-P> :FZF<CR>





"== Playing with what might become a plugin for formatting list items
inoremap <Leader>] <ESC>:lua require("nvim-listas.listas")()<CR>A

