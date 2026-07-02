vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

-- Oil.nvim configuration
-- Changed: Removed Lazy.nvim spec wrapper. Calls setup() directly and sets keymap.

require("oil").setup({
	skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "<leader>e", function()
	require("oil").open()
end, { desc = "Open oil" })
