autocmd BufRead,BufNewFile *.txt set textwidth=72   " Set maximum line length for text files
autocmd BufRead,BufNewFile *.md  set textwidth=72   " Set maximum line length for markdown files
autocmd TabLeave * stopinsert                       " Returns to normal mode upon leaving a tab

