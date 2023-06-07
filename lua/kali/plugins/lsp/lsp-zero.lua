return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" }, -- Required
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate"
        },                                     -- Optional
        { "williamboman/mason-lspconfig.nvim" }, -- Optional

        -- Snippets
        { "L3MON4D3/LuaSnip" },           -- Required
        { "rafamadriz/friendly-snippets" }, -- Optional

        -- Additionals
        { "mfussenegger/nvim-dap" },
    },
    opts = function()
        local lsp = require("lsp-zero").preset({manage_nvim_cmp = false})

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        -- (Optional) Configure lua language server for neovim
        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
    end,
}
