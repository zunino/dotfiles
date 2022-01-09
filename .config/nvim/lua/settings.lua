vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.background = "dark"
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.completeopt = {"menuone", "noinsert"}
vim.opt.cursorline = false
vim.opt.diffopt:append("vertical")
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.ruler = true
vim.opt.scrolloff = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
vim.opt.shortmess:append("c")
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.updatetime = 4000
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.wildignore:append({"*.o", "*.so", "a.out", "*.class"})

vim.g.loaded_matchparen = 1             -- disable pi_paren default plugin
--vim.g.do_filetype_lua = 1               -- experimental file type detection in Lua (https://www.reddit.com/r/neovim/comments/rvwsl3/introducing_filetypelua_and_a_call_for_help/)
--vim.g.did_load_filetypes = 0            -- disable filetype.vim (may cause some detections to fail)

vim.g.gruvbox_termcolors = '256'
vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_invert_selection = 0

vim.cmd("colorscheme gruvbox")
