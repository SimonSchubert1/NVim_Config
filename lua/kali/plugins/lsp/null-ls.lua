return {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
        local null_ls = require("null-ls")

        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        local formatting = null_ls.builtins.formatting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        local diagnostics = null_ls.builtins.diagnostics

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            debug = true,
            sources = {
                formatting.prettier.with({
                    extra_args = { "--semi", "--single-quote", "--jsx-single-quote", "--tab-width", "2" }, --extra_args = { "--semi", "--jsx-single-quote", "--tab-width", "2" },
                }),
                formatting.black.with({ extra_args = { "--fast" } }),
                formatting.stylua,
                -- formatting.google_java_format,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
    end,
}
