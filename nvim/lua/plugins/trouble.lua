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
	},
}
