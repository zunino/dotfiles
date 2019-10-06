" Write current buffer (normal and insert modes)
nnoremap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>

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

" Copy visual selection to system clipboard
vnoremap <Leader>y "+y

" Paste from system clipboard over visual selection
vnoremap <Leader>p "+P

" Paste from system clipboard
nnoremap <Leader>p "+P

" Format current paragraph
nnoremap <Leader>f gqip

