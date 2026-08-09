return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {
			use_diagnostic_signs = true,
		},
		keys = {
			{ "<leader>st", "<cmd>Trouble<cr>", desc = "Trouble" },
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics (Trouble)" },
			{ "[d", "<cmd>Trouble diagnostics next focus=true<cr>", desc = "Next Diagnostic" },
			{ "]d", "<cmd>Trouble diagnostics prev focus=true<cr>", desc = "Prev Diagnostic" },
		},
		config = function(_, opts)
			require("trouble").setup(opts)

			vim.keymap.set("n", "<leader>td", function()
				local enabled = vim.diagnostic.is_enabled()
				vim.diagnostic.enable(not enabled)
				vim.notify("Diagnostics " .. (enabled and "hidden" or "shown"))
			end, { desc = "Toggle diagnostics" })
		end,
	},
}
