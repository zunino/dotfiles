require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
    -- use("ellisonleao/gruvbox.nvim")
    use("rebelot/kanagawa.nvim")
	use("conradirwin/vim-bracketed-paste")
	use("itchyny/vim-gitbranch")
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("sbdchd/neoformat")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
	use("alvarosevilla95/luatab.nvim")
	use("nvim-lualine/lualine.nvim")
	use({
		"nvim-telescope/telescope.nvim",
        tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
    use("nvim-telescope/telescope-file-browser.nvim")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function () require("nvim-treesitter.install").update({with_sync = true}) end
    })
end)

--[ gruvbox ]-------------------------------------------------------------------
-- require("gruvbox").setup({
--     invert_selection = false,
--     dim_inactive = true
-- })

--[ kanagawa ]------------------------------------------------------------------

require("kanagawa").setup({
    keywordStyle = { italic = false },
    dimInactive = true,
    transparent = false,
})
vim.cmd("colorscheme kanagawa")

--[ luatab ]--------------------------------------------------------------------

require("luatab").setup()

--[ lualine ]-------------------------------------------------------------------

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		section_separators = { left = "", right = "" },
		component_separators = { left = "·", right = "·" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})

--[ luatree ]-------------------------------------------------------------------

-- https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L343
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_cursor = false,
    create_in_closed_folder = false,
    open_on_tab = true,
    view = {
        side = "left",
        width = 32,
    }
})

--[ telescope ]-----------------------------------------------------------------

local telescope_actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = telescope_actions.move_selection_previous,
				["<C-j>"] = telescope_actions.move_selection_next,
			},
			n = {
				["<C-k>"] = telescope_actions.move_selection_previous,
				["<C-j>"] = telescope_actions.move_selection_next,
			},
		},
        file_ignore_patterns = {
            "node_modules/",
            "target/",
        },
        layout_strategy = "vertical"
	},
    extensions = {
        file_browser = {
            theme = "ivy",
            mappings = {},
        }
    }
})

--[ lspconfig/cmp ]-------------------------------------------------------------

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lspconfig = require("lspconfig")

local lang_servers = { "pyright", "gopls", "clangd", "rust_analyzer", "denols", "lua_ls" }
for _, lang_server in ipairs(lang_servers) do
	lspconfig[lang_server].setup({
		capabilities = capabilities,
        on_attach = function(client, buffno)
            local map_opts = { noremap=true, silent=true, buffer=buffno  }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, map_opts)
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, map_opts)
            vim.keymap.set("n", "gn", vim.diagnostic.goto_next, map_opts)
            vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, map_opts)
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, map_opts)
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, map_opts)
            vim.keymap.set("n", "<F1>", vim.lsp.buf.hover, map_opts)
            vim.keymap.set("i", "<F1>", vim.lsp.buf.signature_help, map_opts)
            vim.keymap.set("n", "<Leader>d", ":lua vim.diagnostic.open_float(nil, {focus = false})<CR>", map_opts)
        end
	})
end

lspconfig["lua_ls"].setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = {"use", "vim"},
            }
        }
    }
})

lspconfig.yamlls.setup({
    settings = {
        yaml = {
            schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
            }
        }
    },
    capabilities = capabilities,
})

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
	},
})

--[ treesitter ]----------------------------------------------------------------

require("nvim-treesitter.configs").setup({
    ensure_installed = {"cpp", "python", "rust"},
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    indent = {
        enable = false
    }
})

