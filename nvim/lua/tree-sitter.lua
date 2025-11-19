vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

package.path = package.path
	.. ";/Users/yashwanth/.local/share/nvim/site/pack/start/nvim-treesitter/lua/?.lua;/Users/yashwanth/.local/share/nvim/site/pack/start/nvim-treesitter/lua/?/init.lua"

require("nvim-treesitter.install").update("all")

require("nvim-treesitter.configs").setup({
	auto_install = false, -- autoinstall languages that are not installed yet
})
