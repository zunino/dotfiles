"==[GENERAL]================================================

" Write current buffer (normal and insert modes)
nnoremap <C-s> :update<CR>
inoremap <C-s> <ESC>:update<CR>

" Select all
noremap <C-a> <ESC>gg<S-v>G

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

" Replace search match in current buffer
nnoremap <Leader>r :call replace#prompt()<CR>

" Replace visual selection in current buffer
vnoremap <Leader>v y:/<C-r>"<CR>:call replace#prompt()<CR>

" Tab indents visual selection
vnoremap <Tab> >gv

" Shift+Tab unindents visual selection
vnoremap <S-Tab> <gv

" Re-yanks last visual selection after paste over
" vnoremap p "0p


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
noremap <Leader>f :Neoformat<CR>


"==[NVIM-LSPCONFIG]=========================================

" Rename symbol
nnoremap <F2> :lua vim.lsp.buf.rename()<CR>

" Go to definition
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>

" Show diagnostics on a floating pane
nnoremap <Leader>d :lua vim.diagnostic.open_float()<CR>

"==[FZF]====================================================

" File search
noremap <silent> <C-P> <ESC>:FZF<CR>

" Find in files
noremap <silent> <C-F> <ESC>:FindInFiles<CR>





"== Playing with what might become a plugin for formatting list items
inoremap <Leader>] <ESC>:lua require("nvim-listas.listas")()<CR>A

