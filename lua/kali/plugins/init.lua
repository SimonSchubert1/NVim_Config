return {

    -- My plugins here (this section is used to install plugins (this will be used in 99% of cases editing this file))

    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins

    -- Colorschemes
    "lunarvim/colorschemes", -- A bunch of colorschemes
    "lunarvim/darkplus.nvim",
    "folke/tokyonight.nvim",

    -- cmp plugins
    "hrsh7th/nvim-cmp", -- The completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    -- snippets
    "L3MON4D3/LuaSnip", -- snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    -- LSP 
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/nvim-lsp-installer", -- simple to use language server installer
    "jose-elias-alvarez/null-ls.nvim", -- for formatters

    -- Telescope 
    "nvim-telescope/telescope-media-files.nvim",

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    "p00f/nvim-ts-rainbow",
    "nvim-treesitter/playground",
    "JoosepAlviste/nvim-ts-context-commentstring",

    -- NerdTree
    "kyazdani42/nvim-web-devicons",

    -- neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { 
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
        }
    },

    -- Bufferline
    "moll/vim-bbye",

    -- Additional ones i have found in the neovim-from-scratch repo
    { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" 
    },

    -- File jumping in lua
    "sam4llis/nvim-lua-gf",
}
