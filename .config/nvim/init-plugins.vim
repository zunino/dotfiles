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


"==[NVIM-LSPCONFIG/NVIM-CMP]================================

lua << EOF 
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require 'lspconfig'

local lang_servers = {"pyright", "gopls", "clangd", "rust_analyzer", "tsserver"}
for _, lang_server in ipairs(lang_servers) do
    lspconfig[lang_server].setup { 
        capabilities = capabilities, 
    }
end

vim.o.completeopt = "menuone,noselect"

local luasnip = require "luasnip"
local cmp = require "cmp"

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF 


"==[FZF]====================================================

command! -bang -nargs=* FindInFiles call find#in_files(<bang>0, [<f-args>])

