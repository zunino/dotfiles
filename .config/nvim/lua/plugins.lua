require("packer").startup(
    function ()
        use "wbthomason/packer.nvim"
        use "conradirwin/vim-bracketed-paste"
        use "derekwyatt/vim-fswitch"
        use "itchyny/vim-gitbranch"
        use "tpope/vim-commentary"
        use "tpope/vim-repeat"
        use "tpope/vim-surround"
        use "sbdchd/neoformat"
        use "neovim/nvim-lspconfig"
        use "hrsh7th/nvim-cmp"                   -- Autocompletion plugin
        use "hrsh7th/cmp-nvim-lsp"               -- LSP source for nvim-cmp
        use "L3MON4D3/LuaSnip"                   -- Snippets plugin
        use "saadparwaiz1/cmp_luasnip"           -- Snippets source for nvim-cmp
        use {
            "alvarosevilla95/luatab.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = { {"nvim-lua/plenary.nvim"} }
        }
    end
)

require("luatab").setup()

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        section_separators = {left = "", right = ""},
        component_separators = {left = "·", right = "·"},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    tabline = {},
    extensions = {}
})

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
            }
        }
    }
})
