vim.cmd [[
    autocmd BufRead,BufNewFile *.txt set textwidth=96   " Set maximum line length for text files
    autocmd BufRead,BufNewFile *.md  set textwidth=96   " Set maximum line length for markdown files
    autocmd TabLeave * stopinsert                       " Returns to normal mode upon leaving a tab

    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="Search", timeout=200})
    augroup end
]]
