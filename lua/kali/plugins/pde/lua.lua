return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "lua", "luadoc", "luap" })
		end,
	},
	{
		"sam4llis/nvim-lua-gf",
	},
}
