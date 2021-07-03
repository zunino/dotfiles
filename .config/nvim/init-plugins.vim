"==[VIM PLUG]===============================================

let g:plug_url_format = 'ssh://git@github.com/%s'


"==[LIGHTLINE]==============================================

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'gitbranch', 'readonly', 'filename', 'modified' ]
        \ ]
    \ },
    \ 'component_function': {
        \ 'gitbranch': 'gitbranch#name'
    \}
\}


"==[NETRW]==================================================

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_keepdir = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_browse_split = 0


"==[NVIM-LSPCONFIG/COMPLETION-NVIM]=========================

lua << EOF 
local lsp = require 'lspconfig'
local completion = require 'completion'

-- Python (pyright)
lsp.pyright.setup { on_attach=completion.on_attach }

-- Go (gopls)
lsp.gopls.setup { on_attach=completion.on_attach }

-- C++ (clangd)
lsp.clangd.setup { on_attach=completion.on_attach }

-- Rust (rust_analyzer)
lsp.rust_analyzer.setup { on_attach=completion.on_attach }

-- C# (omnisharp)
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/zunino/Tools/OmniSharp/run"
lsp.omnisharp.setup {
    cmd={omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
    on_attach=completion.on_attach
}
EOF 


"==[FZF]====================================================

command! -bang -nargs=* FindInFiles call find#in_files(<bang>0, [<f-args>])

