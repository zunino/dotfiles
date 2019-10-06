set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source init-main.vim
source init-autocmd.vim
source init-plugins.vim
source init-mappings.vim
source init-coc.vim

