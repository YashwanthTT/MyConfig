return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		main = "nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"css",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
	},
}
