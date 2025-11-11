vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon" },
})

require("harpoon").setup()
vim.keymap.set("n", "<leader>h", require("harpoon.ui").toggle_quick_menu)
vim.keymap.set("n", "<leader>H", require("harpoon.mark").add_file)

for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		require("harpoon.ui").nav_file(i)
	end)
end
