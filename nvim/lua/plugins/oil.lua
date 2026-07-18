vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

local function setup_oil()
	if not _G.oil_loaded then
		require("oil").setup({ skip_confirm_for_simple_edits = true })
		_G.oil_loaded = true
	end
end
_G.setup_oil = setup_oil

vim.keymap.set("n", "<leader>e", function()
	setup_oil()
	require("oil").open()
end, { desc = "Open oil" })
