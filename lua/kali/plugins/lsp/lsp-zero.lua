return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" }, -- Required
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
            opts = function()
                require("mason").setup({})
            end,
        }, -- Optional
        {
            "williamboman/mason-lspconfig.nvim",
            opts = function()
                local lspconfig = require("mason-lspconfig")
                lspconfig.setup({
                    ensure_installed = { "clangd", "jdtls", "lua_ls", "cssls", "volar", "marksman", "grammarly" },
                })
            end,
        }, -- Optional

        -- Snippets
        { "L3MON4D3/LuaSnip" },       -- Required
        { "rafamadriz/friendly-snippets" }, -- Optional

        -- Additionals
        {
            "mfussenegger/nvim-dap",
            config = function()
                vim.fn.sign_define(
                    "DapBreakpoint",
                    { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
                )
                vim.fn.sign_define(
                    "DapBreakpointCondition",
                    { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
                )
                vim.fn.sign_define(
                    "DapBreakpointRejected",
                    { text = "", texthl = "", linehl = "", numhl = "" }
                )
                vim.fn.sign_define(
                    "DapLogPoint",
                    { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
                )
                vim.fn.sign_define(
                    "DapStopped",
                    { text = "", texthl = "GitSignsAdd", linehl = "", numhl = "" }
                )

                local dap = require("dap")
                local dapui = require("dapui")
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close()
                end
            end,
        },
        {
            "rcarriga/nvim-dap-ui",
            config = function()
                require("dapui").setup()
            end,
        },
    },
    opts = function()
        local lsp = require("lsp-zero").preset({ manage_nvim_cmp = false })

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        lsp.skip_server_setup({ "jdtls" })

        -- (Optional) Configure lua language server for neovim
        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
    end,
}
