vim.cmd [[
    autocmd TabLeave * stopinsert                       " Returns to normal mode upon leaving a tab

    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="Search", timeout=200})
    augroup end
]]

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.txt"},
    callback = function()
        vim.opt.textwidth = 80
    end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.md"},
    callback = function()
        vim.opt.textwidth = 80
    end
})

-- vim.api.nvim_create_augroup("highlight_yank", {clear = true})
