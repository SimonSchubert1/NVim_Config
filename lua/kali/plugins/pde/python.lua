return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "python" })
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
            config = function()
                require("dap-python").setup() -- Use default python
            end,
        },
    },
}
