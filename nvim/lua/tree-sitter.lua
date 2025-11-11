vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter.install").update("all")

require("nvim-treesitter.configs").setup({
	auto_install = true, -- autoinstall languages that are not installed yet
})
