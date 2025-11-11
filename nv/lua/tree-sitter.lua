vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { confirm = false })

require("nvim-treesitter.install").update("all")

require("nvim-treesitter.configs").setup({
	auto_install = true, -- autoinstall languages that are not installed yet
})
