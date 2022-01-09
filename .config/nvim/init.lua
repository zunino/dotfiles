require("settings")
require("autocmds")
require("plugins")

vim.cmd [[
    runtime init-plugins.vim
    runtime init-mappings.vim
]]
