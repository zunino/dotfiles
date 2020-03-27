set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

runtime init-main.vim
runtime init-autocmd.vim
runtime init-plugins.vim
runtime init-mappings.vim
runtime init-coc.vim

