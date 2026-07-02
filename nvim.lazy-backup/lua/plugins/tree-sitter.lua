return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	branch = "main",
	build = ":TSUpdate",
	config = function()
		vim.treesitter.language.register("bash", "zsh")
	end,
}
