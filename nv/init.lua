vim.o.number = true
vim.o.relativenumber = true
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim"},
})

require("mini.pick").setup()
require("mini.align").setup()

