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
let g:netrw_keepdir = 0
let g:netrw_winsize = 25
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_browse_split = 0


"==[NVIM-LSPCONFIG/COMPLETION-NVIM]=========================

lua << EOF 
local lsp = require 'lspconfig'
local completion = require 'completion'

-- lsp.pyright.setup {}
lsp.pyls.setup {on_attach=completion.on_attach}
lsp.gopls.setup {on_attach=completion.on_attach}
lsp.dockerls.setup {on_attach=completion.on_attach}
EOF 


"==[FZF]====================================================

command! -bang -nargs=* FindInFiles call find#in_files(<bang>0, [<f-args>])

