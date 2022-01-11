local function _map(mode, keys, action, extra)
    extra = extra or {}
    if extra["noremap"] == nil then extra["noremap"] = true end
    vim.api.nvim_set_keymap(mode, keys, action, extra)
end

local function nmap(keys, action, extra)
    _map("n", keys, action, extra)
end

local function imap(keys, action, extra)
    _map("i", keys, action, extra)
end

local function vmap(keys, action, extra)
    _map("v", keys, action, extra)
end

-- write current buffer (normal and insert modes)
nmap("<C-s>", ":update<CR>")
imap("<C-s>", "<ESC>:update<CR>")

-- select all
nmap("<C-a>", "<ESC>gg<S-v>G")
imap("<C-a>", "<ESC>gg<S-v>G")

-- switch to previous and next buffers
nmap("<Leader>,", ":bp!<CR>", {silent = true})
nmap("<Leader>.", ":bn!<CR>", {silent = true})

-- window navigation
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-h>", "<C-w>h")
nmap("<C-l>", "<C-w>l")

-- delete current buffer
nmap("<Leader>q", ":bd<CR>", {silent = true})

-- new line in normal mode
nmap("<Enter>", "i<Enter><Esc>")

-- space in normal mode
nmap("<Space>", "i<Space><Esc>l")

-- backspace in normal mode
nmap("<Backspace>", "X")

-- clear search match highlights
nmap("<Leader><Space>", ":nohl<CR>", {silent = true})

-- tab indents visual selection
vmap("<Tab>", ">gv")

-- shift+Tab unindents visual selection
vmap("<S-Tab>", "<gv")

--[ fswitch ]-------------------------------------------------------------------

nmap("<Leader>s", ":FSHere<CR>") -- switch between headers and sources

--[ commentary ]----------------------------------------------------------------

nmap("<C-_>", "gcc", {noremap = false})
imap("<C-_>", "<ESC>gcc", {noremap = false})
vmap("<C-_>", "gc", {noremap = false})

--[ neoformat ]-----------------------------------------------------------------

nmap("<Leader>f", ":Neoformat<CR>")

--[ lspconfig ]-----------------------------------------------------------------

nmap("<F2>", ":lua vim.lsp.buf.rename()<CR>")
nmap("gd", ":lua vim.lsp.buf.definition()<CR>", {silent = true})
nmap("<Leader>d", ":lua vim.diagnostic.open_float()<CR>", {silent = true})

--[ telescope ]-----------------------------------------------------------------

nmap("<C-p>", ":Telescope find_files<CR>", {silent = true})
imap("<C-p>", "<ESC>:Telescope find_files<CR>", {silent = true})

--[ telescope-file-browser ]----------------------------------------------------

nmap("<C-e>", ":lua require('telescope').extensions.file_browser.file_browser()<CR>", {silent = true})
imap("<C-e>", "<ESC>:lua require('telescope').extensions.file_browser.file_browser()<CR>", {silent = true})
