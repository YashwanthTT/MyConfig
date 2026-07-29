vim.pack.add({ "https://github.com/folke/trouble.nvim" })

local function trouble(cmd)
	return function()
		if not _G.trouble_loaded then
			require("trouble").setup({ use_diagnostic_signs = true })
			_G.trouble_loaded = true
		end
		vim.cmd(cmd)
	end
end

vim.keymap.set("n", "<leader>st", trouble("Trouble"))
vim.keymap.set("n", "<leader>xx", trouble("Trouble diagnostics toggle focus=true"))
vim.keymap.set("n", "[d", trouble("Trouble diagnostics next focus=true"))
vim.keymap.set("n", "]d", trouble("Trouble diagnostics prev focus=true"))

vim.keymap.set("n", "<leader>hd", function()
	local enabled = vim.diagnostic.is_enabled()
	vim.diagnostic.enable(not enabled)
	vim.notify("Diagnostics " .. (enabled and "hidden" or "shown"))
end, { desc = "Toggle diagnostics" })
