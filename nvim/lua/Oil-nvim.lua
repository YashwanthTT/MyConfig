vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

-- Oil
require("oil").setup({
	-- view_options = {
	-- 	show_hidden = true,
	-- },
	skip_confirm_for_simple_edits = true,

	keymaps = {
		["g?"] = { "actions.show_help", mode = "n" },
		["<C-p>"] = "actions.preview",
		["<C-c>"] = { "actions.close", mode = "n" },
		["<C-l>"] = "actions.refresh",
		["-"] = { "actions.parent", mode = "n" },
		["_"] = { "actions.open_cwd", mode = "n" },
		["`"] = { "actions.cd", mode = "n" },
		["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		["gs"] = { "actions.change_sort", mode = "n" },
		["gx"] = "actions.open_external",
		["g."] = { "actions.toggle_hidden", mode = "n" },
		["g\\"] = { "actions.toggle_trash", mode = "n" },
	},
})
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")

-- Quicker.nvim

vim.pack.add({
	{ src = "https://github.com/stevearc/quicker.nvim" },
})

require("quicker").setup({
	show_icon = false,
})
