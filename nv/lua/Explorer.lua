vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})
-- Oil
require("oil").setup({
  skip_confirm_for_simple_edits = true,
})
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
