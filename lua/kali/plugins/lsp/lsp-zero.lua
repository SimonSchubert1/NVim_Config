return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        {
            "neovim/nvim-lspconfig",
            config = function()
                local lspconfig = require("lspconfig")

                lspconfig.volar.setup({
                    settings = {
                        vetur = {
                            format = {
                                scriptInitialIndent = true,
                                styleInitialIndent = true,
                                tabSize = 2,
                                useTabs = false,
                            }
                        }
                    }
                })
            end
        }, -- Required
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
                    ensure_installed = {
                        "clangd",
                        "jdtls",
                        "lua_ls",
                        "cssls",
                        "volar",
                        "marksman",
                        "grammarly",
                    },
                })
            end,
        }, -- Optional

        -- Snippets
        { "L3MON4D3/LuaSnip" },             -- Required
        { "rafamadriz/friendly-snippets" }, -- Optional

        -- Additionals
        {
            "mfussenegger/nvim-dap",
            dependencies = {
                { "jbyuki/one-small-step-for-vimkind" },
            },
            config = function()
                vim.fn.sign_define(
                    "DapBreakpoint",
                    { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
                )
                vim.fn.sign_define(
                    "DapBreakpointCondition",
                    { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
                )
                vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
                vim.fn.sign_define(
                    "DapLogPoint",
                    { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
                )
                vim.fn.sign_define("DapStopped", { text = "", texthl = "GitSignsAdd", linehl = "", numhl = "" })

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

                -- LUA Debug
                dap.configurations.lua = {
                    {
                        type = "nlua",
                        request = "attach",
                        name = "Attach to running Neovim instance",
                    },
                }

                dap.adapters.nlua = function(callback, config)
                    callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
                end
            end,
        },
        {
            "jay-babu/mason-nvim-dap.nvim",
            config = function()
                require("mason-nvim-dap").setup({
                    ensure_installed = {
                        "javatest",
                        "javadbg",
                        "python",
                    },
                })
            end,
        },
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { "mfussenegger/nvim-dap" },
            config = function()
                require("dapui").setup()
            end,
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            config = function()
                local nvimDapVirtualText = require("nvim-dap-virtual-text")
                nvimDapVirtualText.setup({
                    enabled = true,                     -- enable this plugin (the default)
                    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                    show_stop_reason = true,            -- show stop reason when stopped for exceptions
                    commented = true,                   -- prefix virtual text with comment string
                    only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
                    all_references = false,             -- show virtual text on all all references of the variable (not only definitions)
                    clear_on_continue = false,          -- clear virtual text on "continue" (might cause flickering when stepping)
                    --- A callback that determines how a variable is displayed or whether it should be omitted
                    -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
                    virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

                    -- experimental features:
                    all_frames = false,      -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                    virt_lines = false,      -- show virtual lines instead of virtual text (will flicker!)
                    virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
                    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
                })
            end,
        },
        {
            "jay-babu/mason-null-ls.nvim",
            config = function()
                require("mason-null-ls").setup({
                    ensure_installed = {
                        "black",
                        "ruff",
                    },
                })
            end,
        },
        -- {
        --     "folke/neodev.nvim",
        --     config = function()
        --         require("neodev").setup({
        --             library = {
        --                 enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        --                 -- these settings will be used for your Neovim config directory
        --                 runtime = true, -- runtime path
        --                 types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        --                 plugins = { "nvim-dap-ui" }, -- installed opt or start plugins in packpath
        --                 -- you can also specify the list of plugins to make available as a workspace library
        --                 -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
        --             },
        --             setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
        --             -- for your Neovim config directory, the config.library settings will be used as is
        --             -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
        --             -- for any other directory, config.library.enabled will be set to false
        --             override = function(root_dir, options) end,
        --             -- With lspconfig, Neodev will automatically setup your lua-language-server
        --             -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
        --             -- in your lsp start options
        --             lspconfig = true,
        --             -- much faster, but needs a recent built of lua-language-server
        --             -- needs lua-language-server >= 3.6.0
        --             pathStrict = true,
        --         })
        --     end,
        -- },
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
