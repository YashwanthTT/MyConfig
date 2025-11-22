return {
	{
		"gfontenot/nvim-external-tui",
		dependencies = { "folke/snacks.nvim" },
		config = function()
			local external_tui = require("external-tui")

			external_tui.add({
				user_cmd = "Lazygit",
				cmd = "lazygit",
			})
			vim.keymap.set("n", "<leader>gg", "<CMD>Lazygit<CR>", { desc = "Open lazygit" })
		end,
	},
}
